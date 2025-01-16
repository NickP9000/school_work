package people;

public class Professor extends Person{
	private String specialization;
	
	public Professor(String n, int a, String s)
	{
		super(n, a);
		specialization = s;
	}
	
	public String getSpecialization()
	{
		return specialization;
	}
	
	public void setSpecialization(String s)
	{
		specialization = s;
	}
	
	@Override
	public void display()
	{
		System.out.println("Professor: ");
		System.out.println(" name: " + getName());
		System.out.println(" age: " + getAge());
		System.out.println(" specialization: " + specialization);
	}
}
