using System;

namespace Bai1
{
    internal class Circle
    {
        private float radius;

        public Circle() { }

        public Circle(float r)
        {
            radius = r;
        }

        public void SetRadius(float r)
        {
            radius = r;
        }

        public double GetPerimeter()
        {
            return radius * 2 * Math.PI;
        }

        public double GetArea()
        {
            return radius * radius * Math.PI;
        }

        public void Info()
        {
            Console.WriteLine($"Radius: {radius}");
            Console.WriteLine($"Perimeter: {GetPerimeter()}");
            Console.WriteLine($"Area: {GetArea()}");
        }

        public static double operator +(Circle c1, Circle c2)
        {
            return c1.GetArea() + c2.GetArea();
        }
    }
}
