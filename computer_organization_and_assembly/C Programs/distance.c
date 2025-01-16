#include <stdio.h>
#include <math.h>

typedef struct {
    double x;
    double y;
} POINT;

double distance(POINT p1, POINT p2)
{
    double xdiff = p1.x - p2.x;
    double ydiff = p1.y - p2.y;
    return sqrt(xdiff * xdiff + ydiff * ydiff);
}

int main()
{
    POINT p1 = {.x=4,.y=5};
    POINT p2 = {.x=0,.y=0};
    printf("Distance: %f\n",distance(p1,p2));
    return 0;
}