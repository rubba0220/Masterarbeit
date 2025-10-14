//#####################################################################
//
//  File   cdemo0_rcl.cpp
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

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Step 1
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Set the inputs for the computation.
// The variables which can be set and the subroutines to set them are 
// in the file "input.f90".
// All variables have default values, so this step is optional.
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// The standard output is selected
  Recola::set_output_file_rcl("*");

// Let's print the squared amplitude
  Recola::set_print_level_squared_amplitude_rcl(1);

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

// Just 1 process, at NLO:
  Recola::define_process_rcl(1,"u u~ -> g g tau+ tau-","NLO");

// No additional calls: all powers of g_s are selected.

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

//  No running of alphas

// Momenta of the phase-space point.
  double p[6][4] =
  {{          4000.,              0.,              0.,           4000.},
   {          4000.,              0.,              0.,          -4000.},
   {2387.4445571379,-2131.7219821216,  677.6712380335, -834.5145879427},
   {2084.0108209587, 1206.0274745508, 1266.0449626178,-1133.8999008430},
   {1954.1326742459, -173.3442838631, -836.2617619034, 1757.6269608155},
   {1574.4119476575, 1099.0387914340,-1107.4544387478,  210.7875279701}};

  Recola::compute_process_rcl(1,p,"NLO");

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

