#procedure SpinSum

id UBar(p2,v?) = G(v,p2)+M*Gi(v);
id U(p2,v?) = 1;

id V(p1,v?) = G(v,p1)-M*Gi(v);
id VBar(p1,v?) = 1;

id VBar(p4,v?) = G(v,p4);
id V(p4,v?) = 1;

id U(p3,v?) = G(v,p3);
id UBar(p3,v?) = 1;

id Eps(p?,p5)*EpsStar(v0l0?,p5) = -p(v0l0)+(p.p5*p3(v0l0)+p.p3*p5(v0l0))*pow(p5.p3,-1);

repeat id G(v?,p?) = g_(v,p);
repeat id G(v?,v0l0?) = g_(v,v0l0);
repeat id Gi(v?) = gi_(v);

trace4 0;
trace4 1;

.sort
#endprocedure