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

local test = (10*pp12
+pp23);

local Gamma = g_(1,i0,p1);
id g_(i0?, i1?, p1) = g_(i0,i1);
Argument g_;
id p1 = 0;
EndArgument;

*Transform, g_, replace(1,last)=(p1,-p1 - p2 - p3 - p4);


print;
.end
