#procedure ColorFactors

id VBar(p2,v?,cOli0?) = VBar(p2,v)*cOldel(i2, cOli0);
id UBar(p3,v?,cOli0?) = UBar(p3,v)*cOldel(i3, cOli0);
id U(p1,v?,cOli0?) = U(p1,v)*cOldel(i1, cOli0);
id V(p4,v?,cOli0?) = V(p4,v)*cOldel(i4, cOli0);
id EpsStar(v0l0?,p5,cOli0?) = EpsStar(v0l0,p5)*cOldel(a5,cOli0);

id cOlT(cOli0?, cOli1?, cOli2?)*cOlT(cOli3?, cOli4?, cOli5?)*cOlf(cOli6?, cOli2?, cOli5?) = -i_*TF*(cOlT(cOli3, cOli1, cOli6)*cOldel(cOli0, cOli4) - cOlT(cOli0, cOli4, cOli6)*cOldel(cOli1, cOli3));
id cOlT(cOli0?, cOli1?, cOli2?)*cOlT(cOli3?, cOli4?, cOli2?) = TF * (cOldel(cOli0, cOli4)*cOldel(cOli1, cOli3) - NF^(-1)*cOldel(cOli0, cOli1)*cOldel(cOli3, cOli4)); 
repeat id cOlT(?cOli0, cOli1?, ?cOli2)*cOldel(cOli1?, cOli3?) = cOlT(?cOli0, cOli3, ?cOli2);
repeat id cOldel(cOli0?, cOli1?)*cOldel(cOli1?, cOli3?) = cOldel(cOli0, cOli3);
id cOlT(cOli0?, cOli0?, cOli1?) = 0;

* basic simplifications, so we get 
* trivial things out of the box

* standard SU(N) normalisations and constants

id cOlI2R = TF;

id cOlcR^n? = CF^n;
id cOlcA^n? = CA^n;
id cOlNR^n? = NF^n;
id cOlNA^n? = NA^n;

id CF = (NF^2-1)/(2*NF);
id CA = NF;
id TF = 1/2;
id NA = NF^2-1;


* put all cOlor related stuff in bracket 

ab nl, nf, CF, CA, TF, NF, NA,
   cOlf, cOlT, cOldel;
.sort

* put all stuff in brackets in the function cOlor from cOlor.h

collect color;

.sort

#endprocedure
