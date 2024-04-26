using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    internal class ColorPixel : Pixel
    {
        private ConsoleColor color;

        // Constructor
        public ColorPixel(double x, double y, ConsoleColor color) : base(x, y)
        {
            this.color = color;
        }

        public ColorPixel() : base()
        {
        }

        public override void Draw()
        {
            Console.ForegroundColor = color;
            base.Draw();
            Console.ResetColor();
        }
    }
}
