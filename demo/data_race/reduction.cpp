#include<omp.h>
//#include<stdio.h>

void reduction(int *v2){
    int v = 0;
    #pragma omp parallel for reduction(+:v)
    for(int i = 0; i < 10; i++){
        v += i;
    }
    *v2 = v;
    //printf("%d\n",v);
}
