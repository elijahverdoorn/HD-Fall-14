/* Example of command-line arguments in c
   Prints any command-line arguments, one per line
   Usage:  g++ -o cmdargs cmdargs.C
           cmdargs arg1 arg2 ...  */

#include <iostream>
using namespace std;

int main(int argc, char **argv) {
  for (int i = 0;  i < argc;  i++)
    cout << argv[i] << endl;
  
  return 0;
}
