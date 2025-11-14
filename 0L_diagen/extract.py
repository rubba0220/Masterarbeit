#!/usr/bin/env python3
import argparse
import os
import sys
import re

def extract(lines, keyword):
    """
    Return block that start on a line containing `keyword` and
    end on the first subsequent line whose stripped text ends with ';'.
    """
    i = 0
    n = len(lines)
    while i < n:
        if keyword in lines[i]:
            start = i
            i += 1
            while i < n and not lines[i].rstrip().endswith(';'):
                i += 1
            end = i
            block = lines[start:end+1]
            return block
        else:
            i += 1

def main():
    p = argparse.ArgumentParser(
        description="Extract blocks starting at KEYWORD and ending at next ';' line."
    )
    p.add_argument("--file", required=True, help="Input file to scan.")
    p.add_argument("--keyword", required=True, help="Keyword that marks the start of a block.")
    args = p.parse_args()

    with open(args.file, "r") as f:
        lines = f.readlines()

    for i in range(len(lines)):
        lines[i] = re.sub(r'^[ \t]+', '', lines[i], flags=re.MULTILINE)
    block = extract(lines, args.keyword)
    block[0] = block[0] + "("
    block[-2] = block[-2].rstrip() + ")" + block[-1]
    block = block[:-1]
    if not block:
        print("No content found.", file=sys.stderr)
        sys.exit(0)

    base,extension = os.path.basename(args.file).rsplit('.', 1)
    base = re.sub(r"_out$", "", base)
    outpath = os.path.join(f"{base}.out")
    with open(outpath, "w") as g:
        g.writelines(block)

    print(f"Wrote content to: {outpath}")

if __name__ == "__main__":
    main()