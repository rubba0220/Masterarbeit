#procedure FeynmanRules(GAUGE)

id DG(k?,0) = DS(k,0,1);
id SF(v?,k?,m?) = (g_(v,k)+m*gi_(v))*DS(k,m,1);

id G(v1?,v2?) = g_(v1,v2);

b DV;
.sort
Keep Brackets;

#do i=1,1
  id once DV(v1?,v2?,k?,0) = -DS(k,0,1)*d_(v1,v2)+`GAUGE'*k(v1)*k(v2)*DS(k,0,2);
  if (count(DV,1) != 0) redefine i "0";
  b DV;
  .sort:DV;
  Keep Brackets;
#enddo

b VVV;
.sort
Keep Brackets;

#do i=1,1
  id once VVV(k1?,v1?,k2?,v2?,k3?,v3?) = 
    (k1(v3)-k2(v3))*d_(v1,v2)+(k2(v1)-k3(v1))*d_(v2,v3)+(k3(v2)-k1(v2))*d_(v1,v3);
  id once VVV(0,v1?,k2?,v2?,k3?,v3?) = 
    (-k2(v3))*d_(v1,v2)+(k2(v1)-k3(v1))*d_(v2,v3)+(k3(v2))*d_(v1,v3);
  id once VVV(k1?,v1?,0,v2?,k3?,v3?) = 
    (k1(v3))*d_(v1,v2)+(-k3(v1))*d_(v2,v3)+(k3(v2)-k1(v2))*d_(v1,v3);
  id once VVV(k1?,v1?,k2?,v2?,0,v3?) = 
    (k1(v3)-k2(v3))*d_(v1,v2)+(k2(v1))*d_(v2,v3)+(-k1(v2))*d_(v1,v3);
  if (count(VVV,1) != 0) redefine i "0";
  b VVV;
  .sort:VVV;
  Keep Brackets;
#enddo

.sort;

#endprocedure
