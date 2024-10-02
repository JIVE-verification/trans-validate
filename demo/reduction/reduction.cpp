#include<omp.h>
//#include<stdio.h>

int reduction(){
    int v = 0;
    #pragma omp parallel for reduction(+:v)
    for(int i = 0; i < 10; i++){
        v += i;
    }
    return v;
}
