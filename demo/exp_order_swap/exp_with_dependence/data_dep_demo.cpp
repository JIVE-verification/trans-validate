#include<stdio.h>
#include<omp.h>

int main(int argc, char* argv[]){
    float arr[100];
    int arr2[100];
    char arr3[100];
    arr3[0] = 'f';
    #pragma omp parallel for
    for(int i = 0; i < 100; i++){
        if(i == 0){
            arr3[i] = 'c';
            arr2[i] = i;
        }

        if(i == 50){
            arr[i] = arr3[0];
        }
    }

    printf("%c\n", (char)arr[50]);

    return 0;
}