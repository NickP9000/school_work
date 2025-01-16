#include "stdio.h"
#include "stdlib.h"

typedef struct
{
    double x;
    double y;
} POINT;

typedef struct 
{
    POINT * array;
    int array_size;
}POINT_LIST;


POINT_LIST *read_points(char *filename)
{
    FILE *fp = fopen(filename,"r");

    char buffer[80];
    int num_points;

    fgets(buffer, 80, fp);
    sscanf(buffer, "%d\n", &num_points);
    //printf("DEBUGGING num_points: %d\n", num_points);

    POINT * arr = malloc(num_points*sizeof(POINT));
    for(int i = 0; i < num_points; i++)
    {
        fgets(buffer, 80, fp);
        double temp1;
        double temp2;
        sscanf(buffer, "%lf %lf", &temp1, &temp2);
        arr[i].x = temp1;
        arr[i].y = temp2;
    }

    fclose(fp);

    POINT_LIST *p_arr;
    p_arr->array = arr;
    p_arr->array_size = num_points;
    //for(int i = 0; i < num_points; i++)
    //{
    //    printf("DEBUGGING Current row: %lf, %lf\n", arr[i].x, arr[i].y);
    //}
    return p_arr;
}

int main()
{
    POINT_LIST * p_arr = read_points("point_file.txt");

    for(int i = 0; i < p_arr->array_size; i++)
    {

        printf("DEBUGGING Current row: %lf, %lf\n", p_arr[i].array->x, p_arr[i].array->y);
    }
    free(p_arr);
    return 0;
}