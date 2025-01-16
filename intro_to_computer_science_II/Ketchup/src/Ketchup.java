/* Name: Nick Peters
 * Date: 02/14/22
 * Description: This program scans a file filled with data on ketchup bottles purchased from stores. After processing
 * the data, it prints the number of bottles each brand sold and how much money was made from each brand.
 * Sources cited: None used
 */
import java.util.Scanner;
import java.io.*;
public class Ketchup {

	public static void main(String[] args) throws IOException
	{
		String brand;
		int heinz_Bottles = 0, hunts_Bottles = 0, delmonte_Bottles = 0, STB_Bottles = 0; //sums
		double heinz_Money = 0.0, hunts_Money = 0.0, delmonte_Money = 0.0, STB_Money = 0.0; //sums ($)
		double temp1, temp2, temp3, temp4; //used to get prices from the document
		File k_Data = new File("ketchupData.txt");
		Scanner scan = new Scanner(k_Data);
		
		//skip the first line
		scan.nextLine();
		
		while (scan.hasNext())//loop keeps going until there is nothing left in document
		{
			//scan one line
			brand = scan.next();
			temp1 = scan.nextDouble();
			temp2 = scan.nextDouble();
			temp3 = scan.nextDouble();
			temp4 = scan.nextDouble();
			
			//check brand and add to running totals based on brand
			if (brand.equals("heinz"))
			{
				heinz_Bottles++;
				heinz_Money += temp1;
			}
			else if (brand.equals("hunts"))
			{
				hunts_Bottles++;
				hunts_Money += temp2;
			}
			else if (brand.equals("delmonte"))
			{
				delmonte_Bottles++;
				delmonte_Money += temp3;
			}
			else
			{
				STB_Bottles++;
				STB_Money += temp4;
			}
		}
		scan.close();
		
		//print out sums
		System.out.println("Total number of Heinz bottles purchased: " + heinz_Bottles + "\nMoney made from Heinz bottles: $" + heinz_Money);
		System.out.println("Total number of Hunts bottles purchased: " + hunts_Bottles + "\nMoney made from Hunts bottles: $" + hunts_Money);
		System.out.println("Total number of Delmonte bottles purchased: " + delmonte_Bottles + "\nMoney made from Delmonte bottles: $" + delmonte_Money);
		System.out.println("Total number of STB bottles purchased: " + STB_Bottles + "\nMoney made from STB bottles: $" + STB_Money);
	}

}
