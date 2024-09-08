#include <omp.h>

int main (){
    #pragma omp parallel for
    for(int i = 0; i < 5; i++){
    }
    return 0;
}

//analysis (updated): 
// The ir code with omp pragma creates an internal void function that is passed to the kmpc_for_call
// this internal void function contains the instructions of the loop

//Additionally,the semantical difference is that foromp.c calls
//void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %13, i32 34, i32* %10, i32* %7, i32* %8, i32* %9, i32 1, i32 1)
//and
//void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %13)

// __kmpc_for_static_init_4:  look at the definition of __kmpc_for_static_init (line 65~417) from kmp_sched.cpp
// __kmpc_for_static_init_4 calls __kmpc_for_static_init

//__kmpc_for_static_fini: line 1817~1847 of kmpc_csupport.cpp


//I was able to modify the ir (in hand_modified) so that alive-tv can validate the contents in the void function (see line 11 of this current file) with the target main()
//As far as I understand, alive-tv thinks that the @__kmpc_fork_call in foromp.ll never returns because it is not defined within the foromp.ll
//It would be interesting to see what would happen if we just define the @__kmpc_fork_call to immediately return void within foromp.ll




