using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai6
{
    internal class Point
    {
        private int x;
        private int y;

        // Default constructor
        public Point()
        {
            x = 0;
            y = 0;
        }

        // Parameterized constructor
        public Point(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

        // Print the coordinates of the point to the console
        public void PrintInfo()
        {
            Console.WriteLine($"Point coordinates: ({x},{y})");
        }

        // Calculate the distance between two points
        public double CalculateDistance(Point otherPoint)
        {
            int deltaX = this.x - otherPoint.x;
            int deltaY = this.y - otherPoint.y;

            return Math.Sqrt(deltaX * deltaX + deltaY * deltaY);
        }
    }
}
