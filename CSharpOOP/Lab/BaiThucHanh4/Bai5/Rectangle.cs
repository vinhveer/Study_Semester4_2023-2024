using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Rectangle : Shape
    {
        protected double width;
        protected double height;

        public Rectangle(double width, double height)
        {
            this.width = width;
            this.height = height;
        }

        public Rectangle()
        {
        }

        public override double CalculatePerimeter()
        {
            return 2 * (width + height);
        }

        public override double CalculateArea()
        {
            return width * height;
        }

        public new void Input()
        {
            base.Input();
            Console.WriteLine("Enter width: ");
            while (!double.TryParse(Console.ReadLine(), out width) || width <= 0)
            {
                Console.WriteLine("Invalid! Enter width again: ");
            }

            Console.WriteLine("Enter height: ");
            while (!double.TryParse(Console.ReadLine(), out height) || height <= 0)
            {
                Console.WriteLine("Invalid! Enter height again: ");
            }
        }

        public new void Output()
        {
            Console.WriteLine("Rectangle");
            Console.WriteLine("Width: {0}", width);
            Console.WriteLine("Height: {0}", height);
            base.Output();
        }
    }
}
