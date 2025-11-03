#-

#include declarations_mod.h

Off Statistics;


g sum0l = 0;


#do i=1,1

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
id p1.p1 = mt2;
id p2.p2 = mt2;
id p3.p3 = 0;
id p4.p4 = 0;
id p5.p5 = 0;
id p1.p2 = pp12;
id p2.p3 = pp23;
id p3.p4 = pp34;
id p4.p5 = pp45;
id p1.p5 = pp15;
.sort
id p3.p5 = -p1.p3-pp23-pp34;
id p2.p5 = -pp12-mt2-pp23-p2.p4;
.sort
id p1.p3 = -mt2-pp12-p1.p4-pp15;
.sort
id p2.p4 = -p1.p4-pp34-pp45;
.sort
id p1.p4 = pp23-pp45-pp15;
.sort

id M^2 = mt2;
.sort

g sum0l = sum0l +d`i';

print d`i';
.sort

Off Statistics;

#enddo

id color(x?) = x;
b cOlT,cOldel,NF, cOld;

print sum0l;
.end
