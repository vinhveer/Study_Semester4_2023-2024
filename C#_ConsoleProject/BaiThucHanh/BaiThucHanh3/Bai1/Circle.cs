using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai1
{
    internal class Circle
    {
        float radius;

        // Contructor
        public Circle(float r)
        {
            radius = r;
        }

        public Circle()
        {
            radius = 1;
        }

        public void SetRadius(float r)
        {
            radius = r;
        }

        // Caculate the perimeter of the circle
        public float GetPerimeter()
        {
            return (float) (Math.PI * 2 * radius);
        }

        public double GetArea()
        {
            return Math.PI * radius * radius;
        }

        public void Info()
        {
            Console.WriteLine("Radius: " + radius);
            Console.WriteLine("Perimeter: " + GetPerimeter());
            Console.WriteLine("Area: " + GetArea());
        }

        // Operator
        public static double operator +(Circle c1, Circle c2)
        {
            return c1.GetArea() + c2.GetArea();
        }
    }

    class ListCircle
    {
        List<Circle> circles = new List<Circle>();
        int n;

        // Input
        public void Input()
        {
            Console.Write("Enter n: ");
            while (!int.TryParse(Console.ReadLine(), out n) || n <= 2 || n < 30)
            {
                Console.WriteLine("Invalid input. Please enter again: ");
            }

            for (int i = 0; i < n; i++)
            {
                float r;
                Console.Write($"Enter the radius for circle {i}: ");
                while (!float.TryParse(Console.ReadLine(), out r))
                {
                    Console.WriteLine("Invalid input. Please enter again: ");
                }

                circles.Add(new Circle(r));
            }
        }

        // Output
        public void Output()
        {
            foreach (var c in circles)
            {
                c.Info();
            }
        }

        // Sum of perimeters
        public double SumPerimeter()
        {
            double sum = 0;
            foreach (Circle c in circles)
            {
                sum += c.GetPerimeter();
            }

            return sum;
        }

        // Find the circle has the largest area
        public void FindMaxArea()
        {
            double max = circles[0].GetArea();
            int index = 0;
            for (int i = 1; i < n; i++)
            {
                if (circles[i].GetArea() > max)
                {
                    max = circles[i].GetArea();
                    index = i;
                }
            }

            Console.WriteLine("The circle has the largest area: ");
            circles[index].Info();
        }
    }
}
