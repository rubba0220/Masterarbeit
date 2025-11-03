#procedure MassRenormalization(MASS,ORDER)

id SF(v?,k?,`MASS') = SF(v,k,`MASS')
  *sum_(n,0,`ORDER',(`MASS'*dZ`MASS'*SF(v,k,`MASS'))^n);

if (count(dZ`MASS',1) > `ORDER') discard;

.sort

#endprocedure
