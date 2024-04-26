using System;

namespace Bai1
{
    internal class Student
    {
        private string fullName;
        private DateTime dateOfBirth;
        private bool gender;

        public void Input()
        {
            Console.Write("Enter fullname: ");
            fullName = Console.ReadLine();

            Console.Write("Enter date of birth (dd/MM/yyyy): ");
            while (!DateTime.TryParse(Console.ReadLine(), out dateOfBirth) || dateOfBirth < DateTime.MinValue || dateOfBirth > DateTime.MaxValue)
            {
                Console.WriteLine("Invalid date. Please enter the correct format (dd/MM/yyyy).");
                Console.Write("Enter date of birth (dd/MM/yyyy): ");
            }

            Console.WriteLine("Choose gender:");
            Console.WriteLine("1. Male");
            Console.WriteLine("2. Female");

            int choice;
            while (true)
            {
                Console.Write("Enter your choice (1 for Male, 2 for Female): ");
                if (int.TryParse(Console.ReadLine(), out choice) && (choice == 1 || choice == 2))
                {
                    gender = (choice == 1);
                    break;
                }
                else
                    Console.WriteLine("Invalid choice. Please enter 1 for Male or 2 for Female.");
            }
        }

        public void Print()
        {
            Console.WriteLine($"Full-name: {fullName}, " +
                            $"date of birth: {dateOfBirth:dd/MM/yyyy}, " +
                            $"gender: {(gender ? "Male" : "Female")}");
        }
    }
}
