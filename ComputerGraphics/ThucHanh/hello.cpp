#include <graphics.h>

int main()
{
    initwindow(800, 800);
    setcolor(2);
    setlinestyle(1, 0, 3);
    line(100, 100, 400, 400);
    getch();
}