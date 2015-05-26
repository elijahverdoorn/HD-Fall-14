#include <stdio.h>

int main() 
{
	int x;
	printf("Enter an integer: ");
	scanf("%d", &x);
	x = x * 65;
	printf("The product is %d\n", x);
}