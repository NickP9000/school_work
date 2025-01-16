#include "stdio.h"

double average(double arr[], int n)
{
    double sum = 0.0;
    for (int i = 0; i < n; i++)
    {
        sum += arr[i];
    }
    double av = sum/n;
    return av;
}


int main()
{
    int num = 200;
    double arr[num];
    char decision[20] = "y";
    int counter = 0;

    while(decision[0] == 'y' || decision[0] == 'Y')
    {
        printf("Enter a double: ");
        scanf("%lf", &arr[counter]);
        counter++;

        printf("Do you want to keep going(y/n)? ");
        scanf("%s", &decision);
    }

    double result = average(arr, counter);
    printf("The average is %lf", result);
    return 0;
}

