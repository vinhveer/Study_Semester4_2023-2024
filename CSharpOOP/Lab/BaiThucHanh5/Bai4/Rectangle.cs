using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    public class Rectangle : Shape, IPaint
    {
        public double Length { get; set; }
        public double Width { get; set; }
        public double UnitPrice { get; set; }

        public override void Set()
        {
            Console.Write("Enter name: ");
            Name = Console.ReadLine();
            Console.Write("Enter length: ");
            Length = double.Parse(Console.ReadLine());
            Console.Write("Enter width: ");
            Width = double.Parse(Console.ReadLine());
            Console.Write("Enter unit price: ");
            UnitPrice = double.Parse(Console.ReadLine());
        }

        public override double CalculateArea()
        {
            return Length * Width;
        }

        public double CalculatePaintCost()
        {
            return UnitPrice * CalculateArea();
        }

        public void Print()
        {
            Console.WriteLine($"Name: {Name}, Area: {CalculateArea()}, Paint Cost: {CalculatePaintCost()}");
        }
    }
}
