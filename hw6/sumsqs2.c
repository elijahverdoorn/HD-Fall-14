/* example of iteration in C language.  RAB 9/10 */

#include <stdio.h>

int main() {
  int n;
  int result = 0;  
  int i;

  printf("Enter a positive integer:  ");
  scanf("%d", &n);

  for (i = 0; i <= n; i++) {
    result = result + i*i; 
  }

  printf("The sum of the first %d squares is %d.\n", n, result);
  return 0;  
}
