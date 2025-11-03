****************************************
* Interface to DiaGen

s d, ep;
dimension d;

* because of a bug in form one cannot autodeclare!!!

i v;
#do i=0,19
  i v`i';
  #do j=0,19
    i v`i'l`j';
    i v`i'l`j'in;
    i v`i'l`j'out;
  #enddo
#enddo

i mu, nu, al, be;
s n, n1, n2, m;
v k, k1, k2, k3, p, p1, p2, p3, p4, kT, p5;

********************
* Mandelstam variables

s s, t, u;

********************
* process specific
*
* ms = M^2/s
* x = t/s
* y = u/s

s M, ms, x, y;

********************
* utilities

cf pow;

********************
* wave functions

f U, UBar, V, VBar
cf Eps, EpsStar;

********************
* propagator functions

f SF;
cf DS, DG, DV;

********************
* vertex functions
*
* VVV(k1, a1, k2, a2, k3, a3) = (k1(a3)-k2(a3))*d_(a1, a2)+...
*
* G(i, a) = g_(i, a)

cf VVV;
f G;

****************************************
* QCD

* gauge parameter (xi = 0 for Feynman gauge)

s xi(:1);

* mass renormalization constant

s dZM;

* number of fermion loops and light fermion loops and color factors

s nf, nl;
s CF, CA, TF, NF, NA;
cf color, T;

****************************************
* colors

cf delta(symmetric);

#include color.h

.global
