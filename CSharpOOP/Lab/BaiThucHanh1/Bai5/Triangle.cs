using System;

namespace Bai5
{
    internal class Triangle
    {
        private double side1;
        private double side2;
        private double side3;

        public void Input()
        {
            Console.WriteLine("Nhap canh thu 1: ");
            while (!double.TryParse(Console.ReadLine(), out side1) || side1 <= 0)
            {
                Console.WriteLine("Gia tri vua nhap khong hop le!");
                Console.Write("Nhap canh thu 1: ");
            }

            Console.WriteLine("Nhap canh thu 2: ");
            while (!double.TryParse(Console.ReadLine(), out side2) || side2 <= 0)
            {
                Console.WriteLine("Gia tri vua nhap khong hop le!");
                Console.Write("Nhap canh thu 2: ");
            }

            Console.WriteLine("Nhap canh thu 3: ");
            while (!double.TryParse(Console.ReadLine(), out side3) || side3 <= 0)
            {
                Console.WriteLine("Gia tri vua nhap khong hop le!");
                Console.Write("Nhap canh thu 3: ");
            }
        }

        public void Output()
        {
            if (IsTriangle())
            {
                double semiPerimeter = (side1 + side2 + side3) / 2;
                double area = Math.Sqrt(semiPerimeter * (semiPerimeter - side1) * (semiPerimeter - side2) * (semiPerimeter - side3));
                Console.WriteLine($"Dien tich tam giac la: {area}");
            }
            else
            {
                Console.WriteLine("Day khong phai la tam giac");
            }
        }

        private bool IsTriangle()
        {
            return (side1 + side2 > side3) && (side1 + side3 > side2) && (side2 + side3 > side1);
        }
    }
}
