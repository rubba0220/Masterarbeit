#-

#include declarations.h

Off Statistics;
Format 255;



***************************************color decomposition
*#include color_decomposition/0L_d12T435.out
id cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^(-1) = 1;
.sort

*#include color_decomposition/0L_d14T235.out
id cOldel(i1,i4)*cOlT(i2,i3,a5) = 1;
.sort

#include color_decomposition/0L_d23T415.out
id cOldel(i2,i3)*cOlT(i4,i1,a5) = 1;
.sort

*#include color_decomposition/0L_d34T215.out
id cOldel(i3,i4)*cOlT(i2,i1,a5)*NF^(-1) = 1;
.sort



********************************************************************************************************************************
* first step: bring into tensor basis from paper
********************************************************************************************************************************

#call TensorDecomposition(1)

********************************************************************************************************************************
* second step: helicity choice and 
********************************************************************************************************************************

*#call SpinorHelicity(1)


***************************************Plug in values to print part in progress

#call Values

b UBar,V;
print +s; *correct tensor basis brute force reproduced
.sort





.end