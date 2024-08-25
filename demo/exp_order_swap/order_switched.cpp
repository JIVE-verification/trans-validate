
void function1(int j){
    float arr[100];
    int arr2[100];
    char arr3[100];
    for(int i = 0; i < 100; i++){
        if(i%2 != 0){
            arr2[i] = i;
        }

        if(i%2 == 0){
            arr3[i] = i % 256;
        }
    }
}


//original
// void function1(int j){
//     float arr[100];
//     int arr2[100];
//     char arr3[100];
//     for(int i = 0; i < 100; i++){
//         if(i%2 == 0){
//             arr3[i] = i % 256;
//         }

//         if(i%2 != 0){
//             arr2[i] = i;
//         }
//     }
// }