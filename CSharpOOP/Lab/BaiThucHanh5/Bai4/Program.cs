using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Rectangle> rectangles = new List<Rectangle>();
            rectangles.Sort((x, y) => y.CalculatePaintCost().CompareTo(x.CalculatePaintCost())); // Output rectangles sorted by paint cost
            rectangles.RemoveAll(x => x.CalculateArea() < 10); // Remove the first rectangle with area less than x
            rectangles.Insert(0, new Rectangle()); // Add a rectangle at position i
            double totalPaintCost = rectangles.Sum(x => x.CalculatePaintCost()); // Calculate and print the total paint cost
            Console.WriteLine($"Total Paint Cost: {totalPaintCost}");
        }
    }
}
