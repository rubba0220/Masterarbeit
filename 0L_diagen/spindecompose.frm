#-

#include declarations.h

Off Statistics;
Format 255;



***************************************color decomposition
#include color_decomposition/0L_d12T435.out
id cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^(-1) = 1;
.sort

#include color_decomposition/0L_d14T235.out
id cOldel(i1,i4)*cOlT(i2,i3,a5) = 1;
.sort

#include color_decomposition/0L_d23T415.out
id cOldel(i2,i3)*cOlT(i4,i1,a5) = 1;
.sort

#include color_decomposition/0L_d34T215.out
id cOldel(i3,i4)*cOlT(i2,i1,a5)*NF^(-1) = 1;
.sort


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



***************************************standard order
id VBar(p4,v0?)*Gr(v0?,?x)*U(p3,v0?)*UBar(p2,v1?)*Gr(v1?,?y)*V(p1,v1?) = UBar(p2,0)*Gr(0,?y)*V(p1,0)*VBar(p4,1)*Gr(1,?x)*U(p3,1);



***************************************standard indices
id UBar(p2,0)*Gr(0,?x,v0l0?,?y)*V(p1,0)*VBar(p4,1)*Gr(1,?z)*U(p3,1)*EpsStar(v0l0?,p5) = UBar(p2,0)*Gr(0,?x,rho,?y)*V(p1,0)*VBar(p4,1)*Gr(1,?z)*U(p3,1)*EpsStar(rho,p5);
id UBar(p2,0)*Gr(0,?x)*V(p1,0)*VBar(p4,1)*Gr(1,?y, v0l0?,?z)*U(p3,1)*EpsStar(v0l0?,p5) = UBar(p2,0)*Gr(0,?x)*V(p1,0)*VBar(p4,1)*Gr(1,?y,rho,?z)*U(p3,1)*EpsStar(rho,p5);



***************************************contract lorentzindices between different strings
id UBar(p2,v0?)*Gr(v0?,v0l0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,v0l0?,?y)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,beta,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,alpha,?y)*U(p3,v1);
id UBar(p2,v0?)*Gr(v0?,v0l0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y,v0l0?)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,beta,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y,alpha)*U(p3,v1);
id UBar(p2,v0?)*Gr(v0?,?x,v0l0?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y,v0l0?)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,?x,beta)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y,alpha)*U(p3,v1);
id UBar(p2,v0?)*Gr(v0?,?x,v0l0?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,v0l0?,?y)*U(p3,v1?) = UBar(p2,v0)*gmunu(alpha,beta)*Gr(v0,?x,beta)*V(p1,v0)*VBar(p4,v1)*Gr(v1,alpha,?y)*U(p3,v1);

.sort



***************************************contract lorentzindices between strings and EpsStar
id UBar(p2,v0?)*Gr(v0?,rho?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,phi,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y)*U(p3,v1)*EpsStar(kappa,p5);
id UBar(p2,v0?)*Gr(v0?,?x,rho?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,?x,phi)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y)*U(p3,v1)*EpsStar(kappa,p5);
id UBar(p2,v0?)*Gr(v0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,rho?,?y)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,phi,?y)*U(p3,v1)*EpsStar(kappa,p5);
id UBar(p2,v0?)*Gr(v0?,?x)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,?y,rho?)*U(p3,v1?)*EpsStar(rho?,p5) = gmunu(kappa,phi) * UBar(p2,v0)*Gr(v0,?x)*V(p1,v0)*VBar(p4,v1)*Gr(v1,?y,phi)*U(p3,v1)*EpsStar(kappa,p5);

.sort



***************************************Minkowski in terms of Gram (p1,p2,p3,p4), still symbolic in gram inverse, see below
*#include gmunu.out *to large expression to be feasable
id gmunu(mu?,nu?) = p1(mu)*p1(nu) + p1(mu)*p2(nu)  + p1(mu)*p3(nu)  + p2(mu)*p1(nu) + p2(mu)*p2(nu) + p2(mu)*p3(nu) + p2(mu)*p4(nu) + p3(mu)*p1(nu) + p3(mu)*p2(nu) + p3(mu)*p3(nu) + p3(mu)*p4(nu) + p4(mu)*p1(nu) + p4(mu)*p2(nu) + p4(mu)*p3(nu)  + p4(mu)*p4(nu);

*id gmunu(mu?,nu?) = InvG11*p1(mu)*p1(nu)  + InvG12*(p1(mu)*p2(nu) + p2(mu)*p1(nu))  + InvG13*(p1(mu)*p3(nu) + p3(mu)*p1(nu))  + InvG14*(p1(mu)*p4(nu) + p4(mu)*p1(nu))  + InvG22*p2(mu)*p2(nu)  + InvG23*(p2(mu)*p3(nu) + p3(mu)*p2(nu))  + InvG24*(p2(mu)*p4(nu) + p4(mu)*p2(nu))  + InvG33*p3(mu)*p3(nu)  + InvG34*(p3(mu)*p4(nu) + p4(mu)*p3(nu))  + InvG44*p4(mu)*p4(nu);



***************************************reduction of slashed squares
* id Gr(0) = x; *for debug

repeat;
id Gr(v?,p?,p?) = p.p;
id Gr(v?,p?,q?,p?) = 2*p.q*Gr(v,p)-p.p*Gr(v,q);
id Gr(v?, ?x, p?, p?, ?y) = p.p * Gr(v, ?x, ?y);
endrepeat;

id p1.p1 = M^2;
id p2.p2 = M^2;
id p3.p3 = 0;
id p4.p4 = 0;
id p5.p5 = 0;

.sort



***************************************Dirac equation
repeat;
id UBar(p2,v?)*Gr(v?,p2,?x)*V(p1,v?) = 0;
id UBar(p2,v?)*Gr(v?,?x,p1)*V(p1,v?) = 0;
id VBar(p4,v?)*Gr(v?,p4,?x)*U(p3,v?) = 0;
id VBar(p4,v?)*Gr(v?,?x,p3)*U(p3,v?) = 0;

id VBar(p4,v?)*Gr(v?,p3,v1l1?index_)*U(p3,v?) = VBar(p4,v)*2*p3(v1l1)*U(p3,v);
id VBar(p4,v?)*Gr(v?,v0l0?index_,p4)*U(p3,v?) = VBar(p4,v)*2*p4(v0l0)*U(p3,v);
id UBar(p2,v?)*Gr(v?,p1,v1l1?index_)*V(p1,v?) = UBar(p2,v)*2*p1(v1l1)*V(p1,v);
id UBar(p2,v?)*Gr(v?,v0l0?index_,p2)*V(p1,v?) = UBar(p2,v)*2*p2(v0l0)*V(p1,v);

id VBar(p4,v?)*Gr(v?,p3,p?vector_)*U(p3,v?) = VBar(p4,v)*2*p3.p*U(p3,v);
id VBar(p4,v?)*Gr(v?,p?vector_,p4)*U(p3,v?) = VBar(p4,v)*2*p4.p*U(p3,v);
id UBar(p2,v?)*Gr(v?,p1,p?vector_)*V(p1,v?) = UBar(p2,v)*2*p1.p*V(p1,v);
id UBar(p2,v?)*Gr(v?,p?vector_,p2)*V(p1,v?) = UBar(p2,v)*2*p2.p*V(p1,v);

id VBar(p4,v?)*Gr(v?,?x,p3,v1l1?index_)*U(p3,v?) = VBar(p4,v)*Gr(v,?x)*2*p3(v1l1)*U(p3,v);
id VBar(p4,v?)*Gr(v?,v0l0?index_,p4,?y)*U(p3,v?) = VBar(p4,v)*2*p4(v0l0)*Gr(v,?y)*U(p3,v);
id UBar(p2,v?)*Gr(v?,?x,p1,v1l1?index_)*V(p1,v?) = UBar(p2,v)*Gr(v,?x)*2*p1(v1l1)*V(p1,v);
id UBar(p2,v?)*Gr(v?,v0l0?index_,p2,?x)*V(p1,v?) = UBar(p2,v)*2*p2(v0l0)*Gr(v,?x)*V(p1,v);

id VBar(p4,v?)*Gr(v?,?p,p3,q?vector_,?k)*U(p3,v?) = VBar(p4,v)*(2*p3.q*Gr(v,?p,?k) - Gr(v,?p,q,p3,?k))*U(p3,v);
id VBar(p4,v?)*Gr(v?,?p,q?vector_,p4,?k)*U(p3,v?) = VBar(p4,v)*(2*p4.q*Gr(v,?p,?k) - Gr(v,?p,p4,q,?k))*U(p3,v);
id UBar(p2,v?)*Gr(v?,?p,p1,q?vector_,?k)*V(p1,v?) = UBar(p2,v)*(2*p1.p*Gr(v,?p,?k) - Gr(v,?p,q,p1,?k))*V(p1,v);
id UBar(p2,v?)*Gr(v?,?p,q?vector_,p2,?k)*V(p1,v?) = UBar(p2,v)*(2*p2.p*Gr(v,?p,?k) - Gr(v,?p,p2,q,?k))*V(p1,v);
endrepeat;

.sort



***************************************bring p4slashed p3slashed in correct order
id UBar(p2,v?)*Gr(v?,p4,p3)*V(p1,v?) = UBar(p2,v)*(2*p3.p4-Gr(v,p3,p4))*V(p1,v);

.sort



***************************************replace p1, p2 in eps prods
id EpsStar(p4,p5) = -EpsStar(p3,p5)+EpsStar(p1,p5)+EpsStar(p2,p5);
.sort



***************************************plug in Inverse Gram in terms of invariants
#include gdecomp.out
.sort



***************************************Plug in bullshit to figure out spinor structures
id pow(?x) = 1/23;
id pp12 = 2/11;
id pp23 = 1/67;
id pp34 = 1/3;
id pp45 = 1/101;
id pp15 = 23/2;
id M = 4/119;
id p?vector_.q?vector_ = 1;

*.sort



***************************************bracket all spinor stuff and perform spinor helicity state replacements 
b V,VBar,Gr,U,UBar,EpsStar;

*id V(p1, v?) = (Gr(v,p1)-M*gi_(v)) * pow(spA(f1,n1),-1) * ketA(n1,v);
*id UBar(p2,v?) = braA(n2,v) * (Gr(v,p2)+M*gi_(v)) * pow(spA(f2,n2),-1);
*id U(p3, v?) = ketA(p3,v);
*id VBar(p4,v?) = braA(p4,v);

*id EpsStar(p?,p5) = pow(2, -1/2)*spA(k,p5)^(-1) * 2 * (ketA(k,v)*braB(p5,v)+ketB(p5,v)*braA(k1,v));
*.sort



***************************************output
print +s;
.end