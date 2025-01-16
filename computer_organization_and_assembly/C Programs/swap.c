#include  "stdio.h"

void swap(int v[], int k)
{
    int temp = v[k];
    v[k] = v[k+1];
    v[k+1] = temp;
}

void sort (int v[], int n)
{
    for (int i = 0; i < n; i++) {
        for (int j = i - 1; j >= 0 && v[j] > v[j + 1]; j--) {
            swap(v, j); 
        }
    } 
}

int main()
{
    int arr[5] = {7, 3, 1, 2, 10};
    sort(arr,5);
    for (int i = 0; i < 5; i++) {
        printf("The next value is: %d\n", arr[i]);
    }
}