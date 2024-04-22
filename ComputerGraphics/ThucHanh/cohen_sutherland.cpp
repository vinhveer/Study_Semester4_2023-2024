#include <iostream>
#include <graphics.h>
using namespace std;

#define maxDinh 20

struct point
{
    int x, y;
    int code;
};

struct point pt[2];
int soDinh;
int xMin = 200;
int yMin = 200;
int xMax = 400;
int yMax = 400;

FILE *fp;

int MaHoa(struct point p)
{
    // Xét phần ở giữa
    if (p.x >= xMin && p.x <= xMax)
    {
        if (p.x >= yMin && p.y <= yMax)
        {
            return p.code = 0;
        }

        if (p.y < yMin)
        {
            return p.code = 8;
        }

        if (p.y > yMax)
        {
            return p.code = 4;
        }
    }

    // Xét phần bên trái
    if (p.x < xMin)
    {
        if (p.y >= yMin && p.y <= yMax)
        {
            return p.code = 1;
        }

        if (p.y < yMin)
        {
            return p.code = 9;
        }

        if (p.y > yMax)
        {
            return p.code = 5;
        }
    }

    // Xét phần bên phải
    if (p.x > xMax)
    {
        if (p.y >= yMin && p.y <= yMax)
        {
            return p.code = 2;
        }

        if (p.y < yMin)
        {
            return p.code = 10;
        }

        if (p.y > yMax)
        {
            return p.code = 6;
        }
    }
    return 0;
}

void ReadFile()
{
    fp = fopen("input.txt", "r");
    if (fp == NULL)
    {
        cout << "Khong mo duoc file" << endl;
        return;
    }

    fscanf(fp, "%d", &soDinh);
    for (int i = 0; i < soDinh; i++)
    {
        fscanf(fp, "%d %d", &pt[i].x, &pt[i].y);
    }
    fclose(fp);

    // Mã hóa các đỉnh
    for (int i = 0; i < soDinh; i++)
    {
        pt[i].code = MaHoa(pt[i]);
    }

    cout << "X\tY\tCode\n";
    // In ra thông tin các đỉnh
    for (int i = 0; i < soDinh; i++)
    {
        cout << pt[i].x << "\t" << pt[i].y << "\t" << pt[i].code << endl;
    }
}

int main()
{
    ReadFile();
    for (int i = 0; i < soDinh; i++)
    {
        MaHoa(pt[i]);
    }
    return 0;
}