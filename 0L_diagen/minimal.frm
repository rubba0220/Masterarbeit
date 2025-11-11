#-
#include declarations.h

Off Statistics;
Format 255;

s A01, A02, A03, A04,
  A05, A06, A07, A08,
  A09, A10, A11, A12,
  A13, A14, A15, A16;

local subamp =
    
    + UBar(p2,0)*V(p1,0) * (
          + A01 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p1,p5)
          + A02 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p2,p5)
          + A03 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p1,p5)
          + A04 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p2,p5)
          )

       + UBar(p2,0)*Gr(0,p3)*V(p1,0) * (
          + A05 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p1,p5)
          + A06 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p2,p5)
          + A07 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p1,p5)
          + A08 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p2,p5)
          )

       + UBar(p2,0)*Gr(0,p3,p4)*V(p1,0) * (
          + A09 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p1,p5)
          + A10 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p2,p5)
          + A11 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p1,p5)
          + A12 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p2,p5)
          )

       + UBar(p2,0)*Gr(0,p4)*V(p1,0) * (
          + A13 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p1,p5)
          + A14 * VBar(p4,1)*Gr(1,p1)*U(p3,1)*EpsStar(p2,p5)
          + A15 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p1,p5)
          + A16 * VBar(p4,1)*Gr(1,p2)*U(p3,1)*EpsStar(p2,p5)
          );



***************************************helicity configuration choice (normalization: no -sqrt2)
id VBar(p4,1)*Gr(1,p?)*U(p3,1)*EpsStar(q?,p5) = braA(p4,1)*Gr(1,p,p3,q)*ketB(p5,1)*ispA(p5,p3);

***************************************reduction of slashed squares
#call ReduceSlashedSquares

***************************************bring all gamma strings in uniform order

id Gr(1,p1,p3,p2) = 2*p3.p2*Gr(1,p1)-Gr(1,p1,p2,p3);
id Gr(1,p2,p3,p1) = 2*p3.p1*Gr(1,p2)-2*p1.p2*Gr(1,p3)+Gr(1,p1,p2,p3);

***************************************replace p1 via momentum conservation and apply Dirac/asymmetry of brackets
id Gr(1,p1,?p) = -Gr(1,p2,?p)+Gr(1,p3,?p)+Gr(1,p4,?p)-Gr(1,p5,?p);
id Gr(1,p5)*ketB(p5,1) = 0;
id Gr(1,p5,p?,q?) = Gr(1,q)*2*p5.p - Gr(1,p)*2*p5.q + Gr(1,p,q,p5);
id Gr(1,?p,p5)*ketB(p5,1) = 0;
id braA(p4,1)*Gr(1,p4,?x) = 0;

***************************************reduction of slashed squares
#Call ReduceSlashedSquares

***************************************contract brackets
id braA(p4,1)*Gr(1,p?{p3,p4})*ketB(p5,1) = spA(p4,p)*spB(p,p5);
#Call Invariants
id spA(p3,p4)*spB(p3,p5)*ispA(p3,p5) = hel;

b UBar, V;
print +s;
.sort

.end