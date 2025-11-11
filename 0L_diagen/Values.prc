#procedure Values

#include gscaledecomp_elements.out

*repeat id x?{InvG11,InvG12,InvG13,InvG14,InvG22,InvG23,InvG24,InvG33,InvG34,InvG44} = 1;
*repeat id x?{InvG11,InvG13, InvG34}=1;
*repeat id x?{InvG12,InvG14,InvG23,InvG44}=3;
*repeat id x?{InvG22,InvG33,InvG24}=5;

Argument pow;
id pp12 = 1;
id pp23 = 2;
id pp34 = 3;
id pp45 = 5;
id pp15 = 2;
id M = 1;
EndArgument;

id pow(x?,-1) = x^(-1);

id pp12 = 1;
id pp23 = 2;
id pp34 = 3;
id pp45 = 5;
id pp15 = 2;
id M = 1;

.sort

#endprocedure