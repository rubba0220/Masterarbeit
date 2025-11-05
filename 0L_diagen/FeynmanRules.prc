#procedure FeynmanRules(GAUGE)

* ----------------------------------------
* propagators:    if it contracts colors    ->    thats already done with cOLi?l
*                 if it contracts spinors   ->    thats already done via non-commutativity on spinorial structures and line numbers

* no factors of coupling and no i`s, g`s global for fixed loop order, i`s already done by DiaGen ????

* scalar propagator DS(momentum, mass, power?)

* ghost propagator (momentum, mass?)
id DG(k?,0) = DS(k,0,1);

* fermion propagator (fermion line number, momentum, mass)
id SF(v?,k?,m?) = (G(v,k)+m*Gi(v))*DS(k,m,1);

* gamma matrix, e.g. quak-gauge boson vertex (fermion line number, Lorentz index) 
* id G(v?,mu?) = g_(v,mu);

* factor out DV, do all replacements but keep brackets
b DV;
.sort
Keep Brackets;

* replace one massless gauge propagator at a time by its value in terms of scalar propagators (probably for performance reasons)
* log entry modified probably for Debug reason
#do i=1,1
  id once DV(v1?,v2?,k?,0) = -DS(k,0,1)*d_(v1,v2)+`GAUGE'*k(v1)*k(v2)*DS(k,0,2);
  if (count(DV,1) != 0) redefine i "0";
  b DV;
  .sort:DV;
  Keep Brackets;
#enddo

* same procedure for thre gluon vertex (also if one of the momenta is zero ???)
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

* does not include quartic vertex (quartic vertex maybe automatically done by DiaGen ?)

.sort;

#endprocedure
