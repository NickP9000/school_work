/* Name: Nick Peters
 * Date: February 4, 2022
 * Description: This program reads in a file of numbers, computes the minimum and maximum,
 * and outputs them to a file 
 * Sources Cited: Our class notes, textbook, and google search for helping me remember
 * Integer.MIN_VALUE and Integer.MAX_VALUE
 */
import java.io.*;
import java.util.Scanner;
public class MinMax {

	public static void main(String[] args) throws IOException 
	{
		//min and max variables are set to int minimum and maximum to avoid any numbers being overlooked
		int max = Integer.MIN_VALUE;
		int min = Integer.MAX_VALUE;
		//temp is used later to store ints that the scanner reads from data.txt
		int temp = 0;
		
		File myFile = new File("data.txt");
		Scanner fileScan = new Scanner(myFile);
		
		//while look begins, how it is set up ensures that the scanner cannot scan beyond the limit of the file
		while(fileScan.hasNext())
		{
			temp = fileScan.nextInt();
			
			//compare temp to both max and min and change numbers when applicable
			if (temp > max)
			{
				max = temp;
			}
			
			if ( temp < min)
			{
				min = temp;
			}
		}
		fileScan.close();
		
		//max and min found, program writes them to results.txt
		PrintWriter results = new PrintWriter("results.txt");
		results.println("The minimum in data.txt is: " + min);
		results.println("The maximum in data.txt is: " + max);
		results.close();
		
		System.out.print("Done!");
	}

}
