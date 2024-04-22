#include <iostream>
#include <graphics.h>
using namespace std;

#define maxDinh 20

struct Point {
    int x, y;
};

struct Point pts[maxDinh];
int numPts;
int xMin = 200, yMin = 200;
int xMax = 400, yMax = 400;

// Đọc các điểm từ tệp input.txt
void ReadFile() {
    FILE *fp = fopen("input.txt", "r");
    if (fp == NULL) {
        cout << "Khong mo duoc file" << endl;
        return;
    }

    fscanf(fp, "%d", &numPts);
    for (int i = 0; i < numPts; i++) {
        fscanf(fp, "%d %d", &pts[i].x, &pts[i].y);
    }
    fclose(fp);
}

// Vẽ cửa sổ cắt
void DrawWindow() {
    setcolor(15);
    setlinestyle(0, 0, 1);
    rectangle(xMin, yMin, xMax, yMax);
}

// Cắt đoạn thẳng bằng thuật toán Cohen-Sutherland
struct Point CohenSutherlandClip(struct Point p1, struct Point p2) {
    int code1 = 0, code2 = 0;
    struct Point clippedPt1 = p1, clippedPt2 = p2;
    bool accept = false;

    while (true) {
        code1 = (p1.x < xMin) + 2 * (p1.x > xMax) + 4 * (p1.y < yMin) + 8 * (p1.y > yMax);
        code2 = (p2.x < xMin) + 2 * (p2.x > xMax) + 4 * (p2.y < yMin) + 8 * (p2.y > yMax);

        if (!(code1 | code2)) {
            accept = true;
            break;
        } else if (code1 & code2) {
            break;
        } else {
            int codeOut = code1 ? code1 : code2;
            int x, y;

            if (codeOut & 8) {
                x = p1.x + (p2.x - p1.x) * (yMax - p1.y) / (p2.y - p1.y);
                y = yMax;
            } else if (codeOut & 4) {
                x = p1.x + (p2.x - p1.x) * (yMin - p1.y) / (p2.y - p1.y);
                y = yMin;
            } else if (codeOut & 2) {
                y = p1.y + (p2.y - p1.y) * (xMax - p1.x) / (p2.x - p1.x);
                x = xMax;
            } else if (codeOut & 1) {
                y = p1.y + (p2.y - p1.y) * (xMin - p1.x) / (p2.x - p1.x);
                x = xMin;
            }

            if (codeOut == code1) {
                clippedPt1.x = x;
                clippedPt1.y = y;
                p1 = clippedPt1;
            } else {
                clippedPt2.x = x;
                clippedPt2.y = y;
                p2 = clippedPt2;
            }
        }
    }

    if (accept)
        return clippedPt2;
    else
        return {0, 0};
}

// Vẽ các đoạn thẳng đã được cắt
void DrawClippedLines() {
    setcolor(4);
    setlinestyle(0, 0, 1);
    for (int i = 0; i < numPts - 1; i++) {
        struct Point p1 = pts[i];
        struct Point p2 = pts[i + 1];
        struct Point clippedPt = CohenSutherlandClip(p1, p2);

        if (clippedPt.x != 0 || clippedPt.y != 0) 
            line(p1.x, p1.y, clippedPt.x, clippedPt.y);
    }
}

// Hàm chính
int main() {
    // Đọc các điểm từ tệp input.txt
    ReadFile();

    // Khởi tạo cửa sổ đồ họa
    initwindow(1920, 800);

    // Vẽ các đoạn thẳng đã được cắt
    DrawClippedLines();

    // Vẽ cửa sổ cắt
    DrawWindow();

    // Dừng màn hình để người dùng có thể nhìn thấy đồ họa
    getch();
    return 0;
}
