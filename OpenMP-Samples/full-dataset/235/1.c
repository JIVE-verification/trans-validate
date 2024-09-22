#include<stdio.h>
#include<stdlib.h>
#include "omp.h"
#include <omp.h> 
int dummyMethod1();
int dummyMethod2();
int dummyMethod3();
int dummyMethod4();
/**
sample I/O
with thread_count = 4 and n = 32000
the calculated PI is 3.141561 and the actual PI is 3.141592654
*/

void main(int argc,char *argv[])
{
  double factor;
  double sum;
  double pi;
  int n;
  int thread_count;
  if (argc != 2) {
    fprintf(stderr,"Usage: ./a.out thread_Count_value\n");
    exit(0);
  }
  thread_count = (strtol(argv[1],((void *)0),10));
  printf("enter n:\n");
  scanf("%d",&n);
  int k = 0;
  factor = 1;
  dummyMethod1();
  
#pragma omp parallel for private (factor,k) reduction (+:sum)
//#pragma rose_outline
  for (k = 0; k <= n - 1; k += 1) {
    factor = (k % 2 == 0?1.0 : - 1.0);
    sum += factor / (2 * k + 1);
  }
  dummyMethod2();
  pi = 4.0 * sum;
  printf("value PI with n = %d  : %.10lf\n",n,pi);
}

int dummyMethod1()
{
  return 0;
}

int dummyMethod2()
{
  return 0;
}

int dummyMethod3()
{
  return 0;
}

int dummyMethod4()
{
  return 0;
}
