#include <iostream>
#include "blogic.H"
using namespace std;

int alu(int f0, int f1, int inva, int ena, int enb, int carryin, int a, int b)
{
	int x = bor( // 21, output
		band( // 1
			band( // 5
				bxor( // 7
					band( // 9
						a,
						ena
						),
					inva
					),
				band( // 8
					b,
					enb
					)
				),
			band( // 6
				bnot(f0), // 10
				bnot(f1) // 11
				)
			),
		band( // 2
			bor( //12
				bxor( // 7
					band( // 9
						a,
						ena
						),
					inva
					),
				band( // 8
					b,
					enb
					)
				),
			band( //13
				bnot(f0), //14
				f1
				)
			),
		band( //3
			bnot( //15
				band( // 8
					b,
					enb
					)
				),
			band( //16
				bnot(f1), //17
				f0
				)
			),
		band( //4
			bxor( //18
				carryin,
				bxor( //19
					bxor( // 7
						band( // 9
							a,
							ena
							),
						inva
						),
					band( // 8
						b,
						enb
						)
					)
				),
			band( //20
				f0,
				f1
				)
			)
		); // end of x
	int y = bor( //22
	 	band( //23
	 		carryin,
 			bxor( //19
				bxor( // 7
					band( // 9
						a,
						ena
						),
					inva
					),
				band( // 8
					b,
					enb
					)
				),
 			band( //20
				f0,
				f1
				)
	 		),
	 	band( //24
	 		band( //20
				f0,
				f1
				),
	 		bxor( // 7
				band( // 9
					a,
					ena
					),
				inva
				),
	 		band( // 8
				b,
				enb
				)
	 		)
	 	); //end of y
	//create the bitmap of the carryout and the output
	if (x == 0 & y == 0)
		return 0;
	if (x == 0 & y == 1)
		return 1;
	if (x == 1 & y == 0)
		return 2;
	if (x == 1 & y == 1)
		return 3;

}

void print_call(int f0, int f1, int inva, int ena, int enb, int carryin, int a, int b)
{
	cout << "alu(" << f0 << ", " << f1 << ", " << inva << ", " << ena << ", " << enb << ", " << carryin << ", " << a << ", " << b << ") --> " << alu(f0, f1, inva, ena, enb, carryin, a, b) << endl;
}

void print_section(int f0, int f1, int inva, int ena, int enb)
{
	cout << endl;
	cout << "F0=" << f0 << ", F1=" << f1 << ", INVA=" << inva << ", ENA=" << ena << ", ENB=" << enb << endl;
	print_call(f0, f1, inva, ena, enb, 0, 0, 0);
	print_call(f0, f1, inva, ena, enb, 0, 0, 1);
	print_call(f0, f1, inva, ena, enb, 0, 1, 0);
	print_call(f0, f1, inva, ena, enb, 0, 1, 1);
	print_call(f0, f1, inva, ena, enb, 1, 0, 0);
	print_call(f0, f1, inva, ena, enb, 1, 0, 1);
	print_call(f0, f1, inva, ena, enb, 1, 1, 0);
	print_call(f0, f1, inva, ena, enb, 1, 1, 1);
}

main()
{
	print_section(0, 0, 0, 0, 0);
	print_section(0, 0, 0, 0, 1);
	print_section(0, 0, 0, 1, 0);
	print_section(0, 0, 0, 1, 1);
	print_section(0, 0, 1, 0, 0);
	print_section(0, 0, 1, 0, 1);
	print_section(0, 0, 1, 1, 0);
	print_section(0, 0, 1, 1, 1);
	print_section(0, 1, 0, 0, 0);
	print_section(0, 1, 0, 0, 1);
	print_section(0, 1, 0, 1, 0);
	print_section(0, 1, 0, 1, 1);
	print_section(0, 1, 1, 0, 0);
	print_section(0, 1, 1, 0, 1);
	print_section(0, 1, 1, 1, 0);
	print_section(0, 1, 1, 1, 1);
	print_section(1, 0, 0, 0, 0);
	print_section(1, 0, 0, 0, 1);
	print_section(1, 0, 0, 1, 0);
	print_section(1, 0, 0, 1, 1);
	print_section(1, 0, 1, 0, 0);
	print_section(1, 0, 1, 0, 1);
	print_section(1, 0, 1, 1, 0);
	print_section(1, 0, 1, 1, 1);
	print_section(1, 1, 0, 0, 0);
	print_section(1, 1, 0, 0, 1);
	print_section(1, 1, 0, 1, 0);
	print_section(1, 1, 0, 1, 1);
	print_section(1, 1, 1, 0, 0);
	print_section(1, 1, 1, 0, 1);
	print_section(1, 1, 1, 1, 0);
	print_section(1, 1, 1, 1, 1);
}