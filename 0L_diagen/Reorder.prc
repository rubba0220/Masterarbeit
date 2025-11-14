#procedure Reorder

id G(v?, v0l0?index_) = Gr(v, v0l0);

Splitarg, G;

repeat;
id G(v?, p?) = Gr(v,p);
id G(v?, p1?, ?p2) = G(v, p1) + G(v, ?p2);
endrepeat;

Factarg, Gr;

id Gr(v?, p?vector_,-1,x?number_) = -x*Gr(v,p);
id Gr(v?, p?vector_, x?number_) = x*Gr(v,p);

id Gi(?x) = 1;
repeat id Gr(v?, ?x)*Gr(v?, ?y) = Gr(v, ?x, ?y);

id VBar(p4,v0?)*Gr(v0?,?x)*U(p3,v0?)*UBar(p2,v1?)*Gr(v1?,?y)*V(p1,v1?) = UBar(p2,0)*Gr(0,?y)*V(p1,0)*VBar(p4,1)*Gr(1,?x)*U(p3,1);

repeat;
id Gr(v?,p?) = G(v,p);
id Gr(v?,v0l0?) = G(v,v0l0);
id Gr(v?, p?, ?x) = Gr(v, p)*Gr(v, ?x);
id Gr(v?,p?) = G(v,p);
id Gr(v?,v0l0?) = G(v,v0l0);
id Gr(v?, v0l0?, ?x) = Gr(v, v0l0)*Gr(v, ?x);
endrepeat;

.sort

#endprocedure