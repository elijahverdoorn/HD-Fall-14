/* print square roots in C++ language.  R. Brown, 9/2010 */

#include <iostream>
#include <cmath>

using namespace std;
int x = 6; /*this is the number of times it executes */



long factorial(int par)
{
  long answer = 1;
  for (int c = 1; c <= par; c++)
    {
      answer = answer * c;
    }
  return answer;
}


main()
{
  factorial(x);
  cout << "n\tfactorial(n)" << "\n--------------------" << endl;
  for (int c = 0; c <= x; c++)
    {
      cout << c << "\t" << factorial(c) << "\n" << endl;
    }
}
