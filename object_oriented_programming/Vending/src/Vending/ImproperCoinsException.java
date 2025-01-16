package Vending;

public class ImproperCoinsException extends RuntimeException{
	public ImproperCoinsException() {
		super("Error: The amount of cents you put into a machine must be a multiple of 5.");
	}
}
