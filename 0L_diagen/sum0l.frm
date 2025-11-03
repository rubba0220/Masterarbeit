#-
#include declarations.h

Off Statistics;

#do i=1,1

#include diags0l.out # d`i'

*#call QuarkColorCorrelators(2)
#call MassRenormalization(M,2)
#call TreatQuarks(0,0)

b pow, color, dZM, T;
print d`i';
.store

Off Statistics;

#enddo

l sum0l =
#do i=1,1
  +d`i'
#enddo
;

id color(x?) = x;

id pow(s,0) = 1;

id p1.p2 = 1/2*s;
id p1.p3 = -1/2*(t-M^2);
id p2.p3 = 1/2*(s+t-M^2);

id p1.p1 = 0;
id p2.p2 = 0;
id p3.p3 = M^2;

id s = 1;
id t = x;
id M^2 = ms;

b pow, NF, nf, nl, dZM, T;
print;
.end
