using System;

namespace Bai5
{
    internal class Circle
    {
        private double circleRadius;

        public void Input()
        {
            Console.WriteLine("Nhap ban kinh hinh tron: ");
            while (!double.TryParse(Console.ReadLine(), out circleRadius) || circleRadius <= 0)
            {
                Console.WriteLine("Nhap sai gia tri. (Tips: Canh hinh tron lon hon 0)");
                Console.Write("Nhap ban kinh hinh tron: ");
            }
        }

        public void Output() 
        {
            Console.WriteLine($"Dien tich hinh tron la: {Math.PI * Math.Pow(circleRadius, 2)}");
        }
    }
}
