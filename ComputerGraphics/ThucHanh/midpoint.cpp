#include <graphics.h>

void drawLineMidpoint(int x1, int y1, int x2, int y2)
{
    int dx = x2 - x1;
    int dy = y2 - y1;

    int x = x1;
    int y = y1;

    int d = 2 * dy - dx;
    putpixel(x, y, WHITE);

    while (x < x2)
    {
        x++;

        if (d < 0)
            d += 2 * dy;
        else
        {
            d += 2 * (dy - dx);
            y++;
        }

        putpixel(x, y, WHITE);
    }
}

int main()
{
    int gd = DETECT, gm;
    initwindow(700, 700);

    int x1, y1, x2, y2;

    x1 = 6;
    y1 = 2;
    x2 = 300;
    y2 = 200;

    drawLineMidpoint(x1, y1, x2, y2);

    getch();
    closegraph();

    return 0;
}
