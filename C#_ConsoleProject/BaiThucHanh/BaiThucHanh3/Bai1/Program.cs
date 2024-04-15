using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai1
{
    internal class Program
    {
        static void CreateCircle()
        {
            // Create object with constructor
            Circle circle1 = new Circle();

            float radius;
            Console.Write("Enter radius for circle 2: ");
            while (!float.TryParse(Console.ReadLine(), out radius))
            {
                Console.WriteLine("Invalid input. Please try again!");
                Console.Write("Enter radius: ");
            }

            Circle circle2 = new Circle(radius);

            // Print info
            circle1.Info();
            circle2.Info();

            // Update radius for circle1
            Console.WriteLine("Enter radius for circle 1 (Update): ");
            while (!float.TryParse(Console.ReadLine(), out radius))
            {
                Console.WriteLine("Invalid input. Please try again!");
                Console.Write("Enter radius: ");
            }

            circle1.SetRadius(radius);

            // Print sum area with two object
            Console.WriteLine($"Sum area: {circle1 + circle2}");
        }

        static void CreateCircles()
        {
            List<Circle> circles = new List<Circle>();

            // Input n circle
            int n;
            Console.Write("Enter n (2 < n < 30): ");
            while (!int.TryParse(Console.ReadLine(), out n) || n <= 2 || n >= 30)
            {
                Console.WriteLine("Invalid input. Please try again!");
                Console.Write("Enter n (2 < n < 30): ");
            }

            // Enter radius for n circle
            float radius;
            for (int i = 0; i < n; i++)
            {
                Console.Write($"Enter radius for circle {i}: ");
                while (!float.TryParse(Console.ReadLine(), out radius))
                {
                    Console.WriteLine("Invalid input. Please try again!");
                    Console.Write($"Enter radius for circle {i}: ");
                }
                circles.Add(new Circle(radius));
            }

            // Print info for n circle
            foreach (Circle circle in circles)
            {
                circle.Info();
            }

            // Print info circle have max area
            Circle maxArea = circles[0];
            foreach(Circle circle in circles)
            {
                if (circle.GetArea() > maxArea.GetArea())
                {
                    maxArea = circle;
                }
            }

            Console.WriteLine($"Circle have max area: ");
            maxArea.Info();
        }

        static void Main(string[] args)
        {
            CreateCircle();
            CreateCircles();
        }
    }
}
