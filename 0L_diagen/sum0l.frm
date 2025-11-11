#-

#include declarations.h

Off Statistics;
Format 255;



g sum0l = 0;



#do i=1,5

#include diags0l.out # d`i'   

#message color factors
#call ColorFactors
.sort

#message feynman rules
#call FeynmanRules(0)
.sort

#message scalar propagators
id DS(k?,m?,1) = pow(k.k-m^2,-1);
.sort
repeat id pow(x?,-1)*pow(y?,-1) = pow(x*y,-1);
.sort

#message invariants

Argument pow;
#call Invariants
EndArgument;
.sort

g sum0l = sum0l +d`i';

print d`i';
.sort

#enddo



id color(x?) = x;
b cOlT,cOldel,NF;

#message begin_sum;

print +s sum0l;
.sort

#message end_sum;

.end
