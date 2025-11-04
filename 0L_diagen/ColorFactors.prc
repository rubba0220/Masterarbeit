#procedure ColorFactors


***************************************************************************
* fix label of color according to momentum

#do i = 1,4
id VBar(p`i',v?,cOli0?) = VBar(p`i',v)*cOldel(i`i', cOli0);
id UBar(p`i',v?,cOli0?) = UBar(p`i',v)*cOldel(i`i', cOli0);
id U(p`i',v?,cOli0?) = U(p`i',v)*cOldel(i`i', cOli0);
id V(p`i',v?,cOli0?) = V(p`i',v)*cOldel(i`i', cOli0);
#enddo

id EpsStar(v0l0?,p5,cOli0?) = EpsStar(v0l0,p5)*cOldel(a5,cOli0);


***************************************************************************
* perform contractions of SU(3) generators and deltas
* TTf = Td-Td
* TT = dd-dd
* Td = Td
* dd = d1
* Tr(T) = 0

id cOlT(cOli0?, cOli1?, cOli2?)*cOlT(cOli3?, cOli4?, cOli5?)*cOlf(cOli6?, cOli2?, cOli5?) = -i_*cOlI2R*(cOlT(cOli3, cOli1, cOli6)*cOldel(cOli0, cOli4) - cOlT(cOli0, cOli4, cOli6)*cOldel(cOli1, cOli3));
id cOlT(cOli0?, cOli1?, cOli2?)*cOlT(cOli3?, cOli4?, cOli2?) = cOlI2R * (cOldel(cOli0, cOli4)*cOldel(cOli1, cOli3) - cOlNR^(-1)*cOldel(cOli0, cOli1)*cOldel(cOli3, cOli4)); 
repeat id cOlT(?cOli0, cOli1?, ?cOli2)*cOldel(cOli1?, cOli3?) = cOlT(?cOli0, cOli3, ?cOli2);
repeat id cOldel(cOli0?, cOli1?)*cOldel(cOli1?, cOli3?) = cOldel(cOli0, cOli3);
id cOlT(cOli0?, cOli0?, cOli1?) = 0;


***************************************************************************
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


***************************************************************************
* put everything cOlor related in bracket (can be used to run procedure from color.h)

ab nl, nf, CF, CA, TF, NF, NA,
   cOlf, cOlT, cOldel;
.sort

collect color;
.sort

#endprocedure
