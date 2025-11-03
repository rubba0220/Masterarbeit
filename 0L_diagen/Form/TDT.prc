#procedure TDT
****************************************
* T times derivative w/r to T

.sort

s del(:1);
cf denom;

repeat id K1?.K2?^n? = SS(K1.K2,n);
repeat id (K1?.K2?)^n? = SS(K1.K2,n);

splitarg ((p3)) DS;

id DS(K?,p3,m?,n?) = DS(K+p3,m,n)-del*2*n*(K(mu)+p3(mu))*DS(K+p3,m,n+1);
id DS(K?,-p3,m?,n?) = DS(K-p3,m,n)+del*2*n*(K(mu)-p3(mu))*DS(K-p3,m,n+1);

id SS(p3.p3,n?) = SS(p3.p3,n)+del*2*n*p3(mu)*SS(p3.p3,n-1);
id SS(K?!{p3}.p3,n?) = SS(K.p3,n)+del*n*K(mu)*SS(K.p3,n-1);

if (count(del,1) != 1) discard;
id del = 1;

mul -x/2*denom(ms^2 + x - 2*ms*x + x^2)*
  (+(1 - 3*ms + x)*p1(mu)
   +(ms + x)*p2(mu)
   +(-1 + 2*ms - 2*x)*p3(mu));

id SS(K1?.K2?,n?) = K1.K2^n;

.sort

#endprocedure
