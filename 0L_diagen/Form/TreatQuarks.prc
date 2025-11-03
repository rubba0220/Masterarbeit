#procedure TreatQuarks(NLOOPS,GAUGE)

****************************************
****************************************
#message projection

****************************************
* average over colors and spins

id VBar(p2, v?, cOli1?) =
  g_(v, p1, mu, p2)*cOlT(cOli97,cOli1,cOli99);
id U(p1, v?, cOli1?) = delta(cOli1,cOli97);

id UBar(p3, v?, cOli1?) =
  (g_(v, p4)-M*gi_(v))*g_(v, mu)*(g_(v, p3)+M*gi_(v))*cOlT(cOli98,cOli1,cOli99);
id V(p4,v?,cOli1?) = delta(cOli1,cOli98);

mul -i_^{`NLOOPS'+1}*pow(s, `NLOOPS'*(2-ep)-1);

***************************************
* Correct algebra for the color delta
* factors.
* needed because indices have dimension
* NA.

repeat;
  id delta(cOli1?,cOli2?)*cOlT(cOli2?,cOli3?,cOli4?) = cOlT(cOli1,cOli3,cOli4);
  id delta(cOli1?,cOli2?)*cOlT(cOli3?,cOli2?,cOli4?) = cOlT(cOli3,cOli1,cOli4);
  id delta(cOli1?,cOli2?)*delta(cOli2?,cOli3?) = delta(cOli1,cOli3);
  id delta(cOli1?,cOli1?) = cOlNR;
endrepeat;

.sort

****************************************
****************************************
#message color factors

#call ColorFactors

.sort

****************************************
****************************************
#message feynman rules

#call FeynmanRules(`GAUGE')

.sort

****************************************
****************************************

#do i=0,{`nf'+1}

  #message trace `i'

  tracen `i';

.sort

#enddo

****************************************
****************************************
#message mapping of the momenta

#if `NLOOPS' == "0"

  #define nr "0"
  #define r0 ""
  #define r1 ""

#endif

#if `NLOOPS' != "0"

mul replace_(
#do i=1,{`nr'-1}
  `r`i'',
#enddo
  `r`nr''
);

#endif

id DS(-k?,m?,n?) = DS(k,m,n);
Normalize (0) DS, 1;

repeat id DS(p?,m?,n1?)*DS(p?,m?,n2?) = DS(p,m,n1+n2);

.sort

mul replace_(p4,p1+p2-p3);

.sort

****************************************
* recover the dimensionality

id DS(-k?,m?,n?) = DS(k,m,n);
Normalize (0) DS, 1;

repeat id DS(p?,m?,n1?)*DS(p?,m?,n2?) = DS(p,m,n1+n2);

id DS(p1+p2,m?,n?) = pow(s-m^2, -n);
id DS(p1-p3,m?,n?) = pow(t-m^2, -n);
id DS(p2-p3,m?,n?) = pow(u-m^2, -n);

id s = pow(s, 1);
id t = pow(s, 1)*x;
id M^2 = pow(s, 1)*ms;

id k1?.k2? = pow(s, 1)*k1.k2;
id DS(k?,m?,n?) = pow(s, -n)*DS(k,m,n);

repeat id pow(s, n1?)*pow(s, n2?) = pow(s, n1+n2);

id d = 4-2*ep;

.sort

****************************************
****************************************
#message matching

#if `NLOOPS' != "0"

mul `PROTO';

#include `PROTO'matchings
#include integrals
#include useroutput

#endif

.sort

#endprocedure
