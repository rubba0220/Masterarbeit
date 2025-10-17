#include <iostream>
#include <cmath>
#include "recola.h"

int main(int argc, char *argv[])
{


// Momenta of the phase-space point.
  double p[4][4] =
{{400., 0., 0., 400.}, 
 {400., 0., 0., -400.},
 {400., 100., 0., 0.},
 {400., -100., 0., 0.}};

  double mu = sqrt((p[0][0]+p[1][0])*(p[0][0]+p[1][0]) - (p[0][3]+p[1][3])*(p[0][3]+p[1][3]));
  double mt = sqrt((p[3][0])*(p[3][0]) - (p[3][1])*(p[3][1]) - (p[3][2])*(p[3][2]) - (p[3][3])*(p[3][3]));
  std::cout << "mu = " << mu << "\n";
  std::cout << "mt = " << mt << "\n";
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 1
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::set_output_file_rcl("*");

  //Recola::set_compute_ir_poles_rcl(1);
  //Recola::set_on_shell_scheme_rcl;
  //Recola::set_complex_mass_scheme_rcl;
  Recola::set_print_level_squared_amplitude_rcl(3);
  //Recola::set_print_level_amplitude_rcl(2);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 2
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::define_process_rcl(1,"g g -> t t~","NLO");

  //Recola::set_delta_ir_rcl(0., M_PI*M_PI/12.);
  
  Recola::set_pole_mass_top_rcl(mt,0.);
  Recola::set_mu_uv_rcl (mu);
  Recola::set_mu_ir_rcl (mu);
  Recola::set_alphas_rcl (1./(4.*M_PI),mu,5);
  Recola::unselect_all_gs_powers_BornAmpl_rcl(1);
  Recola::select_gs_power_BornAmpl_rcl(1,2);
  Recola::unselect_all_gs_powers_LoopAmpl_rcl(1);
  Recola::select_gs_power_LoopAmpl_rcl(1,4);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 3
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::generate_processes_rcl();

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 4
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//  No running of alphas

  Recola::compute_process_rcl(1,p,"NLO");
  Recola::compute_all_colour_correlations_rcl(1,p);

  double A_tree, A_oneloop;
  double Ac2[2][2]; // color-correlated squared amplitude

  Recola::get_squared_amplitude_rcl(1,2,"LO",A_tree);
  Recola::get_squared_amplitude_rcl(1,3,"NLO",A_oneloop);
  //Recola::get_colour_correlation_rcl(1,2,3,3,Ac2[0][0]);
  //Recola::get_colour_correlation_rcl(1,2,3,4,Ac2[0][1]);
  //Recola::get_colour_correlation_rcl(1,2,4,3,Ac2[1][0]);
  //Recola::get_colour_correlation_rcl(1,2,4,4,Ac2[1][1]);

  std::cout << "LO  : " << std::scientific << A_tree * 256. << "\n";
  std::cout << "NLO : " << std::scientific << A_oneloop * 256. << "\n";
  std::cout << "Color-correlated LO:\n";
  //std::cout << "  (1,1) : " << std::scientific << Ac2[0][0] * 256. << "\n";
  //std::cout << "  (1,2) : " << std::scientific << Ac2[0][1] * 256. << "\n";
  //std::cout << "  (2,1) : " << std::scientific << Ac2[1][0] * 256. << "\n";
  //std::cout << "  (2,2) : " << std::scientific << Ac2[1][1] * 256. << "\n";

  //double I1;
  //double I2;
  //Recola::get_squared_amplitude_rcl(1,4,"NLO-IR1",I1);
  //Recola::get_squared_amplitude_rcl(1,4,"NLO-IR2",I2);
  //std::cout << "NLO 1/eps  : " << std::scientific << I1 << "\n";
  //std::cout << "NLO 1/eps^2: " << std::scientific << I2 << "\n";

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 5
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::reset_recola_rcl();

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  return 0;
}

//#####################################################################

