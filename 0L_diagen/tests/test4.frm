#-
Off Statistics;
v p1,p2,p3,p4,p5;
s pp12, pp23, pp34, pp45, pp15, mt2;
cf delta, gg;
i i0, ..., i10;
cf ten;
f aaa;

#include ../declarations.h
#include ../diags0l.out #d1

local F = G(1, p1-p2);

id G(v?,p1?-p2?) = G(v,p1)+G(v,p2);
Splitarg, G;
print;