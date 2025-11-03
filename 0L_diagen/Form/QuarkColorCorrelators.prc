#procedure QuarkColorCorrelators(ORDER)

.sort

s TX(:2), TY(:2);
cf X, Y;

id U(   p1,v?,cOli1?) = U(   p1,v,cOli61)
  *(delta(cOli1, cOli51)-cOlT(cOli1,cOli51, cOli55)*X(1)*TX)
  *(delta(cOli51,cOli61)-cOlT(cOli51,cOli61,cOli65)*Y(1)*TY);

id VBar(p2,v?,cOli2?) = VBar(p2,v,cOli62)
  *(delta(cOli52,cOli2 )+cOlT(cOli52,cOli2, cOli55)*X(2)*TX)
  *(delta(cOli62,cOli52)+cOlT(cOli62,cOli52,cOli65)*Y(2)*TY);

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
id X(?args1)*Y(?args2) = X(?args1,?args2);

id X(?args) = T(?args);

if (match(T(?args)) == 0) mul T(1);

.sort

#endprocedure
