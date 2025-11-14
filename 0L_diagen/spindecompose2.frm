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

#include gscaledecomp_elements.out

*mul pow(InvGfac,-1)^2;

*Argument pow;
*#include gscaledecomp_scale.out
*EndArgument;

*#call Rat
*.sort
*b UBar,V,VBar,U,EpsStar;
*print +s;
*.sort

.store
Off Statistics;
Format 255;

********************************************************************************************************************************
* second step: helicity choice, spinor-helicity formalism and evaluation at reference points
********************************************************************************************************************************
global prefac = pow(M,-1)*(hel*ispA(p3,p4)*ispB(p3,p5)*spA(p3,p5) + (1-hel)*ispA(p3,p4)*ispB(p4,p5)*spA(p4,p5))*4*pp34^2;

global a12 = pow(2*pp34,-1)*ispA(p3,p4) * spA(f1,p3) * spA(f2,p4);
global a22 = pow(2*pp34,-1)*ispA(p3,p4) * spA(f1,p3) * spA(f2,p4);
global a23 = pow(2*pp34,-1)*ispA(p3,p4) * spA(f1,p4) * spA(f2,p3);
global a34 = -ispAA(p4,p5,p3,p4) * spA(f1,p4) * spA(f2,p4);
global a41 = -ispAA(p3,p4,p5,p3) * spA(f1,p3) * spA(f2,p3);

.store
Off Statistics;
Format 255;



* d12T435
* d14T235
* d23T415

local A1 = d23T415;
#call SpinorHelicity(1,p3,p4)
mul a12;
#call SpinorHelicityReduction

*#call Rat
*#call Values
b UBar,V,VBar,U,EpsStar;
print +s;
.sort

.store
Off Statistics;
Format 255;

* d34T215


.end