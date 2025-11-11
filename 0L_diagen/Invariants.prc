#procedure Invariants

* ----------------------------------------
* routine to express momentum products in terms of masses and pp23,pp34,pp45,pp15
* momenta chosen in 0-> tbar, t, qbar, q, g convention (all outgoing)
* ----------------------------------------

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

id p3.p5 = -p1.p3-pp23-p3.p3-pp34;
id p2.p5 = -pp12-p2.p2-pp23-p2.p4;
id p1.p3 = -p1.p1-pp12-p1.p4-pp15;
id p2.p4 = -p1.p4-pp34-p4.p4-pp45;

* pp15+pp25+pp35+pp45+pp55 = 0
id p1.p4 = 1/2 * (p2.p2-p1.p1+p3.p3-p4.p4-p5.p5) + pp23-pp45-pp15;

endrepeat;

#endprocedure