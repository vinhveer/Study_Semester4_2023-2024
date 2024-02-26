#include <graphics.h>
#include <cmath>

void drawLineDDA(int X1, int Y1, int X2, int Y2)
{
    int dx = X2 - X1;
    int dy = Y2 - Y1;

    int steps = abs(dx) > abs(dy) ? abs(dx) : abs(dy);

    float Xincrement = dx / (float)steps;
    float Yincrement = dy / (float)steps;

    float X = X1;
    float Y = Y1;

    for (int i = 0; i <= steps; i++)
    {
        putpixel(round(X), round(Y), WHITE);
        X += Xincrement;
        Y += Yincrement;
    }
}

int main()
{
    int gd = DETECT, gm;
    initwindow(500, 500);

    int X1 = 100, Y1 = 100, X2 = 300, Y2 = 200;
    drawLineDDA(X1, Y1, X2, Y2);

    getch();
    closegraph();
    return 0;
}
