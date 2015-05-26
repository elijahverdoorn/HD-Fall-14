#include <iostream>
using namespace std;

main()
{
	int input;
	cout << "Enter a non-negative integer: ";
	cin >> input;
	long array[input];
	cout << "Enter " << input << " floating point values, one value per line:" << endl;
	for (int x = 0; x <= input-1; x++)
	{
		cin >> array[x];
	}
	cout << "In reverse order:" << endl;
	for (int x = input - 1; x != -1; x--)
	{
		cout << array[x] << endl;
	}
}