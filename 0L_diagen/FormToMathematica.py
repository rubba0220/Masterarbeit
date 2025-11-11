import re
import sys
import os

FUNCTIONS = [
    "cOldel", "cOlT",
    "UBar", "U", "VBar", "V",
    "G", "EpsStar"]

def convert_pow(s: str) -> str:
    """
    Convert pow(a,b) -> (a)^(b)
    """
    pattern = re.compile(r"pow\(([^,]+),([^)]+)\)")
    def repl(m):
        base = m.group(1).strip()
        exp = m.group(2).strip()
        return f"({base})^({exp})"
    return pattern.sub(repl, s)

def drop_local(s: str) -> str:
    """
    Drop 'Local ' keyword at the start of assignments.
    """
    return re.sub(r'^Local\s+', '', s)

def convert_i(s: str) -> str:
    """
    Replace i_ (FORM-style imaginary unit) by Mathematica I.
    """
    return re.sub(r"\bi_\b", "I", s)

def convert_functions(s: str) -> str:
    """
    Turn FUNCTIONS(x,...) into FUNCTIONS[ x, ... ].
    """
    # First: replace f( -> f[
    for name in FUNCTIONS:
        s = re.sub(rf"\b{name}\(", f"{name}[", s)

    # Now walk through and replace closing ')' that belong to these calls with ']'.
    expr = []
    brackets = []

    for ch in s:
        if ch == '[' or ch == '(':
            brackets.append(ch)
            expr.append(ch)
        elif ch == ')':
            if brackets:
                last = brackets.pop()
                if last == '[':
                    expr.append(']')
                else:
                    expr.append(')')
            else:
                raise ConversionError("Unmatched closing parenthesis")
        else:
            expr.append(ch)

    return ''.join(expr)

def process_file(infile: str, outfile: str) -> None:
    # Skip files that are already converted
    base, extension = infile.rsplit('.', 1)
    if base.endswith("_mat"):
        print(f"Skipping already-converted file: {infile}")
        return
    
    print(f"Beginning conversion of {infile}  ->  {outfile} \n")

    try:
        with open(infile, "r") as f:
            text = f.read()
    except OSError as err:
        print(f"Error reading {infile}: {err}", file=sys.stderr)
        return

    with open(infile, "r") as f:
        text = f.read()

    # Apply transformations
    text = drop_local(text)
    text = convert_pow(text)
    text = convert_i(text)
    text = convert_functions(text)

    try:
        with open(outfile, "w") as f:
            f.write(text)
        print(f"Converted file written to {outfile} containing: \n {text}")
    except OSError as err:
        print(f"Error writing {outfile}: {err}", file=sys.stderr)
        return

    print(f"Done converting {infile} to {outfile}")

def main():
    if len(sys.argv) != 2:
        print("Usage: python to_mathematica.py <inputfile-or-directory>", file=sys.stderr)
        sys.exit(1)
    
    inpath = sys.argv[1]

    if os.path.isdir(inpath):
        outpath = inpath + "_mat"
        os.makedirs(outpath, exist_ok=True)
        for filename in os.listdir(inpath):
            infile = os.path.join(inpath, filename)
            if os.path.isfile(infile):
                base,extension = filename.rsplit('.', 1)
                outfile = os.path.join(outpath, f"{base}_mat.{extension}")
                process_file(infile, outfile)
    elif os.path.isfile(inpath):
        infile = inpath
        base,extension = os.path.basename(infile).rsplit('.', 1)
        outfile = os.path.join(f"{base}_mat.{extension}")
        process_file(infile, outfile)
    else:
        print(f"Error: {inpath} is neither a file nor a directory.", file=sys.stderr)

if __name__ == "__main__":
    main()