using System;

// Đề 2
class Program
{
    static void Main()
    {
        int b;

        // Input for variable b (positive)
        Console.Write("Enter value for b: ");
        while (!int.TryParse(Console.ReadLine(), out b) || b <= 0)
        {
            Console.WriteLine("Value for b must be a non-negative number. Please enter again: ");
        }

        long result = CalculateOddNumbers(b);
        Console.WriteLine($"Product of odd numbers from 1 to {b} is: {result}");

        // Input for variable n (positive, even, and less than 30)
        Console.WriteLine("Enter a positive even integer (n <= 30):");
        int n;
        while (!int.TryParse(Console.ReadLine(), out n) || n > 30 || n <= 0 || n % 2 != 0)
        {
            Console.WriteLine("Value for n must be a positive even integer less than 30. Please enter again: ");
        }

        double resultExpression = CalculateExpValue(n);
        Console.WriteLine($"Value of the expression is: {resultExpression}");
    }

    // Function to calculate the product of odd numbers from 1 to b
    static long CalculateOddNumbers(int b)
    {
        long product = 1;

        for (int i = 1; i <= b; i += 2)
        {
            product *= i;
        }

        return product;
    }

    // Function to calculate the value of the given expression
    static double CalculateExpValue(int n)
    {
        double result = 0;
        long numerator = 1;
        long denominator = 0;

        for (int i = 1; i <= n; i += 2)
        {
            numerator *= i;
            denominator += 2;
            result += ((double)numerator / denominator);
        }

        return result;
    }
}
