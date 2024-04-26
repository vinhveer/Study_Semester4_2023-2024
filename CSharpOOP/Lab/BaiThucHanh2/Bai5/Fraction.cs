using System;

namespace Bai5
{
    internal class Fraction
    {
        private int numerator;
        private int denominator;

        public Fraction()
        {
            numerator = 0;
            denominator = 1;
        }

        public Fraction(int num, int denom)
        {
            numerator = num;
            denominator = denom != 0 ? denom : 1;
        }

        public Fraction(Fraction fraction)
        {
            numerator = fraction.numerator;
            denominator = fraction.denominator;
        }

        public Fraction Add(Fraction fraction)
        {
            int num = numerator * fraction.denominator + fraction.numerator * denominator;
            int denom = denominator * fraction.denominator;
            return Simplify(new Fraction(num, denom));
        }

        public Fraction Subtract(Fraction fraction)
        {
            int num = numerator * fraction.denominator - fraction.numerator * denominator;
            int denom = denominator * fraction.denominator;
            return Simplify(new Fraction(num, denom));
        }

        public Fraction Multiply(Fraction fraction)
        {
            int num = numerator * fraction.numerator;
            int denom = denominator * fraction.denominator;
            return Simplify(new Fraction(num, denom));
        }

        public Fraction Divide(Fraction fraction)
        {
            if (fraction.numerator == 0)
            {
                Console.WriteLine("Cannot divide by a fraction with numerator equal to 0.");
                return null;
            }

            int num = numerator * fraction.denominator;
            int denom = denominator * fraction.numerator;
            return Simplify(new Fraction(num, denom));
        }

        private int GCD(int a, int b)
        {
            a = Math.Abs(a);
            b = Math.Abs(b);
            while (b != 0)
            {
                int remainder = a % b;
                a = b;
                b = remainder;
            }
            return a;
        }

        private Fraction Simplify(Fraction fraction)
        {
            int gcd = GCD(fraction.numerator, fraction.denominator);
            fraction.numerator /= gcd;
            fraction.denominator /= gcd;
            return fraction;
        }

        public void Display()
        {
            Console.WriteLine($"{numerator}/{denominator}");
        }
    }
}
