using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // 3 5 7
            // PTB2 p = new PTB2();
            // p.Xuat();

            // 2 4
            // PTB1 p = new PTB1();
            // p.Xuat();

            // 1 4
            // PTB1 p = new PTB1(1);
            // p.Xuat();

            // 1 5 7
            // PTB2 p = new PTB2(1);
            // p.Xuat();

            // 1 2 7
            PTB2 p = new PTB2(1, 2);
            p.Xuat();
        }
    }
}
