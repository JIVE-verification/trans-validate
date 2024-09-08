#include <omp.h>

int main (){
    omp_set_num_threads(2);
    
    for(int i = 0; i < __INT32_MAX__; i++){
    }
    return 0;
}
