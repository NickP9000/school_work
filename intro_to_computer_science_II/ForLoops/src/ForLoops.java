
public class ForLoops {

	public static void main(String[] args) 
	{
		int sum = 0;
		
		for (int i = 2; i < 100; i +=2)
		{
			sum += i;
			System.out.print(i + " ");
		}
		
		
		System.out.println("\nThe sum of even numbers between 1 and 99 is " + sum);
	}

}
