
public class RectangleTest {

	public static void main(String[] args) 
	{
		Rectangle r1 = new Rectangle(10,10);
		Rectangle r2 = new Rectangle(70,200);
		Rectangle r3 = new Rectangle(15.37,80.0001);
		
		r1.setLength(-1);
		r1.setWidth(-1);
		
		System.out.println("The area of r1 is: " + r1.getArea());
		System.out.println("The area of r2 is: " + r2.getArea());
		System.out.println("The area of r3 is: " + r3.getArea());
		
		r3.setLength(20);
		r3.setWidth(12);
		System.out.println("The new area of r3 is: " + r3.getArea());
	}

}
