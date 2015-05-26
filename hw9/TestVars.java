/* print factorials in Java language.  R. Brown, 10/2010 */

import java.io.*;

class TestVars {

  /** helper function to read user input and convert to an integer.
      returns 0 if there is an exception (e.g., user enters non-integer) */
  public static int getVal(String prompt) {
    byte[] buff = new byte[100];
    int count;
    int value = 0;

    try {
      System.out.print(prompt);
      count = System.in.read(buff, 0, 100);
      value = Integer.parseInt(new String(buff, 0, count-1));
    } catch (IOException e) {
      System.out.println("IOException:  " + e.getMessage());
    } catch (NumberFormatException e) {
      System.out.println("NumberFormatException:  " + e.getMessage());
    } 

    return value;
  }

  public static void main(String args[]) {
    AddN.n = 7;

    int val;

    val = getVal("Enter an integer value:  ");

    AddN a = new AddN();
    System.out.println("The call addn(" + val + ") returns " + a.addn(val));
    return;
  }
}

class AddN {
  public static int n;  
  
  public int addn(int x) {
    return x + n;
  }
}
