import java.util.Scanner;
public class FindMax {

	public static void main(String[] args) 
	{
		int[] nums = new int[5];
		int largestInt = Integer.MIN_VALUE;
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Please input five ints");
		for(int i = 0; i < 5; i++)
		{
			nums[0] = scan.nextInt();
		}
		scan.close();
		
		for( int i = 0; i < 5; i++)
		{
			if (nums[i] > largestInt)
			{
				largestInt = nums[i];
			}
		}
		
		System.out.println("Your largest int is: " + largestInt);
	}

}
