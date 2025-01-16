import java.io.Serializable;

/**
   The BankAccount class simulates a bank account.
*/

public class BankAccount implements Serializable
{
   private double balance;      // Account balance
   private PersonalInformation info;

   public BankAccount(double startBalance, String name, String address, int ssn)
   {
      balance = startBalance;
      info = new PersonalInformation(name, address, ssn);
   }

   public void deposit(double amount)
   {
      balance += amount;
   }

   public void withdraw(double amount)
   {
      balance -= amount;
   }

   public void setBalance(double b)
   {
      balance = b;
   }

   public double getBalance()
   {
      return balance;
   }
   
   public void displayAccount() {
	   System.out.println("Name " + info.getName());
	   System.out.println("Address " + info.getAddress());
	   System.out.println("SSN " + info.getSSN());
	   System.out.println("Balance " + getBalance());
   }
}
