/* example of function definitions and calls. RAB 10/10 */
#include <stdio.h>

/* iterative factorial function */
long iter(int n) 
{
	int i; /* loop control variable */
	int answer = 1; /* accumulates the answer */
	for (i = 1; i <= n; i++)
		answer = answer * i;
	return answer;
}
/* recursive factorial function */
long recur(int n)
{
	if (n <= 0)
		return 1;
	else
		return n * recur(n-1);
}
int main() 
{
	int val = 10;
	printf("iter(%d) returns %d\n", val, iter(val));
	printf("recur(%d) returns %d\n", val, recur(val));
	return 0; /* normal exit status */
}