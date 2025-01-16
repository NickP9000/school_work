public class ImproperAgeException extends RuntimeException{
	public ImproperAgeException()
	{
		super("You cannot give an employee a negative age.");
	}
}