using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai6
{
    internal class Point
    {
        private int x;
        private int y;

        // Thiết lập không tham số
        public Point()
        {
            x = 0;
            y = 0;
        }

        // Khởi tạo có tham số
        public Point(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

        // In ra màn hình thông tin tọa độ điểm
        public void InThongTin()
        {
            Console.WriteLine($"Tọa độ điểm: ({x},{y})");
        }

        // Tính khoảng cách giữa 2 điểm
        public double TinhKhoangCach(Point otherPoint)
        {
            int deltaX = this.x - otherPoint.x;
            int deltaY = this.y - otherPoint.y;

            return Math.Sqrt(deltaX * deltaX + deltaY * deltaY);
        }
    }
}
