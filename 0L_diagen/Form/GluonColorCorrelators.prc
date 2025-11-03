#procedure GluonColorCorrelators(ORDER)

.sort

s TX(:2), TY(:2);
cf X, Y;

id Eps(v?,p1,cOli1?) = Eps(v,p1,cOli61)
  *(d_(cOli51, cOli1)+i_*cOlf(cOli51,cOli55, cOli1)*X(1)*TX)
  *(d_(cOli61,cOli51)+i_*cOlf(cOli61,cOli65,cOli51)*Y(1)*TY);

id Eps(v?,p2,cOli2?) = Eps(v,p2,cOli62)
  *(d_(cOli52,cOli2 )+i_*cOlf(cOli52,cOli55, cOli2)*X(2)*TX)
  *(d_(cOli62,cOli52)+i_*cOlf(cOli62,cOli65,cOli52)*Y(2)*TY);

id UBar(p3,v?,cOli3?) = UBar(p3,v,cOli63)
  *(delta(cOli53,cOli3 )+cOlT(cOli53,cOli3, cOli55)*X(3)*TX)
  *(delta(cOli63,cOli53)+cOlT(cOli63,cOli53,cOli65)*Y(3)*TY);

id V(   p4,v?,cOli4?) = V(   p4,v,cOli64)
  *(delta(cOli4, cOli54)-cOlT(cOli4, cOli54,cOli55)*X(4)*TX)
  *(delta(cOli54,cOli64)-cOlT(cOli54,cOli64,cOli65)*Y(4)*TY);

if (count(TX,1) != multipleof(2)) discard;
if (count(TY,1) != multipleof(2)) discard;
if (count(TX,1) < count(TY,1)) discard;

if (`ORDER' == 1);
  id TY = 0;
endif;

id TX = 1;
id TY = 1;

id X(n1?)*X(n2?) = X(n1,n2)+X(n2,n1);
id Y(n1?)*Y(n2?) = Y(n1,n2)+Y(n2,n1);

* keep only the independent color factors
if (match(X(n1?{2,3,4},n2?))) discard;
if (match(X(n1?,n2?{,4}))) discard;
if (match(Y(n1?{2,3,4},n2?))) discard;
if (match(Y(n1?,n2?{,4}))) discard;

id X(?args1)*Y(?args2) = X(?args1,?args2);

* by symmetry, this one is not needed
id X(1,3,1,2) = 0;

id X(?args) = T(?args);

if (match(T(?args)) == 0) mul T(1);

.sort

#endprocedure
