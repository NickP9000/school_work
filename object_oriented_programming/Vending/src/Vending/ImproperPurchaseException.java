package Vending;

public class ImproperPurchaseException extends RuntimeException{
	public ImproperPurchaseException() {
		super("Error: You have not selected a snack number yet.");
	}
	
	public ImproperPurchaseException(int c) {
		super("Error: Insufficient funds. The selected snack costs " + c + " more cents.");
	}
}