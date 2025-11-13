#procedure TensorDecomposition(GAUGECHOICE)

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
#if `GAUGECHOICE'
    id EpsStar(p3,p5) = 0;
#endif
.sort
