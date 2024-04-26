using System;

namespace Bai4
{
    internal class Operation
    {
        private int number1;
        private int number2;
        private char operatorChar;

        public void Input()
        {
            Console.WriteLine("Enter number 1: ");
            while (!int.TryParse(Console.ReadLine(), out number1))
            {
                Console.WriteLine("Invalid input. Please enter a valid number: ");
            }

            Console.WriteLine("Enter number 2: ");
            while (!int.TryParse(Console.ReadLine(), out number2))
            {
                Console.WriteLine("Invalid input. Please enter a valid number: ");
            }

            Console.WriteLine("Enter operator (+, -, *, /): ");
            while (!char.TryParse(Console.ReadLine(), out operatorChar) || (operatorChar != '+' && operatorChar != '-' && operatorChar != '*' && operatorChar != '/'))
            {
                Console.WriteLine("Invalid operator. Please enter a valid operator (+, -, *, /): ");
            }
        }

        public void Output()
        {
            switch (operatorChar)
            {
                case '+':
                    Console.WriteLine($"{number1} + {number2} = {number1 + number2}");
                    break;
                case '-':
                    Console.WriteLine($"{number1} - {number2} = {number1 - number2}");
                    break;
                case '*':
                    Console.WriteLine($"{number1} * {number2} = {number1 * number2}");
                    break;
                case '/':
                    if (number2 == 0)
                        Console.WriteLine("Divide by zero!");
                    else
                        Console.WriteLine($"{number1} / {number2} = {number1 / (double)number2}");
                    break;
            }
        }
    }
}
