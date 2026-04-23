#!/usr/bin/env python3
import sys
from collections import OrderedDict


def read_value(lines, i):
    line = lines[i].lstrip()
    if line.startswith('"'):
        # string value
        # find the colon first
        parts = lines[i].split(":", 1)
        if len(parts) < 2:
            return None, i + 1
        # value may span multiple lines if contains escaped chars, but simpler: collect until line ends with , or }\n
        value = parts[1].rstrip("\n")
        i += 1
        while not (
            value.rstrip().endswith(",") or value.rstrip().endswith("}")
        ) and i < len(lines):
            value += "\n" + lines[i].rstrip("\n")
            i += 1
        return value.rstrip(), i
    elif line.startswith("{") or line.startswith("{\n") or line.startswith("{"):
        # object value: collect balanced braces
        depth = 0
        val_lines = []
        while i < len(lines):
            l = lines[i]
            depth += l.count("{") - l.count("}")
            val_lines.append(l.rstrip("\n"))
            i += 1
            if depth == 0:
                break
        return "\n".join(val_lines), i
    else:
        # other (number, true, false, null or array)
        parts = lines[i].split(":", 1)
        if len(parts) < 2:
            return None, i + 1
        value = parts[1].rstrip("\n")
        i += 1
        while not (
            value.rstrip().endswith(",") or value.rstrip().endswith("}")
        ) and i < len(lines):
            value += "\n" + lines[i].rstrip("\n")
            i += 1
        return value.rstrip(), i


def clean_arb(path):
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    # skip initial '{' and trailing '}' if present
    # parse top-level entries
    out = OrderedDict()
    i = 0
    # find opening brace
    while i < len(lines) and "{" not in lines[i]:
        i += 1
    if i < len(lines) and "{" in lines[i]:
        i += 1

    while i < len(lines):
        line = lines[i].lstrip()
        if line.strip().startswith("}"):
            break
        if '"' in line:
            # try to extract key
            try:
                key_start = line.index('"') + 1
                key_end = line.index('"', key_start)
                key = line[key_start:key_end]
            except ValueError:
                i += 1
                continue
            if key in out:
                # skip this entry's value
                _, i = read_value(lines, i)
                continue
            # capture value text from current line to end of value
            # but we want to preserve formatting; so include from the colon onward
            # find colon index
            colon_idx = line.find(":")
            if colon_idx == -1:
                i += 1
                continue
            # build value starting from after colon
            remainder = line[colon_idx + 1 :]
            # if remainder contains opening brace, treat as object
            if remainder.strip().startswith("{"):
                # collect balanced braces starting from remainder
                value_lines = [remainder.rstrip("\n")]
                depth = remainder.count("{") - remainder.count("}")
                i += 1
                while i < len(lines) and depth > 0:
                    l = lines[i]
                    depth += l.count("{") - l.count("}")
                    value_lines.append(l.rstrip("\n"))
                    i += 1
                out[key] = "\n".join(value_lines).rstrip(",")
            else:
                # collect until line ends with , or }
                value = remainder.rstrip("\n")
                i += 1
                while i < len(lines) and not (
                    value.rstrip().endswith(",") or value.rstrip().endswith("}")
                ):
                    value += "\n" + lines[i].rstrip("\n")
                    i += 1
                out[key] = value.rstrip(",")
        else:
            i += 1

    # reconstruct JSON with simple formatting
    with open(path + ".cleaned", "w", encoding="utf-8") as f:
        f.write("{" + "\n")
        first = True
        for k, v in out.items():
            if not first:
                f.write(",\n")
            first = False
            # write key
            f.write('  "' + k + '": ')
            # v may already contain leading spaces/newlines; write as-is
            v_str = v.strip()
            # if v_str starts with '{' or '[' write raw
            if v_str.startswith("{") or v_str.startswith("["):
                # indent nested lines
                lines_v = v_str.split("\n")
                f.write(lines_v[0].lstrip())
                for ln in lines_v[1:]:
                    f.write("\n    " + ln.lstrip())
                # no trailing comma here; loop will add commas
            else:
                f.write(v_str)
        f.write("\n}\n")
    return path + ".cleaned"


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: clean_arb.py path/to/file.arb")
        sys.exit(2)
    cleaned = clean_arb(sys.argv[1])
    print("Cleaned file written to", cleaned)
