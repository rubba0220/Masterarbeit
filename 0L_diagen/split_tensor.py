import os
import re
import subprocess
import sys
# ------------------------------------------------------------
FORM_EXEC = "form"
FORM_INPUT = "sum0l.frm"
OUTDIR = "color_decomposition"
TERMS_FILE = "generate/terms.list"
# ------------------------------------------------------------

print(f"Running FORM: {FORM_EXEC} {FORM_INPUT}")
with open(TERMS_FILE, "w") as f:
    proc = subprocess.run([FORM_EXEC, FORM_INPUT], stdout=f, stderr=subprocess.PIPE)

print(f"FORM output captured in: {TERMS_FILE}(_strings)")

with open(TERMS_FILE, "r") as f:
    alllines = [ln.strip() for ln in f if ln.strip()]

def extract(index_start, index_end, alllines):
    color_terms = []

    lines = alllines[index_start:index_end]

    index_s1 = lines.index('+ cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^-1 * (')
    index_e1 = lines.index(')')
    color_terms.append(lines[index_s1:index_e1+1])
    lines = lines[index_e1+1:]
    index_s2 = lines.index('+ cOldel(i1,i4)*cOlT(i2,i3,a5) * (')
    index_e2 = lines.index(')')
    color_terms.append(lines[index_s2:index_e2+1])
    lines = lines[index_e2+1:]
    index_s3 = lines.index('+ cOldel(i2,i3)*cOlT(i4,i1,a5) * (')
    index_e3 = lines.index(')')
    color_terms.append(lines[index_s3:index_e3+1])
    lines = lines[index_e3+1:]
    index_s4 = lines.index('+ cOldel(i3,i4)*cOlT(i2,i1,a5)*NF^-1 * (')
    index_e4 = lines.index(');')
    color_terms.append(lines[index_s4:index_e4+1])
    return color_terms

index_start = alllines.index('~~~begin_sum') + 2
index_end = alllines.index('~~~end_sum')

color_terms = extract(index_start, index_end, alllines)

index_start_string = alllines.index('~~~begin_strings') + 2
index_end_string = alllines.index('~~~end_strings')

color_terms_strings = extract(index_start_string, index_end_string, alllines)

tags = ['d12T435', 'd14T235', 'd23T415', 'd34T215']

os.makedirs(OUTDIR, exist_ok=True)
os.makedirs(OUTDIR + "_strings", exist_ok=True)

for i, (t, t_s) in enumerate(zip(color_terms, color_terms_strings), 1):
    tag = tags[i-1]
    fname = os.path.join(OUTDIR, f"0L_{tag}.out")
    fname_strings = os.path.join(OUTDIR + "_strings", f"0L_{tag}.out")
    print(f"Writing term file: {fname}")
    with open(fname, "w") as g:
        expr = "\n".join(t)
        if not expr.rstrip().endswith(";"):
            expr = expr + ";"
        g.write(f"Local {tag} = {expr}\n")

    with open(fname_strings, "w") as g:
        expr = "\n".join(t_s)
        if not expr.rstrip().endswith(";"):
            expr = expr + ";"
        g.write(f"Local {tag} = {expr}\n")
print(f"Wrote {len(color_terms)} term files to: {OUTDIR}(_strings)/")