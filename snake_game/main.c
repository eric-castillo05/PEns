#include <stdio.h>
#include <conio.h>
#include <dos.h>

/* Global variables to store snake body */
/* Screen is 80x25 in standard text mode */
int bodyX[255];
int bodyY[255];
int lenParams[1]; /* Requirement: save length in an array */
int dirX = 1;     /* Initially moving right */
int dirY = 0;
int isRunning = 1;

/* Function to set text mode using Assembly */
void setVideoMode() {
    asm {
        mov ax, 0x03  /* Text Mode 80x25 color */
        int 0x10      /* BIOS Video Interrupt */
    }
}

/* Function to draw a character at (x,y) directly to Video Memory */
/* Video Memory starts at segment B800h for text mode */
void drawChar(int x, int y, char c, unsigned char color) {
    asm {
        push es
        push di
        
        /* Setup ES to point to Video Memory */
        mov ax, 0xB800
        mov es, ax

        /* Calculate Offset: (y * 80 + x) * 2 */
        /* Each character takes 2 bytes (char + attribute) */
        mov ax, y
        mov bx, 80
        mul bx      /* ax = y * 80 */
        add ax, x   /* ax = y * 80 + x */
        shl ax, 1   /* ax = (y * 80 + x) * 2 */
        
        mov di, ax  /* DI holds the offset */

        /* Write character and color */
        mov al, c
        mov ah, color
        mov es:[di], ax

        pop di
        pop es
    }
}

/* Function to check keyboard buffer for Arrow Keys using Assembly */
void checkInput() {
    asm {
        /* Check if a key is available (AH=01h INT 16h) */
        mov ah, 0x01
        int 0x16
        jz no_key_pressed /* Jump if Zero Flag is set (no key) */

        /* Get the key (AH=00h INT 16h) */
        mov ah, 0x00
        int 0x16

        /* AL = ASCII, AH = Scan Code */
        /* Up: 0x48, Down: 0x50, Left: 0x4B, Right: 0x4D, Esc: 0x01 */
        
        cmp ah, 0x48 /* UP */
        je go_up
        cmp ah, 0x50 /* DOWN */
        je go_down
        cmp ah, 0x4B /* LEFT */
        je go_left
        cmp ah, 0x4D /* RIGHT */
        je go_right
        cmp ah, 0x01 /* ESC */
        je exit_game
        jmp no_key_pressed

    go_up:
        /* Prevent reversing directly */
        cmp dirY, 1
        je no_key_pressed
        mov dirX, 0
        mov dirY, -1
        jmp no_key_pressed

    go_down:
        cmp dirY, -1
        je no_key_pressed
        mov dirX, 0
        mov dirY, 1
        jmp no_key_pressed

    go_left:
        cmp dirX, 1
        je no_key_pressed
        mov dirX, -1
        mov dirY, 0
        jmp no_key_pressed

    go_right:
        cmp dirX, -1
        je no_key_pressed
        mov dirX, 1
        mov dirY, 0
        jmp no_key_pressed

    exit_game:
        mov isRunning, 0

    no_key_pressed:
    }
}

void main() {
    int i;
    int headIndex = 0;
    int tailIndex;
    int nextX, nextY;
    
    clrscr();
    printf("Insert the length of the line: ");
    scanf("%d", &lenParams[0]);

    /* Validation to prevent crash */
    if (lenParams[0] > 50) lenParams[0] = 50;
    if (lenParams[0] < 2) lenParams[0] = 2;

    setVideoMode();

    /* Hide cursor (optional, prevents flickering) */
    asm {
        mov ah, 0x01
        mov ch, 0x20
        int 0x10
    }

    /* Initialize the line in the middle of the screen */
    /* Center is roughly x=40, y=12 */
    for (i = 0; i < lenParams[0]; i++) {
        bodyX[i] = 40 - (lenParams[0] / 2) + i;
        bodyY[i] = 12;
        /* Draw initial body */
        drawChar(bodyX[i], bodyY[i], '*', 0x0F); // 0x0F = White text
    }

    /* Game Loop */
    while (isRunning) {
        checkInput();

        /* Logic: Move Snake */
        /* Calculate new Head position */
        nextX = bodyX[lenParams[0] - 1] + dirX;
        nextY = bodyY[lenParams[0] - 1] + dirY;

        /* Screen wrapping (optional) or collision */
        if (nextX < 0) nextX = 79;
        if (nextX > 79) nextX = 0;
        if (nextY < 0) nextY = 24;
        if (nextY > 24) nextY = 0;

        /* Erase the tail (the 0th element in our sliding logic) */
        drawChar(bodyX[0], bodyY[0], ' ', 0x07); // Write space to erase

        /* Shift Array: Move all coordinates down by 1 */
        for (i = 0; i < lenParams[0] - 1; i++) {
            bodyX[i] = bodyX[i + 1];
            bodyY[i] = bodyY[i + 1];
        }

        /* Set new Head */
        bodyX[lenParams[0] - 1] = nextX;
        bodyY[lenParams[0] - 1] = nextY;

        /* Draw new Head */
        drawChar(nextX, nextY, '*', 0x0F);

        delay(100); /* Speed of the snake */
    }

    /* Restore text mode to clear garbage before exiting */
    setVideoMode();
    printf("Game Over");
}
