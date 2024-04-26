#include <graphics.h>

void drawLineBresenham(int x1, int y1, int x2, int y2)
{
    putpixel(x1, y1, WHITE);

    if (x1 == x2 && y1 == y2)
        return;

    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);

    if (dx >= dy)
        if (x1 < x2)
            drawLineBresenham(x1 + 1, y1 + (y2 > y1 ? 1 : -1), x2, y2);
        else
            drawLineBresenham(x1 - 1, y1 + (y2 > y1 ? 1 : -1), x2, y2);

    else
        if (y1 < y2)
            drawLineBresenham(x1 + (x2 > x1 ? 1 : -1), y1 + 1, x2, y2);
        else
            drawLineBresenham(x1 + (x2 > x1 ? 1 : -1), y1 - 1, x2, y2);
}

int main()
{
    int gd = DETECT, gm;
    initwindow(700, 700);

    int x1 = 100, y1 = 100, x2 = 300, y2 = 300;

    drawLineBresenham(x1, y1, x2, y2);

    delay(5000);
    closegraph();

    return 0;
}
