#include<omp.h>
int arr[100];
int main(int argc, char* argv[]){
    #pragma omp parallel for
    for(int i = 0; i < 100; i++){
        arr[i] = 20*i;
    }
    return 0;
}