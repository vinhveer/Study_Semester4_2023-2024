using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            CC cC = new CC(1);  
            Console.WriteLine(cC.A);
            cC.Xuat();
        }
    }
}
