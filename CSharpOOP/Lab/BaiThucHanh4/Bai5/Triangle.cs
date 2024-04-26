using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Triangle : Shape
    {
        protected double side1;
        protected double side2;
        protected double side3;

        public Triangle(double side1, double side2, double side3)
        {
            this.side1 = side1;
            this.side2 = side2;
            this.side3 = side3;
        }

        public Triangle()
        {
        }

        public override double CalculatePerimeter()
        {
            return side1 + side2 + side3;
        }

        public override double CalculateArea()
        {
            double p = CalculatePerimeter() / 2;
            return Math.Sqrt(p * (p - side1) * (p - side2) * (p - side3));
        }

        public new void Input()
        {
            base.Input();
            Console.WriteLine("Enter side 1: ");
            while (!double.TryParse(Console.ReadLine(), out side1) || side1 <= 0)
            {
                Console.WriteLine("Invalid! Enter side 1 again: ");
            }

            Console.WriteLine("Enter side 2: ");
            while (!double.TryParse(Console.ReadLine(), out side2) || side2 <= 0)
            {
                Console.WriteLine("Invalid! Enter side 2 again: ");
            }

            Console.WriteLine("Enter side 3: ");
            while (!double.TryParse(Console.ReadLine(), out side3) || side3 <= 0)
            {
                Console.WriteLine("Invalid! Enter side 3 again: ");
            }
        }

        public new void Output()
        {
            Console.WriteLine("Triangle");
            Console.WriteLine("Side 1: {0}", side1);
            Console.WriteLine("Side 2: {0}", side2);
            Console.WriteLine("Side 3: {0}", side3);
            base.Output();
        }
    }
}
