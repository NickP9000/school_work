public class Point<T extends Number>
{
   private T xCoordinate;
   private T yCoordinate;
   
   public Point(T x, T y)
   {
      xCoordinate = x;
      yCoordinate = y;
   }
   
   public void setX(T x)
   {
      xCoordinate = x;
   }
   
   public void setY(T y)
   {
      yCoordinate = y;
   }
   
   public T getX()
   {
      return xCoordinate;
   }
   
   public T getY()
   {
      return yCoordinate;
   }
   
   public static void printPoint(Point<? extends Number> point)
   {
	   System.out.println("X Coordinate: " + point.getX());
	   System.out.println("Y Coordinate: " + point.getY());

   }
}