/* Name: Nick Peters
 * Date: 1/31/22
 * Description: This program takes five ints from user input, calculates their average, and outputs the ints and the average in Average.txt
 * Sources Cited: None used
 */
import java.util.Scanner;
import java.io.*;
public class Average {

	public static void main(String[] args) throws IOException
	{
		//int variables, average, and scanner are initialized
		int num1, num2, num3, num4, num5;	
		double average;
		Scanner scan = new Scanner(System.in);
		
		//program requests and receives user input
		System.out.println("Please input five integers separated by spaces:");
		num1 = scan.nextInt();
		num2 = scan.nextInt();
		num3 = scan.nextInt();
		num4 = scan.nextInt();
		num5 = scan.nextInt();
		scan.close();
		
		//average is calculated, 5.0 is used to prevent truncation
		average = (num1 + num2 + num3 + num4 + num5)/5.0;
		
		//program outputs the int variables and the average to Average.txt
		System.out.println("Your numbers and their average will now be output to Average.txt");
		PrintWriter outputFile = new PrintWriter("Average.txt");
		outputFile.println(num1 + ", " + num2 + ", " + num3 + ", " + num4 + ", " + num5);
		outputFile.print("The average is: " + average);
		outputFile.close();
		
		//program completes
		System.out.println("Done!");
		
		
	}

}
