using System;

namespace Bai6
{
    internal class PTB1
    {
        protected int a, b;
        public PTB1(int a1 = 2, int b1 = 4)
        {
            a = a1; b = b1;
        }
        public void Xuat()
        {
            Console.Write($"{a}\t{b}");
        }

    }
}
