package people;

public class DProfessor extends Professor{
	public DProfessor(String n, int a, String s)
	{
		super(n, a, s);
	}
	
	public void brag()
	{
		System.out.println("I'm distinguished!");
	}
	
	@Override
	public void display()
	{
		System.out.println("Distinguished Professor: ");
		System.out.println(" name: " + getName());
		System.out.println(" age: " + getAge());
		System.out.println(" specialization: " + getSpecialization());
		System.out.print("Did I mention that "); brag();
	}
}
