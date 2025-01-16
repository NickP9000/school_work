import static org.junit.Assert.*;
import org.junit.Test;

public class EmployeeTester {

	// Test to see if we can successfully get an employee's name
	@Test
    public void getNameTest() {
		Employee e = new Employee("Jim", 3000, 23);

		assertEquals(e.getName(), "Jim");
	}
	
	// Test to see if we can successfully change an employee's name
	@Test
    public void setNameTest() {
		Employee e = new Employee("Jim", 3000, 23);
		e.setName("Bob");
		
		assertEquals(e.getName(), "Bob");
	}
	
	// Test to see if we can successfully get an employee's age
	@Test
    public void getAgeTest() {
		Employee e = new Employee("Jim", 3000, 23);

		assertEquals(e.getAge(), 23);
	}
	
	// Test to see if we can successfully change an employee's age
    public void setAgeTest1() {
		Employee e = new Employee("Jim", 3000, 23);
		e.setAge(30);
		
		assertEquals(e.getAge(), 30);
	}
	
    // Test to see if an ImproperAgeException is thrown if we set an
    // employee's age to a negative number
	@Test(expected = ImproperAgeException.class)
    public void setAgeTest2() {
		Employee e = new Employee("Jim", 3000, 23);
		e.setAge(-3);
	}
	
	// Test to see if we can successfully get an Employee's monthly salary.
	@Test
    public void getMonthlySalaryTest() {
		Employee e = new Employee("Jim", 3000, 23);

		assertEquals(e.getMonthlySalary(), 3000);
	}
	
	// Test to see if we can successfully change employee's monthly salary.
	@Test
    public void setMonthlySalaryTest1() {
		Employee e = new Employee("Jim", 3000, 23);
		e.setMonthlySalary(4000);
		
		assertEquals(e.getMonthlySalary(), 4000);
	}
	
	// Test to see if an ImproperMonthlySalaryException is thrown 
	// if we set an employee's age to a negative number
	@Test(expected = ImproperMonthlySalaryException.class)
    public void setMonthlySalaryTest2() {
		Employee e = new Employee("Donald", 3000, 23);
		e.setMonthlySalary(-1000);
	}
	
	// Test to see if we can successfully compute an employee's yearly salary.
	@Test
	public void yearlySalaryTest() {
		Employee e = new Employee("Anna", 5000, 32);
		
		assertEquals(e.yearlySalary(), 60000); 
	}
	
	// Test to see if we can successfully compute the number of year's until an
	// employee has reached retirement age.
	// Note: An employee is at retirement age if he/she is 65 or older
	@Test
	public void yearsUntilRetirementAgeTest1() {
		Employee e = new Employee("Cory", 6000, 52);
		
		assertEquals(e.yearsUntilRetirementAge(), 13); 
	}
	
	// Test to see if we can successfully compute the number of year's until an
	// employee has reached retirement age.
	// Note: An employee is at retirement age if he/she is 65 or older
	@Test
	public void yearsUntilRetirementAgeTest2() {
		Employee e = new Employee("Mark", 7000, 65);
		
		assertEquals(e.yearsUntilRetirementAge(), 0); 
	}
	
	// Test to see if we can successfully compute the number of year's until an
	// employee has reached retirement age.
	// Note: An employee is at retirement age if he/she is 65 or older
	@Test
	public void yearsUntilRetirementAgeTest3() {
		Employee e = new Employee("Laura", 8000, 70);
		
		assertEquals(e.yearsUntilRetirementAge(), 0); 
	}
	
	// Test to see if we can successfully determine whether or not an employee should
	// retire or not.
	// Note: An employee should retire if they are 65 or older.
	@Test
	public void shouldEmployeeRetireTest() {
		Employee e = new Employee("Carl", 8000, 64);
		
		assertFalse(e.shouldEmployeeRetire()); 
	}
}
