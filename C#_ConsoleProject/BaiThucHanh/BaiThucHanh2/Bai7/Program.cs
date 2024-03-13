using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.InputEncoding = Encoding.Unicode;
            Console.OutputEncoding = Encoding.Unicode;

            // Nhập thông tin 1 người (dùng phương thức khởi tạo)
            Console.Write("Nhập họ tên: ");
            string hoTen = Console.ReadLine();

            Console.Write("Nhập cân nặng (kg): ");
            double canNang = Convert.ToDouble(Console.ReadLine());

            Console.Write("Nhập chiều cao (m): ");
            double chieuCao = Convert.ToDouble(Console.ReadLine());

            // Tạo đối tượng Adult
            Adult nguoi = new Adult(hoTen, canNang, chieuCao);

            // Xuất thông tin người vừa nhập và tình trạng sức khỏe người đó ra màn hình
            nguoi.XuatThongTin();
        }
    }
}
