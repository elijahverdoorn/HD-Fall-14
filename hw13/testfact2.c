/* Example of recursion in C, Elijah Verdoorn */
#include <stdio.h>

int factorial(int n)
{
	if (n == 0)
		return 1;
	else
		return n * factorial(n-1);
}

int main()
{
	int out = factorial(10);
	printf("%d\n", out);

}