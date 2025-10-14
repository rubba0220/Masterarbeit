//#####################################################################
//
//  File   demo4_rcl.cpp
//  is part of RECOLA (REcursive Computation of One Loop Amplitudes)
//
//  Copyright (C) 2015-2025   Stefano Actis, Ansgar Denner, 
//                            Lars Hofer, Jean-Nicolas Lang, 
//                            Andreas Scharf, Sandro Uccirati
//
//  RECOLA is licenced under the GNU GPL version 3, 
//         see COPYING for details.
//
//#####################################################################
//PARTICLES
//Scalars:       'H', 'p0', 'p+', 'p-'
//Vector bosons: 'g', 'A', 'Z', 'W+', 'W-'
//leptons:       'nu_e', 'nu_e~', 'e-', 'e+', 
//               'nu_mu', 'nu_mu~', 'mu-', 'mu+', 
//               'nu_tau', 'nu_tau~', 'tau-', 'tau+'
//quarks:        'u', 'u~', 'd', 'd~', 
//               'c', 'c~', 's', 's~',
//               't', 't~', 'b', 'b~'
//#####################################################################

//Each program, which uses RECOLA must have:
# include "recola.h"

int main(int argc, char *argv[])
{

//Variables for this demo file
  double p_full_prod[4][4], p_full_dec1[3][4], p_full_dec2[3][4];
  double A2[2], B2[1], C2[1], D2[1], E2[1];
  double M2prod, M2dec1, M2dec2, M2full;
  double MW, MZ, wwidth, alpha;
  int i;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 1
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Set the inputs for the computation.
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//The standard output is selected
  Recola::set_output_file_rcl("*");

//Let's print the squared amplitude
  Recola::set_print_level_squared_amplitude_rcl(3);

//Select scheme and fix vector-boson masses
  MW = 80.3579736098775;
  MZ = 91.1534806191828;
  wwidth = 2.08429899827822;
  alpha = 7.555310522369e-3;

  Recola::use_gfermi_scheme_and_set_alpha_rcl(alpha);
  Recola::set_pole_mass_w_rcl(MW,wwidth);
  Recola::set_pole_mass_z_rcl(MZ,0e0);
  Recola::set_complex_mass_scheme_rcl();

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Define the processes to be computed and select the power of g_s 
//(i.e. the strong coupling: g_s^2 = 4*pi*alpha_s), by calling 
//the subroutines of "process_definition.f90". 
//The processes are defined calling subroutine "define_process_rcl" 
//successively with different process number argument. At least one 
//call of define_process_rcl must be present.
//All power of g_s are selected by default, the call of the 
//subroutines for their selection are optional. 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Set the W boson as resonant
  Recola::set_resonant_particle_rcl("W-");
//Define process 1, at NLO with polarised intermediate W bosons:
  Recola::define_process_rcl(1,"A A -> W-[-](nu_e~ e-) W+[-](mu+ nu_mu)","NLO");

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 3
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//The skeleton of the recursive procedure is built for all defined 
//processes, by calling the subroutine "generate_processes_rcl" of 
//"process_generation.f90". 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::generate_processes_rcl();

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 4
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//The fourth step is the actual computation of processes. Each 
//process defined at step 2 can be computed at this step, once the 
//user has provided the values for all external momenta of the 
//process under consideration (which define a phase-space point). 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Momenta of the off-shell phase-space point.
  double p_full[6][4] = 
    {{5000.0000000000000, 0.0000000000000000, 0.0000000000000000, 5000.0000000000000},
     {5000.0000000000000, 0.0000000000000000, 0.0000000000000000,-5000.0000000000000},
     {3243.8985189361665, 695.23069130847887,-3166.9342850974826,-100.29516884221320},
     {1756.1014810638335, 433.87511031166298,-1700.8566566424388,-52.263122770570874},
     {2249.2998992648813,-494.85571955991441, 2193.9693904301166, 31.083235152524409},
     {2750.7001007351187,-634.25008206022721, 2673.8215513098039, 121.47505646025964}};

//Compute the amplitude
  Recola::compute_process_rcl(1, p_full, "NLO", A2);
//Retrieve the squared amplitude and print it 
  Recola::get_squared_amplitude_rcl(1,0,"LO",M2full);
  printf("%s %20.16e\n"," ME2 = ", M2full);

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 5
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Calling the subroutine reset_recola_rcl (from file reset.f90),
//deallocates all allocatable arrays used in the previous steps and 
//allows for the next call of Recola. The input variables of 
//input.f90 keep their actual value.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   Recola::reset_recola_rcl();

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 1
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Set the inputs for the computation.
//The variables from the preceeding calculation still have their values.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::use_gfermi_scheme_and_set_alpha_rcl(alpha);
  Recola::set_pole_mass_w_rcl(MW,0e0);
  Recola::set_pole_mass_z_rcl(MZ,0e0);
  Recola::set_on_shell_scheme_rcl();

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Define the processes to be computed and select the power of g_s 
//(i.e. the strong coupling: g_s^2 = 4*pi*alpha_s), by calling 
//the subroutines of "process_definition.f90". 
//The processes are defined calling subroutine "define_process_rcl" 
//successively with different process number argument. At least one 
//call of define_process_rcl must be present.
//All power of g_s are selected by default, the call of the 
//subroutines for their selection are optional. 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Define processes 1-3 for production and decay of on-shell W bosons:
  Recola::define_process_rcl(1,"A A -> W-[-] W+[-]","NLO");
  Recola::define_process_rcl(2," W-[-] -> nu_e~ e-","NLO");
  Recola::define_process_rcl(3," W+[-] -> mu+ nu_mu","NLO");

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 3
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//The skeleton of the recursive procedure is built for all defined 
//processes, by calling the subroutine "generate_processes_rcl" of 
//"process_generation.f90". 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::generate_processes_rcl();

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 4
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//The fourth step is the actual computation of processes. Each 
//process defined at step 2 can be computed at this step, once the 
//user has provided the values for all external momenta of the 
//process under consideration (which define a phase-space point). 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Fix momenta of the subprocesses.
  for (i=0; i<= 3; i = i + 1)
   {p_full_prod[0][i] = p_full[0][i];
    p_full_prod[1][i] = p_full[1][i];
    p_full_prod[2][i] = p_full[2][i] + p_full[3][i];
    p_full_prod[3][i] = p_full[4][i] + p_full[5][i];
    p_full_dec1[0][i] = p_full_prod[2][i];
    p_full_dec1[1][i] = p_full[2][i];
    p_full_dec1[2][i] = p_full[3][i];
    p_full_dec2[0][i] = p_full_prod[3][i];
    p_full_dec2[1][i] = p_full[4][i];
    p_full_dec2[2][i] = p_full[5][i];}

//Compute the amplitudes
  Recola::compute_process_rcl(1, p_full_prod, "NLO", B2);
  Recola::compute_process_rcl(2, p_full_dec1, "NLO", C2);
  Recola::compute_process_rcl(3, p_full_dec2, "NLO", D2);
//Retrieve the squared amplitudes and print the combined amplitude 
  Recola::get_squared_amplitude_rcl(1,0,"LO",M2prod);
  Recola::get_squared_amplitude_rcl(2,0,"LO",M2dec1);
  Recola::get_squared_amplitude_rcl(3,0,"LO",M2dec2);

  M2full = M2prod*M2dec1*M2dec2/(MW*wwidth)/(MW*wwidth)/(MW*wwidth)/(MW*wwidth);

  printf("%s %20.16e\n"," ME2 = ", M2full);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Step 5
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Reset recola
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::reset_recola_rcl();

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  return 0;
} 

//#####################################################################
