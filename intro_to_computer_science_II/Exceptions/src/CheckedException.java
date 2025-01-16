import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class CheckedException {

	public static void main(String[] args) {
		String fileName = "neato.txt";
		try
		{
			displayFile(fileName);
		}
		catch (FileNotFoundException e)
		{
			System.out.println("File not found.");
		}
	}
	
	public static void displayFile(String name) throws FileNotFoundException
	{
		File file = new File(name);
		Scanner inputFile = new Scanner(file);
		while(inputFile.hasNext())
		{
			System.out.println(inputFile.nextLine());
		}
			
		inputFile.close();
	}

}
