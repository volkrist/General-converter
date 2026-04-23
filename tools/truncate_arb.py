#!/usr/bin/env python3
import sys
import os


def truncate_to_first_object(s):
    # find first '{'
    start = s.find("{")
    if start == -1:
        return None
    i = start
    depth = 0
    in_str = False
    esc = False
    while i < len(s):
        c = s[i]
        if esc:
            esc = False
        elif c == "\\":
            esc = True
        elif c == '"':
            in_str = not in_str
        elif not in_str:
            if c == "{":
                depth += 1
            elif c == "}":
                depth -= 1
                if depth == 0:
                    return s[start : i + 1]
        i += 1
    return None


def process(path):
    with open(path, "r", encoding="utf-8") as f:
        s = f.read()
    try:
        import json

        json.loads(s)
        print(path, "valid")
        return True
    except Exception as e:
        print(path, "invalid:", e)
        obj = truncate_to_first_object(s)
        if not obj:
            print("  could not find balanced object")
            return False
        bak = path + ".bak"
        if not os.path.exists(bak):
            os.rename(path, bak)
            with open(path, "w", encoding="utf-8") as f:
                f.write(obj + "\n")
            print("  wrote truncated object to", path, "backup at", bak)
            return True
        else:
            print("  backup exists, skipping", path)
            return False


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: truncate_arb.py path1.arb [path2.arb ...]")
        sys.exit(2)
    ok = 0
    fail = 0
    for p in sys.argv[1:]:
        if os.path.isdir(p):
            continue
        res = process(p)
        if res:
            ok += 1
        else:
            fail += 1
    print("\nSummary:", ok, "processed,", fail, "failed")
