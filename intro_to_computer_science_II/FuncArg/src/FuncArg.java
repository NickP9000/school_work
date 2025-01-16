public class FuncArg {

	public static void main(String[] args) 
	{
		int[] arr1 = {1, 2, 3, 4, 5};
		System.out.println(findMax(arr1));
		
		int[] arr2 = {5, 4, 3, 2, 1};
		System.out.println(findMax(arr2));
		
		int[] arr3 = {1, 4, 200, 4, 7};
		System.out.println(findMax(arr3));
		
	}
	
	public static int findMax(int[] arr)
	{
		int max = arr[0];
		for (int i = 1; i < arr.length; i++)
		{
			if (arr[i] > max)
			{
				max = arr[i];
			}
		}
		return max;
	}

}
