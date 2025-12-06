# include <stdio.h>

void video(char n){
  asm {
    MOV AH, 0;
    MOV AL, n;
    INT 10H;
  }
}

void pixel(int x, int y, char color){
  asm {
    MOV AH, 12;
    MOV DX, y;
    MOV CX, x;
    MOV AL, color;
    INT 10H;
  }
}

int main(){
  int i, j;

  video(6);

  pixel(1, 1, 1);
  pixel(639, 1, 1);
  pixel(1, 199, 1);
  pixel(639, 199, 1);
  pixel(320, 100, 1);

  for(i = 0; i < 639; i++){
    pixel(i, 1, 1);
    pixel(i, 100, 1);
    pixel(i, 199, 1);
  }

  for(j = 0; j < 199; j++){
    pixel(1, j, 1);
    pixel(320, j, 1);
    pixel(639, j, 1);
  }

  getch();
  return 0;
}