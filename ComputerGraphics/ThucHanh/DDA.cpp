#include <graphics.h>
#include <stdio.h>
#include <math.h>

int lt(float a)
{
    return (a + 0.5);
}

float m;

void dda1(int xa, int ya, int xb, int yb)
{
    int x;
    float y;
    int dy = yb - ya;
    int dx = xb - xa;
    m = (float)dy / dx;
    printf("m = %f", m);
    x = xa;
    y = ya;
    putpixel(x, y, 255);
    if (x < xb)
    {
        while (x < xb)
        {
            x++;
            y = y + m;
            putpixel(x, lt(y), 255);
            printf("(%d, %d)\n", x, lt(y));
            delay(10);
        }
    }
    else
    {
        while (x > xb)
        {
            x--;
            y = y - m;
            putpixel(x, lt(y), 255);
            printf("(%d, %d)\n", x, lt(y));
            delay(10);
        }
    }
}

void dda2(int xa, int ya, int xb, int yb)
{
    float x;
    int y;
    int dy = yb - ya;
    int dx = xb - xa;
    m = (float)dy / dx;
    printf("m = %f", m);
    x = xa;
    y = ya;
    putpixel(x, y, 255);
    if (y < yb)
    {
        while (y < yb)
        {
            y++;
            x = x + 1 / m;
            putpixel(lt(x), y, 255);
            printf("(%d, %d)\n", lt(x), y);
            delay(10);
        }
    }
    else
    {
        while (y >= yb)
        {
            y--;
            x = x - 1 / m;
            putpixel(lt(x), y, 255);
            printf("(%d, %d)\n", lt(x), y);
            delay(10);
        }
    }
}

int main()
{
    initwindow(800, 400);
    // setcolor(2);
    // line(100,100,400,400);

    dda1(20, 30, 120, 80);
    dda1(120, 80, 20, 30);
    dda1(20, 80, 120, 30);
    dda1(120, 30, 20, 80);

    dda2(30, 20, 80, 120);
    dda2(80, 120, 30, 20);
    dda2(80, 20, 30, 120);
    dda2(130, 70, 80, 170);
    dda2(30, 120, 80, 20);

    getch();
}
