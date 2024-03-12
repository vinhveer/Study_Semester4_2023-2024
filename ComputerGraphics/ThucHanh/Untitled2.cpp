#include <iostream>
#include <graphics.h>
using namespace std;
// Khai bao bien
void Bresenham1(int xa, int xb, int ya, int yb, int color)
{
	int dx=xb-xa;
	int dy=yb-ya;
	float m = (float) dy/dx;
	cout << "m = " << m << endl;
	// Tim Q_0
	int Q0 = -2*dy+dx;
	cout << "Q_0 = " << Q0 << endl;
	// Tim Qi, Qi+1, Khoi tao Qi = 0;
	int Q = Q0;
	int x = xa;
	int y = ya;
	cout << x << y;
	putpixel(x, y, color); // Ve diem dau tien
	// Ve cac diem tiep theo
	while (x < xb)
	{
		x++;
		// Xet diem ke tiep
		if (Q<=0) {
			// Cap nhat lai Q
			Q = Q+2*dx-2*dy;	
			y++;
			
			// Ve
			
		}
		else {
		// Q > 0
			// Cap nhat lai Q
			Q=Q-2*dy;
			y++;
		}
		
		
		// Ve	 
		putpixel(x, y, color);
		cout << x << ", " << y << endl;
		delay(250);
	}
}

int main()
{
	initwindow(400, 500);
	Bresenham1(2,3,12,8,4);
	getch();
	return 0;
}
