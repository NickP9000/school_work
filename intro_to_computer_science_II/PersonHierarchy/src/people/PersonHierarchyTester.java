package people;

public class PersonHierarchyTester {

	public static void main(String[] args) {
		// Let's create a Person variable an initialize it to a Professor named Alice.
		Person p1 = new Professor("Alice", 35, "Mathematics");
		
		// Let's create a Professor variable and initialize it to a DProfessor named Bob.
		Professor pr1 = new DProfessor("Bob", 70, "Geology");
		
		// Why doesn't this line work?
		//Student s1 = new Professor("Carly", 29, "Physics");
		
		// Why doesn't this line work?
		//DProfessor dp1 = new Professor("Donald", 38, "Literature");
		
		// We can get Alice's age. Why?
		System.out.println("Alice is " + p1.getAge() + " years old. \n");
		
		// Huh? Why can't we get Alice's area of specialization?
		//System.out.println("Alice's area of specialization is " + p1.getSpecialization());
		
		// Bob is at a yacht club party and wants to brag a bit.
		//pr1.brag();
		// What!?! Why can't Bob Brag?
		
		// Now we are going to call Bob's display() method.
		pr1.display();
		// Okay, this works. But which version of the display()
		// method was called: Professor's display method or
		// DProfessor display method? Why?
	}

}
