#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "ctype.h"

/*
int read_content(FILE *fp, char buffer, int r, int c)
{
    while (fgets(buffer, 80, fp) != NULL) 
    {
    // buffer contains the current line here
    }
}
*/


int main()
{
    FILE *fp = fopen("twoDarray.txt", "r");
    char buffer[80];
    int rows = 0;
    int cols = 0;

    int **arr2;

    fgets(buffer, 80, fp);
    sscanf(buffer,"%d/%d",&rows,&cols);
    printf("%d %d\n",rows,cols);

    arr2 = malloc(rows*sizeof(int *));

    const char comm[2] = ",";
    char *line;
    for(int i = 0; i < rows; i++)
    {
        fgets(buffer, 80, fp);
        arr2[i] = malloc(cols*sizeof(int));
        line = strtok(buffer, comm);
        int j = 0;
        while(line != NULL)
        {
            sscanf(line, "%d", &arr2[i][j]);
            line = strtok(NULL, comm);
            j++;
        }
    }

    for(int i = 0; i < rows; i++)
    {
        for(int j = 0; j < cols; j++)
        {
            printf("%d ", arr2[i][j]);
        }
        printf("\n");
    }


    return 0;
}