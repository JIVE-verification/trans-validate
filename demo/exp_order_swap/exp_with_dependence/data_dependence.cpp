//Assume the for-loop is distrubted onto 2 different threads each taking a workload of 50 indices
//Thread1 := index 0 to 49, Thread2 := index 50 to 99
//Assume Threads start computation at the same time. 
//So, When Thread1 is at index 0, Thread2 is at index 50
//Data race occurrs for the given loop because
// Thread1's if(i==0) block tries to update arr3[0] as 'c'
// But Thread2's if(i==50) block might not be able to see the updated 'c'

// data_dep_demo.cpp shows the effect of this data race condition
// compile data_dep_demo.cpp with openmp flag (e.g. g++ -fopenmp data_dep_demo.cpp -o exec)
// and try executing it several times, you will observe that the printf value is not consistent



//originial
// void function1(int j){
//     float arr[100];
//     int arr2[100];
//     char arr3[100];
//     arr3[0] = 'f';
//     for(int i = 0; i < 100; i++){
//         if(i == 0){
//             arr3[i] = 'c';
//             arr2[i] = i;
//         }

//         if(i == 50){
//             arr[i] = arr3[0];
//         }
//     }
// }


// modified
void function1(int j){
    float arr[100];
    int arr2[100];
    char arr3[100];
    arr3[0] = 'f';
    for(int i = 0; i < 100; i++){
        if(i == 50){
            arr[i] = arr3[0];
        }

        if(i == 0){
            arr3[i] = 'c';
            arr2[i] = i;
        }
    }
}