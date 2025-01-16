package ABCClasses;

public class ClassC extends ClassA{
	public final void pub()
	{
		System.out.println("Running ClassC.pub()");
	}
	
	public void fun()
	{
		// priv(); //Compiler Error!
		super.pub();
	}
}
