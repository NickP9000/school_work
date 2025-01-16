import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

public class DeserializeDemo {

	public static void main(String[] args) {
		
		BankAccount myAccount;
		
		
		try
		{
			FileInputStream inStream = new FileInputStream("account.dat");
			ObjectInputStream objectInputFile = new ObjectInputStream(inStream);
			
			myAccount = (BankAccount) objectInputFile.readObject();
			
			objectInputFile.close();
			
			myAccount.displayAccount();
		}
		catch(IOException e)
		{
			System.out.println("A problem arose during deserialization.");
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("The class was not found.");
		}
		

	}

}
