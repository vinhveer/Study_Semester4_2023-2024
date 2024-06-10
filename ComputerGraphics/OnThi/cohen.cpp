#include <stdio.h>
#include <graphics.h>
#include <math.h>
#include <limits.h>
#define maxdinh 20
FILE *fp;
float m[maxdinh];
void cohen();
#define INPUT "input1.txt"
struct point
{
    int x;
    int y;
    int code;
};
struct point pt[maxdinh];
int sodinh;
int xmin = 50;
int ymin = 50;
int xmax = 100;
int ymax = 80;

int mahoa(int x, int y)
{

    if (x >= xmin && x <= xmax)
    {
        // diem nam giua
        if (y >= ymin && y <= ymax)
            return 0;
        if (y < ymin)
            return 8;
        if (y > ymax)
            return 4;
    }
    if (x < xmin)
    {
        // diem nam ben trai
        if (y >= ymin && y <= ymax)
        {
            return 1;
        }
        if (y < ymin)
        {
            return 9;
        }
        if (y > ymax)
        {
            return 5;
        }
    }
    // diem nam ben phai
    if (x > xmax)
    {
        if (y >= ymin && y <= ymax)
        {
            return 2;
        }
        if (y < ymin)
            return 10;
        if (y > ymax)
            return 6;
    }
}

void readfile()
{
    fp = fopen(INPUT, "r");
    if (fp == NULL)
    {
        printf("Khong mo duoc file\n");
        return;
    }

    fscanf(fp, "%d", &sodinh);
    printf("So dinh: %d\n", sodinh);
    for (int i = 0; i < sodinh; i++)
        fscanf(fp, "%d %d", &pt[i].x, &pt[i].y);
    for (int i = 0; i < sodinh; i++)
        printf("%d %d\n", pt[i].x, pt[i].y);
    // tim he so goc
    for (int i = 0; i < sodinh; i++)
        pt[i].code = mahoa(pt[i].x, pt[i].y);

    printf("X\tY\tCode\n");
    for (int i = 0; i < sodinh; i++)
        printf("%d\t%d\t%d\t\n", pt[i].x, pt[i].y, pt[i].code);

    fclose(fp);
}
float heSoGoc(struct point p1, struct point p2)
{
    if (p1.x == p2.x)
        return INT_MAX;
    if (p1.y == p2.y)
        return 0.0;
    return (float)(p2.y - p1.y) / (p2.x - p1.x);
}
void swap(struct point *p1, struct point *p2)
{
    struct point temp = *p1;
    *p1 = *p2;
    *p2 = temp;
}
void TimgiaoDiem(struct point p1, struct point p2)
{
    struct point res[2];
    // khong co giao diem
    if ((p1.code & p2.code) != 0)
    {
        // khong co giao diem
        printf("\nKhong co giao diem voi cua so cat\n");
        return;
    }
    // co it nhat 1 giao diem
    int dem = 0; // luu giu so sao diem cua doan thang voi csc
    if (p1.code == 0)
    {
        res[dem].x = p1.x;
        res[dem++].y = p1.y;
    }
    if (p1.code == 8)
    {
        res[dem].y = ymin;
        res[dem++].x = p1.x + (ymin - p1.y) / heSoGoc(p1, p2);
    }
    if (p1.code == 1)
    {
        res[dem].x = xmin;
        res[dem++].y = p1.y + (p1.x - xmin) * heSoGoc(p1, p2);
    }
    if (p1.code == 2)
    {
        res[dem].x = xmax;
        res[dem++].y = p1.y + (xmax - p1.x) * heSoGoc(p1, p2);
    }
    if (p1.code == 4)
    {
        res[dem].y = ymax;
        res[dem++].x = p1.x + (ymax - p1.y) / heSoGoc(p1, p2);
    }
    if (p1.code == 9)
    {
        res[dem].y = ymin;
        res[dem].x = p1.x + (ymin - p1.y) / heSoGoc(p1, p2);
        if (res[dem].x < xmin)
        {
            res[dem].x = xmin;
            res[dem].y = p1.y + (xmin - p1.x) * heSoGoc(p1, p2);
        }
        dem++;
    }
    if (p1.code == 5)
    {
        res[dem].y = ymax;
        res[dem].x = p1.x + (ymax - p1.y) / heSoGoc(p1, p2);
        if (res[dem].x < xmin)
        {
            res[dem].x = xmin;
            res[dem].y = p1.y + (xmin - p1.x) * heSoGoc(p1, p2);
        }
        dem++;
    }
    if (p1.code == 10)
    {
        res[dem].y = ymin;
        res[dem].x = p1.x + (p1.y - ymin) / heSoGoc(p1, p2);
        if (res[dem].x > xmax)
        {
            res[dem].x = xmax;
            res[dem].y = p1.y + (xmax - p1.x) * heSoGoc(p1, p2);
        }
        dem++;
    }
    if (p1.code == 6)
    {
        res[dem].y = ymax;
        res[dem].x = p1.x + (ymax - p1.y) / heSoGoc(p1, p2);
        if (res[dem].x > xmax)
        {
            res[dem].x = xmax;
            res[dem].y = p1.y + (xmax - p1.x) * heSoGoc(p1, p2);
        }
        dem++;
    }
    if (p2.code == 0)
    {
        res[dem].x = p2.x;
        res[dem++].y = p2.y;
    }
    if (p2.code == 8)
    {
        res[dem].y = ymin;
        res[dem++].x = p2.x + (ymin - p2.y) / heSoGoc(p1, p2);
    }
    if (p2.code == 1)
    {
        res[dem].x = xmin;
        res[dem++].y = p2.y + (xmin - p2.x) * heSoGoc(p1, p2);
    }
    if (p2.code == 2)
    {
        res[dem].x = xmax;
        res[dem++].y = p2.y + (xmax - p2.x) * heSoGoc(p1, p2);
    }
    if (p2.code == 4)
    {
        res[dem].y = ymax;
        res[dem++].x = p2.x + (ymax - p2.y) / heSoGoc(p1, p2);
    }
    if (p2.code == 9)
    {
        res[dem].y = ymin;
        res[dem].x = p2.x + (ymin - p2.y) / heSoGoc(p1, p2);
        if (res[dem].x < xmin)
        {
            res[dem].x = xmin;
            res[dem].y = p2.y + (xmin - p2.x) * heSoGoc(p1, p2);
        }
        dem++;
    }
    if (p2.code == 5)
    {
        res[dem].y = ymax;
        res[dem].x = p2.x + (ymax - p2.y) / heSoGoc(p1, p2);
        if (res[dem].x < xmin)
        {
            res[dem].x = xmin;
            res[dem].y = p2.y + (xmin - p2.x) * heSoGoc(p1, p2);
        }
        dem++;
    }
    if (p2.code == 10)
    {
        res[dem].y = ymin;
        res[dem].x = p2.x + (ymin - p2.y) / heSoGoc(p1, p2);
        if (res[dem].x > xmax)
        {
            res[dem].x = xmax;
            res[dem].y = p2.y + (xmax - p2.x) * heSoGoc(p1, p2);
        }
        dem++;
    }
    if (p2.code == 6)
    {
        res[dem].y = ymax;
        res[dem].x = p2.x + (ymax - p2.y) / heSoGoc(p1, p2);
        if (res[dem].x > xmax)
        {
            res[dem].x = xmax;
            res[dem].y = p2.y + (xmax - p2.x) * heSoGoc(p1, p2);
        }
        dem++;
    }

    for (int i = 0; i < dem; i++)
    {
        if (res[i].x < xmin || res[i].x > xmax || res[i].y < ymin || res[i].y > ymax)
        {
            return;
        }
    }
    printf("Giao diem tim duoc:\n");
    printf("%d\n", dem);
    for (int i = 0; i < dem; i++)
    {
        printf("(%d,%d)\n", res[i].x, res[i].y);
    }
    setlinestyle(1, 1, 2);
    setcolor(GREEN);
    line(res[0].x, res[0].y, res[1].x, res[1].y);
}
void vecuasocat()
{
    setlinestyle(1, 1, 2);
    setcolor(15);
    rectangle(xmin, ymin, xmax, ymax);
    setlinestyle(1, 0, 1);
    // ve doan thang ban dau
    for (int i = 0; i < sodinh - 1; i++)
    {
        line(pt[i].x, pt[i].y, pt[i + 1].x, pt[i + 1].y);
    }
    line(pt[sodinh - 1].x, pt[sodinh - 1].y, pt[0].x, pt[0].y);
}
void cohen()
{
    for (int i = 0; i < sodinh; i++)
    {
        TimgiaoDiem(pt[i], pt[(i + 1) % sodinh]);
    }
}
int main()
{
    readfile();
    initwindow(500, 500);
    vecuasocat();
    // cohen();
    // getch();
    cohen();
    getch();
    return 0;
}