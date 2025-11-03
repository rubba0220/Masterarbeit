#procedure ColorFactors

mul nf^`nf';
mul nl^`nl';

#call docolor

****************************************
* basic simplifications, so we get 
* trivial things out of the box

id cOlI2R = TF;

id cOlcR^n? = CF^n;
id cOlcA^n? = CA^n;
id cOlNR^n? = NF^n;
id cOlNA^n? = NA^n;

id CF = (NF^2-1)/(2*NF);
id CA = NF;
id TF = 1/2;
id NA = NF^2-1;

id cOld33(cOlpR1,cOlpR2) = (NF^2-1)*(NF^2-4)/(16*NF);

id cOld44(cOlpR1,cOlpR2) = (NF^4-6*NF^2+18)/(96*NF^2)*(NF^2-1);
id cOld44(cOlpR1,cOlpA1) = NF*(NF^2+6)/48*(NF^2-1);
id cOld44(cOlpA1,cOlpA2) = NF^2*(NF^2+36)/24*(NF^2-1);

id cOld55(cOlpR1,cOlpR2) = (NF^2-1)*(NF^2-4)*(NF^4+24)/(768*NF^3);

id cOld433(cOlpR3,cOlpR1,cOlpR2) = (NF^2-1)*(NF^2-4)*(NF^2-6)/(192*NF^2);

ab nl, nf, CF, CA, TF, NF, NA,
   cOlpA1, ..., cOlpA`RANK',
   cOlpR1, ..., cOlpR`RANK',
   cOld33,cOld44,cOld55,cOld433,cOld66,cOld633,cOld543,cOld444,cOld3333,
   cOld77,cOld743,cOld653,cOld644,cOld554,cOld5333,cOld4433a,cOld4433b,cOld4433c,
   cOld88,cOld853,cOld844,cOld763,cOld754,cOld7333,cOld664,cOld655,cOld6433a,cOld6433b,cOld6433c,
   cOld5533a,cOld5533b,cOld5533c,cOld5533d,cOld5443a,cOld5443b,cOld5443c,cOld5443d,
   cOld4444a,cOld4444b,cOld43333a,cOld43333b,
   cOlf, cOlT;
.sort

collect color;
normalize color;

.sort

#endprocedure
