#procedure CloseBrackets

id Gr(0,p5,p?{p3,p4}) = 2*p5.p-Gr(0,p,p5);
id Gr(0,p3,p5) = pow(2*pp34,-1)*( Gr(0,p3,p5,p4,p3)+2*p3.p5*Gr(0,p3,p4) );
id Gr(0,p4,p5) = pow(2*pp34,-1)*( Gr(0,p4,p5,p3,p4)+2*p4.p5*Gr(0,p4,p3) );
id Gr(0,p4,p3) = -Gr(0,p3,p4)+2*p3.p4;

id braA(r2,0)*ketA(r1,0) = spA(r2,r1);
id braA(r2,0)*Gr(0,p3,p4)*ketA(r1,0) = spA(r2,p3)*spB(p3,p4)*spA(p4,r1);

id braA(r2,0)*Gr(0,p?)*ketA(r1,0) =  0;
id braA(r2,0)*Gr(0,p?,q?,k?)*ketA(r1,0) = 0;

id braA(r2,0)*Gr(0,p3,p5,p4,p3)*ketA(r1,0) = spA(r2,p3)*spBB(p3,p5,p4,p3)*spA(p3,r1);
id braA(r2,0)*Gr(0,p4,p5,p3,p4)*ketA(r1,0) = spA(r2,p4)*spBB(p4,p5,p3,p4)*spA(p4,r1);

id spA(r1,r2) = hel1;
id spA(p3,r2)*spA(p4,r1)*spB(p3,p4) = hel2;
id spA(p3,r1)*spA(p3,r2)*spBB(p3,p5,p4,p3) = hel3;
id spA(p4,r1)*spA(p4,r2)*spBB(p4,p5,p3,p4) = hel4;
id spA(p3,p4)*spB(p3,p5)*ispA(p3,p5) = hel;

.sort

#endprocedure