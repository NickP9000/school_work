
public class LinkedListTester {

	public static void main(String[] args) {
		LinkedList<String> sList = new LinkedList<String>();

		sList.prepend("strings");
		sList.prepend("list");
		sList.prepend("of");
		sList.prepend("cool");

		System.out.println(sList.toString());
		
		LinkedList<Person> pList = new LinkedList<Person>();
		   
		Person p1 = new Person("Jim Bob", 34);
		Person p2 = new Person("Mary Sue", 23);
		Person p3 = new Person("Sarah Jones", 10);
			
		pList.prepend(p1);
		pList.prepend(p2);
		pList.prepend(p3);
			
		System.out.println(pList.toString());
	}

}
