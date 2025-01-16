#include "stdio.h"
#include "stdlib.h"
//Name: Nick Peters


// Takes an array of n strings and returns
// a new string allocated on the heap
char *join(char **arr, int n)
{
    char *new_string;
    int num_chars = 0;

    //for each string in the array
    for(int i = 0; i < n; i++)
    {
        //for each character in string[i]
        for(int j = 0; arr[i][j] != '\0'; j++)
        {
            num_chars++; //count the number of characters
        }
    }

    new_string = malloc((num_chars)*sizeof(char)); //use num_chars to determine how much of the heap to use for new_string

    int counter = 0; //use counter to keep track of where to put the next character in new_string
    //for each string in the array
    for(int i = 0; i < n; i++)
    {
        //for each character in the array
        for(int j = 0; arr[i][j] != '\0'; j++)
        {
            //add character[j] from string[i] to new_string
            new_string[counter] = arr[i][j];
            counter++;
        }
        //put a space in between the strings in the array
        new_string[counter] = *" ";
        counter++;
    }
    new_string[counter] = *"\0"; //add the null pointer to the end of the string
    return new_string;
}


int main()
{
    char *my_strings[4] = {"Sphinx", "of", "black", "quartz"};
    char *joined = join(my_strings,4);
    printf("Here is the joined string: %s\n",joined);
    free(joined); //free up the memory after we're done

    return 0;
}