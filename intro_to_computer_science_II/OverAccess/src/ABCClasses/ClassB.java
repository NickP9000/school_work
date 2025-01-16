package ABCClasses;

public class ClassB extends ClassA{
	
	public void fun()
	{
		// priv(); //Compiler Error!
		pub();
	}
}
