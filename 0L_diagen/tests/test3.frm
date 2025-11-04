#-
Off Statistics;
v p1,p2,p3,p4,p5;
s pp12, pp23, pp34, pp45, pp15, mt2;
cf delta;
i i0, ..., i10;
cf ten;

#include declarations.h
#include diags0l.out #d1
#include terms.list

local test = (10*pp12
+pp13);

print
.end
