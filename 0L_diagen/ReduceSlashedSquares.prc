#procedure ReduceSlashedSquares

id Gr(0) = x; *for debug

repeat;
id Gr(v?,p?,p?) = p.p;
id Gr(v?, ?x, p?, p?, ?y) = p.p * Gr(v, ?x, ?y);
id Gr(v?,?s1,p?,?s2,q?,p?,?s3) = 2*p.q*Gr(v,?s1,p,?s2,?s3)-Gr(v,?s1,p,?s2,p,q,?s3);
endrepeat;

.sort

#endprocedure