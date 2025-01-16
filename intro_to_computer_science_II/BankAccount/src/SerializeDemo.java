import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class SerializeDemo {

	public static void main(String[] args) {

		try
		{
			FileOutputStream outStream = new FileOutputStream("account.dat");
			ObjectOutputStream objectOutputFile = new ObjectOutputStream(outStream);
			
			BankAccount myAccount = new BankAccount(150.00, "Jim Lahey", "Sunnvale Trailer Park, Trailer 5", 57234);
			
			objectOutputFile.writeObject(myAccount);
			
			objectOutputFile.close();
		}
		catch(IOException e) 
		{
			System.out.println("A problem arose during serialization.");
		}

	}

}
