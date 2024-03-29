#include <iostream>
#include <graphics.h>
using namespace std;

void drawLine(int x1, int y1, int x2, int y2) {
    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);
    int x = x1;
    int y = y1;
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;
    
    if (dx > dy) {
        int p = 2 * dy - dx;
        while (x != x2) {
            putpixel(x, y, RED);
            cout << x << " " << y << endl;
            delay(100);
            if (p >= 0) {
                y += sy;
                p -= 2 * dx;
            }
            x += sx;
            p += 2 * dy;
        }
    } else {
        int p = 2 * dx - dy;
        while (y != y2) {
            putpixel(x, y, RED);
            cout << x << " " << y << endl;
            delay(100);
            if (p >= 0) {
                x += sx;
                p -= 2 * dy;
            }
            y += sy;
            p += 2 * dx;
        }
    }
}

int main() {
    initwindow(800, 400);

    // drawLine(20, 30, 120, 80);
    // drawLine(120, 80, 20, 30);
    // drawLine(20, 80, 120, 30);
    // drawLine(120, 30, 20, 80);

    drawLine(30, 20, 80, 120);
    drawLine(80, 120, 30, 20);
    drawLine(80, 20, 30, 120);
    drawLine(130, 70, 80, 170);
    drawLine(30, 120, 80, 20);

    getch();
    return 0;
}
