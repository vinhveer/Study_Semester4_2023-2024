using System;

namespace Bai1
{
    internal class QuadraticEquation : LinearEquation
    {
        private double a;

        public QuadraticEquation(double a, double b, double c) : base(b, c)
        {
            this.a = a;
        }

        public QuadraticEquation()
        {
        }

        public new void Input()
        {
            Console.Write("Enter a: ");
            while (!double.TryParse(Console.ReadLine(), out a) || a == 0)
            {
                Console.WriteLine("a must be a non-zero number");
                Console.Write("Enter a: ");
            }

            base.Input();
        }

        public new void Output()
        {
            Console.Write("{0}x^2 + ", a);
            base.Output();
        }

        public new void Solve()
        {
            if (a == 0)
            {
                base.Solve();
            }
            else
            {
                double delta = b * b - 4 * a * c;
                if (delta < 0)
                {
                    Console.WriteLine("No real roots");
                }
                else if (delta == 0)
                {
                    double x = -b / (2 * a);
                    Console.WriteLine("Double root: x = {0}", x);
                }
                else
                {
                    double x1 = (-b + Math.Sqrt(delta)) / (2 * a);
                    double x2 = (-b - Math.Sqrt(delta)) / (2 * a);
                    Console.WriteLine("Roots: x1 = {0}, x2 = {1}", x1, x2);
                }
            }
        }

    }
}
