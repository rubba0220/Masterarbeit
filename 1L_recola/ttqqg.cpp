#include <iostream>
#include "recola.h"

int main(int argc, char *argv[])
{


// Momenta of the phase-space point.
  double p[5][4] =
  {{243.958874340707,                    0,                    0,     243.958874340707},
   {243.274422280898,                    0,                    0,    -243.274422280898},
   {72.4210128964652,     50.6623055703701,     44.0522222052368,     27.1576070747199},
   {202.733585822752,    -81.9445526000469,      60.951575089163,     30.2432242639469},
   {212.078697902388,     31.2822470296768,      -105.0037972944,    -56.7163792788578}};

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

  Recola::define_process_rcl(1,"u u~ -> g t t~","NLO");

  //Recola::set_delta_ir_rcl(0., M_PI*M_PI/12.);
  
  Recola::set_pole_mass_top_rcl(mt,0.);
  Recola::set_mu_uv_rcl (mu);
  Recola::set_mu_ir_rcl (mu);
  Recola::set_alphas_rcl (1./(4.*M_PI),mu,5);
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

