/* print square roots in C++ language.  R. Brown, 9/2010 */

#include <iostream>
#include <cmath>

using namespace std;

main()
{
  cout << "n\tsqrt(n)" << endl << "----------------" << endl;
  for (int n=0;  n<=5;  n++)
    cout << n << "\t" << sqrt(n) << endl;
  return 0;
}
