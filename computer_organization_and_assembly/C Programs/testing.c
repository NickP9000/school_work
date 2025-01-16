#include "stdio.h"

int main()
{
    int var = 0;
    int arr[3] = {1,2,3};
    printf("Address of var: %p\n", &var);
    printf("Address of arr[0]: %p\n", arr);
    printf("Address of arr[1]: %p\n", &arr[1]);
    printf("Address of arr[2]: %p\n", &arr[2]);

    return 0;
}