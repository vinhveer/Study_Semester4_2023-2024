using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.InputEncoding = Encoding.Unicode;
            Console.OutputEncoding = Encoding.Unicode;
            // Tạo một điểm dùng phương thức thiết lập không tham số
            Point point1 = new Point();

            // Tạo một điểm dùng phương thức thiết lập có tham số
            Point point2 = new Point(3, 4);

            // In ra màn hình thông tin tọa độ 2 điểm và khoảng cách giữa 2 điểm
            Console.WriteLine("Thông tin điểm 1:");
            point1.InThongTin();

            Console.WriteLine("Thông tin điểm 2:");
            point2.InThongTin();

            double khoangCach = point1.TinhKhoangCach(point2);
            Console.WriteLine($"Khoảng cách giữa 2 điểm: {khoangCach}");
        }
    }
}
