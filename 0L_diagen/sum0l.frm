#-

#include declarations.h

Off Statistics;
Format 255;

g sum0l = 0;


#do i=1,5

#include diags0l.out # d`i'   


#message color factors
#call ColorFactors
.sort

#message feynman rules
#call FeynmanRules(0)

.sort

#message scalar propagators
id DS(k?,m?,1) = pow(k.k-m^2,-1);

.sort

#message invariants
Argument pow;
repeat;
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
id p3.p5 = -p1.p3-pp23-mt2-pp34;
id p2.p5 = -pp12-pp23-p2.p4;
id p1.p3 = -pp12-p1.p4-pp15;
id p2.p4 = -p1.p4-pp34-mt2-pp45;
id p1.p4 = pp23-pp45-pp15;

id M^2 = mt2;

endrepeat;
EndArgument;
.sort

g sum0l = sum0l +d`i';

print d`i';
.sort

Off Statistics;

#enddo

id color(x?) = x;
b cOlT,cOldel,NF;
#message begin_sum;

print +s sum0l;
.sort

#message end_sum;
.end
