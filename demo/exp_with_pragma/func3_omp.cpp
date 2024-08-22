#include <omp.h>

int main(int argc, char* argv[]){
    int arr[100];
    int arr2[100];
    #pragma omp parallel for
    for(int i = 0; i < 100; i++){
        arr[i] = i*30*argc;
        arr2[i] = i*20*argc;
    }

    return arr[20]; //to confuse the optimizer?
}