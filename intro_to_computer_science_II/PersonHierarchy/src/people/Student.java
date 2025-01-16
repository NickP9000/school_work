package people;

public class Student extends Person{
	private double gpa;
	
	public Student(String n, int a, double g)
	{
		super(n, a);
		gpa = g;
	}
	
	public void setGPA(double g)
	{
		gpa = g;
	}
	
	public double getGPA()
	{
		return gpa;
	}
	
	public void study()
	{
		gpa += 0.01;
	}
	
	@Override
	public void display()
	{
		System.out.println("STUDENT: ");
		System.out.println(" name: " + getName());
		System.out.println(" age: " + getAge());
		System.out.println(" gpa: " + gpa);
	}
}
