#include <stdio.h>

int main() 
{
	int x;
	printf("Enter an integer: ");
	scanf("%d", &x);
	x = x * 1000;
	printf("The product is %d\n", x);
}