int main(){
    int N = 100;
    int arr[N];

    for(int i = 1; i < 99; i++){
        arr[i] = arr[i+1];
    }

    return 0;
}