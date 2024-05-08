#include <stdio.h>
#include <graphics.h>

#define INPUT "input.txt"
#define maxdinh 20

// Khai bao prototype
void LiangBaskey(struct point A, struct point B);
void ReadFile();

// Khai bao bien
int soDinh;

struct point
{
    int x, y;
};
struct point pt[maxdinh];

int xmin = 200, xmax = 400;
int ymin = 200, ymax = 400;

// Chuong trinh con
void ReadFile()
{
    FILE *fp;

    fp = fopen(INPUT, "r");

    if (fp == NULL)
    {
        printf("Khong mo duoc file\n");
        return;
    }

    fscanf(fp, "%d", &soDinh);
    printf("%d\n", soDinh);

    for (int i = 0; i < soDinh; i++)
    {
        fscanf(fp, "%d %d", &pt[i].x, &pt[i].y);
        printf("(%d, %d)\n", pt[i].x, pt[i].y);
    }

    pt[soDinh].x = pt[0].x;
    pt[soDinh].y = pt[0].y;
    soDinh++;

    // Tính dx, dy, p, q

    fclose(fp);
}

void InMang(int m[], int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%d ", m[i]);
    }
}

float max(float a, float b)
{
    return a > b ? a : b;
}

float min(float a, float b)
{
    return a < b ? a : b;
}

void LiangBaskey(struct point A, struct point B)
{
    int dy = B.y - A.y;
    int dx = B.x - A.x;
    int p[4] = {-dx, dx, -dy, dy};
    int q[4] = {A.x - xmin, xmax - A.x, A.y - ymin, ymax - A.y};

    // In ra man hinh gia tri cua p va q
    printf("p[]: ");
    InMang(p, 4);
    printf("\nq[]: ");
    InMang(q, 4);

    // Tim t trong truong hop pk < 0
    float t1 = 0; // t1 = max(0, qk / pk), k = 0 - 4
    float t2 = 1; // t2 = min(1, qk / pk), k = 0 - 4

    for (int i = 0; i < 4; i++)
    {
        if (p[i] < 0)
        {
            t1 = max(t1, (float)q[i] / p[i]);
        }
        else
        {
            t2 = min(t2, (float)q[i] / p[i]);
        }
    }

    // In ra t1, t2
    printf("\nt1 = %.3f, t2 = %.3f\n", t1, t2);

    struct point res[2];
    res[0].x = A.x + t1 * dx;
    res[0].y = A.y + t1 * dy;
    res[1].x = A.x + t2 * dx;
    res[1].y = A.y + t2 * dy;

    // Loai cac diem nam ngoai gioi han cua so cat
    for (int i = 0; i < 1; i++)
    {

        // In ra toa do cac giao diem
        printf("Giao diem %d: (%d, %d)\n", i + 1, res[i].x, res[i].y);
        // Ve duong thang noi hai giao diem neu ca hai deu nam trong cua so cat
        if (res[i].x >= xmin && res[i].x <= xmax && res[i].y >= ymin && res[i].y <= ymax)
        {
            setlinestyle(0, 0, 1);
            setcolor(2);
            line(res[i].x, res[i].y, res[i + 1].x, res[i + 1].y);
        }
        else
        {
            printf("Giao diem %d nam ngoai cua so cat\n", i + 1);
        }
    }
}

int main(int argc, char const *argv[])
{
    ReadFile();

    initwindow(600, 600);

    // Ve cua so cat
    setlinestyle(0, 0, 3);
    setcolor(15);
    rectangle(xmin, ymin, xmax, ymax);

    // Ve duong thang
    setlinestyle(1, 0, 1);
    setcolor(4);

    for (int i = 0; i < soDinh - 1; i++)
    {
        line(pt[i].x, pt[i].y, pt[i + 1].x, pt[i + 1].y);
    }

    for (int i = 0; i < soDinh - 1; i++)
    {
        LiangBaskey(pt[i], pt[i + 1]);
    }

    getch();
    return 0;
}
