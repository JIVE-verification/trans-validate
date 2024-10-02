#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#define M 1000
#define INT_MAX 999

int main(void)
{
    int A[M];
    int i;
    int result= INT_MAX;


    #pragma omp parallel for private(i)
    for (i = 0; i < M; i++)
    {
        A[i] = i;
    }

    //non-parallel loop
    for (i = 0; i < 1000; i++)
    {
        if (A[i] < result)
            result = A[i];
    }

    printf("Suma %d\n", result);
    return 0;
}