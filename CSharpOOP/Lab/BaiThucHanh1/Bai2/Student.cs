using System;

namespace Bai2
{
    internal class Student
    {
        private string fullName;
        private DateTime dateOfBirth;

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
        }

        public void CalculateAge()
        {
            int age = DateTime.Now.Year - dateOfBirth.Year;

            if (DateTime.Now > dateOfBirth.AddYears(age))
                age--;

            Console.WriteLine($"Age: {age}");
        }
    }
}
