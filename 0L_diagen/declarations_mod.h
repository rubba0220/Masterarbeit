* header file to declare variables from DiaGen output

********************
* indices used by DiaGen and in following FORM files

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
i i1,i2,i3,i4,a5;

********************
* momenta and invariants

v p1, p2, p3, p4, p5, k, k1, k2, k3;
s pp12, pp23, pp34, pp45, pp15, mt2, M;

********************
* wave functions
*Functions declares non-commuting objects - spinor space

f U, UBar, V, VBar;     *Functions declares non-commuting objects - spinor space
cf Eps, EpsStar;        *CFunctions declares commuting functions

********************
* propagator functions

f SF;                   *spinor space
cf DS, DG, DV;

********************
* vertex functions

cf VVV;
f G;                    *Why non-commuting?

****************************************
* QCD

* number of fermion loops and light fermion loops and color factors

s nf, nl;
s CF, CA, TF, NF, NA;
cf color, T;


****************************************
* utilities

cf pow;
s x;
CFunction cOldel(symmetric);

****************************************
* colors

cf delta(symmetric);

#include color.h

.global
