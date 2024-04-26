using System;
using System.Text;

namespace Bai7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.InputEncoding = Encoding.Unicode;
            Console.OutputEncoding = Encoding.Unicode;

            // Enter information for a person (using constructor)
            Console.Write("Enter full name: ");
            string fullName = Console.ReadLine();

            Console.Write("Enter weight (kg): ");
            double weight = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter height (m): ");
            double height = Convert.ToDouble(Console.ReadLine());

            // Create an Adult object
            Adult person = new Adult(fullName, weight, height);

            // Display the entered information and the person's health status
            person.DisplayInformation();
        }
    }
}
