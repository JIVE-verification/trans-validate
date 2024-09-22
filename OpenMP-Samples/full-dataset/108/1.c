/*
Copyright (c) 2017, Lawrence Livermore National Security, LLC.
Produced at the Lawrence Livermore National Laboratory
Written by Chunhua Liao, Pei-Hung Lin, Joshua Asplund,
Markus Schordan, and Ian Karlin
(email: liao6@llnl.gov, lin32@llnl.gov, asplund1@llnl.gov,
schordan1@llnl.gov, karlin1@llnl.gov)
LLNL-CODE-732144
All rights reserved.
This file is part of DataRaceBench. For details, see
https://github.com/LLNL/dataracebench. Please also see the LICENSE file
for our additional BSD notice.
Redistribution and use in source and binary forms, with
or without modification, are permitted provided that the following
conditions are met:
* Redistributions of source code must retain the above copyright
  notice, this list of conditions and the disclaimer below.
* Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the disclaimer (as noted below)
  in the documentation and/or other materials provided with the
  distribution.
* Neither the name of the LLNS/LLNL nor the names of its contributors
  may be used to endorse or promote products derived from this
  software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL LAWRENCE LIVERMORE NATIONAL
SECURITY, LLC, THE U.S. DEPARTMENT OF ENERGY OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
THE POSSIBILITY OF SUCH DAMAGE.
*/
/*
Use of private() clause
*/
#include <stdio.h>
#include <math.h>
#include <omp.h> 
int dummyMethod1();
int dummyMethod2();
int dummyMethod3();
int dummyMethod4();
#define MSIZE 200
int n = 200;
int m = 200;
double alpha = 0.0543;
double u[200][200];
double f[200][200];
double uold[200][200];
double dx;
double dy;

void initialize()
{
  int i;
  int j;
  int xx;
  int yy;
  dx = 2.0 / (n - 1);
  dy = 2.0 / (m - 1);
/* Initialize initial condition and RHS */
  dummyMethod1();
  for (i = 0; i <= n - 1; i += 1) {
    dummyMethod2();
  }
  
#pragma omp parallel for private (xx,yy,j) firstprivate (m,alpha,dx,dy,i)
//#pragma rose_outline
  for (j = 0; j <= m - 1; j += 1) {
    xx = ((int )(- 1.0 + dx * (i - 1)));
/* -1 < x < 1 */
    yy = ((int )(- 1.0 + dy * (j - 1)));
/* -1 < y < 1 */
    u[i][j] = 0.0;
    f[i][j] = - 1.0 * alpha * (1.0 - (xx * xx)) * (1.0 - (yy * yy)) - 2.0 * (1.0 - (xx * xx)) - 2.0 * (1.0 - (yy * yy));
  }
}

int main()
{
  initialize();
  int i;
  int j;
  dummyMethod3();
  for (i = 0; i <= n - 1; i += 1) {
    for (j = 0; j <= m - 1; j += 1) {
      printf("%lf %lf\n",u[i][j],f[i][j]);
    }
  }
  dummyMethod4();
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
