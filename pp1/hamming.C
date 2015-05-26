/* Hamming code project file 1 in C++. Elijah Verdoorn 9/14 */

#include <iostream>
#include <cmath>
#include <stdlib.h>

using namespace std;


long hamming(long val)
{
  //todo: make the hamming function
  long output;
  //for (int c)












  return output;
}





main()
{
  //setting inputs to hexadecimal
  cin.setf(ios::hex, ios::basefield);
  cout.setf(ios::hex, ios::basefield);

  //define variables here
  int hexIn;

  //getting user input in hexadecimal
  cout << "Enter a four digit hexadecimal value:" << endl;
  cin >> hexIn;
  if (hexIn.size_of() != 2)
  {
    cout << "Not a four digit hexadecimal number! Quitting!" << endl;
    exit(EXIT_FAILURE);
  }
  else
  {
    if (hexIn == 0)
    {
      cout << "Not a four digit hexadecimal number! Quitting!" << endl;
      exit(EXIT_FAILURE);
    }
    else
    {
      hamming(hexIn);
    }
  }


  //testing the in/out in hex: cout << "value is : " << hexin << endl;

}