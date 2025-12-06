#include <stdio.h> 
#include <conio.h> 
int main() { 
	float c1, c2, c3, c4; 
	float promedio; 
	clrscr(); 
	printf("Ingresa la calificacion 1: "); 
	scanf("%f", &c1); 
	printf("Ingresa la calificacion 2: "); 
	scanf("%f", &c2); 
	printf("Ingresa la calificacion 3: "); 
	scanf("%f", &c3); 
	printf("Ingresa la calificacion 4: "); 
	scanf("%f", &c4); 
	promedio = (c1 + c2 + c3 + c4) / 4.0; 
	clrscr(); 
	printf("El promedio es: %.2f\n", promedio); 
	if (promedio >= 70) { 

		printf("Resultado: APROBADO\n"); 
	} else { 
		printf("Resultado: REPROBADO\n");
	} 
	getch();
       return 0;	
} 

