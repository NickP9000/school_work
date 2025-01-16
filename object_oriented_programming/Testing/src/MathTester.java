import static org.junit.Assert.*;
import org.junit.Test;

public class MathTester {

	@Test
    public void addTest() {
		assertEquals(4 + 3, 7);
	}
	
	@Test
    public void absTest1() {
		assertEquals(Math.abs(7), 7);
	}
	
	@Test
    public void absTest2() {
		assertEquals(Math.abs(-7), 7);
	}
	
	@Test
    public void divideTest1() {
		int x = 10 / 5;
		assertEquals(x, 2);
	}
	
	@Test(expected = ArithmeticException.class)
    public void divideTest2() {
		int x = 10 / 0;
	}
	
	@Test
	public void compareTest1() {
		assertTrue(4 > 1);
	}
	
	@Test
	public void compareTest2() {
		assertFalse(4 < 1);
	}
}