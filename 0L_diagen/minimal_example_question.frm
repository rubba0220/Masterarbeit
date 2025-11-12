#-
#include declarations.h

Off Statistics;
Format 255;

local massive = UBar(p2,0)*V(p1,0);


***************************************perform spinor helicity state replacements
id V(p1,v?) = (G(v,p1)-M*Gi(v)) * ispA(f1,r1) * ketA(r1,v);
id UBar(p2,v?) = braA(r2,v) * (G(v,p2)+M*Gi(v)) * ispA(f2,r2);

***************************************ispA(ri,fi) are global factors in 2.32, so set them to 1
id ispA(p?,q?) = 1;

***************************************momentum conservation and splitting to get rid of p1
Argument G;
id p1 = -p2+p5+p3+p4;
EndArgument;

Splitarg, G;

repeat;
id G(v?, p?) = Gr(v,p);
id G(v?, p1?, ?p2) = G(v, p1) + G(v, ?p2);
endrepeat;

Factarg, Gr;

id Gr(v?, p?vector_,-1,x?number_) = -x*Gr(v,p);
id Gr(v?, p?vector_, x?number_) = x*Gr(v,p);

.sort

***************************************make gamma strings
id Gi(0) = 1;
repeat id Gr(0, ?x)*Gr(0, ?y) = Gr(0, ?x, ?y);

#Call ReduceSlashedSquares

#call CloseBrackets

*********************************************************
* now there are terms remaining that contain p2, the terms in the curly brackets of 2.32 do not contain p2

print +s;
.sort


**************************************express p2 by massless momenta
* use Dirac to replace p2 by f2 
* replace f2 in favour of p3, p4, p5

id braA(r2,0)*Gr(0,p2,?p) = braA(r2,0)*Gr(0,f2,?p);

id Gr(v?,p?,q?) = G(v,p)*G(v,q);

Argument G;
id f2 = s1*p3+s2*p4+s3*p5;
EndArgument;

Splitarg, G;

repeat;
id G(v?, p?) = Gr(v,p);
id G(v?, p1?, ?p2) = G(v, p1) + G(v, ?p2);
endrepeat;

Factarg, Gr;

id Gr(v?, p?vector_,-1,x?symbol_) = -x*Gr(v,p);
id Gr(v?, p?vector_, x?symbol_) = x*Gr(v,p);

id s1 = -((-f2.p4 * p3.p4-f2.p5 * p3.p5+f2.p3 * p4.p5))*pow((p3.p4)^2+(p3.p5)^2,-1);
id s2 = -((f2.p5 * p3.p4 * p3.p5-f2.p4 * (p3.p5)^2-f2.p3 * p3.p4 * p4.p5))*pow(((p3.p4)^2+(p3.p5)^2)* p4.p5,-1);
id s3 = -((-f2.p5 * (p3.p4)^2+f2.p4 * p3.p4 * p3.p5-f2.p3 * p3.p5 * p4.p5))*pow(((p3.p4)^2+(p3.p5)^2)* p4.p5,-1);

***************************************make gamma strings
id Gi(0) = 1;
repeat id Gr(0, ?x)*Gr(0, ?y) = Gr(0, ?x, ?y);

#Call ReduceSlashedSquares

#call CloseBrackets

***************************************plug in values
#call Invariants
Argument pow;
#call Invariants
EndArgument;
#call Values

**************************************

b hel1, hel2, hel3, hel;
print +s;
.sort
.end

