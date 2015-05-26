

/* print square roots in C language.  R. Brown, 9/2010 */

#include <stdio.h>
#include <math.h>

main()
{
  int n;
  printf("sqrt(n)\n--------\n");
  for (n=0;  n<=5;  n++)
    printf("%f\n", sqrt(n));
  return 0;
}

