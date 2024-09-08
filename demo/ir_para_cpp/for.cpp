#include <omp.h>

int main (){
    for(int i = 0; i < 5; i++){
    }
    return 0;
}

//findings:
//Alive-tv produces error if source (first .ll argument) is more defined than the target
//Alive-tv thinks that files without omp pragma is more defined
//Therefore, to run the validation, we should do: alive-tv FileWithPragma.ll FileWithoutPragma.ll


