#include <stdio.h>
#include <stdlib.h>

main()
{
	int input;
	printf("Enter a non-negative integer: ");
	scanf("%d", &input);
	long array[input];
	printf("Enter %d floating point values, one value per line:\n", input);
	int x = 0;
	while (x <= input-1)
	{
		scanf("%u", &array[x]);
		x = x +1;
	}
	printf("In reverse order:\n");
	x = input - 1;
	while (x != -1)
	{
		printf("%u\n", array[x]);
		x = x -1;
	}
}