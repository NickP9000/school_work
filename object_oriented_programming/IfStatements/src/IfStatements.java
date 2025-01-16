import java.util.Scanner;
public class IfStatements {

	public static void main(String[] args) 
	{
		int num;
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Please input a number");
		num = scan.nextInt();
		scan.close();
		
		if (num > 100)
		{
			System.out.println("Your number is greater than 100!");
		}
		else
		{
			System.out.println("Your number is less than or equal to 100!");
		}
	}

}
