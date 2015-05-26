/* Example of command-line arguments in c
Prints any command-line arguments, one per line
Usage: gcc -o cmdargs2 cmdargs.c
cmdargs2 arg1 arg2 ... */

#include <stdio.h>

int main(int argc, char **argv) 
{
	int i; /* loop control */
	for (i = 0; i < argc; i++)
		printf("%s\n", argv[i]);
	return 0;
}