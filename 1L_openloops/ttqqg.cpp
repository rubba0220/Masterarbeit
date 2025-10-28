
// calculate the tree and loop matrix element of the process
// q qbar -> g t tbar for given phase-space point in evaluation example

#include <iostream>
#include <cmath>
#include "openloops.h"

int main() {

  double p[5][4] =
  {{243.958874340707,                    0,                    0,     243.958874340707},
   {243.274422280898,                    0,                    0,    -243.274422280898},
   {72.4210128964652,     50.6623055703701,     44.0522222052368,     27.1576070747199},
   {202.733585822752,    -81.9445526000469,      60.951575089163,     30.2432242639469},
   {212.078697902388,     31.2822470296768,      -105.0037972944,    -56.7163792788578}};

  double sqrts = sqrt((p[0][0]+p[1][0])*(p[0][0]+p[1][0]) - (p[0][3]+p[1][3])*(p[0][3]+p[1][3]));
  double mt = sqrt((p[3][0])*(p[3][0]) - (p[3][1])*(p[3][1]) - (p[3][2])*(p[3][2]) - (p[3][3])*(p[3][3]));
  
  double mq = 0., mu = mt, alphas = 1./(4*M_PI); // dimensionful: GeV
  double m2_tree, m2_loop[3], acc;

  // pure QCD (order_s fixed by LO/NLO)
  ol_setparameter_int("order_ew", 0);
  ol_setparameter_int("polenorm", 0);

  // first example: massless d quark
  ol_setparameter_double("mass(1)", mq);
  ol_setparameter_double("mass(6)", mt);

  // Increase verbosity level to list loaded libraries
  ol_setparameter_int("verbose", 1);

  // example process d dbar -> g t tbar (since q are massless: should not matter)
  //
  // second argument of ol_register_process:
  // 1 for tree-like matrix elements (tree, color and spin correlations),
  // 11 for loop, 12 for loop^2 (loop induced: processes without tree)

  int id = ol_register_process("1 -1 -> 21 6 -6", 11);

  // Initialize OpenLoops
  ol_start();


  if (id > 0) {
    // Set parameter: strong coupling
    ol_setparameter_double("alpha_s", alphas);
    // Set parameter: renormalization scale
    ol_setparameter_double("mu", mu);

    // Obtain a random phase-space point in the format pp[5*N] from Rambo
    double pp[25] = {
        243.958874340707, 0, 0, 243.958874340707, 0,
        243.274422280898, 0, 0, -243.274422280898, 0,
        72.4210128964652, 50.6623055703701, 44.0522222052368, 27.1576070747199, 0,
        202.733585822752, -81.9445526000469, 60.951575089163, 30.2432242639469, mt,
        212.078697902388, 31.2822470296768, -105.0037972944, -56.7163792788578, mt
    };
    std::cout.precision(20);
    std::cout << std::endl;
    std::cout << "Tree and loop matrix element of the process" << std::endl;
    std::cout << "d dbar -> g t tbar" << std::endl;
    std::cout << "for the phase-space point" << std::endl;
    for (int k = 0; k < 5; k++) {
      std::cout << "P[" << k+1 << "] = " << pp[5*k] << "  " << pp[5*k+1]
                << "  " << pp[5*k+2] << "  " << pp[5*k+3]  << "  m="
            << pp[5*k+4]<< std::endl;
    }

    // evaluate tree matrix element
    ol_evaluate_tree(id, pp, &m2_tree);

    // print tree result
    std::cout << std::endl;
    std::cout << "ol_evaluate_tree" << std::endl;
    std::cout << "Tree:       " << m2_tree << std::endl;

    // evaluate loop matrix element (which also returns the tree)
    ol_evaluate_loop(id, pp, &m2_tree, m2_loop, &acc);

    // print loop result
    std::cout << std::endl;
    std::cout << "ol_evaluate_loop" << std::endl;
    std::cout << "Tree:       " << m2_tree * 36 << std::endl;
    std::cout << "Loop ep^0:  " << m2_loop[0] * 36 << std::endl;
    std::cout << "Loop ep^-1: " << m2_loop[1] * 36 << std::endl;
    std::cout << "Loop ep^-2: " << m2_loop[2] * 36 << std::endl;
    std::cout << "Accuracy:   " << acc << std::endl;
    std::cout << std::endl;
  }


  ol_finish();

  return 0; // result has GeV^-2 ???
}