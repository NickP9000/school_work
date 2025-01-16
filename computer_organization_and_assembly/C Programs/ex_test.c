#include "stdio.h"

int main()
{
    float x = 3.5;
    float * x_ad = &x;
    printf("Value of x: %f", x_ad);
}