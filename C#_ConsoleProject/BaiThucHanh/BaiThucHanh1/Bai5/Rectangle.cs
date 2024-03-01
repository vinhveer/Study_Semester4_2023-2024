using System;

namespace Bai5
{
    internal class Rectangle
    {
        private double length;
        private double width;

        public void Input()
        {
            Console.WriteLine("Nhap chieu dai: ");
            while (!double.TryParse(Console.ReadLine(), out length) || length <= 0)
            {
                Console.WriteLine("Nhập sai giá trị. Hãy nhập lại");
                Console.Write("Nhập chiều dài: ");
            }

            Console.WriteLine("Nhập chiều rộng: ");
            while (!double.TryParse(Console.ReadLine(), out length) || length <= 0)
            {
                Console.WriteLine("Nhập sai giá trị. Hãy nhập lại");
                Console.Write("Nhập chiều rộng: ");
            }
        }

        public void Output()
        {
            Console.WriteLine($"Diện tích hình chữ nhật là: {length * width}");
        }
    }
}
