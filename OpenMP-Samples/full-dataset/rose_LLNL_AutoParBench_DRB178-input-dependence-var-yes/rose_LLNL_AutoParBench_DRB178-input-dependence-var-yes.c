/*
!!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!
!!! Copyright (c) 2017-20, Lawrence Livermore National Security, LLC
!!! and DataRaceBench project contributors. See the DataRaceBench/COPYRIGHT file
for details.
!!!
!!! SPDX-License-Identifier: (BSD-3-Clause)
!!!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!
 */
/* 
 * Input dependence race: example from OMPRacer: A Scalable and Precise Static Race
   Detector for OpenMP Programs
 * Data Race Pair, A[0]@45:7:W vs. A[i]@42:5:W
 * */
#include <stdio.h>
#include <stdlib.h>
#include <omp.h> 
int dummyMethod1();
int dummyMethod2();
int dummyMethod3();
int dummyMethod4();

void load_from_input(int *data,int size)
{
  dummyMethod3();
  
#pragma omp parallel for firstprivate (size)
//#pragma rose_outline
  for (int i = 0; i <= size - 1; i += 1) {
    data[i] = size - i;
  }
  dummyMethod4();
}

int main(int argc,char *argv[])
{
  int *A;
  int N = 100;
  if (argc > 1) 
    N = atoi(argv[1]);
  A = ((int *)(malloc(sizeof(int ) * N)));
  load_from_input(A,N);
  dummyMethod1();
  for (int i = 0; i <= N - 1; i += 1) {
    A[i] = i;
    if (N > 10000) {
      A[0] = 1;
    }
  }
  dummyMethod2();
  free(A);
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
