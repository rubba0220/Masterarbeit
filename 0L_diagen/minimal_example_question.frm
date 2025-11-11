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
repeat;
id Gr(1,p?,p?) = p.p;
id Gr(1,p?,q?,p?) = 2*p.q*Gr(1,p)-p.p*Gr(1,q);
id Gr(1, ?x, p?, p?, ?y) = p.p * Gr(1, ?x, ?y);
endrepeat;

.sort



***************************************bring all gamma strings in uniform order

id Gr(1,p1,p3,p2) = 2*p3.p2*Gr(1,p1)-Gr(1,p1,p2,p3);
id Gr(1,p2,p3,p1) = 2*p3.p1*Gr(1,p2)-2*p1.p2*Gr(1,p3)+Gr(1,p1,p2,p3);

#call Invariants

.sort



***************************************replace p1 via momentum conservation and apply Dirac/asymmetry of brackets
id Gr(1,p1, ?p) = -Gr(1,p2,?p)+Gr(1,p3,?p)+Gr(1,p4,?p)-Gr(1,p5,?p);
id Gr(1,p5)*ketB(p5,1) = 0;
id Gr(1,p5,p?,q?) = Gr(1,q)*2*p5.p - Gr(1,p)*p5.q + Gr(1,p,q,p5);
id Gr(1,?p,p5)*ketB(p5,1) = 0;



***************************************reduction of slashed squares
repeat;
id Gr(1,p?,p?) = p.p;
id Gr(1,p?,q?,p?) = 2*p.q*Gr(1,p)-p.p*Gr(1,q);
id Gr(1, ?x, p?, p?, ?y) = p.p * Gr(1, ?x, ?y);
endrepeat;

.sort



***************************************contract brackets
id braA(p4,1)*Gr(1,p?{p3,p4})*ketB(p5,1) = spA(p4,p)*spB(p,p5);



Argument G;
id p1 = -p2+p5+p3+p4;
EndArgument;

Splitarg, G;

repeat;
id G(v?, p?) = Gr(v,p);
id G(v?, p1?, ?p2) = G(v, p1) + G(v, ?p2);
endrepeat;

Factarg, Gr;

id Gr(v?, p?vector_,-1,x?number_) = -x*Gr(v,p);
id Gr(v?, p?vector_, x?number_) = x*Gr(v,p);

.sort



***************************************make gamma strings
id Gi(0) = 1;
repeat id Gr(0, ?x)*Gr(0, ?y) = Gr(0, ?x, ?y);



**************************************replace p3/4 p5 and correct order
id Gr(0,p3,p5) = pow(2*p3.p4,-1)*( Gr(0,p3,p5,p4,p3)+2*p3.p5*Gr(0,p3,p4) );
id Gr(0,p4,p5) = pow(2*p3.p4,-1)*( Gr(0,p4,p5,p3,p4)+2*p4.p5*Gr(0,p4,p3) );
id Gr(0,p4,p3) = -Gr(0,p3,p4)+2*p3.p4;



**************************************bring p2 to same position
id braA(r2,0)*Gr(0,p2,p?)*ketA(r1,0) = braA(r2,0)*ketA(r1,0)*2*p2.p - braA(r2,0)*Gr(0,p,p2)*ketA(r1,0);
.sort



***************************************reduction of slashed squares
repeat;
id Gr(0,p?,p?) = p.p;
id Gr(0,?k1,p?,q?,p?,?k2) = 2*p.q*Gr(0,?k1,p,?k2)-p.p*Gr(0,?k1,q,?k2);
id Gr(0,?k1,p?,q?,k?,p?,?k2) = 2*p.k*Gr(0,?k1,p,q,?k2)-2*p.q*Gr(0,?k1,p,k,?k2)+p.p*Gr(0,?k1,q,k,?k2);
id Gr(0, ?x, p?, p?, ?y) = p.p * Gr(0, ?x, ?y);
endrepeat;

.sort



***************************************close brackets
id braA(r2,0)*ketA(r1,0) = spA(r2,r1);
id braA(r2,0)*Gr(0,p?{p3,p4},q?{p3,p4})*ketA(r1,0) = spA(r2,p)*spB(p,q)*spA(q,r1);

id braA(r2,0)*Gr(0,p?)*ketA(r1,0) =  0;
id braA(r2,0)*Gr(0,p?,q?,k?)*ketA(r1,0) = 0;

id braA(r2,0)*Gr(0,p3,p5,p4,p3)*ketA(r1,0) = spA(r2,p3)*spBB(p3,p5,p4,p3)*spA(p3,r1);
id braA(r2,0)*Gr(0,p4,p5,p3,p4)*ketA(r1,0) = spA(r2,p4)*spBB(p4,p5,p3,p4)*spA(p4,r1);

***************************************perform spinor helicity state replacements
id V(p1, v?) = (G(v,p1)-M*Gi(v)) * ispA(f1,r1) * ketA(r1,v);
id UBar(p2,v?) = braA(r2,v) * (G(v,p2)+M*Gi(v)) * ispA(f2,r2);



***************************************momentum conservation and splitting
Argument G;
id p1 = -p2+p5+p3+p4;
EndArgument;

Splitarg, G;

repeat;
id G(v?, p?) = Gr(v,p);
id G(v?, p1?, ?p2) = G(v, p1) + G(v, ?p2);
endrepeat;

Factarg, Gr;

id Gr(v?, p?vector_,-1,x?number_) = -x*Gr(v,p);
id Gr(v?, p?vector_, x?number_) = x*Gr(v,p);

.sort



***************************************make gamma strings
id Gi(0) = 1;
repeat id Gr(0, ?x)*Gr(0, ?y) = Gr(0, ?x, ?y);



**************************************replace p3/4 p5 and correct order
id Gr(0,p3,p5) = pow(2*p3.p4,-1)*( Gr(0,p3,p5,p4,p3)+2*p3.p5*Gr(0,p3,p4) );
id Gr(0,p4,p5) = pow(2*p3.p4,-1)*( Gr(0,p4,p5,p3,p4)+2*p4.p5*Gr(0,p4,p3) );
id Gr(0,p4,p3) = -Gr(0,p3,p4)+2*p3.p4;



**************************************bring p2 to same position
id braA(r2,0)*Gr(0,p2,p?)*ketA(r1,0) = braA(r2,0)*ketA(r1,0)*2*p2.p - braA(r2,0)*Gr(0,p,p2)*ketA(r1,0);
.sort



***************************************reduction of slashed squares
repeat;
id Gr(0,p?,p?) = p.p;
id Gr(0,?k1,p?,q?,p?,?k2) = 2*p.q*Gr(0,?k1,p,?k2)-p.p*Gr(0,?k1,q,?k2);
id Gr(0,?k1,p?,q?,k?,p?,?k2) = 2*p.k*Gr(0,?k1,p,q,?k2)-2*p.q*Gr(0,?k1,p,k,?k2)+p.p*Gr(0,?k1,q,k,?k2);
id Gr(0, ?x, p?, p?, ?y) = p.p * Gr(0, ?x, ?y);
endrepeat;

.sort



***************************************close brackets
id braA(r2,0)*ketA(r1,0) = spA(r2,r1);
id braA(r2,0)*Gr(0,p?{p3,p4},q?{p3,p4})*ketA(r1,0) = spA(r2,p)*spB(p,q)*spA(q,r1);

id braA(r2,0)*Gr(0,p?)*ketA(r1,0) =  0;
id braA(r2,0)*Gr(0,p?,q?,k?)*ketA(r1,0) = 0;

id braA(r2,0)*Gr(0,p3,p5,p4,p3)*ketA(r1,0) = spA(r2,p3)*spBB(p3,p5,p4,p3)*spA(p3,r1);
id braA(r2,0)*Gr(0,p4,p5,p3,p4)*ketA(r1,0) = spA(r2,p4)*spBB(p4,p5,p3,p4)*spA(p4,r1);














***************************************perform spinor helicity state replacements
id V(p1, v?) = (G(v,p1)-M*Gi(v)) * ispA(f1,r1) * ketA(r1,v);
id UBar(p2,v?) = braA(r2,v) * (G(v,p2)+M*Gi(v)) * ispA(f2,r2);



***************************************momentum conservation and splitting
Argument G;
id p1 = -p2+p5+p3+p4;
EndArgument;

Splitarg, G;

repeat;
id G(v?, p?) = Gr(v,p);
id G(v?, p1?, ?p2) = G(v, p1) + G(v, ?p2);
endrepeat;

Factarg, Gr;

id Gr(v?, p?vector_,-1,x?number_) = -x*Gr(v,p);
id Gr(v?, p?vector_, x?number_) = x*Gr(v,p);

.sort



***************************************make gamma strings
id Gi(0) = 1;
repeat id Gr(0, ?x)*Gr(0, ?y) = Gr(0, ?x, ?y);



**************************************replace p3/4 p5 and correct order
id Gr(0,p3,p5) = pow(2*p3.p4,-1)*( Gr(0,p3,p5,p4,p3)+2*p3.p5*Gr(0,p3,p4) );
id Gr(0,p4,p5) = pow(2*p3.p4,-1)*( Gr(0,p4,p5,p3,p4)+2*p4.p5*Gr(0,p4,p3) );
id Gr(0,p4,p3) = -Gr(0,p3,p4)+2*p3.p4;



**************************************bring p2 to same position
id braA(r2,0)*Gr(0,p2,p?)*ketA(r1,0) = braA(r2,0)*ketA(r1,0)*2*p2.p - braA(r2,0)*Gr(0,p,p2)*ketA(r1,0);
.sort



***************************************reduction of slashed squares
repeat;
id Gr(0,p?,p?) = p.p;
id Gr(0,?k1,p?,q?,p?,?k2) = 2*p.q*Gr(0,?k1,p,?k2)-p.p*Gr(0,?k1,q,?k2);
id Gr(0,?k1,p?,q?,k?,p?,?k2) = 2*p.k*Gr(0,?k1,p,q,?k2)-2*p.q*Gr(0,?k1,p,k,?k2)+p.p*Gr(0,?k1,q,k,?k2);
id Gr(0, ?x, p?, p?, ?y) = p.p * Gr(0, ?x, ?y);
endrepeat;

.sort



***************************************close brackets
id braA(r2,0)*ketA(r1,0) = spA(r2,r1);
id braA(r2,0)*Gr(0,p?{p3,p4},q?{p3,p4})*ketA(r1,0) = spA(r2,p)*spB(p,q)*spA(q,r1);

id braA(r2,0)*Gr(0,p?)*ketA(r1,0) =  0;
id braA(r2,0)*Gr(0,p?,q?,k?)*ketA(r1,0) = 0;

id braA(r2,0)*Gr(0,p3,p5,p4,p3)*ketA(r1,0) = spA(r2,p3)*spBB(p3,p5,p4,p3)*spA(p3,r1);
id braA(r2,0)*Gr(0,p4,p5,p3,p4)*ketA(r1,0) = spA(r2,p4)*spBB(p4,p5,p3,p4)*spA(p4,r1);


id spA(r1,r2) = AA1;
id spA(p3,r1)*spA(p4,r2)*spB(p3,p4) = AA2;
id spA(p3,r1)*spA(p3,r2)*spBB(p3,p5,p4,p3) = AA3;
id spA(p4,r1)*spA(p4,r2)*spBB(p4,p5,p3,p4) = AA4;
id spA(p3,p4)*spB(p3,p5)*ispA(p3,p5) = AAA;
id ispA(f1,r1)*ispA(f2,r2) = norm;

id AAA * AA1 = 0;
id AAA * AA2 = 0;
id AAA * AA3 = 0;
id AAA * AA4 = 0;

b UBar, U, VBar, V, spA, spB, ispA, braA, ketB, AA1, AA2, AA3, AA4, AAA;
.sort
collect factors;
.sort
id factors(?x) = 1;
print +s;
.sort
.end

