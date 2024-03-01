using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            byte option;
            Console.WriteLine("Chuong trinh co cac lua chon sau: ");
            Console.WriteLine("----------------------------------");
            Console.WriteLine("1. Tinh dien tich hinh tron");
            Console.WriteLine("2. Tinh dien tich hinh chu nhat");
            Console.WriteLine("3. Tinh dien tich hinh vuong");
            Console.Write("Lua chon cua ban: ");
            while (!byte.TryParse(Console.ReadLine(), out option) || option <= 0)
            {
                Console.WriteLine("Nhap sai gia tri.");
                Console.Write("Lua chon cua ban: ");
            }

            switch (option)
            {
                case 1:
                    Circle circle = new Circle();
                    circle.Input();
                    circle.Output();
                    break;
                case 2:
                    Rectangle rectangle = new Rectangle();
                    rectangle.Input(); 
                    rectangle.Output();
                    break;
                case 3:
                    Triangle triangle = new Triangle();
                    triangle.Input();
                    triangle.Output();
                    break;
                default: 
                    Console.WriteLine("Lua chon khong hop le!");
                    break;
            }
        }
    }
}
