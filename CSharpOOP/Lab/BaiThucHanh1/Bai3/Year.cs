using System;

namespace Bai3
{
    internal class Year
    {
        private int year;

        public void Input()
        {
            Console.Write("Enter year (yyyy): ");
            while (!int.TryParse(Console.ReadLine(), out year) || year <= 0)
            {
                Console.WriteLine("Invalid input. Please enter a valid year.");
                Console.Write("Enter year (yyyy): ");
            }
        }

        public void Output()
        {
            Console.WriteLine($"{year} is {(IsLeapYear() ? "a leap year" : "not a leap year")}.");
        }

        public bool IsLeapYear()
        {
            return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
        }
    }
}
