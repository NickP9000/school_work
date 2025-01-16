public class CopyTest {
	public static void main(String[] args) {
		Rectangle r1 = new Rectangle(10, 20);
		// Rectangle r2 = r1; // NOT A TRUE COPY!
		Rectangle r2 = r1.copy();
		
		r1.setLength(50);
		
		System.out.println("The length of r1 is " + r1.getLength());
		System.out.println("The length of r2 is " + r2.getLength());
	}
}
