using System;

namespace Bai2
{
    internal class Rectangle
    {
        private double width;
        private double height;

        public Rectangle()
        {
            width = 0;
            height = 0; 
        }

        public Rectangle(double width, double height)
        {
            this.width = width;
            this.height = height;
        }

        public Rectangle(Rectangle rectangle)
        {
            this.width = rectangle.width;
            this.height = rectangle.height;
        }

        public void Update()
        {
            double newWidth, newHeight;

            do
            {
                Console.Write("Enter width: ");
            } while (!double.TryParse(Console.ReadLine(), out newWidth) || newWidth <= 0);

            do
            {
                Console.Write("Enter height: ");
            } while (!double.TryParse(Console.ReadLine(), out newHeight) || newHeight <= 0);

            this.width = newWidth;
            this.height = newHeight;
        }

        public double Area()
        {
            return width * height;
        }

        public double Perimeter()
        {
            return (width + height) * 2;
        }

        public void Show()
        {
            Console.WriteLine("Rectangle: {0}x{1}, Area: {2}, Perimeter: {3}", width, height, Area(), Perimeter());
        }
    }
}
