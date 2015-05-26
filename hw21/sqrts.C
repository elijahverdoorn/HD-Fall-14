/* print square roots in C++ language.  R. Brown, 9/2010 */

#include <iostream>
#include <cmath>
#include <cstdlib>

using namespace std;

int main(int argc, char **argv)
{
  if (argc > 1)
  {
  	cout << "Error, input arguements next time!" << endl;
  	return 1;
  }
  else
  {
	  cout << "sqrt(n)" << endl << "--------" << endl;
	  int max = atoi(argv[1]);
	  for (int i = 0;  i < max;  i++)
	    cout << sqrt(i) << endl;
	  return 0;
  }
}