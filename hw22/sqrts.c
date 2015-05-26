/* print square roots in C language.  R. Brown, 9/2010 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
  if (argc < 1)
  {
  	printf("Error, input arguements next time!\n");
  	return 1;
  }
  int n;
  printf("sqrt(n)\n--------\n");
  int x = atoi(argv[1]);
  for (n = 0;  n < x;  n++)
  {
  	printf("%f\n", sqrt(n));
  }
  return 0;
}