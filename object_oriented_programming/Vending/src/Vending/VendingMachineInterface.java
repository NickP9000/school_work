package Vending;

public interface VendingMachineInterface {

	/* 
	 * The insertCents function takes an int c that represents a certain amount of cents and
	 * stores it in the machine.
	 * 
	 * Exception: An ImproperCoinsException is thrown if c is not a multiple of 5.
	 */
	public void insertCents(int c);
	
	/*
	 * The makeSelection function takes an int s that represents a selected item. There are only three items
	 * to purchase, so a customer can only select option 0, 1, or 2.
	 * 
	 * Exception: An ImproperSelectionException is thrown if s is not either a 0, 1, or 2.
	 * Exception: An ImproperSelectionException is thrown if the selected item s is sold out.
	 */
	public void makeSelection(int s);
	
	/*
	 * The purchaseSelection function makes the purchase that was selected after calling makeSelection. It returns
	 * the amount of cents that should be given back to the customer if he/she overpaid. 0 should be
	 * returned if the customer inserted the exact number of cents needed to make the purchase.
	 * 
	 * Exception: An ImproperPurchaseException is thrown if the customer has not yet selected an item.
	 * Exception: An ImproperPurchaseException is thrown if the customer has not yet inserted enough
	 * cents into the machine to make the purchase.
	 */
	public int purchaseSelection();
	
	/*
	 * The returnUnspentCents function returns the amount of unspent cents that were inserted into the machine.
	 */
	public int returnUnspentCents();
	
	/*
	 * The getProfits function returns the profits (in cents) that have been collected from customer purchases.
	 */
	public int getProfits();
}