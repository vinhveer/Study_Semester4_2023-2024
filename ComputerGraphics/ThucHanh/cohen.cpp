#include <graphics.h>
#include <conio.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <dos.h>

#define LEFT 1
#define RIGHT 2
#define BOTTOM 4
#define TOP 8

int xmin, ymin, xmax, ymax;

int computeOutCode(int x, int y) {
    int code = 0;
    if (x < xmin)
        code |= LEFT;
    else if (x > xmax)
        code |= RIGHT;
    if (y < ymin)
        code |= BOTTOM;
    else if (y > ymax)
        code |= TOP;
    return code;
}

void cohenSutherlandClip(int x1, int y1, int x2, int y2) {
    int outcode1 = computeOutCode(x1, y1);
    int outcode2 = computeOutCode(x2, y2);
    int accept = 0;

    while (1) {
        if (!(outcode1 | outcode2)) {
            accept = 1;
            break;
        } else if (outcode1 & outcode2) {
            break;
        } else {
            int outcodeOut = outcode1 ? outcode1 : outcode2;
            int x, y;

            if (outcodeOut & TOP) {
                x = x1 + (x2 - x1) * (ymax - y1) / (y2 - y1);
                y = ymax;
            } else if (outcodeOut & BOTTOM) {
                x = x1 + (x2 - x1) * (ymin - y1) / (y2 - y1);
                y = ymin;
            } else if (outcodeOut & RIGHT) {
                y = y1 + (y2 - y1) * (xmax - x1) / (x2 - x1);
                x = xmax;
            } else if (outcodeOut & LEFT) {
                y = y1 + (y2 - y1) * (xmin - x1) / (x2 - x1);
                x = xmin;
            }

            if (outcodeOut == outcode1) {
                x1 = x;
                y1 = y;
                outcode1 = computeOutCode(x1, y1);
            } else {
                x2 = x;
                y2 = y;
                outcode2 = computeOutCode(x2, y2);
            }
        }
    }

    if (accept) {
        line(x1, y1, x2, y2);
    }
}

void clipPolygon(int poly[], int n) {
    for (int i = 0; i < n - 2; i += 2) {
        cohenSutherlandClip(poly[i], poly[i + 1], poly[i + 2], poly[i + 3]);
    }
    cohenSutherlandClip(poly[n - 2], poly[n - 1], poly[0], poly[1]);
}

void drawPolygon(int poly[], int n) {
    for (int i = 0; i < n - 2; i += 2) {
        line(poly[i], poly[i + 1], poly[i + 2], poly[i + 3]);
    }
    line(poly[n - 2], poly[n - 1], poly[0], poly[1]);
}

void clearScreen() {
    cleardevice();
}

void runTestCase(int testCase) {
    clearScreen();
    setcolor(RED);
    rectangle(xmin, ymin, xmax, ymax);
    setcolor(WHITE);

    int polygon1[] = {50, 150, 200, 250, 300, 200, 250, 100, 50, 150};
    int n1 = sizeof(polygon1) / sizeof(polygon1[0]);

    int polygon2[] = {400, 400, 450, 450, 500, 400, 450, 350, 400, 400};
    int n2 = sizeof(polygon2) / sizeof(polygon2[0]);

    int *polygon;
    int n;

    switch (testCase) {
    case 1:
        polygon = polygon1;
        n = n1;
        break;
    case 2:
        polygon = polygon2;
        n = n2;
        break;
    default:
        return;
    }

    drawPolygon(polygon, n);
    delay(2000); // Delay to show original polygon

    clearScreen();
    setcolor(RED);
    rectangle(xmin, ymin, xmax, ymax);
    setcolor(GREEN);

    clipPolygon(polygon, n);
}

int main() {
    initwindow(800, 600, "Cohen Sutherland Line Clipping Algorithm");

    xmin = 100;
    ymin = 100;
    xmax = 300;
    ymax = 300;

    int testCase = 1;
    while (1) {
        runTestCase(testCase);
        testCase = (testCase % 2) + 1; // Toggle between test case 1 and 2
        delay(100); // 10 seconds delay
    }

    getch();
    return 0;
}
