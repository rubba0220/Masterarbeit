#-
Off Statistics;
v p1,p2,p3,p4,p5;
s pp12, pp23, pp34, pp45, pp15, mt2;
cf delta;
i i0, ..., i10;
cf ten;

#include declarations.h
#include diags0l.out #d1

local a1 = p1.p1+p1.p2+p1.p3+p1.p4+p1.p5;
local a2 = p2.p1+p2.p2+p2.p3+p2.p4+p2.p5;
local a3 = p3.p1+p3.p2+p3.p3+p3.p4+p3.p5;
local a4 = p4.p1+p4.p2+p4.p3+p4.p4+p4.p5;
local aa5 = p5.p1+p5.p2+p5.p3+p5.p4+p5.p5;

local aa = d1*2;

local contraction = ten(i0, i1)*delta(i1,i2);

#message invariants
id p1.p1 = 0;
id p2.p2 = 0;
id p3.p3 = mt2;
id p4.p4 = mt2;
id p5.p5 = 0;
id p1.p2 = pp12;
id p2.p3 = pp23;
id p3.p4 = pp34;
id p4.p5 = pp45;
id p1.p5 = pp15;
.sort
id p3.p5 = -p1.p3-pp23-mt2-pp34;
id p2.p5 = -pp12-pp23-p2.p4;
id p1.p3 = -pp12-p1.p4-pp15;
.sort
id p2.p4 = -p1.p4-pp34-mt2-pp45;
.sort
id p1.p4 = pp23-pp45-pp15;
.sort
id ten(?i0, i1?, ?i2)*delta(i1?, i3?) = ten(?i0, i3, ?i2);
.sort

Print aa
Print a1,a2,a3,a4,aa5;
Print contraction;

.end
