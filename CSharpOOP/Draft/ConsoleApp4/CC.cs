using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
     class CC
    {
        int a, b;
        public static int c=8;
        public CC()
        {
            a = 1;
            b = 2;
        }

        public CC(int x = 4, int y = 8)
        {
            a = x;
            b = y;
            CC.c = 10;
        }
        public int A { get=>c; set=>c=value; }

        public void Xuat()
        {
            Console.WriteLine(a);
        }
    }
}
