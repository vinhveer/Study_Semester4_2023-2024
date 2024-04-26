#include <graphics.h>

void drawLineBresenham(int x1, int y1, int x2, int y2)
{
    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);
    int x, y;

    if (dx >= dy)
    {
        int p = 2 * dy - dx;
        int twoDy = 2 * dy;
        int twoDyMinusDx = 2 * (dy - dx);

        if (x1 > x2)
        {
            x = x2;
            y = y2;
            x2 = x1;
        }
        else
        {
            x = x1;
            y = y1;
        }

        putpixel(x, y, WHITE);

        while (x < x2)
        {
            x++;

            if (p < 0)
            {
                p += twoDy;
            }
            else
            {
                if ((y2 > y1 && y < y2) || (y2 < y1 && y > y2))
                {
                    y++;
                }
                else
                {
                    y--;
                }

                p += twoDyMinusDx;
            }

            putpixel(x, y, WHITE);
        }
    }
    else
    {
        int p = 2 * dx - dy;
        int twoDx = 2 * dx;
        int twoDxMinusDy = 2 * (dx - dy);

        if (y1 > y2)
        {
            x = x2;
            y = y2;
            y2 = y1;
        }
        else
        {
            x = x1;
            y = y1;
        }

        putpixel(x, y, WHITE);

        while (y < y2)
        {
            y++;

            if (p < 0)
            {
                p += twoDx;
            }
            else
            {
                if ((x2 > x1 && x < x2) || (x2 < x1 && x > x2))
                {
                    x++;
                }
                else
                {
                    x--;
                }

                p += twoDxMinusDy;
            }

            putpixel(x, y, WHITE);
        }
    }
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
