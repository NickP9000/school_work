import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileNotFound {

	public static void main(String[] args) {
		try {
			File file = new File("MyFile.txt");
			Scanner inputFile = new Scanner(file);
		}
		catch (FileNotFoundException e) {
			System.out.println("File not found.");
		}
	}

}
