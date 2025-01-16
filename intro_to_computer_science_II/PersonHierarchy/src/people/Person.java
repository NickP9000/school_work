package people;

public class Person {
	private String name;
	private int age;
	
	public Person(String n, int a)
	{
		name = n;
		age = a;
	}
	
	public void setName(String n)
	{
		name = n;
	}
	
	public void setAge(int a)
	{
		age = a;
	}
	
	public int getAge()
	{
		return age;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void display()
	{
		System.out.println("PERSON: ");
		System.out.println(" name: " + name);
		System.out.println(" age: " + age);
	}
}
