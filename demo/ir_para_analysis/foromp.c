#include <omp.h>

int main (){
    omp_set_num_threads(2);
    #pragma omp parallel for
    for(int i = 0; i < __INT32_MAX__; i++){
    }
    return 0;
}

//analysis: 
//llvm emitted with no optimization, and with llvm-14 (used 14 because opaque pointers were confusing to track)
//loop limit was set to int max to see if the chunk size changes within the ir (it is always set to 1 on my end)

//semantically, the only difference is that foromp.c calls
//void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %13, i32 34, i32* %10, i32* %7, i32* %8, i32* %9, i32 1, i32 1)
//and
//void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %13)

// __kmpc_for_static_init_4:  look at the definition of __kmpc_for_static_init (line 65~417) from kmp_sched.cpp
// __kmpc_for_static_init_4 calls __kmpc_for_static_init

//__kmpc_for_static_fini: line 1817~1847 of kmpc_csupport.cpp


