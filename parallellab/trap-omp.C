#include <iostream>
#include <cmath>
#include <cstdlib>
#include <omp.h>
using namespace std;

/* Demo program for OpenMP: computes trapezoidal approximation to an integral*/

const double pi = 3.141592653589793238462643383079;

int main(int argc, char** argv) 
{
  //start the timing
  double start = omp_get_wtime ();

  /* Variables */
  double a = 0.0, b = pi;  /* limits of integration */
  int n = 1048576; /* number of subdivisions = 2^20 */
  double h = (b - a) / n; /* width of subdivision */
  double integral; /* accumulates answer */
  int threadct = 1;  /* number of threads to use */
  
  /* parse command-line arg for number of threads */
  if (argc > 1)
    threadct = atoi(argv[1]);

  double f(double x);
    
#ifdef _OPENMP
  cout << "OMP defined, threadct = " << threadct << endl;
#else
  cout << "OMP not defined" << endl;
#endif

  integral = (f(a) + f(b))/2.0;
  int i;

  //code added here
  #pragma omp parallel for num_threads(threadct) \
    shared (a, n, h) private(i) reduction(+: integral)

  for(i = 1; i < n; i++) 
  {
    integral += f(a+i*h);
  }
  
  integral = integral * h;
  cout << "With n = " << n << " trapezoids, our estimate of the integral" <<
    " from " << a << " to " << b << " is " << integral << endl;
  double end = omp_get_wtime ();
  double realtime = end - start;
  cout << "Total computational time: " << realtime << endl;
}
  
double f(double x) 
{
  return sin(x);
}