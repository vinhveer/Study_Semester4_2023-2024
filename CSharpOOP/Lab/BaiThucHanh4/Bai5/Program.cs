using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Program
    {
        List<Shape> shapes = new List<Shape>();

        public void Input()
        {
            Console.WriteLine("Enter number of shapes: ");
            int n;
            while (!int.TryParse(Console.ReadLine(), out n) || n < 2 || n > 20)
            {
                Console.WriteLine("Enter again!");
            }

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine("Enter shape {0}:", i + 1);
                Console.WriteLine("1. Rectangle");
                Console.WriteLine("2. Triangle");
                int choice;
                while (!int.TryParse(Console.ReadLine(), out choice) || choice < 1 || choice > 2)
                {
                    Console.WriteLine("Enter again!");
                }

                switch (choice)
                {
                    case 1:
                        Rectangle rectangle = new Rectangle();
                        rectangle.Input();
                        shapes.Add(rectangle);
                        break;
                    case 2:
                        Triangle triangle = new Triangle();
                        triangle.Input();
                        shapes.Add(triangle);
                        break;
                    default:
                        Console.WriteLine("Invalid choice!");
                        break;
                }
            }
        }

        public void Output()
        {
            foreach (Shape shape in shapes)
            {
                shape.Output();
            }
        }

        public double AverageAreaRectangle()
        {
            double sum = 0;
            int count = 0;
            foreach (Shape shape in shapes)
            {
                if (shape is Rectangle)
                {
                    sum += shape.CalculateArea();
                    count++;
                }
            }

            return count == 0 ? 0 : sum / count;
        }

        static void Main(string[] args)
        {
            Program program = new Program();
            program.Input();
            program.Output();
            Console.WriteLine("Average area of rectangle: {0}", program.AverageAreaRectangle());
        }
    }
}
