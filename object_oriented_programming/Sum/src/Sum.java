import java.util.Scanner;
public class Sum {

	public static void main(String[] args) 
	{
		int num1, num2;
		double num3, sum;
		String name;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Please input your name:");
		name = scan.nextLine();
		
		System.out.println("Please input two ints and then a double:");
		num1 = scan.nextInt();
		num2 = scan.nextInt();
		num3 = scan.nextDouble();
		
		scan.close();
		
		sum = num1 + num2 + num3;
		
		
		System.out.println("Thank you " + name + "! The sum is " + sum + ".");
	}
}
