#procedure TreatGluons(NLOOPS,GAUGE)

****************************************
****************************************
#message projection

****************************************
* average over colors and spins

id UBar(p3, 0, cOli1?) = 
  (g_(0, p4)-M*gi_(0))*(
    +i_*G(0, al)*cOlT(cOli99,cOli1,cOli96)*VVV(p1, mu, p2, nu, -p1-p2, be)*cOlf(cOli97,cOli98,cOli96)*DV(al, be, p1+p2, 0)
    +G(0, nu)*cOlT(cOli99,cOli96,cOli98)*SF(0, p3-p1, M)*G(0, mu)*cOlT(cOli96,cOli1,cOli97)
    +G(0, mu)*cOlT(cOli99,cOli96,cOli97)*SF(0, p1-p4, M)*G(0, nu)*cOlT(cOli96,cOli1,cOli98)
  )*(g_(0, p3)+M*gi_(0));

id V(p4, 0, cOli1?) = delta(cOli1,cOli99);

#ifdef `SPINCORRELATED'

id Eps(v?, p1, cOli1?) = (-d_(v,mu)+(p1(v)*p2(mu)+p2(v)*p1(mu))*2*pow(s,-1)+kT(v)*kT(mu)*pow(s,-1))*d_(cOli1,cOli97);

#else

id Eps(v?, p1, cOli1?) = (-d_(v,mu)+(p1(v)*p2(mu)+p2(v)*p1(mu))*2*pow(s,-1))*d_(cOli1,cOli97);

#endif

id Eps(v?, p2, cOli1?) = (-d_(v,nu)+(p1(v)*p2(nu)+p2(v)*p1(nu))*2*pow(s,-1))*d_(cOli1,cOli98);

mul i_^{`NLOOPS'+1}*pow(s, `NLOOPS'*(2-ep));

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

#do i=0,`nf'

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
  #define r2 ""
  #define r3 ""

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

id pow(t, n?) = x^n*pow(s, n);
id pow(u, n?) = pow(2*ms-x-1, n)*pow(s, n);

id pow(t-M^2, n?) = pow(x-ms, n)*pow(s, n);
id pow(u-M^2, n?) = pow(ms-x-1, n)*pow(s, n);

id k1?.k2? = pow(s, 1)*k1.k2;
id DS(k?,m?,n?) = pow(s, -n)*DS(k,m,n);

repeat id pow(s, n1?)*pow(s, n2?) = pow(s, n1+n2);

id d = 4-2*ep;

.sort

****************************************
* PV reduction of a contraction with kT
* obtained with PassarinoVeltman.nb
* notice that it is assumed that kT
* is transverse to p1, i.e. kT.p1 = 0

if (count(k.kT,1) == 2);

  id k.kT^2 = ((ms^2 + x - 2*ms*x + x^2)*((ms^2 + x - 2*ms*x + x^2)*k.k - 
    (1 - ms + x)^2*(k.p1)^2 - ((-ms + x)*k.p2 + k.p3)^2 - 
    2*k.p1*((ms + ms^2 + x - 2*ms*x + x^2)*k.p2 + 
      (-1 + ms - x)*k.p3))*kT.kT + 
  (-((ms - x)^2*(ms^2 + x - 2*ms*x + x^2)*k.k) - 
    2*(((-1 + ep)*ms^4 + (-1 + ep)*x^2*(1 + x)^2 + 
        ms^3*(ep*(2 - 4*x) + 4*x) + ms^2*(-1 + ep - 2*x - 2*ep*x - 
          6*x^2 + 6*ep*x^2) - 2*ms*x*(1 + x)*(-2*x + ep*(-1 + 2*x)))*
       (k.p1)^2 + (-1 + ep)*(ms - x)^2*((-ms + x)*k.p2 + k.p3)^2 + 
      2*(ms - x)*k.p1*((-1 + ep)*(ms^3 + ms^2*(1 - 3*x) + 3*ms*x^2 - 
          x^2*(1 + x))*k.p2 - (ep*ms^2 + ep*x*(1 + x) + 
          ms*(-1 + ep - 2*ep*x))*k.p3)))*(kT.p2)^2 - 
  2*((-ms^3 + 3*ms^2*x + x^2*(1 + x) - ms*x*(1 + 3*x))*k.k + 
    2*((-1 + ms - x)*(ep*ms^2 + ep*x*(1 + x) + ms*(-1 + ep - 2*ep*x))*
       (k.p1)^2 - (-1 + ep)*(ms - x)*((-ms + x)*k.p2 + k.p3)^2 + 
      k.p1*((ms - x)*(ms^2 + x*(1 + x) - 2*ms*(-1 + ep + x))*k.p2 + 
        (ms^2 + 2*ms*(-1 + ep - x) + x*(1 + x))*k.p3)))*kT.p2*
   kT.p3 + (-((ms^2 + x - 2*ms*x + x^2)*k.k) - 
    2*((-1 + ep)*(1 - ms + x)^2*(k.p1)^2 + 
      (-1 + ep)*((-ms + x)*k.p2 + k.p3)^2 - 
      2*k.p1*((ep*ms^2 + ep*x*(1 + x) - ms*(-1 + ep + 2*ep*x))*
         k.p2 - (-1 + ep)*(-1 + ms - x)*k.p3)))*(kT.p3)^2)*
 pow(1 - 2*ep, -1)*pow(-ms + (ms - x)*(1 - ms + x), -2);

else if (count(k.kT,1) == 1);

  id k.kT = -(((ms + ms^2 + x - 2*ms*x + x^2)*k.p1 + 
    (ms - x)*((ms - x)*k.p2 - k.p3))*kT.p2*
   pow(-ms^2 + 2*ms*x - x*(1 + x), -1)) - 
 ((-1 + ms - x)*k.p1 + (-ms + x)*k.p2 + k.p3)*kT.p3*
  pow(-ms^2 + 2*ms*x - x*(1 + x), -1);

endif;

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
