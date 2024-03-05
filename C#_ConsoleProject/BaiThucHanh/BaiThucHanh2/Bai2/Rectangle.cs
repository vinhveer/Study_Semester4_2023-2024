using System;

namespace Bai2
{
    internal class Rectangle
    {
        private double width;
        private double height;

        public Rectangle()
        {
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

        public void Input()
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

        public double Width
        {
            get => width;
            set => width = value > 0 ? value : 0;
        }

        public double Height
        {
            get => height;
            set => height = value > 0 ? value : 0;
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
