#include <stdio.h>
#include "omp.h"
#include <omp.h> 
int dummyMethod1();
int dummyMethod2();
int dummyMethod3();
int dummyMethod4();
int n = 64;

int main()
{
  int fail = 0;
  int a = - 1;
//
#if 1
{
//nothing
  }
#endif
  dummyMethod3();
  
#pragma omp parallel for
//#pragma rose_outline
  for (int k = 0; k <= n - 1; k += 1) {
// nothing
  }
  dummyMethod4();
  dummyMethod1();
  
#pragma omp parallel for firstprivate (n)
//#pragma rose_outline
  for (int k = 0; k <= n - 1; k += 1) {
// nothing
  }
  dummyMethod2();
  printf("Succeeded\n");
  return fail;
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
