#-

#include declarations.h

Off Statistics;
Format 255;



***************************************color decomposition
*#include color_decomposition/0L_d12T435.out
id cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^(-1) = 1;
.sort

#include color_decomposition/0L_d14T235.out
id cOldel(i1,i4)*cOlT(i2,i3,a5) = 1;
.sort

*#include color_decomposition/0L_d23T415.out
id cOldel(i2,i3)*cOlT(i4,i1,a5) = 1;
.sort

*#include color_decomposition/0L_d34T215.out
id cOldel(i3,i4)*cOlT(i2,i1,a5)*NF^(-1) = 1;
.sort



********************************************************************************************************************************
* first step: bring into tensor basis from paper
********************************************************************************************************************************



***************************************momentum conservation and splitting
id G(v?, v0l0?index_) = Gr(v, v0l0);

Argument G;
id p5 = -p1-p2+p3+p4;
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
id Gi(?x) = 1;
repeat id Gr(v?, ?x)*Gr(v?, ?y) = Gr(v, ?x, ?y);



***************************************standard order p3/4 left p1/2 right
id VBar(p4,v0?)*Gr(v0?,?x)*U(p3,v0?)*UBar(p2,v1?)*Gr(v1?,?y)*V(p1,v1?) = UBar(p2,0)*Gr(0,?y)*V(p1,0)*VBar(p4,1)*Gr(1,?x)*U(p3,1);



***************************************standard indices EpsStar(rho,p)
id UBar(p2,0)*Gr(0,?x,v0l0?,?y)*V(p1,0)*VBar(p4,1)*Gr(1,?z)*U(p3,1)*EpsStar(v0l0?,p5) = UBar(p2,0)*Gr(0,?x,rho,?y)*V(p1,0)*VBar(p4,1)*Gr(1,?z)*U(p3,1)*EpsStar(rho,p5);
id UBar(p2,0)*Gr(0,?x)*V(p1,0)*VBar(p4,1)*Gr(1,?y, v0l0?,?z)*U(p3,1)*EpsStar(v0l0?,p5) = UBar(p2,0)*Gr(0,?x)*V(p1,0)*VBar(p4,1)*Gr(1,?y,rho,?z)*U(p3,1)*EpsStar(rho,p5);



***************************************contract lorentzindices between different string (decompose metric into p1,p2,p3,p4)
id UBar(p2,v0?)*Gr(v0?,v0l0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,v0l0?,?y)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,beta,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,alpha,?y)*U(p3,v1);
id UBar(p2,v0?)*Gr(v0?,v0l0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y,v0l0?)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,beta,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y,alpha)*U(p3,v1);
id UBar(p2,v0?)*Gr(v0?,?x,v0l0?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y,v0l0?)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,?x,beta)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y,alpha)*U(p3,v1);
id UBar(p2,v0?)*Gr(v0?,?x,v0l0?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,v0l0?,?y)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,?x,beta)*V(p1,v0)*VBar(p4,v1)*Gr(v1,alpha,?y)*U(p3,v1);

.sort



***************************************contract lorentzindices between strings and EpsStar (decompose metric into p1,p2,p3,p4)
id UBar(p2,v0?)*Gr(v0?,rho?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,phi,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y)*U(p3,v1)*EpsStar(kappa,p5);
id UBar(p2,v0?)*Gr(v0?,?x,rho?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,?x,phi)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y)*U(p3,v1)*EpsStar(kappa,p5);
id UBar(p2,v0?)*Gr(v0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,rho?,?y)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,phi,?y)*U(p3,v1)*EpsStar(kappa,p5);
id UBar(p2,v0?)*Gr(v0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y,rho?)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y,phi)*U(p3,v1)*EpsStar(kappa,p5);

.sort



***************************************Minkowski in terms of Gram (p1,p2,p3,p4), still symbolic in gram inverse, see below
* #include gmunu.out *too large expression to be feasable

* for simplicity InvGij = 1 (off-diagonal symmetry not killed)
*id gmunu(mu?,nu?) = p1(mu)*p1(nu) + p1(mu)*p2(nu)  + p1(mu)*p3(nu)  + p2(mu)*p1(nu) + p2(mu)*p2(nu) + p2(mu)*p3(nu) + p2(mu)*p4(nu) + p3(mu)*p1(nu) + p3(mu)*p2(nu) + p3(mu)*p3(nu) + p3(mu)*p4(nu) + p4(mu)*p1(nu) + p4(mu)*p2(nu) + p4(mu)*p3(nu)  + p4(mu)*p4(nu);

* InvGij in symbolic form including the symmetry of off-diagonals
id gmunu(mu?,nu?) = InvG11*p1(mu)*p1(nu)  + InvG12*(p1(mu)*p2(nu) + p2(mu)*p1(nu))  + InvG13*(p1(mu)*p3(nu) + p3(mu)*p1(nu))  + InvG14*(p1(mu)*p4(nu) + p4(mu)*p1(nu))  + InvG22*p2(mu)*p2(nu)  + InvG23*(p2(mu)*p3(nu) + p3(mu)*p2(nu))  + InvG24*(p2(mu)*p4(nu) + p4(mu)*p2(nu))  + InvG33*p3(mu)*p3(nu)  + InvG34*(p3(mu)*p4(nu) + p4(mu)*p3(nu))  + InvG44*p4(mu)*p4(nu);



***************************************reduction of slashed squares
id Gr(0) = x; *for debug

repeat;
id Gr(v?,p?,p?) = p.p;
id Gr(v?,p?,q?,p?) = 2*p.q*Gr(v,p)-p.p*Gr(v,q);
id Gr(v?, ?x, p?, p?, ?y) = p.p * Gr(v, ?x, ?y);
endrepeat;

id p1.p1 = M^2; *could be sone later but might reduce number of terms
id p2.p2 = M^2;
id p3.p3 = 0;
id p4.p4 = 0;
id p5.p5 = 0;

.sort



***************************************Dirac equation
id Gr(v?) = y; *debug

repeat;

id VBar(p4,v?)*Gr(v?,p4,?x)*U(p3,v?) = 0;
id VBar(p4,v?)*Gr(v?,?x,p3)*U(p3,v?) = 0;

id UBar(p2,v?)*Gr(v?,p2,?x)*V(p1,v?) = M*UBar(p2,v)*Gr(v,?x)*V(p1,v);
id UBar(p2,v?)*Gr(v?,?x,p1)*V(p1,v?) = -M*UBar(p2,v)*Gr(v,?x)*V(p1,v);

*id VBar(p4,v?)*Gr(v?,p3,v1l1?index_)*U(p3,v?) = VBar(p4,v)*2*p3(v1l1)*U(p3,v);
*id VBar(p4,v?)*Gr(v?,v0l0?index_,p4)*U(p3,v?) = VBar(p4,v)*2*p4(v0l0)*U(p3,v);
*id UBar(p2,v?)*Gr(v?,p1,v1l1?index_)*V(p1,v?) = UBar(p2,v)*(2*p1(v1l1)-Gr(v,v1l1,p1))*V(p1,v);
*id UBar(p2,v?)*Gr(v?,v0l0?index_,p2)*V(p1,v?) = UBar(p2,v)*(2*p2(v0l0)-Gr(v,p2,v0l0))*V(p1,v);
*id VBar(p4,v?)*Gr(v?,p3,p?vector_)*U(p3,v?) = VBar(p4,v)*2*p3.p*U(p3,v);
*id VBar(p4,v?)*Gr(v?,p?vector_,p4)*U(p3,v?) = VBar(p4,v)*2*p4.p*U(p3,v);
*id UBar(p2,v?)*Gr(v?,p1,p?vector_)*V(p1,v?) = UBar(p2,v)*(2*p1.p-Gr(v,p,p1))*V(p1,v);
*id UBar(p2,v?)*Gr(v?,p?vector_,p2)*V(p1,v?) = UBar(p2,v)*(2*p2.p-Gr(v,p2,p))*V(p1,v);

id VBar(p4,v?)*Gr(v?,?x,p3,v1l1?index_)*U(p3,v?) = VBar(p4,v)*Gr(v,?x)*2*p3(v1l1)*U(p3,v);
id VBar(p4,v?)*Gr(v?,v0l0?index_,p4,?y)*U(p3,v?) = VBar(p4,v)*2*p4(v0l0)*Gr(v,?y)*U(p3,v);

id UBar(p2,v?)*Gr(v?,?x,p1,v1l1?index_)*V(p1,v?) = UBar(p2,v)*(Gr(v,?x)*2*p1(v1l1)-Gr(v,?x,v1l1,p1))*V(p1,v);
id UBar(p2,v?)*Gr(v?,v0l0?index_,p2,?x)*V(p1,v?) = UBar(p2,v)*(Gr(v,?x)*2*p2(v0l0)-Gr(v,p2,v0l0,?x))*V(p1,v);

id VBar(p4,v?)*Gr(v?,?p,p3,q?vector_,?k)*U(p3,v?) = VBar(p4,v)*(2*p3.q*Gr(v,?p,?k)-Gr(v,?p,q,p3,?k))*U(p3,v);
id VBar(p4,v?)*Gr(v?,?p,q?vector_,p4,?k)*U(p3,v?) = VBar(p4,v)*(2*p4.q*Gr(v,?p,?k)-Gr(v,?p,p4,q,?k))*U(p3,v);

id UBar(p2,v?)*Gr(v?,?p,p1,q?vector_,?k)*V(p1,v?) = UBar(p2,v)*(2*p1.q*Gr(v,?p,?k)-Gr(v,?p,q,p1,?k))*V(p1,v);
id UBar(p2,v?)*Gr(v?,?p,q?vector_,p2,?k)*V(p1,v?) = UBar(p2,v)*(2*p2.q*Gr(v,?p,?k)-Gr(v,?p,p2,q,?k))*V(p1,v);
endrepeat;

id Gr(0) = 1;

repeat;
id p1.p1 = M^2;
id p2.p2 = M^2;
id p3.p3 = 0;
id p4.p4 = 0;
id p5.p5 = 0;
id p1.p2 = pp12;
id p2.p3 = pp23;
id p3.p4 = pp34;
id p4.p5 = pp45;
id p1.p5 = pp15;
id p3.p5 = -p1.p3-pp23-pp34;
id p2.p5 = -pp12-M^2-pp23-p2.p4;
id p1.p3 = -M^2-pp12-p1.p4-pp15;
id p2.p4 = -p1.p4-pp34-pp45;
id p1.p4 = pp23-pp45-pp15;
endrepeat;

.sort



***************************************bring p4slashed p3slashed in correct order
id UBar(p2,v?)*Gr(v?,p4,p3)*V(p1,v?) = UBar(p2,v)*(2*p3.p4-Gr(v,p3,p4))*V(p1,v);

.sort



***************************************replace p1, p2 in eps prods
id EpsStar(p4,p5) = -EpsStar(p3,p5)+EpsStar(p1,p5)+EpsStar(p2,p5);
.sort



***************************************Plug in bullshit to print part in progress
*id pow(?x) = 1/23;
*id pp12 = 2/11;
*id pp23 = 1/67;
*id pp34 = 1/3;
*id pp45 = 1/101;
*id pp15 = 23/2;
*id M = 4/119;
*repeat id x?{InvG11,InvG12,InvG13,InvG14,InvG22,InvG23,InvG24,InvG33,InvG34,InvG44} = 1;

*b V,VBar,Gr,U,UBar,EpsStar;
*print +s; *correct tensor basis brute force reproduced
*.sort



********************************************************************************************************************************
* second step: perform spinor helicity formalism on p3,p4,p5 part
********************************************************************************************************************************



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
* expect cancellation from terms containing slashed p1,p2 once momentum conservation applied
id Gr(1,p?,q?,p?) = 2*p.q*Gr(1,p)-p.p*Gr(1,q);
id Gr(1,p1,p3,p2) = 2*p3.p2*Gr(1,p1)-Gr(1,p1,p2,p3);
id Gr(1,p2,p3,p1) = 2*p3.p1*Gr(1,p2)-2*p1.p2*Gr(1,p3)+Gr(1,p1,p2,p3);

repeat;
id p1.p1 = M^2;
id p2.p2 = M^2;
id p3.p3 = 0;
id p4.p4 = 0;
id p5.p5 = 0;
id p1.p2 = pp12;
id p2.p3 = pp23;
id p3.p4 = pp34;
id p4.p5 = pp45;
id p1.p5 = pp15;
id p3.p5 = -p1.p3-pp23-pp34;
id p2.p5 = -pp12-M^2-pp23-p2.p4;
id p1.p3 = -M^2-pp12-p1.p4-pp15;
id p2.p4 = -p1.p4-pp34-pp45;
id p1.p4 = pp23-pp45-pp15;
endrepeat;

.sort



***************************************replace p1 via momentum conservation and apply Dirac/asymmetry of brackets
id Gr(1,p1) = -Gr(1,p2)+Gr(1,p3)+Gr(1,p4)+Gr(1,p5);
id Gr(1,p5)*ketB(p5,1) = 0;



***************************************contract brackets
id braA(p4,1)*Gr(1,p?{p3,p4})*ketB(p5,1) = spA(p4,p)*spB(p,p5);



********************************************************************************************************************************
* third step: perform spinor helicity formalism on p1,p2,p3 part
********************************************************************************************************************************



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



***************************************close p2 brackets via massless decomposition
id Gr(?x) = G(?x);

repeat;
id G(v?, p?) = Gr(v,p);
id G(v?, p1?, ?p2) = G(v, p1) * G(v, ?p2);
endrepeat;

Argument Gr;
id p1 = f1 + r1;
id p2 = f2 + r2;
EndArgument;

Splitarg, Gr;

repeat;
id Gr(v?, p?) = G(v,p);
id Gr(v?, p1?, ?p2) = Gr(v, p1) + Gr(v, ?p2);
endrepeat;

id G(v?,r1) = M^2*pow(f1.r1)*G(v,r1);
id G(v?,r2) = M^2*pow(f2.r2)*G(v,r2);

id braA(r2,0)*G(0,r2) = 0;

repeat;
id braA(p?,v?)*G(v?,q?) = spA(p,q)*braB(q,v);
id braB(p?,v?)*G(v?,q?) = spB(p,q)*braA(q,v);
endrepeat;

id braA(p?,v?)*ketA(q?,v?) = spA(p,q);
id braB(p?,v?)*ketB(q?,v?) = spB(p,q);

repeat id G(v?, ?x)*G(v?, ?y) = G(v, ?x, ?y);
id braA(p?,v?)*G(v?,?x)*ketA(q?,v?) = spAA(p,?x,q);
id braA(p?,v?)*G(v?,?x)*ketB(q?,v?) = spAB(p,?x,q);

.sort





***************************************plug in Inverse Gram in terms of invariants
#include gscaledecomp_elements.out

.sort



***************************************invariants
repeat;
id p1.p1 = M^2;
id p2.p2 = M^2;
id p3.p3 = 0;
id p4.p4 = 0;
id p5.p5 = 0;
id p1.p2 = pp12;
id p2.p3 = pp23;
id p3.p4 = pp34;
id p4.p5 = pp45;
id p1.p5 = pp15;
id p3.p5 = -p1.p3-pp23-pp34;
id p2.p5 = -pp12-M^2-pp23-p2.p4;
id p1.p3 = -M^2-pp12-p1.p4-pp15;
id p2.p4 = -p1.p4-pp34-pp45;
id p1.p4 = pp23-pp45-pp15;
endrepeat;

.sort



***************************************set all good structures to one to work better
id ispA(f1,r1) = 1;
id ispA(f2,r2) = 1;

id spA(p3,p4)*spB(p3,p5)*ispA(p3,p5) = 1;


*id spA(p3,r1) = 1;
*id spA(p3,r2) = 1;
*id spB(p3,p5) = 1;
*id spBB(p3,p5,p4,p3) = 1;
*id spA(p4,r1) = 1;
*id spA(p4,r2) = 1;
*id spBB(p4,p5,p3,p4) = 1;
*id spA(r1,r2) = 1;
*id spB(p3,p4) = 1;



***************************************Plug in bullshit to print part in progress
id pow(?x) = 1;
id pp12 = 2;
id pp23 = 3;
id pp34 = 2;
id pp45 = 1;
id pp15 = 2;
id M = 5;

*repeat id x?{InvG11,InvG12,InvG13,InvG14,InvG22,InvG23,InvG24,InvG33,InvG34,InvG44} = 1;
*id InvG11 = 1;
*id InvG12 = 1;
*id InvG13 = 1;
*id InvG14 = 1;
*id InvG22 = 2;
*id InvG23 = 2;
*id InvG24 = 2;
*id InvG33 = 3;
*id InvG34 = 3;
*id InvG44 = 4;

b braA, braB, ketA, ketB, ispA, ispB, spA,spB, spAA, spBB, spAB, spBA, G;
print +s;
.sort


















**************************************change to G
*id Gr(?x) = G(?x);

***************************************close brackets
*id braA(r2,0)*G(0,p2,p?)*ketA(r1,0) = spA(r2,r1)*p2.p - braA(r2,0)*G(0,p,p2)*ketA(r1,0);
*id braA(r2,0)*ketA(r1,0) = spA(p,q);
*id braA(r2,0)*G(0,p1?{p3,p4},p2?{p3,p4})*ketA(r1,0) = spA(p,p3)*spB(p3,p4)*spA(p4,q);

*id braA(r2,0)*G(0,p?)*ketA(r1,0) =  0;
*id braA(r2,0)*G(0,p?,q?,k?)*ketA(r1,0) = 0;





.end