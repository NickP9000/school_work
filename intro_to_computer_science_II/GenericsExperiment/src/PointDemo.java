public class PointDemo {

	public static void main(String[] args) {
		Point<Integer> p1 = new Point<>(5, 10);
		
		Point<Double> p2 = new Point<>(20.5, 11.2);
		
		Point p3 = new Point(32.5, 3);
		
		Point.printPoint(p1);
		Point.printPoint(p2);
		Point.printPoint(p3);
	}
}