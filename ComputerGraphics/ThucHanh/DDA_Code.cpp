#include <bits/stdc++.h>
#include <graphics.h>
using namespace std;

double m;
int x;
double y;

void dda1(int xa, int ya, int xb, int yb)
{
    int dy = yb - ya;
    int dx = xb - xa;
    m = (double)dy / dx;
    cout << "m : " << m << endl;
    x = xa;
    y = ya;
    putpixel(x, round(y), 255);
    while (x < xb)
    {
        x = x + 1;
        y = y + m;
        putpixel(x, round(y), 255);
        delay(10);
        cout << "(" << x << "," << round(y) << ")" << endl;
    }
}

int main()
{
    initwindow(800, 800);
    dda1(20, 30, 120, 80);
    getch();
}