#include <stdio.h>
#include <graphics.h>
#include <math.h>
#include <limits.h>

#define INPUT "input.inp"
#define MAX 20 // Số đỉnh tối đa của đa giác

FILE *fp;
int sodinh;
float m[MAX];

struct point
{
    int x;
    int y;
};

struct point pt[MAX]; // Tọa độ các đỉnh của đa giác

// Đọc file input
void readFile()
{
    fp = fopen(INPUT, "r");

    if (fp == NULL)
    {
        printf("Không thể mở file %s\n", INPUT);
        return;
    }

    // Đọc số đỉnh
    fscanf(fp, "%d", &sodinh);
    printf("Số đỉnh: %d\n", sodinh);

    // Đọc tọa độ các đỉnh
    for (int i = 0; i < sodinh; i++)
    {
        fscanf(fp, "%d %d", &pt[i].x, &pt[i].y);

        // In tọa độ các đỉnh
        printf("Đỉnh %d: %d %d\n", i, pt[i].x, pt[i].y);
    }
    pt[sodinh].x = pt[0].x; // Gán đỉnh cuối cùng lại với đỉnh đầu tiên
    pt[sodinh].y = pt[0].y;
    fclose(fp);
}

// Tính hệ số góc của các cạnh
void heSoGoc()
{
    printf("Hệ số góc các cạnh\n");
    for (int i = 0; i < sodinh; i++)
    {
        if (pt[i + 1].y == pt[i].y || pt[i + 1].x == pt[i].x)
        {
            m[i] = INT_MAX;
        }
        else
        {
            m[i] = (float) (pt[i + 1].y - pt[i].y) / (pt[i + 1].x - pt[i].x);
        }
        printf("m[%d] = %.1f\n", i, m[i]);
    }
}

void veDaGiac()
{
    for (int i = 0; i < sodinh; i++)
    {
        line(pt[i].x, pt[i].y, pt[i + 1].x, pt[i + 1].y);
    }
}

void scanLine()
{
    int y;
    int xgd[MAX]; // Mảng chứa tọa độ x của các điểm giao với đường quét

    // Tìm yMin và yMax
    int yMin = pt[0].y;
    int yMax = pt[0].y;

    for (int i = 1; i < sodinh; i++)
    {
        if (pt[i].y < yMin)
        {
            yMin = pt[i].y;
        }
        if (pt[i].y > yMax)
        {
            yMax = pt[i].y;
        }
    }

    printf("yMin = %d, yMax = %d\n", yMin, yMax);

    // Tô màu theo dòng quét
    for (y = yMin; y <= yMax; y++)
    {
        int dem = 0; // Đếm số điểm giao

        // Với mỗi dòng quét, tìm điểm giao y với các cạnh của đa giác
        for (int i = 0; i < sodinh; i++)
        {
            // Kiểm tra xem dòng quét có điểm giao với cạnh này không
            if ((y < pt[i].y && y < pt[i + 1].y) || (y >= pt[i].y && y >= pt[i + 1].y))
            {
                continue; // Không có điểm giao với cạnh này
            }
            
            // Xác định tọa độ x của điểm giao
            float x_inter = pt[i].x + (float)(y - pt[i].y) / m[i];
            xgd[dem++] = round(x_inter);
        }

        // Sắp xếp các tọa độ x tăng dần
        for (int i = 0; i < dem - 1; i++)
        {
            for (int j = i + 1; j < dem; j++)
            {
                if (xgd[i] > xgd[j])
                {
                    int temp = xgd[i];
                    xgd[i] = xgd[j];
                    xgd[j] = temp;
                }
            }
        }

        // Tô màu giữa các cặp tọa độ x
        for (int i = 0; i < dem - 1; i += 2)
        {
            for (int x = xgd[i]; x <= xgd[i + 1]; x++)
            {
                putpixel(x, y, 15); // Tô màu
            }
        }
    }
}


// Hàm main
int main()
{
    initwindow(800, 600);
    setlinestyle(1, 0, 2);
    setcolor(15);
    readFile();
    heSoGoc();
    veDaGiac();
    scanLine();
    getch();
    closegraph();
    return 0;
}
