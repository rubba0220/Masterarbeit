#procedure m2Dm2
****************************************
* m2 times derivative w/r to m2

.sort

s del(:1), Norm;
cf denom;

repeat id K1?.K2?^n? = SS(K1.K2,n);
repeat id (K1?.K2?)^n? = SS(K1.K2,n);

splitarg ((p3)) DS;

id DS(K?,p3,m?,n?) = DS(K+p3,m,n)-del*Norm*2*n*(K(mu)+p3(mu))*DS(K+p3,m,n+1);
id DS(K?,-p3,m?,n?) = DS(K-p3,m,n)+del*Norm*2*n*(K(mu)-p3(mu))*DS(K-p3,m,n+1);

id SS(p3.p3,n?) = SS(p3.p3,n)+del*Norm*2*n*p3(mu)*SS(p3.p3,n-1);
id SS(K?!{p3}.p3,n?) = SS(K.p3,n)+del*Norm*n*K(mu)*SS(K.p3,n-1);

id DS(K?,M,n?) = DS(K,M,n)+del*n*s*ms*DS(K,M,n+1);

if (count(del,1) != 1) discard;

id del*Norm = -ms*denom(ms^2 + x - 2*ms*x + x^2)
  *(ms*p1(mu) - x*p2(mu) + (-ms + x)*p3(mu));
id del = 1;


id SS(K1?.K2?,n?) = K1.K2^n;

.sort

#endprocedure
