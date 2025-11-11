#-

#include declarations.h

Off Statistics;
Format 255;



***************************************color decomposition
*#include color_decomposition/0L_d12T435.out
id cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^(-1) = 1;
.sort

*#include color_decomposition/0L_d14T235.out
id cOldel(i1,i4)*cOlT(i2,i3,a5) = 1;
.sort

#include color_decomposition/0L_d23T415.out
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
id Gr(v0?,?x,v0l0?,?y)*EpsStar(v0l0?,p5) = Gr(v0,?x,rho,?y)*EpsStar(rho,p5);



***************************************contract lorentzindices between different string (decompose metric into p1,p2,p3,p4)
id Gr(v0?,?s1,v0l0?,?s2) *V(p1,v0?)*VBar(p4,v1?)* Gr(v1?,?s3,v0l0?,?s4) = gmunu(alpha,beta)*Gr(v0,?s1,alpha,?s2) *V(p1,v0)*VBar(p4,v1)* Gr(v1,?s3,beta,?s4);

.sort



***************************************contract lorentzindices between strings and EpsStar (decompose metric into p1,p2,p3,p4)
id Gr(v0?,?x,rho?,?y)*EpsStar(rho?,p5) = gmunu(kappa,phi)*Gr(v0,?x,kappa,?y)*EpsStar(phi,p5);

.sort



***************************************Minkowski in terms of Gram (p1,p2,p3,p4), still symbolic in gram inverse, see below

* for simplicity InvGij = 1 (off-diagonal symmetry not killed, but oversimplification killing not understood terms)
*id gmunu(mu?,nu?) = p1(mu)*p1(nu) + p1(mu)*p2(nu)  + p1(mu)*p3(nu)  + p2(mu)*p1(nu) + p2(mu)*p2(nu) + p2(mu)*p3(nu) + p2(mu)*p4(nu) + p3(mu)*p1(nu) + p3(mu)*p2(nu) + p3(mu)*p3(nu) + p3(mu)*p4(nu) + p4(mu)*p1(nu) + p4(mu)*p2(nu) + p4(mu)*p3(nu)  + p4(mu)*p4(nu);

* InvGij in symbolic form including the symmetry of off-diagonals
id gmunu(mu?,nu?) = InvG11*p1(mu)*p1(nu)  + InvG12*(p1(mu)*p2(nu) + p2(mu)*p1(nu))  + InvG13*(p1(mu)*p3(nu) + p3(mu)*p1(nu))  + InvG14*(p1(mu)*p4(nu) + p4(mu)*p1(nu))  + InvG22*p2(mu)*p2(nu)  + InvG23*(p2(mu)*p3(nu) + p3(mu)*p2(nu))  + InvG24*(p2(mu)*p4(nu) + p4(mu)*p2(nu))  + InvG33*p3(mu)*p3(nu)  + InvG34*(p3(mu)*p4(nu) + p4(mu)*p3(nu))  + InvG44*p4(mu)*p4(nu);

.sort



***************************************reduction of slashed squares
#call ReduceSlashedSquares
id Gr(v?,p?,p?) = p.p;
#Call Invariants
*could be done later but might kill some terms with massless momentum squares

.sort



***************************************Dirac equation
#Call DiracEquation

#Call Invariants

.sort



***************************************bring p4slashed p3slashed in correct order
id UBar(p2,v?)*Gr(v?,p4,p3)*V(p1,v?) = UBar(p2,v)*(2*p3.p4-Gr(v,p3,p4))*V(p1,v);

#Call Invariants

.sort



***************************************replace p4 in eps prods (momentum conservation)
id EpsStar(p4,p5) = -EpsStar(p3,p5)+EpsStar(p1,p5)+EpsStar(p2,p5);
.sort



***************************************gauge choice p3*epsStar = 0 (reference vector choice q=p3)
id EpsStar(p3,p5) = 0;
.sort



***************************************Plug in values to print part in progress

*#call Values

*b UBar,V;
*print +s; *correct tensor basis brute force reproduced
*.sort



********************************************************************************************************************************
* second step: perform spinor helicity formalism on p3,p4,p5 part
********************************************************************************************************************************



***************************************helicity configuration choice (normalization: no -sqrt2)
id VBar(p4,1)*Gr(1,p?)*U(p3,1)*EpsStar(q?,p5) = braA(p4,1)*Gr(1,p,p3,q)*ketB(p5,1)*ispA(p5,p3);



***************************************reduction of slashed squares
#call ReduceSlashedSquares



***************************************bring all gamma strings in uniform order
* expect cancellation from terms containing slashed p1,p2 once momentum conservation applied (???)
id Gr(1,p1,p3,p2) = 2*p3.p2*Gr(1,p1)-Gr(1,p1,p2,p3);
id Gr(1,p2,p3,p1) = 2*p3.p1*Gr(1,p2)-2*p1.p2*Gr(1,p3)+Gr(1,p1,p2,p3);

.sort



***************************************replace p1 via momentum conservation and apply Dirac/asymmetry of brackets
id Gr(1,p1,?x) = -Gr(1,p2,?x)+Gr(1,p3,?x)+Gr(1,p4,?x)-Gr(1,p5,?x);

id Gr(1,p5)*ketB(p5,1) = 0;
id Gr(1,p5,p?,q?) = Gr(1,q)*2*p5.p - Gr(1,p)*2*p5.q + Gr(1,p,q,p5);
id Gr(1,?p,p5)*ketB(p5,1) = 0;
id braA(p4,1)*Gr(1,p4,?x) = 0;



***************************************reduction of slashed squares
#call ReduceSlashedSquares



***************************************contract brackets
id braA(p4,1)*Gr(1,p?{p3,p4})*ketB(p5,1) = spA(p4,p)*spB(p,p5);



***************************************Plug in values to print part in progress
#call Invariants
#call Values

b UBar,V;
print +s;
.sort



********************************************************************************************************************************
* third step: perform spinor helicity formalism on p1,p2 part
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



**************************************reduce slashed squares
#Call ReduceSlashedSquares



**************************************replace p3/4 p5 and correct order
id Gr(0,p3,p5) = pow(2*pp34,-1)*( Gr(0,p3,p5,p4,p3)+2*p3.p5*Gr(0,p3,p4) );
id Gr(0,p4,p5) = pow(2*pp34,-1)*( Gr(0,p4,p5,p3,p4)+2*p4.p5*Gr(0,p4,p3) );
id Gr(0,p4,p3) = -Gr(0,p3,p4)+2*p3.p4;



**************************************bring p2 to same position
id Gr(0,p?,p2) = 2*p2.p - Gr(0,p2,p);
id Gr(0,p2,p4,p3) = 2*p3.p4*Gr(0,p2)-Gr(0,p2,p3,p4);
.sort



***************************************close brackets
id braA(r2,0)*ketA(r1,0) = spA(r2,r1);
id braA(r2,0)*Gr(0,p?{p3,p4},q?{p3,p4})*ketA(r1,0) = spA(r2,p)*spB(p,q)*spA(q,r1);

id braA(r2,0)*Gr(0,p?)*ketA(r1,0) =  0;
id braA(r2,0)*Gr(0,p?,q?,k?)*ketA(r1,0) = 0;

id braA(r2,0)*Gr(0,p3,p5,p4,p3)*ketA(r1,0) = spA(r2,p3)*spBB(p3,p5,p4,p3)*spA(p3,r1);
id braA(r2,0)*Gr(0,p4,p5,p3,p4)*ketA(r1,0) = spA(r2,p4)*spBB(p4,p5,p3,p4)*spA(p4,r1);



*****************************************reduce remaining slashed ReduceSlashedSquares
#call ReduceSlashedSquares




id spA(p3,p4)*spB(p3,p5)*ispA(p3,p5)*ispA(r1,f1)*ispA(r2,f2) = hel;
id spA(r1,r2) = hel1;
id spA(p4,r1)*spA(p3,r2)*spB(p3,p4) = hel2;
id spA(p3,r1)*spA(p3,r2)*spBB(p3,p5,p4,p3) = hel3;
id spA(p4,r1)*spA(p4,r2)*spBB(p4,p5,p3,p4) = hel4;




***************************************Plug in values to print part in progress



#call Invariants
#call Values

b hel, hel1, hel2, hel3, hel4;
print +s;
.sort



.end