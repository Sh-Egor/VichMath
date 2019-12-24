#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double
f(double x)
{
	return (x*x + exp(x));
}

double

gold(double a, double b, double eps)
{
	double fi = (1 + sqrt(5))/2;
	double x1;
	double x2;
	while(fabs(b - a)> eps){
		x1 = b - (b-a)/fi;
		x2 = a + (b-a)/fi;
	if(f(x1) >= f(x2)){
		a = x1;
	}else{
		b = x2;
	}
	}
	return (a+b)/2;
}

int
main(void)
{
	double a,b,eps;
	printf("Введите края отрезка\n");
	scanf("%lf %lf",&a,&b);
	printf("Введиет точность eps: \n");
	scanf("%lf",&eps);
	double min = gold(a,b,eps);
	printf("Минимум функции - %lf\nДостигается в точке %lf\n",f(min),min);
	return 0;
}