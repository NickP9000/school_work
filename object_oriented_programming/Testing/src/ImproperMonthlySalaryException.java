
public class ImproperMonthlySalaryException extends RuntimeException{
	public ImproperMonthlySalaryException()
	{
		super("You cannot give an employee a negative monthly salary.");
	}
}
