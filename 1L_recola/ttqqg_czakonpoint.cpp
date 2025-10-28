#include <iostream>
#include "recola.h"

int main(int argc, char *argv[])
{


// Momenta of the phase-space point.
  double p[5][4] =
  {{0.398862017608732820927563104883, 0., 0., -0.398862017608732820927563104883}, 
   {0.398862017608732820927563104883, 0., 0., 0.398862017608732820927563104883}, 
   {0.274172121291808818123174317276, -0.0343276106217492514525687944123, 0.268519020148941225028767936408, 0.0434684145202512608401512998102}, 
   {0.158062966616170203745696361834, -0.0291672900055891151374737889565, 0.0500000000000000000000000000000, 0.0526074896383667540907148088284}, 
   {0.365488947309486619986255530655, 0.0634949006273383665900425833688, -0.318519020148941225028767936408, -0.0960759041586180149308661086386}};

  double sqrts = sqrt((p[0][0]+p[1][0])*(p[0][0]+p[1][0]) - (p[0][3]+p[1][3])*(p[0][3]+p[1][3]));
  double mt = sqrt((p[3][0])*(p[3][0]) - (p[3][1])*(p[3][1]) - (p[3][2])*(p[3][2]) - (p[3][3])*(p[3][3]));
  double mu = mt; // renormalization scale
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

  Recola::define_process_rcl(1,"d d~ -> g t t~","NLO");

  //Recola::set_delta_ir_rcl(0., M_PI*M_PI/12.);
  
  Recola::set_pole_mass_top_rcl(mt,0.);
  Recola::set_mu_uv_rcl (mu);
  Recola::set_mu_ir_rcl (mu);
  Recola::set_alphas_rcl (0.118,mu,5);
  Recola::unselect_all_gs_powers_BornAmpl_rcl(1);
  Recola::select_gs_power_BornAmpl_rcl(1,3);
  Recola::unselect_all_gs_powers_LoopAmpl_rcl(1);
  Recola::select_gs_power_LoopAmpl_rcl(1,5);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 3
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::generate_processes_rcl();

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 4
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//  No running of alphas

  Recola::compute_process_rcl(1,p,"NLO");

  double A_tree, A_oneloop;

  Recola::get_squared_amplitude_rcl(1,3,"LO",A_tree);
  Recola::get_squared_amplitude_rcl(1,4,"NLO",A_oneloop);

  std::cout << "LO  : " << std::scientific << A_tree * 36. << "\n";
  std::cout << "NLO : " << std::scientific << A_oneloop * 36. << "\n";

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

