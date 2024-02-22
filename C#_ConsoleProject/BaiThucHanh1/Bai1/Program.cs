using System;

namespace Bai1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string fullName;
            DateTime dateOfBirth;
            byte gender;
            Input(out fullName, out dateOfBirth, out gender);
            Output(fullName, dateOfBirth, gender);
        }

        private static void Input(out string fullName, out DateTime dateOfBirth, out byte gender)
        {
            Console.Write("Enter fullname: ");
            fullName = Console.ReadLine();

            Console.Write("Enter date of birth (dd/MM/yyyy): ");
            string inputDate = Console.ReadLine();

            while (!DateTime.TryParseExact(inputDate, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out dateOfBirth))
            {
                Console.WriteLine("Invalid date. Please enter the correct format (dd/MM/yyyy).");
                Console.Write("Enter date of birth (dd/MM/yyyy): ");
                inputDate = Console.ReadLine();
            }

            bool validGender = false;
            do
            {
                Console.Write("Enter gender (0 - Male, 1 - Female, 2 - LGBT): ");
                string inputGender = Console.ReadLine();

                if (byte.TryParse(inputGender, out gender) && (gender >= 0 && gender <= 2))
                {
                    validGender = true;
                }
                else
                {
                    Console.WriteLine("Invalid gender. Please try again");
                }

            } while (!validGender);
        }

        private static void Output(string fullName, DateTime dateOfBirth, byte gender)
        {
            Console.WriteLine($"Full-name: {fullName}, date of birth: {dateOfBirth:dd/MM/yyyy}, gender: {gender}");
            Console.ReadKey();
        }
    }
}
