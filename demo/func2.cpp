int func1(int x){
    int arr[100];
    int arr2[100];
    for(int i = 0; i < 100; i++){
        arr[i] = i*30*x;
        arr2[i] = i*20*x;
    }
    return arr[20];
}