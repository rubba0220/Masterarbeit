#procedure SpinorHelicity(hel, r1, r2)

* hel = 1 for qbar(3) q(4) g(5) +-+ from paper convention (0->5) = q(3) qbar(4) g(5) -++ from diagram convention (2->3)

id VBar(p4,v?)*Gr(v?,p?{p1,p2})*U(p3,v?) = `hel'*spAB(p4,p,p3)+(1-`hel')*spBA(p4,p,p3);

id UBar(p2,v?)*V(p1,v?) = ispA(`r2',f2)*ispA(f1,`r1') * (spAA(`r2',p2,p1,`r1')-M^2*spA(`r2',`r1')); 

id UBar(p2,v?)*Gr(v?,p?{p3,p4})*V(p1,v?) = ispA(`r2',f2)*ispA(f1,`r1') * M * (spAA(`r2',p,p1,`r1') - spAA(`r2',p2,p,`r1'));

id UBar(p2,v?)*Gr(v?,p3,p4)*V(p1,v?) = ispA(`r2',f2)*ispA(f1,`r1') * (spAA(`r2',p2,p3,p4,p1,`r1')-M^2*spAA(`r2',p3,p4,`r1')); 

id EpsStar(p?{p1,p2},p5) = ispA(p3,p5) * spBA(p5,p,p3);

* missing square root of 2 normalization factor


.sort
#endprocedure