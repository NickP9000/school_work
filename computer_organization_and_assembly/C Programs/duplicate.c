#include <stdio.h>
#include <stdlib.h>

int * duplicate(int *arr, int n) {
    int *new_arr = malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) {
        new_arr[i] = arr[i];
    }

    return new_arr;
}

int main()
{
    int myarr[5] = {1,2,3,4,5};
    int *myarr_copy = duplicate(myarr,5);

    for(int i=0; i< 5; i++)
    {
        printf("%d\n",myarr_copy[i]);
    }
    free(myarr_copy);
    return 0;
}