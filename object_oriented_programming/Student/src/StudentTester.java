/*author: 
 *date: 
 *description: A file that creates and uses Student objects
 */

public class StudentTester {

	public static void main(String[] args) {
		Student a = new Student("Alice", 2.00);
		Student b = new Student("Bob", 2.00);
		
		a.display();
		b.display();
		
		a.study();
		
		a.display();
		b.display();
		
		if(a.getGPA() > b.getGPA())
			System.out.println(a.getName() + " has a better GPA than " + b.getName());
		else
			System.out.println(b.getName() + " has a better GPA than " + a.getName());
	}

}
