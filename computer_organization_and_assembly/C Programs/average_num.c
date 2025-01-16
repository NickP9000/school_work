//Name: Nick Peters
//Description: This is program is an expansion of the average_four program
/*Name: Nick Peters
  Description: This is program is an expansion of the average_four program.
  Instead of only being able to take 4 integer inputs, my program is able
  to take a wide number of integer inputs, directed by the user.*/
#include "stdio.h"

float average(int arr[], int len) //#2 This function sums the values in the array and returns the average.
{
    int sum;
    for (int i = 0; i < len; i++) //#5 This for loop sums the contents of the array.
    {
        sum += arr[i];
    }
    float mean = (float)sum/len;
    return mean;
}

int main ()
{
    int num;

    printf("Welcome to the Average Program!\nPlease input the amount of numbers you wish to average:\n");
    scanf("%d", &num); //#3 scans the amount of numbers the user wants to input

    int num_arr[num]; // #1 This array is used to store numbers inputted by the user

    for (int i = 0; i < num; i++) //#5 This for loop collects num amount of numbers and puts them in the array.
    {
        printf("Please input an integer(%d integers left):\n", num-i-1); //#4 This print statement directs the user on what to do and tells them how far into the process they are
        scanf("%d", &num_arr[i]); //puts numbers into the array, the amount determined by num
    }

    float result = average(num_arr, num);
    printf("\nThe average of your numbers is: %f", result); //#4 This print statement prints the average of the numbers.
    return 0;
}