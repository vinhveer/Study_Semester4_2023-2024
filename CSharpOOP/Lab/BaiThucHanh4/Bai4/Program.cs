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
            Pixel p = new Pixel(10, 10);
            p.Draw();
            ColorPixel cp = new ColorPixel(20, 20, ConsoleColor.Red);
            cp.Draw();
            Console.ReadKey();
        }
    }
}
