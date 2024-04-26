using System;

namespace Bai5
{
    internal class Shape
    {
        private string shapeName;

        public Shape(string shapeName)
        {
            this.shapeName = shapeName;
        }

        public Shape()
        {
        }

        public virtual double CalculatePerimeter()
        {
            return 0;
        }

        public virtual double CalculateArea()
        {
            return 0;
        }

        public void Input()
        {
            Console.WriteLine("Enter shape name: ");
            shapeName = Console.ReadLine();
        }

        public void Output()
        {
            Console.WriteLine("Shape: {0}", shapeName);
            Console.WriteLine("Perimeter: {0}", CalculatePerimeter());
            Console.WriteLine("Area: {0}", CalculateArea());
        }
    }
}
