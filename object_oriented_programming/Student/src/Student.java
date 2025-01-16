/*author: 
 *date: 
 *description: Specification file for the Student class
 */

public class Student {
	private String name;
	private double gpa;
	
	public Student(String n, double g)
	{
		setName(n);
		setGPA(g);
	}
	
	public void setName(String n)
	{
		name = n;
	}
	
	public void setGPA(double g)
	{
		if (g >= 0 && g <= 4.0)
			gpa = g;
		else System.out.println("Invalid GPA assignment");
	}
	
	public String getName()
	{
		return name;
	}
	
	public double getGPA()
	{
		return gpa;
	}
	
	public void study()
	{
		gpa += 0.05;
		if (gpa > 4.0)
		{
			gpa = 4.0;
		}
	}
	
	public void display()
	{
		System.out.println("Name: " + name + "\nGPA: " + gpa);
	}
}