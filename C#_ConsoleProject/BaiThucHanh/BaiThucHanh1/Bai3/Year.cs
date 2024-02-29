using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai3
{
    internal class Year
    {
        private DateTime year;

        private static void Input(out DateTime year)
        {
            Console.Write("Enter year (yyyy): ");
            string inputYear = Console.ReadLine();

            while (!DateTime.TryParseExact(inputYear, "yyyy", null, System.Globalization.DateTimeStyles.None, out year))
            {
                Console.WriteLine("Invalid input. Please try again!");
                Console.Write("Enter year (yyyy): ");
                inputYear = Console.ReadLine();
            }
        }

        private static void Output(DateTime year)
        {
            if (!DateTime.IsLeapYear(year.Year))
            {
                Console.WriteLine("This is not a leap year.");
            }
            else
            {
                Console.WriteLine("This is a leap year.");
            }
        }
    }
}
