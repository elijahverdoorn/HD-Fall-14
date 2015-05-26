/* print square roots in C++ language.  R. Brown, 9/2010 */

#include <iostream>
#include <cmath>

using namespace std;

int x = 6; /*this is the number of times it executes */

long answer;

long factorial(int par)
{
  answer = 1;
  int c = 1;
  while (c <= par)
    {
      answer = answer * c;
      c++;
    }
  return answer;
}


main()
{
  answer = 1;
  factorial(x);
  cout << "n\tfactorial(n)" << "\n--------------------" << endl;
  int c = 0;
  while (c <= x)
    {
      cout << c << "\t" << factorial(c) << "\n" << endl;
      c++;
    }
}
