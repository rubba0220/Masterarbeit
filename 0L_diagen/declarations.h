***************************************************************************************
* header file to declare variables from DiaGen output and used in FORM files
***************************************************************************************


***************************************************************************
* indices used by DiaGen and in FORM files

i v;
#do i=0,19
  i v`i';
  #do j=0,19
    i v`i'l`j';
    i v`i'l`j'in;
    i v`i'l`j'out;
  #enddo
#enddo

i mu, nu, rho, sigma, alpha, beta, zeta, eta, theta, lambda, kappa, tau, phi;
i i0,j0,i1,i2,i3,i4,j1,j2,j3,j4,a5,i5,j5;


***************************************************************************
* momenta, reference vectors, masses and invariants

v p, p1, p2, p3, p4, p5, k, k1, k2, k3, f, f1, f2, r, r1, r2, q;
s pp, pp12, pp23, pp34, pp45, pp15;
s M, m;
s s34, t12, t23, t45, t51, x5123;


***************************************************************************
* wave functions
* non-commuting objects -> spinor space

f U, UBar, V, VBar;
cf Eps, EpsStar;


***************************************************************************
* propagator functions
* non-commuting objects -> spinor space

f SF;
cf DS, DG, DV;


***************************************************************************
* vertex functions
* non-commuting objects -> spinor space

f G, Gi, Gr,Gs,Gt;
cf VVV;


***************************************************************************
* QCD
* number of fermion loops and light fermion loops and color factors
* color space objects

s nf, nl;
s CF, CA, TF, NF, NA;
cf color;

cf cOldel(symmetric);
t cOlf(antisymmetric), cOlT;
s cOlNA,cOlNR, cOln, cOlcA,cOlcR,[cOlcR-cOlcA/2];
Dimension cOlNA;
AutoDeclare Index cOli;
AutoDeclare Symbol cOlI;
AutoDeclare Symbol cOlc;


***************************************************************************
* utilities for potentiation and other algebraic operations
* gmunu not symmetric because it might already only contain relevant terms of replacing gamma matrices

cf pow, rat;
s x,y,z;
s s1,s2,s3,s4,s5,s6,s7,s8,s9;
s n;
cf delta(symmetric);
cf gmunu;
cf factors;


***************************************************************************
* spinor helicity formalism objects

f braA, ketA, braB, ketB;
cf spA(antisymmetric), spB(antisymmetric), spAA, spBB, spAB, spBA, ispA(antisymmetric), ispB(antisymmetric), ispAA, ispBB, ispAB, ispBA;
cf hel1, hel2, hel3, hel4, hel, norm;

***************************************************************************
* bullshit for bad way to decompose in tensor basis

s InvG11, InvG12, InvG13, InvG14;
s InvG21, InvG22, InvG23, InvG24;
s InvG31, InvG32, InvG33, InvG34;
s InvG41, InvG42, InvG43, InvG44;
s InvGfac;

***************************************************************************
* constants in spinors from recola

f rR, apR, amR, bpR, bmR, sR, phatpR, phatmR, ppR, pmR, ptR, abspR;  
Cf ten;
.global
