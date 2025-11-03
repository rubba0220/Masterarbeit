#- *execute silently

Off Statistics; *no statistics on runtime printed

*-----------------------------------------------------------------------

* files are named with .frm or .h for headers
* files are run with form file without .frm
* or form -f file for output into .log fike

* star can be used to comment out stuff
* only whole lines at the beginning

* form programs are modular

* declarations, settings, definitions, statements, output

* .end executes module and terminates programs

* .sort executes, clears buffer, continues

* i_ or I_ 

* end statement with ;

*-----------------------------------------------------------------------

s x,y,a,b,c,d,e,f,g,h;
Vector p6,p7,p8;
Index i1,...,i10;
CFunctions C1,C2,C3,C4,C5;
function F1,F2,F3,F4,F5;
Tensor Mat;


i v;
#do i=0,19
  i v`i';
  #do j=0,19
    i v`i'w`j';
    i v`i'w`j'in;
    i v`i'w`j'out;
  #enddo
#enddo

cf delta(symmetric);

#include declarations_mod.h

#include diags0l.out #d5

local ptest = p1(i1)*p1(i1);
local somefunc = (x+y)^4;
local lsum = p7(v12l3in)*p7(v12l3in);
global gsum = p7(v12l3in)*p7(v12l3in);

local null =  delta(v1, v2) - delta(v2,v1);

local momsquare = g_(0,p7,p7); *testtetstststjsdfrsahjwaöls

local factor = d*x+d*y;

local factor2 = p7*x + p7*a + p7*C1 + C2*p7 + p7*F3 + F2*p7 + 4;
local factor3 = F1(p7)*a + F1(p7)*b;

id x = 1;

trace4, 0;
b d;
b p7;
b F1;


Print somefunc;
Print lsum;
Print null;
Print momsquare;
Print factor;
Print factor2;
Print factor3;
Print d5;
.store

local usegsum = gsum;

.sort



.end