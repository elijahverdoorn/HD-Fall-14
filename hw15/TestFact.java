/* print square roots in Java language.  R. Brown, 9/2010 */

class TestFact 
{
	static int factorial(int par)
	{
		if (par == 0) 
			return 1;
		else
			return par * factorial(par-1);
	}

	public static void main(String args[])
	{
		System.out.println("factorial(n)");
		System.out.println("----------------");
		System.out.println(factorial(10));
		return;
	}
}