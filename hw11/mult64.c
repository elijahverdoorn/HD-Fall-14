#include <stdio.h>

int main() 
{
	int x;
	printf("Enter an integer: ");
	scanf("%d", &x);
	x = x * 64;
	printf("The product is %d\n", x);
}