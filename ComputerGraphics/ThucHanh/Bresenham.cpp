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
            putpixel(x, y, WHITE);
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
            putpixel(x, y, WHITE);
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

    // Vẽ đường thẳng từ điểm (100, 100) đến (400, 100)
    // Xét theo x, tăng giá trị x
    drawLine(100, 100, 400, 200);

    // Vẽ đường thẳng từ điểm (100, 100) đến (100, 300)
    // Xét theo y, tăng giá trị y
    drawLine(100, 100, 100, 300);

    // Vẽ đường thẳng từ điểm (100, 100) đến (400, 300)
    // Xét theo x, tăng giá trị x và y
    drawLine(100, 100, 400, 300);

    // Vẽ đường thẳng từ điểm (100, 100) đến (300, 400)
    // Xét theo y, tăng giá trị y và x
    drawLine(100, 100, 300, 400);

    // Vẽ đường thẳng từ điểm (100, 100) đến (100, 500)
    // Xét theo y, tăng giá trị y và giảm giá trị x
    drawLine(100, 100, 100, 500);

    // Vẽ đường thẳng từ điểm (100, 100) đến (300, 600)
    // Xét theo x, tăng giá trị x và y
    drawLine(100, 100, 300, 600);

    // Vẽ đường thẳng từ điểm (100, 100) đến (400, 500)
    // Xét theo x, tăng giá trị x và giảm giá trị y
    drawLine(100, 100, 400, 500);

    // Vẽ đường thẳng từ điểm (100, 100) đến (500, 300)
    // Xét theo y, tăng giá trị y và giảm giá trị x
    drawLine(100, 100, 500, 300);

    getch();
    return 0;
}