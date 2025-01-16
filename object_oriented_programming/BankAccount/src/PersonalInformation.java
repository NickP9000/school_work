
import java.io.Serializable;

public class PersonalInformation implements Serializable{
	private String name;
	private String address;
	private transient int SSN;
	
	public PersonalInformation(String n, String a, int ssn) {
		setName(n);
		setAddress(a);
		setSSN(ssn);
	}
	
	public String getName() {
		return name;
	}
	
	public String getAddress() {
		return address;
	}
	
	public int getSSN() {
		return SSN;
	}
	
	public void setName(String n) {
		name = n;
	}
	
	public void setAddress(String a) {
		address = a;
	}
	
	public void setSSN(int ssn) {
		SSN = ssn;
	}
}
