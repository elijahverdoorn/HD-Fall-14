/* Example Java program using hexadecimal input/output 
   RAB 9/00 */

import java.io.*;

public class TryHex {
  final static int MAX = 100;

  static void doError(Exception e, String s) {
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

    int val = 0;
    try {
      val = Integer.parseInt(new String(arr, 0, 4), 16);
      
    } catch (NumberFormatException e) {
      doError(e, "You entered some non-hexadecimal digits! Aborting.");
    }	  
    /* val is the value that was read, as a binary integer stored in 
       main memory.  */

    System.out.println("Binary:       " + Integer.toBinaryString(val));
    System.out.println("Octal:        " + Integer.toOctalString(val));
    System.out.println("Decimal:      " + Integer.toString(val));
    System.out.println("Hexadecimal:  " + Integer.toHexString(val));

  }
}