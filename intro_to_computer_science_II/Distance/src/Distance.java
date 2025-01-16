/* This is a file that tests the functions you wrote in Math.java.
 * Do not modify this file!
 */
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Distance {
	public static void main(String[] args) throws FileNotFoundException {

		int SIZE = 5;
		File inFile = new File("arrays.txt");
		Scanner scan = new Scanner(inFile);
		
		double array1[] = new double[SIZE];
		double array2[] = new double[SIZE];
		
		while(scan.hasNextLine())
		{
			for(int i = 0; i < SIZE; i++)
				array1[i] = scan.nextDouble();
			for(int i = 0; i < SIZE; i++)
				array2[i] = scan.nextDouble();
			
			System.out.println("The max distance between");
			outputArray(array1,SIZE);
			System.out.println("and");
			outputArray(array2,SIZE);
			System.out.println("is" + "\r\n" + Math.maxDistance(array1,array2,SIZE) + ". \r\n");
		}
		scan.close();
	}
	
	static void outputArray(double array[], int size)
	{
		for(int i = 0; i < size; i++)
			System.out.print(array[i] + " ");
		System.out.println();
	}
}