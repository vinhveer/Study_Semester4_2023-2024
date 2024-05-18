#include <stdio.h>
#include <math.h>
#include <graphics.h>

#define GEO "chopnhon.geo"
#define ADJ "chopnhon.adj"
#define MAX_DINH 20

// Khai bao prototype
void readgeo();
void intoado(struct point p[MAX_DINH], int size);
void readadj();
void inmatran(int m[MAX_DINH][MAX_DINH], int size);
void phepchieu(float L, float theta);

// Khai bao bien
FILE *fp;
int sodinh;

struct point
{
    int x, y, z;
};

struct point pt[MAX_DINH];
int mtk[MAX_DINH][MAX_DINH];

// Chuong trinh con
void readgeo()
{
    fp = fopen(GEO, "r");

    if (fp == NULL)
    {
        printf("Khong mo duoc file %s\n", GEO);
        return;
    }

    // Doc so dinh cua hinh chop
    fscanf(fp, "%d", &sodinh);
    printf("So dinh cua hinh chop: %d\n", sodinh);

    for (int i = 0; i < sodinh; i++)
    {
        fscanf(fp, "%d %d %d", &pt[i].x, &pt[i].y, &pt[i].z);
        printf("%d %d %d\n", pt[i].x, pt[i].y, pt[i].z);
    }

    fclose(fp);
}

void intoado(struct point p[MAX_DINH], int size)
{
    for (int i = 0; i < size; i++)
    {
            printf("%d %d %d\n", p[i].x, p[i].y, p[i].z);
    }
}

void readadj()
{
    fp = fopen(ADJ, "r");

    if (fp == NULL)
    {
        printf("Khong mo duoc file %s\n", GEO);
        return;
    }

    // Doc so dinh cua hinh chop
    fscanf(fp, "%d", &sodinh);
    // Doc ma tran ke
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < sodinh; j++)
        {
            fscanf(fp, "%d", &mtk[i][j]);
        }
    }

    printf("Ma tran ke: \n");
    inmatran(mtk, sodinh);

    fclose(fp);
}

void inmatran(int m[MAX_DINH][MAX_DINH], int size)
{
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            printf("%d ", m[i][j]);
        }
        printf("\n");
    }
}

void phepchieu(float L, float theta)
{
    float theta_rad = 3.141592 * theta / 180;

    struct point res[MAX_DINH];

    for (int i = 0; i < sodinh; i++)
    {
        res[i].x = pt[i].x + L * pt[i].z * cos(theta_rad);
        res[i].y = pt[i].y + L * pt[i].z * sin(theta_rad);
        res[i].z = 0;
    }

    printf("Toa do cac dinh sau khi chieu: \n");
    intoado(res, sodinh);

    // Ve hinh chieu
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < sodinh; j++)
        {
            if (mtk[i][j] != 0)
            {
                line(res[i].x, res[i].y, res[j].x, res[j].y);
            }
        }

        // if (i == sodinh - 1)
        // {
        //     line(pt[i].x, pt[i].y, pt[0].x, pt[0].y);
        //     line(res[i].x, res[i].y, res[0].x, res[0].y);
        // }
        // else
        // {
        //     line(pt[i].x, pt[i].y, pt[i + 1].x, pt[i + 1].y);
        //     line(res[i].x, res[i].y, res[i + 1].x, res[i + 1].y);
        // }
    }
    delay(100);
    cleardevice();
}

// Chuong trinh chinh
int main()
{
    initwindow(1000, 1000);
    readgeo();
    readadj();
    for (int i = 0; i < 3600; i++)
    {
        phepchieu(0.5, i);
    }
    getch();
}