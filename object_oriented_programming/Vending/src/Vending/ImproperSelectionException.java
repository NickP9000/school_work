package Vending;

public class ImproperSelectionException extends RuntimeException{
	public ImproperSelectionException() {
		super("Error: The item number selected does not exist.");
	}
	
	public ImproperSelectionException(String snack) {
		super("Error: This vending machine is out of " + snack + ".");
	}
}