/*--------------------------------------------------------------------
  (C) Copyright 2006-2013 Barcelona Supercomputing Center
                          Centro Nacional de Supercomputacion
  
  This file is part of Mercurium C/C++ source-to-source compiler.
  
  See AUTHORS file in the top level directory for information
  regarding developers and contributors.
  
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 3 of the License, or (at your option) any later version.
  
  Mercurium C/C++ source-to-source compiler is distributed in the hope
  that it will be useful, but WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  PURPOSE.  See the GNU Lesser General Public License for more
  details.
  
  You should have received a copy of the GNU Lesser General Public
  License along with Mercurium C/C++ source-to-source compiler; if
  not, write to the Free Software Foundation, Inc., 675 Mass Ave,
  Cambridge, MA 02139, USA.
--------------------------------------------------------------------*/
/*
<testinfo>
test_generator=config/mercurium-omp
</testinfo>
*/
#include <stdio.h>
#include <stdlib.h>
#include <omp.h> 
int dummyMethod1();
int dummyMethod2();
int dummyMethod3();
int dummyMethod4();
#define N 100
int omp_get_num_threads();
int omp_get_thread_num();

int main(int argc,char **argv)
{
  int i;
  int x = 100 + 1;
  float a[100];
  dummyMethod4();
  dummyMethod3();
  
#pragma omp parallel for private (i)
//#pragma rose_outline
  for (i = 0; i <= 99; i += 1) {
    a[i] = i;
  }
#ifdef NANOX
#else
  dummyMethod1();
#endif
  for (i = 0; i <= 99; i += 1) {
    x = ((a[i] < x?a[i] : x));
  }
  dummyMethod2();
  if (x != 0) {
    fprintf(stderr," x = %d\n",x);
  }
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
