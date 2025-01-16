
public class TwoDimArray {

	public static void main(String[] args) 
	{
		char[][] arr = new char[12][20];
		
		///*
		for (int rows = 0; rows < arr.length; rows++)
		{
			for (int cols = 0; cols < arr[0].length; cols+=2)
			{
				if (rows % 2 == 0)
				{
						arr[rows][cols] = 'x';
						arr[rows][cols+1] = '0';
				}
				else
				{
						arr[rows][cols] = '0';
						arr[rows][cols+1] = 'x';
				}
			}
		}
		//*/
		
		/*
		for (int rows = 0; rows < arr.length; rows+=2)
		{
			for (int cols = 0; cols < arr[0].length; cols+=2)
			{
				arr[rows][cols] = arr[rows+1][cols+1] = 'x';
				arr[rows][cols+1] = arr[rows+1][cols] = '0';
			}	
		}
		*/
		
		for (int rows = 0; rows < arr.length; rows++)
		{
			for (int cols = 0; cols < arr[0].length; cols++)
			{
				System.out.print(arr[rows][cols] + " ");
			}
			System.out.println();
		}
		
	}

}
