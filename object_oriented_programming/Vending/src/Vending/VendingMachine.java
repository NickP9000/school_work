/* Name: Nick Peters
 * Date: 3/28/22
 * Description: implements VendingMachineInterface. With this class, a vending machine can be created for
 * customers to insert coins into, make selection from various items, and then purchase said item.
 * If a customer backs out, they can have their cents returned to them. For the owner, they can find the
 * profits earned by the machine.
 * Sources Cited: none
 */
package Vending;

public class VendingMachine implements VendingMachineInterface 
{
	private int cents, selection;
	private int[] choices = new int[3]; //contains the number of snickers, twix, and reeses in the machine
	private static String[] snacks = {"snickers", "twix", "reeses"}; //array of string choices
	private static int[] prices = {100, 115, 130}; // array of prices of choices
	private int profit; // tracks profit from purchases on the machine
	
	public VendingMachine (int s, int t, int r)
	{
		//set the number of items in the machine. 
		choices[0] = s; //snickers
		choices[1] = t; //trix
		choices[2] = r; //reeses
		
		selection = -1; //-1 means selection has not been made
	}
	
	public void insertCents(int c)
	{
		if (c % 5 != 0) // if inserted coin is not a multple of 5
			throw new ImproperCoinsException();
		else cents += c; //coin is multiple of 5
	}
	
	public void makeSelection(int s)
	{
		if (s > 2 || s < 0) //if selection is out of bounds
			throw new ImproperSelectionException();
		else if (choices[s] == 0) // if selection is out of stock
			throw new ImproperSelectionException(snacks[s]);
		else selection = s; //selection is neither out of bounds or out of stock
	}
	
	public int purchaseSelection()
	{
		if (selection == -1) //if selection has not been made
			throw new ImproperPurchaseException();
		else if (cents < prices[selection]) //if not enough cents have been inserted
			throw new ImproperPurchaseException(prices[selection]-cents);
		else 
		{
			int change = (cents - prices[selection]); //calculate change customer is owed
			profit += prices[selection]; //add transaction to profit
			choices[selection] -= 1; //item removed
			
			//reset selection and cents in preparation for next customer
			selection = -1; 
			cents = 0; 
			
			return change;
		}
			
	}
	
	public int returnUnspentCents()
	{
		int temp = cents; //transfer cents to a temp variable
		
		//reset selection and cents in preparation for next customer
		selection = -1;
		cents = 0;
		
		return temp;
	}
	
	public int getProfits()
	{
		return profit;
	}
	
}
