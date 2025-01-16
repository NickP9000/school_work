#include "stdio.h"
#include "stdlib.h"

void concatenate(char *str1, char *str2)
{
    char new_string;
    int counter = 0;
    int total_chars = 0;

    for (int i = 0; str1[i] != '\0'; i++)
    {
        total_chars++;
    }

    for (int i = 0; str2[i] != '\0'; i++)
    {
        total_chars++;
    }

    new_string = malloc((total_chars)*sizeof(char));

    for(int i = 0; i < len1; i++)
    {
        new_string[counter] = str1[i];
        counter++;
    }

    for(int i = 0; i < len2; i++)
    {
        new_string[counter] = str2[i];
        counter++;
    }
}

int main()
{
    char *result;

}