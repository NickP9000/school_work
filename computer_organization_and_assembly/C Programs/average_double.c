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
    int num;
    
    printf("Please enter the number of doubles you wish to average:\n");
    scanf("%d", &num);

    double arr[num];

    for (int i = 0; i < num; i++)
    {
        printf("Please enter a double (%d doubles left):\n", num-i-1);
        scanf("%lf", &arr[i]);
    }

    double result = average(arr, num);
    printf("The average is %lf", result);
    return 0;
}