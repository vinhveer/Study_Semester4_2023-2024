using System;

namespace Bai2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            String fullName;
            DateTime dateOfBirth;
            Input(out fullName, out dateOfBirth);

            // Call CalculateAge method with the obtained dateOfBirth
            CalculateAge(dateOfBirth);
        }

        private static void Input(out string fullName, out DateTime dateOfBirth)
        {
            Console.Write("Enter FullName: ");
            fullName = Console.ReadLine();

            Console.Write("Enter dateOfBirth (dd/MM/yyyy): ");
            string inputDate = Console.ReadLine();

            // Check value is in correct date format
            while (!DateTime.TryParseExact(inputDate, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out dateOfBirth))
            {
                Console.WriteLine("Invalid date. Please enter the correct format (dd/MM/yyyy).");
                Console.Write("Enter dateOfBirth (dd/MM/yyyy): ");
                inputDate = Console.ReadLine();
            }
        }

        private static void CalculateAge(DateTime dateOfBirth)
        {
            int age = DateTime.Now.Year - dateOfBirth.Year;

            if (DateTime.Now < dateOfBirth.AddYears(age))
            {
                age--;
            }

            Console.WriteLine($"Age: {age}");
        }
    }
}
