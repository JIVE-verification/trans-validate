#include <stdio.h>
#include <omp.h>
int main() {
	int x = 10;
	int a;

#pragma omp parallel for reduction(-:a)
	for(x = 0; x < 10; x++)
	{
		a -= 10;
	}
	x = 20;
	return 0;
}