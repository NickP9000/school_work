package ABCClasses;

public class Tester {

	public static void main(String[] args) {
		ClassA a = new ClassA();
		ClassB b = new ClassB();
		ClassC c = new ClassC();
		ClassD d = new ClassD();
		
		System.out.println("Calling ClassA's methods:\n");
		
		//a.priv(); // Compiler Error!
		a.pub();
		
		System.out.println("\nCalling ClassB's methods:\n");
		
		//b.priv(); // Compiler Error!
		b.pub();
		b.fun();
		
		System.out.println("\nCalling ClassC's methods:\n");
		
		//c.priv(); // Compiler Error!
		c.pub();
		c.fun();
		
		System.out.println("\nCalling ClassD's methods:\n");
		
		//d.priv(); // Compiler Error!
		d.pub();
		d.fun();

	}

}
