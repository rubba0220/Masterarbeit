
// calculate the tree and loop matrix element of the process
// g g -> t tbar for given phase-space point in evaluation example

#include <iostream>
#include <cmath>
#include "openloops.h"

int main() {

  double p[4][4] =
{{400., 0., 0., 400.}, 
 {400., 0., 0., -400.},
 {400., 100., 0., 0.},
 {400., -100., 0., 0.}};

  double muv = sqrt((p[0][0]+p[1][0])*(p[0][0]+p[1][0]) - (p[0][3]+p[1][3])*(p[0][3]+p[1][3]));
  double mtv = sqrt((p[3][0])*(p[3][0]) - (p[3][1])*(p[3][1]) - (p[3][2])*(p[3][2]) - (p[3][3])*(p[3][3]));
  
  double sqrts = muv, mq = 0., mt = mtv, mu = muv, alphas = 1./(4.*M_PI); // dimensionful: GeV
  double m2_tree, m2_loop[3], acc;

  // pure QCD (order_s fixed by LO/NLO)
  ol_setparameter_int("order_ew", 0);
  ol_setparameter_int("polenorm", 1);

  // first example: massless d quark
  ol_setparameter_double("mass(1)", mq);
  ol_setparameter_double("mass(6)", mt);

  // Increase verbosity level to list loaded libraries
  ol_setparameter_int("verbose", 1);

  // example process d dbar -> t tbar (since q are massless: should not matter)
  //
  // second argument of ol_register_process:
  // 1 for tree-like matrix elements (tree, color and spin correlations),
  // 11 for loop, 12 for loop^2 (loop induced: processes without tree)

  int id = ol_register_process("21 21 -> 6 -6", 11);

  // Initialize OpenLoops
  ol_start();


  if (id > 0) {
    // Set parameter: strong coupling
    ol_setparameter_double("alpha_s", alphas);
    // Set parameter: renormalization scale
    ol_setparameter_double("mu", mu);

    // Obtain a random phase-space point in the format pp[5*N] from Rambo
    double pp[25] = {
        400., 0., 0., 400., 0.,
        400., 0., 0., -400., 0.,
        400., 100., 0., 0., mtv,
        400., -100., 0., 0., mtv
    };
    std::cout.precision(20);
    std::cout << std::endl;
    std::cout << "Tree and loop matrix element of the process" << std::endl;
    std::cout << "g g -> t tbar" << std::endl;
    std::cout << "for the phase-space point" << std::endl;
    for (int k = 0; k < 4; k++) {
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
    double af = 256.;
    std::cout << std::endl;
    std::cout << "ol_evaluate_loop" << std::endl;
    std::cout << "Tree:       " << m2_tree * af << std::endl;
    std::cout << "Loop ep^0:  " << m2_loop[0] * af << std::endl;
    std::cout << "Loop ep^-1: " << m2_loop[1] * af << std::endl;
    std::cout << "Loop ep^-2: " << m2_loop[2] * af << std::endl;
    std::cout << "Accuracy:   " << acc << std::endl;
    std::cout << std::endl;
  }


  ol_finish();

  return 0; // result has GeV^-2 ???
}