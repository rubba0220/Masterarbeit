#-

#include declarations.h

Off Statistics;
Format 255;











#include color_decomposition/0L_d12T435.out
id cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^(-1) = 1;
.sort

*#include color_decomposition/0L_d14T235.out
id cOldel(i1,i4)*cOlT(i2,i3,a5)*NF = 1;
.sort

*#include color_decomposition/0L_d23T415.out
id cOldel(i2,i3)*cOlT(i4,i1,a5)*NF = 1;
.sort

*#include color_decomposition/0L_d34T215.out
id cOldel(i3,i4)*cOlT(i2,i1,a5)*NF = 1;
.sort











Argument G;
id p5 = -p1-p2+p3+p4;
EndArgument;

Splitarg, G;

repeat;
id G(v?, p1?, ?p2) = G(v, p1) + G(v, ?p2);
id G(v?, p?) = Gr(v,p);
id G(v?, v0l0?) = Gr(v, v0l0);
endrepeat;

Factarg, Gr;

id Gr(v?, p?vector_,-1,x?number_) = -x*Gr(v,p);
id Gr(v?, p?vector_, x?number_) = x*Gr(v,p);

*repeat id Gr(v?,v0l0?,p5,v1l1?) = -Gr(v,v0l0,p1,v1l1)-Gr(v,v0l0,p2,v1l1)+Gr(v,v0l0,p3,v1l1)+Gr(v,v0l0,p4,v1l1);
.sort






repeat id Gr(v?, ?x)*Gr(v?, ?y) = Gr(v, ?x, ?y);
.sort







id VBar(p4,v?)*Gr(v?,v0l0?,p3,v1l1?)*U(p3,v?) = VBar(p4,v)*Gr(v,v0l0)*2*p3(v1l1)*U(p3,v);
id VBar(p4,v?)*Gr(v?,v0l0?,p4,v1l1?)*U(p3,v?) = VBar(p4,v)*2*p3(v0l0)*Gr(v,v1l1)*U(p3,v);
.sort







id UBar(p2,v0?)*Gr(v0?,v0l0?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,v0l0?)*U(p3,v1?) =  UBar(p2,v0)*gmunu(mu,nu)*Gr(v0,mu)*V(p1,v0)*VBar(p4,v1)*Gr(v1,nu)*U(p3,v1);
id UBar(p2,v0?)*Gr(v0?,v0l0?)*V(p1,v0?)*VBar(p4,v1?)*Gr(v1?,v0l0?,p?,v1l1?)*U(p3,v1?) =  UBar(p2,v0)*gmunu(mu,nu)*Gr(v0,mu)*V(p1,v0)*VBar(p4,v1)*Gr(v1,v1l1,p,nu)*U(p3,v1);
id VBar(p4,v0?)*Gr(v0?,v1l1?,p?,v0l0?)*U(p3,v0?)*UBar(p2,v1?)*Gr(v1?,v0l0?)*V(p1,v1?) =  VBar(p4,v0)*Gr(v0,v1l1,p,nu)*U(p3,v0)*UBar(p2,v1)*gmunu(mu,nu)*Gr(v1,mu)*V(p1,v1);
.sort











#include gmunu.out
id pow(?x) = 1;
id pp12 = 1;
id pp23 = 1;
id pp34 = 1;
id pp45 = 1;
id pp15 = 1;
id M = 1;
.sort




b V,VBar,Gr,U,UBar,EpsStar;

*id V(p1, v?) = (Gr(v,p1)-M*gi_(v)) * pow(spA(f1,n1),-1) * ketA(n1,v);
*id U(p3, v?) = ketA(p3,v);
*id VBar(p4,v?) = braA(p4,v);
*id UBar(p2,v?) = braA(n2,v) * (Gr(v,p2)+M*gi_(v)) * pow(spA(f2,n2),-1);

*id Gr(v?, ?v0l0, v0l1?, ?v0l2) * EpsStar(v0l1?, p5) = pow(2, -1/2)*pow(spA(k1,p5),-1) * Gr(v, ?v0l0) * 2 * (ketA(k1,v)*braB(p5,v)+ketB(p5,v)*braA(k1,v)) * Gr(v, ?v0l2);
*.sort


print +s;
.end