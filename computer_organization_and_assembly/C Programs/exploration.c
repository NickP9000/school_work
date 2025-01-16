#include "stdio.h"

void reverse(int arr[], int n)
{
    int rev = n-1;
    int start = 0;

    while(start < rev)
    {
        int temp = arr[start];
        arr[start] = arr[rev];
        arr[rev] = temp;
        start++;
        rev--;
    }

}

void print_array(int arr[], int n)
{
    for (int i = 0; i < n; i++)
    {
        if (i == n-1)
            printf("%d \n", arr[i]);
        else
            printf("%d, ", arr[i]);
    }
    
}

int main()
{
    int arr[5] = {1, 2, 3, 4, 5};
    print_array(arr, 5);
    reverse(arr, 5);
    print_array(arr, 5);
    return 0;
}