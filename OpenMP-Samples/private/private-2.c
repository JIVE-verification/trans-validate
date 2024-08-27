#include <stdio.h>
#include <omp.h>

const int n =20;

int main() {
	int a[n];
	int b=1000;
	int i;
#pragma omp parallel for private(i)
	for (i = 0; i < n; ++i)
	{
		a[i]=b+i;
	}
	return 0;
}
