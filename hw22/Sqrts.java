/* print square roots in Java language.  R. Brown, 9/2010 */

class Sqrts {
  public static void main(String args[]) 
  {
    System.out.println("sqrt(n)");
    System.out.println("--------");
    if (args.length < 1)
    {
    	System.out.println("Error, input arguements!");
    	return;
	}
    int value = Integer.parseInt(args[0]);
    for (int n=0;  n < value;  n++)
      System.out.println(Math.sqrt(n));
    return;
  }
}