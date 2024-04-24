using System;

namespace Bai1
{
    internal class LinearEquation
    {
        protected double b;
        protected double c;

        public LinearEquation(double b, double c)
        {
            this.b = b;
            this.c = c;
        }

        public LinearEquation()
        {
        }

        public void Input()
        {
            Console.Write("Enter b: ");
            while (!double.TryParse(Console.ReadLine(), out b))
            {
                Console.WriteLine("a must be a non-zero number");
                Console.Write("Enter b: ");
            }

            Console.Write("Enter c: ");
            while (!double.TryParse(Console.ReadLine(), out c))
            {
                Console.WriteLine("c must be a number");
                Console.Write("Enter c: ");
            }
        }

        public void Output()
        {
            Console.WriteLine("{0}x + {1} = 0", b, c);
        }

        public void Solve()
        {
            if (b == 0)
            {
                if (c == 0)
                {
                    Console.WriteLine("Infinite solutions");
                }
                else
                {
                    Console.WriteLine("No solution");
                }
            }
            else
            {
                Console.WriteLine("x = {0}", -c / b);
            }
        }
    }
}
