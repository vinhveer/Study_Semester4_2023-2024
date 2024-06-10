#include <graphics.h>
#include <stdio.h>
#include <math.h>
#define GEO "chopnhon.geo"
#define ADJ "chopchon.adj"
#define MAXDINH 20
FILE *fp;
int sodinh;

int res[3][MAXDINH];
int mtk[MAXDINH][MAXDINH];

void inmatran(int m[MAXDINH][MAXDINH], int size)
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
void readgeo()
{
    fp = fopen(GEO, "r");
    if (fp == NULL)
    {
        printf("Khong mo duoc file %s", GEO);
        return;
    }
    // doc so dinh cua hinh chop
    fscanf(fp, "%d", &sodinh);
    printf("So dinh:%d", sodinh);
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            fscanf(fp, "%d", &res[j][i]);
        }
    }
    printf("\nToa do cac dinh:\n");
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            printf("%d ", res[j][i]);
        }
        printf("\n");
    }
    fclose(fp);
}
void readadj()
{
    fp = fopen(ADJ, "r");
    if (fp == NULL)
    {
        printf("Khong mo duoc file");
        return;
    }
    // doc so dinh cua hinh chop
    fscanf(fp, "%d", &sodinh);
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < sodinh; j++)
        {
            fscanf(fp, "%d", &mtk[i][j]);
        }
    }
    printf("\nMa tran ke:\n");
    inmatran(mtk, sodinh);
    fclose(fp);
}

void solve(float L, float alpha)
{
    alpha = float(alpha * 3.141592654) / 180;
    printf("goc alpha la:%f", alpha);
    for (int i = 0; i < sodinh; i++)
    {
        res[0][i] = roundf(res[0][i] + res[2][i] * L * cos(alpha));
        res[1][i] = roundf(res[1][i] + res[2][i] * L * sin(alpha));
        res[2][i] = 0.0;
    }
    printf("\nToa do cac dinh sau khi chieu xien:\n");
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < 3; j++)
            printf("%d ", res[j][i]);
        printf("\n");
    }
}
void Draw()
{
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < sodinh; j++)
        {
            if (mtk[i][j] == 1)
                line(res[0][i], res[1][i], res[0][j], res[1][j]);
        }
    }
}
int main()
{
    initwindow(800, 800);
    readgeo();
    readadj();
    solve(0.5, 30);
    Draw();
    getch();
    // readadj();
}