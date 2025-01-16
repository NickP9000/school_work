/* Name: Nick Peters
 * Date: 4/25/22
 * Description: generic class for finding max, min and a specific value in an array of objects which are comparable
 * Sources Cited: none
 */
public class GenericArraySearcher<T extends Comparable<T>> {
	
	//takes an array of type T and returns the min
	public T findMin(T[] arr)
	{
		T min = arr[0]; //set min as first value in the array
		for (int x = 1; x < arr.length; x++) //start at 1 since min is set to first value in array
		{
			//Compare min and an object in arr
			//when min is greater, compareTo returns an int greater than 0
			if (min.compareTo(arr[x]) > 0)
				min = arr[x]; //When min is greater, set min to new value
		}
		return min;
	}
	
	//takes an array of type T and returns the max
	public T findMax(T[] arr)
	{
		T max = arr[0]; //set max as first value in the array
		for (int x = 1; x < arr.length; x++) //start at 1 since max is set to first vlaue in array
		{
			//when max is less than, compareTo returns an int less than 0
			if(max.compareTo(arr[x]) < 0)
				max = arr[x]; //when max is less than, set max to new value
		}
		return max;
	}
	
	//takes a target and an array of type T and returns true if the target is in the array
	public boolean find(T obj, T[] arr)
	{
		boolean found = false; //flag variable
		for (int x = 0; x < arr.length; x++) //start at 0
		{
			//if arr[x] and obj are the same thing, compareTo returns 0
			if (arr[x].compareTo(obj) == 0)
				found = true; // if compareTo returns 0, set flag variable to true
		}
		return found;
	}
}
