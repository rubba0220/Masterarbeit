#-

#include declarations.h

Off Statistics;
Format 255;

*#include color_decomposition/0L_d12T435.out
id cOldel(i1,i2)*cOlT(i4,i3,a5)*NF^(-1) = 1;
.sort

*#include color_decomposition/0L_d14T235.out
id cOldel(i1,i4)*cOlT(i2,i3,a5) = 1;
.sort

#include color_decomposition/0L_d23T415.out
id cOldel(i2,i3)*cOlT(i4,i1,a5) = 1;
#call Reorder
.sort

*#include color_decomposition/0L_d34T215.out
id cOldel(i3,i4)*cOlT(i2,i1,a5)*NF^(-1) = 1;
.sort


#call ToMomentumTwistors
repeat id pow(x?,-1) = 1/x;
.sort
repeat id pow(x?,-1) = 1/x;
.sort
b UBar,V,VBar,U,EpsStar;
print +s;
.sort

.store
Off Statistics;
Format 255;

#call ToMomentumTwistors

*global Tt1 = M^2*VBar(p1,0)*U(p2,0);
*global Tt2 = M*VBar(p1,0)*G(0,p3)*U(p2,0);
*global Tt3 = M*VBar(p1,0)*G(0,p4)*U(p2,0);
*global Tt4 = VBar(p1,0)*G(0,p4)*G(0,p3)*U(p2,0);

*global Gt1 = UBar(p3,1)*G(1,p1)*V(p4,1)*Eps(p1,p5);
*global Gt2 = UBar(p3,1)*G(1,p1)*V(p4,1)*Eps(p2,p5);
*global Gt3 = UBar(p3,1)*G(1,p2)*V(p4,1)*Eps(p1,p5);
*global Gt4 = UBar(p3,1)*G(1,p2)*V(p4,1)*Eps(p2,p5);

*.store
*Off Statistics;
*Format 255;

********************************************************************************************************************************
* first step: bring into tensor basis from paper
********************************************************************************************************************************

*#do i=1,1;
*    #do j=1,1;
*        global conT`i'`j' = Tt`i'*d23T415*Gt`j';
*    #enddo
*#enddo

*#call SpinSum
*#call Invariants
*#call ToMomentumTwistors
*id pow(x?,-1) = rat(1,x);
*id x? = rat(x,1);
*.sort
*PolyRatFun rat;


b UBar,V,VBar,U,EpsStar;
print +s;
.sort

.end