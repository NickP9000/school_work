public class Pair<T, S>
{
   private T first;     // The first item
   private S second;    // The second item
   
   public Pair(T firstArg, S secondArg)
   {
      first = firstArg;
      second = secondArg;
   }

   public T getFirst()
   {
      return first;
   }

   public S getSecond()
   {
      return second;
   }
}