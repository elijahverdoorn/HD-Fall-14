class Facts
{
    static long factorial(int par)
    {
	long answer = 1;
	if (par == 0)
	    return answer;
	int c  = 1;
	while (c <= par)
	    {
		answer = answer * c;
		c++;
	    }
	return answer;
    }

    public static void main(String args[])
    {
	System.out.println("n" + "       " + "n!");
	System.out.println("------------");
	int n = 0;
	while (n <= 6)
	    {
		System.out.println(n + "       " + factorial(n));
		n++;
	    }
	return;
    }
}
