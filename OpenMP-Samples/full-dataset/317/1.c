#include <stdio.h>
#include <stdlib.h>
#include <omp.h> 
int dummyMethod1();
int dummyMethod2();
int dummyMethod3();
int dummyMethod4();
#ifdef _OPENMP
#include "omp.h"
#else
#define omp_get_thread_num() 0
#define omp_get_num_threads() 1
#define omp_get_num_procs() (system("cat /proc/cpuinfo | grep 'processor' | wc -l"))
#endif
// Size of vectors.
#ifndef N
#define N 1048576
#endif
// Entrada e saida.
double h_a[1048576];
double h_b[1048576];
double h_c[1048576];

void init_array()
{
  fprintf(stdout,"Inicializando os arrays.\n");
  int i;
// Initialize vectors on host.
  dummyMethod3();
  
#pragma omp parallel for private (i)
//#pragma rose_outline
  for (i = 0; i <= 1048575; i += 1) {
    h_a[i] = 0.5;
    h_b[i] = 0.5;
  }
  dummyMethod4();
}

void print_array()
{
  int i;
  fprintf(stdout,"Thread [%02d]: Imprimindo o array de resultados:\n",0);
  dummyMethod3();
  for (i = 0; i <= 1048575; i += 1) {
    fprintf(stdout,"Thread [%02d]: h_c[%07d]: %f\n",0,i,h_c[i]);
  }
  dummyMethod4();
}

void check_result()
{
// Soma dos elementos do array C e divide por N, o valor deve ser igual a 1.
  int i;
  double sum = 0;
  fprintf(stdout,"Thread [%02d]: Verificando o resultado.\n",0);
  dummyMethod3();
  
#pragma omp parallel for private (i) reduction (+:sum)
//#pragma rose_outline
  for (i = 0; i <= 1048575; i += 1) {
    sum += h_c[i];
  }
  dummyMethod4();
  fprintf(stdout,"Thread [%02d]: Resultado Final: (%f, %f)\n",0,sum,(double )(sum / ((double )1048576)));
}

int main()
{
  int i;
  init_array();
// int chunk_size = N / omp_get_num_procs();
  dummyMethod1();
  
#pragma omp parallel for private (i)
//#pragma rose_outline
  for (i = 0; i <= 1048575; i += 1) {
    h_c[i] = h_a[i] + h_b[i];
  }
  dummyMethod2();
// print_array();
  check_result();
  return 0;
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
