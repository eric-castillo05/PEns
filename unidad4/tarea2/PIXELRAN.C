#include <stdio.h>
#include <stdlib.h>
struct punto{
 int x;
 int y;
};

void video(char n){
asm mov AH, 0
asm mov AL, n
asm int 10h
}
void pixel(int x, int y, char color){
 asm mov AH,12
 asm mov DX, y
 asm mov CX, x
 asm mov AL, color
 asm int 10h
}

int main(){
 int i;
 struct punto puntos[3000];
 video(6);
 randomize();

 for(i=0; i<=2999; i++){
  puntos[i].x = rand()% 639;
  puntos[i].y = rand()% 199;

  pixel(puntos[i].x, puntos[i].y, 1);
  }

   for(i=0; i<=2999; i++){
   delay(5);
  pixel(puntos[i].x, puntos[i].y, 0);
  }
  getch();
  return 0;
 }
