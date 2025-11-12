#-

#include declarations.h
s A1, A2, A3, A4;

Off Statistics;
Format 255;

********************************color decomposition
* cOlT(i,j,a5) = (T_a5)_i^jbar (funfamental, antifundamental, adjoint)

g cOlstruc1 = cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^(-1)*A1;
g cOlstruc2 = cOldel(i1,i4)*cOlT(i2,i3,a5)*A2;
g cOlstruc3 = cOldel(i2,i3)*cOlT(i4,i1,a5)*A3;
g cOlstruc4 = cOldel(i3,i4)*cOlT(i2,i1,a5)*NF^(-1)*A4;
.store

Off Statistics;
Format 255;

********************************full amplitude
l amp = cOlstruc1 + cOlstruc2 + cOlstruc3 + cOlstruc4;

#Call ColorFlow

b cOldel;
print +s;
.sort







.end
