#include <stdio.h>
#include <math.h>
#include <graphics.h>
FILE *fp;
int sodinh;
#define dinh 8
#define INPUT "input_PhoiCanh.txt"
// Phep chieu cabinet. cho hinh hop chu nhat co dinh = 8

// khai bao bien
int xp, yp, zp; // tam chieu

int a[3][dinh]; // ma tran hinh hop chu nhat
int res[3][dinh];

int m = 8; // so dinh
int p = 8;

// int D[10][10]; //ma tran ke noi cac dinh
int D[8][8] =
    {
        // A,B,C,D,E,F,G,H
        {1, 1, 0, 1, 1, 0, 0, 0}, // A
        {1, 1, 1, 0, 0, 1, 0, 0}, // B
        {0, 1, 1, 1, 0, 0, 1, 0}, // C
        {1, 0, 1, 1, 0, 0, 0, 1}, // D
        {1, 0, 0, 0, 1, 1, 0, 1}, // E
        {0, 1, 0, 0, 1, 1, 1, 0}, // F
        {0, 0, 1, 0, 0, 1, 1, 1}, // G
        {0, 0, 0, 1, 1, 0, 1, 1}, // H
};
void nhapTamChieu()
{
    printf("Nhap tam chieu\n");
    printf("Nhap xp:");
    scanf("%d", &xp);
    printf("Nhap yp:");
    scanf("%d", &yp);
    printf("Nhap zp:");
    scanf("%d", &zp);
}
// chuong trinh con
void read()
{
    fp = fopen(INPUT, "r");
    if (fp == NULL)
    {
        printf("Khong mo duoc file/n");
    }
    fscanf(fp, "%d", &sodinh);
    printf("So dinh cua hinh la:%d\n", sodinh);
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            fscanf(fp, "%d", &a[j][i]);
        }
    }
    printf("Toa do cac dinh la\n");
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            printf("%d\t", a[j][i]);
        }
        printf("\n");
    }
}
void mtk()
{
    printf("Ma tran ke cua hinh la\n");
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < sodinh; j++)
        {
            printf("%d ", D[i][j]);
        }
        printf("\n");
    }
}
void solve()
{
    for (int i = 0; i < sodinh; i++)
    {
        int x = a[0][i];
        int y = a[1][i];
        int z = a[2][i];
        res[0][i] = roundf(xp + (float)(x + xp) / (float)(z + zp) * zp);
        res[1][i] = roundf(yp + (float)(y + yp) / (float)(z + zp) * zp);
        res[2][i] = 0;
    }
    printf("Toa do cac dinh sau khi chieu phoi canh la\n");
    for (int i = 0; i < sodinh; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            printf("%d\t", res[j][i]);
        }
        printf("\n");
    }
    setcolor(GREEN);
    for (int i = 0; i < sodinh - 1; i++)
    {
        for (int j = i + 1; j < sodinh; j++)
        {
            if (D[i][j] == 1)
                line(res[0][i], res[1][i], res[0][j], res[1][j]);
        }
    }
}

// chuong trinh chinh
int main()
{
    initwindow(800, 800);
    read();
    mtk();
    nhapTamChieu();
    solve();
    getch();
    return 0;
}