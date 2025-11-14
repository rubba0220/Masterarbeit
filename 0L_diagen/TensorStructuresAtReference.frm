#-

#include declarations.h

Off Statistics;
Format 255;



global prefac = pow(M,-1)*(hel*ispA(p3,p4)*ispB(p3,p5)*spA(p3,p5) + (1-hel)*ispA(p3,p4)*ispB(p4,p5)*spA(p4,p5))*4*pp34^2;

global a12 = pow(2*pp34,-1)*ispA(p3,p4) * spA(f1,p3) * spA(f2,p4);
global a22 = pow(2*pp34,-1)*ispA(p3,p4) * spA(f1,p3) * spA(f2,p4);
global a23 = pow(2*pp34,-1)*ispA(p3,p4) * spA(f1,p4) * spA(f2,p3);
global a34 = -ispAA(p4,p5,p3,p4) * spA(f1,p4) * spA(f2,p4);
global a41 = -ispAA(p3,p4,p5,p3) * spA(f1,p3) * spA(f2,p3);

.store
Off Statistics;
Format 255;

global T1 = UBar(p2,v)*V(p1,v);
global T2 = UBar(p2,v)*Gr(v,p3)*V(p1,v);
global T3 = UBar(p2,v)*Gr(v,p4)*V(p1,v);
global T4 = UBar(p2,v)*Gr(v,p3,p4)*V(p1,v);

global G1 = VBar(p4,v)*Gr(v,p1)*U(p3,v)*EpsStar(p1,p5);
global G2 = VBar(p4,v)*Gr(v,p1)*U(p3,v)*EpsStar(p2,p5);
global G3 = VBar(p4,v)*Gr(v,p2)*U(p3,v)*EpsStar(p1,p5);
global G4 = VBar(p4,v)*Gr(v,p2)*U(p3,v)*EpsStar(p2,p5);

.store
Off Statistics;
Format 255;

local T1mod = T1;
local T2mod = T2;
local T3mod = T3;
local T4mod = T4;


#call SpinorHelicity(1,p3,p3)

mul a41;

id ispA(p?,q?)*spA(p?,q?) = 1;
id ispB(p?,q?)*spB(p?,q?) = 1;
id ispAA(p?,p?,?q) = 0;
id ispAB(p?,p?,?q) = 0;
id ispBA(p?,p?,?q) = 0;
id ispBB(p?,p?,?q) = 0;
id ispAA(?q,p?,p?) = 0;
id ispAB(?q,p?,p?) = 0;
id ispBA(?q,p?,p?) = 0;
id ispBB(?q,p?,p?) = 0;
id spAA(p?,p?,?q) = 0;
id spAB(p?,p?,?q) = 0;
id spBA(p?,p?,?q) = 0;
id spBB(p?,p?,?q) = 0;
id spAA(?q,p?,p?) = 0;
id spAB(?q,p?,p?) = 0;
id spBA(?q,p?,p?) = 0;
id spBB(?q,p?,p?) = 0;
id spAA(p?,q?,p?,?k) = 2*p.q*spAA(p,?k);
id spAA(p?,q?) = spA(p,q);

#call Invariants

print +s;
.sort

.end