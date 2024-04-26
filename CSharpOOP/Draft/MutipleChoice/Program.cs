using System;

namespace MutipleChoice
{
    class Program
    {
        static void Method(out int a, int b) {
            a = b --;
            b = a + b;
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            int x=2, y = 5;
            Method(out x, y);
            Console.WriteLine($"{x} {y}");
        }
    }
}