using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    internal class Pixel
    {
        private double x;
        private double y;

        public Pixel(double x, double y)
        {
            this.x = x;
            this.y = y;
        }

        public Pixel()
        {
        }

        public virtual void Draw()
        {
            Console.SetCursorPosition((int)x, (int)y);
            Console.Write("o");
        }
    }
}
