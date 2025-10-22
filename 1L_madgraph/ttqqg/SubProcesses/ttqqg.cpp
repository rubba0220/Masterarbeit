#include <iostream>
#include <iomanip> 

#include "CPPProcess.h"
#include "rambo.h"

int main(int argc, char** argv){

  // Create a process object
  CPPProcess process;

  // Read param_card and set parameters
  process.initProc("../../Cards/param_card.dat");

  const int n = process.nexternal;                  // number of external legs
  std::vector<double*> p(n);
  for (int i=0;i<n;++i) p[i] = new double[4];

  double q[5][4] = {
    {243.958874340707, 0.0, 0.0, +243.958874340707},  // d
    {243.274422280898, 0.0, 0.0, -243.274422280898},  // d~
    { 72.4210128964652, 50.6623055703701,  44.0522222052368,  27.1576070747199}, // g
    {202.733585822752, -81.9445526000469, 60.951575089163,   30.2432242639469}, // t
    {212.078697902388,  31.2822470296768,-105.0037972944,   -56.7163792788578}  // t~
  };

  for (int i=0;i<n;++i)
    for (int mu=0; mu<4; ++mu)
      p[i][mu] = q[i][mu];

  // Set momenta for this event
  process.setMomenta(p);

  // Evaluate matrix element
  process.sigmaKin();

  const double* matrix_elements = process.getMatrixElements();

  cout << "Momenta:" << endl;
  for(int i=0;i < process.nexternal; i++)
    cout << setw(4) << i+1 
	 << setiosflags(ios::scientific) << setw(14) << p[i][0]
	 << setiosflags(ios::scientific) << setw(14) << p[i][1]
	 << setiosflags(ios::scientific) << setw(14) << p[i][2]
	 << setiosflags(ios::scientific) << setw(14) << p[i][3] << endl;
  cout << " -----------------------------------------------------------------------------" << endl;

  // Display matrix elements
  for(int i=0; i<process.nprocesses;i++)
    cout << " Matrix element = " 
//	 << setiosflags(ios::fixed) << setprecision(17)
	 << matrix_elements[i]*36
	 << " GeV^" << -(2*process.nexternal-8) << endl;

  cout << " -----------------------------------------------------------------------------" << endl;
}
