#!/usr/bin/env python3
import sys, json, glob, os

if len(sys.argv) < 3:
    print("Usage: propagate_metadata.py template.arb target1.arb [target2.arb ...]")
    sys.exit(2)

template_path = sys.argv[1]
targets = sys.argv[2:]

with open(template_path, "r", encoding="utf-8") as f:
    tpl = json.load(f)

# collect metadata keys (those starting with @)
metadata = {k: v for k, v in tpl.items() if isinstance(k, str) and k.startswith("@")}
print("Template metadata keys:", len(metadata))

modified = []
for pattern in targets:
    for p in glob.glob(pattern):
        if os.path.abspath(p) == os.path.abspath(template_path):
            continue
        try:
            with open(p, "r", encoding="utf-8") as f:
                data = json.load(f)
        except Exception as e:
            print(p, "SKIP load error:", e)
            continue
        added = []
        for k, v in metadata.items():
            if k not in data:
                data[k] = v
                added.append(k)
        if added:
            # write back preserving UTF-8 and pretty formatting
            with open(p, "w", encoding="utf-8") as f:
                json.dump(data, f, ensure_ascii=False, indent=2)
                f.write("\n")
            print(p, "added", len(added), "metadata keys")
            modified.append(p)
        else:
            print(p, "no changes")

print("\nSummary: modified", len(modified), "files")
