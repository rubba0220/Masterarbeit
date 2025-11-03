#procedure ColorFactors

id VBar(p2,v?,cOli0?) = VBar(p2,v)*cOldel(i2, cOli0);
id UBar(p3,v?,cOli0?) = UBar(p3,v)*cOldel(i3, cOli0);
id U(p1,v?,cOli0?) = U(p1,v)*cOldel(i1, cOli0);
id V(p4,v?,cOli0?) = V(p4,v)*cOldel(i4, cOli0);
id EpsStar(v0l0?,p5,cOli0?) = EpsStar(v0l0,p5)*cOldel(a5,cOli0);

id cOlT(cOli0?, cOli1?, cOli2?)*cOlT(cOli3?, cOli4?, cOli5?)*i_*cOlf(cOli6?, cOli2?, cOli5?) = cOlT(cOli3, cOli0, cOli6)*cOldel(cOli1, cOli4) -  cOlT(cOli1, cOli4, cOli6)*cOldel(cOli0, cOli3);
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
   cOlpA1, ..., cOlpA`RANK',
   cOlpR1, ..., cOlpR`RANK',
   cOld33,cOld44,cOld55,cOld433,cOld66,cOld633,cOld543,cOld444,cOld3333,
   cOld77,cOld743,cOld653,cOld644,cOld554,cOld5333,cOld4433a,cOld4433b,cOld4433c,
   cOld88,cOld853,cOld844,cOld763,cOld754,cOld7333,cOld664,cOld655,cOld6433a,cOld6433b,cOld6433c,
   cOld5533a,cOld5533b,cOld5533c,cOld5533d,cOld5443a,cOld5443b,cOld5443c,cOld5443d,
   cOld4444a,cOld4444b,cOld43333a,cOld43333b,
   cOlf, cOlT, cOld, cOldel;
.sort

* put all stuff in brackets in the function cOlor from cOlor.h

collect color;

.sort

#endprocedure
