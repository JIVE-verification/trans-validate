//test1.ll
// void func(){
//    int v = 0;
//    for(int i = 0; i < 10; i++){
//     v -= (i+1);
//    } 
// }

//test2.ll
void func(){
   int v = 0;
   for(int i = 0; i < 5; i++){
    v += (i+1);
   } 

   for(int i = 5; i < 10; i++){
    v += (i+1);
   } 
   
}