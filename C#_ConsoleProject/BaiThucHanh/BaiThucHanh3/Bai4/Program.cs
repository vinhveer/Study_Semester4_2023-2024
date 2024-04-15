using System;
using System.Collections.Generic;
using System.Text;

namespace Bai4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            Console.InputEncoding = Encoding.UTF8;

            Console.Write("Enter the number of adults: ");
            int n;
            while (!int.TryParse(Console.ReadLine(), out n) || n <= 2 || n >= 100)
            {
                Console.Write("Invalid input! Please enter a number between 2 and 100: ");
            }

            List<Adult> adults = new List<Adult>();
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"\nEnter information for adult {i + 1}:");

                Console.Write("Full name: ");
                string fullName = Console.ReadLine();

                double weight;
                Console.Write("Weight (kg): ");
                while (!double.TryParse(Console.ReadLine(), out weight) || weight <= 0)
                {
                    Console.Write("Invalid input! Please enter a positive number: ");
                }

                double height;
                Console.Write("Height (m): ");
                while (!double.TryParse(Console.ReadLine(), out height) || height <= 0)
                {
                    Console.Write("Invalid input! Please enter a positive number: ");
                }

                adults.Add(new Adult(fullName, weight, height));
            }

            Console.WriteLine("\nList of adults with good health:");
            foreach (Adult adult in adults)
            {
                double bmi = adult.CalculateBMI();
                if (bmi >= 18.5 && bmi < 24.9)
                {
                    adult.DisplayInformation();
                }
            }

            Console.ResetColor();
        }
    }
}
