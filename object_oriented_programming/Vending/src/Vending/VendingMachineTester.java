/* Name: Nick Peters
 * Date: 3/28/22
 * Description: Tests various functions of the VendingMachine class. Tests are described in comments above them.
 * Sources Cited: none
 */
package Vending;
import static org.junit.Assert.*;
import org.junit.Test;

public class VendingMachineTester {

	//1. Test to see if ImproperCoinsException is thrown when the inputted coin is not a multiple of 5
	@Test(expected = ImproperCoinsException.class)
	public void coinTest()
	{
		VendingMachine v = new VendingMachine(5,5,5);
		v.insertCents(1);
	}
	
	//2. Test to see if ImproperSelectionException is thrown when the item selected is not 0, 1, or 2
	@Test(expected = ImproperSelectionException.class)
	public void makeSelectionTest1()
	{
		VendingMachine v = new VendingMachine(5,5,5);
		v.makeSelection(3);
	}
	
	//3. Test to see if ImproperSelectionException is thrown when customer selects an item that is out of stock
	@Test(expected = ImproperSelectionException.class)
	public void makeSelectionTest2()
	{
		VendingMachine v = new VendingMachine(1,0,0);
		v.insertCents(200);
		v.makeSelection(0);
		v.purchaseSelection();
		v.makeSelection(0);
	}
	
	//4. Test to see if ImproperPurchseException is thrown if the customer tries to purchase an item without selecting one first
	@Test(expected = ImproperPurchaseException.class)
	public void purchaseSelectionTest1()
	{
		VendingMachine v = new VendingMachine(5,5,5);
		v.purchaseSelection();
	}
	
	//5. Test to see if ImproperPurchaseException is thrown when purchase is attempted before proper amount of cents is inserted.
	@Test(expected = ImproperPurchaseException.class)
	public void purchaseSelectionTest2()
	{
		VendingMachine v = new VendingMachine(5,5,5);
		v.insertCents(10);
		v.makeSelection(0);
		v.purchaseSelection();
	}
	
	//6. Test if correct amount of cents is returned when customer overpays
	@Test
	public void purchaseSelectionTest3()
	{
		VendingMachine v = new VendingMachine(5,5,5);
		v.insertCents(120);
		v.makeSelection(0);
		assertEquals(20,v.purchaseSelection());
	}
	
	//7. Test if correct amount of cents returned after customer decides not to make a purchase
	@Test
	public void returnUnspentCentsTest()
	{
		VendingMachine v = new VendingMachine(5,5,5);
		v.insertCents(120);
		assertEquals(120,v.returnUnspentCents());
	}
	
	//8. Test if correct amount of cents are returned as profit after several purchases
	@Test
	public void getProfitsTest()
	{
		VendingMachine v = new VendingMachine(5,5,5);
		v.insertCents(200);
		v.makeSelection(0);
		v.purchaseSelection();
		v.insertCents(200);
		v.makeSelection(1);
		v.purchaseSelection();
		v.insertCents(200);
		v.makeSelection(2);
		v.purchaseSelection();
		assertEquals(345,v.getProfits());
		
	}
}
