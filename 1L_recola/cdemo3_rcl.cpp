//#####################################################################
//
//  File   cdemo3_rcl.cpp
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

#include <complex>
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

// Let's print the squared amplitude
  Recola::set_print_level_squared_amplitude_rcl (1);

// Let's print correlated squared amplitudes
  Recola::set_print_level_correlations_rcl (1);

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

// Four processes are defined:
// 1) A Born process
// 2) A real QCD correction to process 1, where the first incoming 
//    gluon comes from the splitting of an up-quark line
// 3) Another Born process
// 4) A real QED correction to process 3, where the first incoming 
//    photon comes from the splitting of an up-quark line
  Recola::define_process_rcl(1,"g g -> d d~ e+ e-","LO");
  Recola::define_process_rcl(2,"u g -> d d~ e+ e- u","LO");
  Recola::define_process_rcl(3,"A A -> mu+ mu- e+ e-","LO");
  Recola::define_process_rcl(4,"u A -> mu+ mu- e+ e- u","LO");

// Selection of QCD contributions for process 1:
// All powers of gs are unselected for Born amplitude, except power 2.
  Recola::unselect_all_gs_powers_BornAmpl_rcl(1);
  Recola::select_gs_power_BornAmpl_rcl(1,2);

// Selection of QCD contributions for process 2:
// All powers of gs are unselected for Born amplitude, except power 3.
  Recola::unselect_all_gs_powers_BornAmpl_rcl(2);
  Recola::select_gs_power_BornAmpl_rcl(2,3);

// Selection of EW contributions for process 3:
// All powers of gs are unselected for Born amplitude, except power 0.
  Recola::unselect_all_gs_powers_BornAmpl_rcl(3);
  Recola::select_gs_power_BornAmpl_rcl(3,0);

// Selection of EW contributions for process 4:
// All powers of gs are unselected for Born amplitude, except power 0.
  Recola::unselect_all_gs_powers_BornAmpl_rcl(4);
  Recola::select_gs_power_BornAmpl_rcl(4,0);

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

// In this example we start with the following phase-space point
  double p[6][4] =
   {{2789.36556449,  0.00000000000,  0.00000000000,  2789.36556449},
    {2003.32704474,  0.00000000000,  0.00000000000, -2003.32704474},
    {1482.88702577,  87.3273179083, -1127.68979373,  958.980500246},
    {2032.83040303, -234.591543535,  1812.27464017,  890.520568996},
    {1220.45323502,  159.141025786, -661.270470691, -1013.36153340},
    {56.5219454083, -11.8768001589, -23.3143757501, -50.1010160985}};

  double k[7][4] =
   {{2914.11325883,  0.00000000000,  0.00000000000,  2914.11325883},
    {2003.32704474,  0.00000000000,  0.00000000000, -2003.32704474},
    {1321.46369109,  169.108121020, -876.002925898,  974.826961102},
    {2032.83040303, -234.591543535,  1812.27464017,  890.520568996},
    {1220.45323502,  159.141025786, -661.270470691, -1013.36153340},
    {56.5219454083, -11.8768001589, -23.3143757501, -50.1010160985},
    {286.171029020, -81.7808031113, -251.686867829,  108.901233489}};


// Compute process 1
  Recola::compute_process_rcl(1,p,"NLO");

// Compute process 2
  Recola::compute_process_rcl(2,k,"NLO");

// Compute process 3
  Recola::compute_process_rcl(3,p,"NLO");

// Compute process 4
  Recola::compute_process_rcl(4,k,"NLO");

// Compute colour-correlation of process 1 (for the QCD dipoles 
// corresponding to process 2)
  Recola::compute_colour_correlation_rcl(1,p,1,3);

// Compute spin- and colour-correlation of process 1 (for the QCD 
// dipoles corresponding to process 2)
  std::complex<double> v[4] = 
    {std::complex<double>(-1151.5040504618346, 0.),
     std::complex<double>(-497.28644383654944, 0.),
     std::complex<double>( 580.15008908958009, 0.),
     std::complex<double>(-1151.5040504618348, 0.)};
  Recola::compute_spin_colour_correlation_rcl(1,p,1,3,v);

// Compute spin-correlation of process 3 (for the QED dipoles 
// corresponding to process 4)
  Recola::compute_spin_correlation_rcl(3,p,1,v);

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
