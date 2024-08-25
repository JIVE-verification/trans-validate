int func1(int x){
    
    int arr[100];
    int arr2[100];
    int arr3[100];

    for(int i = 0; i < 100; i++){
        arr[i] = i*30*x;
        arr2[i] = i*20*x;
        arr3[i] = i*40*x;
    }
    return arr[20];
}