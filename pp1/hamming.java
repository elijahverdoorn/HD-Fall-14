import java.io.*;


public class hamming
{
	final static int MAX = 100;

      static void doError(Exception e, String s) 
    {
    	System.out.println(s);
   		System.out.println(e.getMessage());      
    	System.out.println(" Aborting.");
    	System.exit(1);
    }
 
  public static void main(String [] argv) {
    
    byte [] arr = new byte[MAX];
    
    System.out.print("Please enter a 4-digit hexadecimal value:  ");
    
    try {
      int count = System.in.read(arr, 0, MAX);
      if (count != 5) {
	System.out.println("You did not enter four digits!  Aborting.");
	System.exit(1);
      }
    } catch (IOException e) {
      doError(e, "Could not read the input!");
    }
    /* four characters (plus one newline) were read. */
    }
}