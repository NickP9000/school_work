/*
 * Name: Nick Peters
 * Date: 02/21/22
 * Description: Provides important methods for Distance.java to work, such as a function to calculate absolute value,
 * and a function to calculate maximum distance within two sets of arrays
 * Sources Cited: None used
 */

public class Math {
	//if positive, returns x. If negative, multiplies it by -1 to make it positive 
	public static double abs(double x)
	{
		if (x >=0)
		{
			return x;
		}
		else return (x * -1);
	}
	
	//finds distance between two values
	public static double dist(double x, double y)
	{
		return abs(x-y);
	}
	
	//iterates through two arrays, finding the max distance between two values and returning it
	public static double maxDistance(double array1[], double array2[], int size)
	{
		double max = 0.0;
		for (int i = 0; i < size; i++)
		{
			double temp = dist(array1[i], array2[i]); //put distance in temp variable
			if (temp > max) //compare, if temp if greater, set a new max
			{
				max = temp;
			}
		}
		return max;
	}
}