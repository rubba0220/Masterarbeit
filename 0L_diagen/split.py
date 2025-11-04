import os
import re
import subprocess
import sys
# ------------------------------------------------------------
FORM_EXEC = "form"
FORM_INPUT = "sum0l.frm"
OUTDIR = "color_decomposition"
TERMS_FILE = "terms.list"
# ------------------------------------------------------------

print(f"Running FORM: {FORM_EXEC} {FORM_INPUT}")
with open(TERMS_FILE, "w") as f:
    proc = subprocess.run([FORM_EXEC, FORM_INPUT], stdout=f, stderr=subprocess.PIPE)

print(f"FORM output captured in: {TERMS_FILE}")

with open(TERMS_FILE, "r") as f:
    lines = [ln.strip() for ln in f if ln.strip()]

color_terms = []

index_start = lines.index('~~~begin_sum') + 2
index_end = lines.index('~~~end_sum')

lines = lines[index_start:index_end]

index_s1 = lines.index('+ cOldel(i1,i2)*cOlT(i3,i4,a5)*NF^-1 * (')
index_e1 = lines.index(')')
color_terms.append(lines[index_s1:index_e1+1])
lines = lines[index_e1+1:]
index_s2 = lines.index('+ cOldel(i1,i3)*cOlT(i2,i4,a5) * (')
index_e2 = lines.index(')')
color_terms.append(lines[index_s2:index_e2+1])
lines = lines[index_e2+1:]
index_s3 = lines.index('+ cOldel(i2,i4)*cOlT(i3,i1,a5) * (')
index_e3 = lines.index(')')
color_terms.append(lines[index_s3:index_e3+1])
lines = lines[index_e3+1:]
index_s4 = lines.index('+ cOldel(i3,i4)*cOlT(i2,i1,a5)*NF^-1 * (')
index_e4 = lines.index(');')
color_terms.append(lines[index_s4:index_e4+1])

tags = ['d12T345', 'd13T245', 'd24T135', 'd34T125']

os.makedirs(OUTDIR, exist_ok=True)

for i, t in enumerate(color_terms, 1):
    tag = tags[i-1]
    fname = os.path.join(OUTDIR, f"0L_{tag}.frm")
    print(f"Writing term file: {fname}")
    with open(fname, "w") as g:
        expr = "\n".join(t)
        if not expr.rstrip().endswith(";"):
            expr = expr + ";"
        g.write(f"Local {tag} = {expr}\n")

print(f"Wrote {len(color_terms)} term files to: {OUTDIR}/")