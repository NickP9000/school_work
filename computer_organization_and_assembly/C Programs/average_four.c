#include "stdio.h"

float average(int arr[])
{
    int total;
    for (int i=0; i < 4; i++)
    {
        total += arr[i];
    }
    float av = (float) total/4;
    return av;
}

int main()
{
    int num_arr[4];
    printf("Welcome, User! Please input four integers.\n");
    printf("First integer:\n");
    scanf("%d", &num_arr[0]);
    printf("Second integer:\n");
    scanf("%d", &num_arr[1]);
    printf("Third integer:\n");
    scanf("%d", &num_arr[2]);
    printf("Fourth integer:\n");
    scanf("%d", &num_arr[3]);
    float result = average(num_arr);
    printf("The average is: %f", result);
    return 0;
}

