#include <iostream>
#include <graphics.h>
using namespace std;

#define maxDinh 20

struct point
{
    int x, y;
    int code;
};

struct point pt[maxDinh]; // Mảng chứa tất cả các điểm
int soDinh;
int xMin = 200;
int yMin = 200;
int xMax = 400;
int yMax = 400;

FILE *fp;

struct point res[2];

int MaHoa(struct point p)
{
    // Xét phần ở giữa
    if (p.x >= xMin && p.x <= xMax)
    {
        if (p.y >= yMin && p.y <= yMax)
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

void TimGiaoDiem(struct point p1, struct point p2)
{
    int x0 = p1.x;
    int y0 = p1.y;
    int x1 = p2.x;
    int y1 = p2.y;

    int code1 = p1.code;
    int code2 = p2.code;

    while (true)
    {
        if (!(code1 | code2)) // Trường hợp cả hai điểm đều trong cửa sổ cắt
        {
            res[0].x = x0;
            res[0].y = y0;
            res[1].x = x1;
            res[1].y = y1;
            return;
        }
        else if (code1 & code2)
        {
            return;
        }
        else
        {
            int code = code1 ? code1 : code2;
            int newX, newY;

            // Tìm điểm giao với cạnh của cửa sổ cắt
            if (code & 8) // Kiểm tra cạnh trên
            {
                newX = x0 + (x1 - x0) * (yMax - y0) / (y1 - y0);
                newY = yMax;
            }
            else if (code & 4) // Kiểm tra cạnh dưới
            {
                newX = x0 + (x1 - x0) * (yMin - y0) / (y1 - y0);
                newY = yMin;
            }
            else if (code & 2) // Kiểm tra cạnh phải
            {
                newY = y0 + (y1 - y0) * (xMax - x0) / (x1 - x0);
                newX = xMax;
            }
            else if (code & 1) // Kiểm tra cạnh trái
            {
                newY = y0 + (y1 - y0) * (xMin - x0) / (x1 - x0);
                newX = xMin;
            }

            // Cập nhật lại tọa độ cho điểm nằm ngoài cửa sổ cắt
            if (code == code1)
            {
                x0 = newX;
                y0 = newY;
                code1 = MaHoa({newX, newY});
            }
            else
            {
                x1 = newX;
                y1 = newY;
                code2 = MaHoa({newX, newY});
            }
        }
    }
}

void CohenSutherland()
{
    // Vẽ đường thẳng nối các điểm liên tiếp trong danh sách đỉnh
    setcolor(4); // Màu đỏ cho đường thẳng
    setlinestyle(1, 1, 2); // Nét liền
    for (int i = 0; i < soDinh - 1; i++)
    {
        TimGiaoDiem(pt[i], pt[i + 1]);
        line(res[0].x, res[0].y, res[1].x, res[1].y);
    }
}

void VeCuaSoCat()
{
    setcolor(4); // Màu trắng cho cửa sổ cắt
    setlinestyle(0, 0, 1); // Nét liền
    rectangle(xMin, yMin, xMax, yMax);

    // Vẽ đoạn thẳng ban đầu
    for (int i = 0; i < soDinh - 1; i++)
    {
        line(pt[i].x, pt[i].y, pt[i + 1].x, pt[i + 1].y);
    }
}

int main()
{
    ReadFile();
    initwindow(500, 500);
    CohenSutherland();
    VeCuaSoCat();
    getch();
    return 0;
}
