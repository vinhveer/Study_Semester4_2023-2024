using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai6
{
    internal class PTB2 : PTB1
    {
        int c;
        public PTB2(int a = 3, int b = 5, int c = 7) : base(a, b)
        {
            this.c = c;
        }
        public new void Xuat()
        {
            base.Xuat();
            Console.Write($"\t{c}");
        }
    }
}
