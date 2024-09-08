#include <omp.h>

int main (){
    omp_set_num_threads(2);
    #pragma omp parallel for
    for(int i = 0; i < __INT32_MAX__; i++){
    }
    return 0;
}

//analysis: 
//semantically, the only difference is that foromp.c calls
//void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %13, i32 34, i32* %10, i32* %7, i32* %8, i32* %9, i32 1, i32 1)
//and
//void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %13)


