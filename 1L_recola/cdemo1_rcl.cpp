//#####################################################################
//
//  File   cdemo1_rcl.cpp
//  is part of RECOLA (REcursive Computation of One Loop Amplitudes)
//
//  Copyright (C) 2015-2017   Stefano Actis, Ansgar Denner, 
//                            Lars Hofer, Jean-Nicolas Lang, 
//                            Andreas Scharf, Sandro Uccirati
//
//  RECOLA is licenced under the GNU GPL version 3, 
//         see COPYING for details.
//
//#####################################################################
// PARTICLES
// Scalars:       'H', 'p0', 'p+', 'p-'
// Vector bosons: 'g', 'A', 'Z', 'W+', 'W-'
// leptons:       'nu_e', 'nu_e~', 'e-', 'e+', 
//                'nu_mu', 'nu_mu~', 'mu-', 'mu+', 
//                'nu_tau', 'nu_tau~', 'tau-', 'tau+'
// quarks:        'u', 'u~', 'd', 'd~', 
//                'c', 'c~', 's', 's~',
//                't', 't~', 'b', 'b~'
//#####################################################################

// Each program, which uses RECOLA must have:
#include "recola.h"

int main(int argc, char *argv[])
{
  double pi= 3.141592653589793238462643;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 1
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Set the inputs for the computation.
// The variables which can be set and the subroutines to set them are 
// in the file "input.f90".
// All variables have default values, so this step is optional.
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Set a massive bottom quark
  Recola::set_pole_mass_bottom_rcl(4.5,0.);
// The bottom quark is set as a heavy particle (full mass dependence 
// is kept)
  Recola::unset_light_bottom_rcl ();

// The double IR-pole DeltaIR2 is set to Zeta(2) = pi^2/6. 
// In this way the result of the amplitude corresponds to the finite 
// part of the amplitude in the conventions of the Binoth-Les Houches 
// Accord (arXiv:1001.1307 [hep-ph])
  Recola::set_delta_ir_rcl (0,pi*pi/6.);

// UV- and IR-scales are set to 100 GeV
  Recola::set_mu_uv_rcl (100.);
  Recola::set_mu_ir_rcl (100.);

// QCD renormalization scale is set to 100 GeV, the variable flavour 
// scheme is selected and the corresponding value for alpha_s is set 
// to 0.125808685692
  Recola::set_alphas_rcl (0.125808685692,100.,-1);

// The alphaZ scheme is selected for EW renormalization
  Recola::use_alphaz_scheme_rcl (0.0078125);

// The print levels are changed
  Recola::set_print_level_amplitude_rcl (2);
  Recola::set_print_level_squared_amplitude_rcl (3);

// The .tex file will be generated
  Recola::set_draw_level_branches_rcl (2);


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 2
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Define the processes to be computed and select the power of g_s 
// (i.e. the strong coupling: g_s^2 = 4*pi*alpha_s), by calling 
// the subroutines of "process_definition.f90". 
// The processes are defined calling subroutine "define_process_rcl" 
// successively with different process number argument. At least one 
// call of define_process_rcl must be present.
// All power of g_s are selected by default, the call of the 
// subroutines for their selection are optional. 
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Two processes are defined:
// 1) Scattering at NLO of a pair of down-antidown producing a pair of 
//    top-antitop and a pair of bottom-antibottom. The bottom and the 
//    anti-bottom are set as left-handed. 
// 2) Scattering at LO of a pair of down-antidown producing a pair of 
//    top-antitop and a pair of bottom-antibottom and an extra gluon. 
//    The bottom and the anti-bottom are set as left-handed. 
  Recola::define_process_rcl(1,"d d~ -> t t~ b[-] b~[+]","NLO");
  Recola::define_process_rcl(2,"d d~ -> t t~ b[-] b~[+] g","LO");

// Selection of QCD contributions for process 1:
// All powers of gs are unselected for Born amplitude, except power 4.
// All powers of gs are unselected for Loop amplitude, except power 6.
  Recola::unselect_all_gs_powers_BornAmpl_rcl(1);
  Recola::select_gs_power_BornAmpl_rcl(1,4);
  Recola::unselect_all_gs_powers_LoopAmpl_rcl(1);
  Recola::select_gs_power_LoopAmpl_rcl(1,6);

// Selection of QCD contributions for process 2:
// All powers of gs are unselected for Born amplitude, except power 5.
  Recola::unselect_all_gs_powers_BornAmpl_rcl(2);
  Recola::select_gs_power_BornAmpl_rcl(2,5);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 3
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// The skeleton of the recursive procedure is built for all defined 
// processes, by calling the subroutine "generate_processes_rcl" of 
// "process_generation.f90". 
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::generate_processes_rcl();

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 4
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// The fourth step is the actual computation of processes. Each 
// process defined at step 2 can be computed at this step, once the 
// user has provided the values for all external momenta of the 
// process under consideration (which define a phase-space point). 
// The computation of the amplitude and of the squared amplitude is 
// then achieved by calling the subroutine "compute_process_rcl" (from 
// file process "computation.f90"), which uses the informations on the 
// recursive procedure stored at step 3. 
// In file process "computation.f90" are present also other 
// subroutines, which allow to get the actual value for the amplitude 
// or for the squared amplitude of the computed processes. Other 
// subroutines of process computation.f90 can be used to compute 
// Born colour- and/or spin-correlated squared amplitudes and to get 
// their actual value. 
// Calling the subroutine set "running_alphas_rcl" or 
// "compute_running_alphas_rcl" at the beginning of this step the user 
// can make use of a running value for the strong coupling constant 
// alphas.
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Momenta of the phase-space point for process 1
  double p[6][4] =
  {{           250.,              0.,              0.,            250.},
   {           250.,              0.,              0.,           -250.},
   {  191.521737019,   -72.989672519,    23.203308008,   -28.573588393},
   {  187.323053415,    41.294104557,    43.349089605,   -38.824472950},
   {  67.060209357,     -5.935268585,   -28.633411230,    60.180744654},
   {  54.095000210,     37.630836547,   -37.918986384,     7.217316689}};

// Running of alpha_s for this phase-space point
// The running value is computed by RECOLA at the CM energy 
// (p(0,0)+p(1,0) = 500 GeV), in the variable flavour scheme, with 
// one-loop running.
  Recola::compute_running_alphas_rcl (p[0][0]+p[1][0],-1,1);

// Compute process 1
  Recola::compute_process_rcl(1,p,"NLO");

// Momenta of the phase-space point for process 2
  double k[7][4] =
          {{250.000000000,   0.000000000,   0.000000000, 250.000000000},
           {250.000000000,   0.000000000,   0.000000000,-250.000000000},
           {187.692956406, -59.993359307,  28.357226683, -28.758832003},
           {186.301598855,  38.377203074,  43.056475804, -37.193761727},
           { 52.741902453,  -3.942491762, -17.679399804,  49.329036639},
           { 44.020044292,  33.185994848, -28.199232244,   4.583377168},
           { 29.243497994,  -7.627346853, -25.535070439,  12.040179922}};

// Running of alpha_s for this phase-space point
// The running value is computed by RECOLA at the CM energy 
// (k(0,1)+k(0,2) = 500 GeV), in the variable flavour scheme, with 
// one-loop running.
  Recola::compute_running_alphas_rcl (k[0][0]+k[1][0],-1,1);

// Compute process 2
  Recola::compute_process_rcl(2,k,"LO");

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 5
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Calling the subroutine reset_recola_rcl (from file reset.f90),
// deallocates all allocatable arrays used in the previous steps and 
// allows for the next call of Recola. The input variables of 
// input.f90 keep their actual value.
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Recola::reset_recola_rcl();

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  return 0;
}

//#####################################################################
