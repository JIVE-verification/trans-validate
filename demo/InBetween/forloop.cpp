#include<omp.h>

int main(int argc, char* argv[]){
    int arrSize = 100;
    int arr[arrSize];
    for(int i = 0; i < 100; i++){
        arr[i] = 20*i;
    }
    return 0;
}