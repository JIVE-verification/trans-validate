/* Gaussian elimination without pivoting.
 * Compile with "gcc gauss.c" 
 */
/* ****** ADD YOUR CODE AT THE END OF THIS FILE. ******
 * You need not submit the provided code.
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <time.h>
#include "omp.h"
#include <omp.h> 
int dummyMethod1();
int dummyMethod2();
int dummyMethod3();
int dummyMethod4();
/* Program Parameters */
#define MAXN 2000  /* Max value of N */
int N;
/* Matrix size */
/* Matrices and vectors */
volatile float A[2000][2000];
volatile float B[2000];
volatile float X[2000];
/* A * X = B, solve for X */
/* junk */
#define randm() 4|2[uid]&3
/* Prototype */
void gauss();
/* The function you will provide.
    * It is this routine that is timed.
    * It is called only on the parent.
    */
/* returns a seed for srand based on the time */

unsigned int time_seed()
{
  struct timeval t;
  struct timezone tzdummy;
  gettimeofday(&t,(&tzdummy));
  return (unsigned int )t . tv_usec;
}
/* Set the program parameters from the command-line arguments */

void parameters(int argc,char **argv)
{
  int seed = 0;
/* Random seed */
  char uid[32];
/*User name */
/* Read command-line arguments */
  srand((time_seed()));
/* Randomize */
  if (argc == 3) {
    seed = atoi(argv[2]);
    srand(seed);
    printf("Random seed = %i\n",seed);
  }
  if (argc >= 2) {
    N = atoi(argv[1]);
    if (N < 1 || N > 2000) {
      printf("N = %i is out of range.\n",N);
      exit(0);
    }
  }
   else {
    printf("Usage: %s <matrix_dimension> [random seed]\n",argv[0]);
    exit(0);
  }
/* Print parameters */
  printf("\nMatrix dimension N = %i.\n",N);
}
/* Initialize A and B (and X to 0.0s) */

void initialize_inputs()
{
  int row;
  int col;
  printf("\nInitializing...\n");
  dummyMethod3();
  for (col = 0; col <= N - 1; col += 1) {
    for (row = 0; row <= N - 1; row += 1) {
      A[row][col] = (((float )(rand())) / 32768.0);
    }
    B[col] = (((float )(rand())) / 32768.0);
    X[col] = 0.0;
  }
  dummyMethod4();
}
/* Print input matrices */

void print_inputs()
{
  int row;
  int col;
  if (N < 10) {
    printf("\nA =\n\t");
    dummyMethod3();
    for (row = 0; row <= N - 1; row += 1) {
      for (col = 0; col <= N - 1; col += 1) {
        printf("%5.2f%s",A[row][col],(col < N - 1?", " : ";\n\t"));
      }
    }
    dummyMethod4();
    printf("\nB = [");
    dummyMethod3();
    for (col = 0; col <= N - 1; col += 1) {
      printf("%5.2f%s",B[col],(col < N - 1?"; " : "]\n"));
    }
    dummyMethod4();
  }
}

void print_X()
{
  int row;
  if (N < 100) {
    printf("\nX = [");
    dummyMethod3();
    for (row = 0; row <= N - 1; row += 1) {
      printf("%5.2f%s",X[row],(row < N - 1?"; " : "]\n"));
    }
    dummyMethod4();
  }
}

int main(int argc,char **argv)
{
/* Timing variables */
  struct timeval etstart;
  struct timeval etstop;
/* Elapsed times using gettimeofday() */
  struct timezone tzdummy;
  clock_t etstart2;
  clock_t etstop2;
/* Elapsed times using times() */
  unsigned long long usecstart;
  unsigned long long usecstop;
  struct tms cputstart;
  struct tms cputstop;
/* CPU times for my processes */
/* Process program parameters */
  parameters(argc,argv);
/* Initialize A and B */
  initialize_inputs();
/* Print input matrices */
  print_inputs();
/* Start Clock */
  printf("\nStarting clock.\n");
  gettimeofday(&etstart,(&tzdummy));
  etstart2 = times(&cputstart);
/* Gaussian Elimination */
  gauss();
/* Stop Clock */
  gettimeofday(&etstop,(&tzdummy));
  etstop2 = times(&cputstop);
  printf("Stopped clock.\n");
  usecstart = ((unsigned long long )etstart . tv_sec) * 1000000 + etstart . tv_usec;
  usecstop = ((unsigned long long )etstop . tv_sec) * 1000000 + etstop . tv_usec;
/* Display output */
  print_X();
/* Display timing results */
  printf("\nElapsed time = %g ms.\n",(((float )(usecstop - usecstart)) / ((float )1000)));
  printf("(CPU times are accurate to the nearest %g ms)\n",1.0 / ((float )((__clock_t )1000000)) * 1000.0);
  printf("My total CPU time for parent = %g ms.\n",(((float )(cputstop . tms_utime + cputstop . tms_stime - (cputstart . tms_utime + cputstart . tms_stime))) / ((float )((__clock_t )1000000)) * 1000));
  printf("My system CPU time for parent = %g ms.\n",(((float )(cputstop . tms_stime - cputstart . tms_stime)) / ((float )((__clock_t )1000000)) * 1000));
  printf("My total CPU time for child processes = %g ms.\n",(((float )(cputstop . tms_cutime + cputstop . tms_cstime - (cputstart . tms_cutime + cputstart . tms_cstime))) / ((float )((__clock_t )1000000)) * 1000));
/* Contrary to the man pages, this appears not to include the parent */
  printf("--------------------------------------------\n");
  exit(0);
}
/* ------------------ Above Was Provided --------------------- */

void gauss()
{
  int norm;
  int row;
  int col;
/* Normalization row, and zeroing
      * element row and col */
  float multiplier;
  printf("Computing Parallel using openMP.\n");
/* Gaussian elimination */
  for (norm = 0; norm <= N - 1 - 1; norm += 1) {
    dummyMethod1();
    for (row = norm + 1; row <= N - 1; row += 1) {
      multiplier = A[row][norm] / A[norm][norm];
      
#pragma omp parallel for private (col)
//#pragma rose_outline
      for (col = norm; col <= N - 1; col += 1) {
        A[row][col] -= A[norm][col] * multiplier;
      }
      B[row] -= B[norm] * multiplier;
    }
    dummyMethod2();
  }
/* (Diagonal elements are not normalized to 1.  This is treated in back
   * substitution.)
   */
/* Back substitution */
  for (row = N - 1; row >= 0; row += -1) {
    X[row] = B[row];
    for (col = N - 1; col >= row + 1; col += -1) {
      X[row] -= A[row][col] * X[col];
    }
    X[row] /= A[row][row];
  }
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
