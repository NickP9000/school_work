#include "stdio.h"

int main()
{
    char name[20];
    int age;
    printf("Hi! What is your name?\n");
    scanf("%s", name);
    printf("Hello, %s, it is nice to meet you!\n", name);
    printf("What is your age?\n");
    scanf("%d", &age);
    printf("Wow, %d is pretty old!\n", age);
    return 0;
}