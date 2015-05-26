/* Example of command-line arguments in Java
Prints any command-line arguments, one per line
Usage: javac CmdArgs.java
java CmdArgs arg1 arg2 ... */

import java.io.*;

public class CmdArgs 
{
	public static void main(String[] args) 
	{
		for (int i = 0; i < args.length; i++)
			System.out.println(args[i]);
	}
}