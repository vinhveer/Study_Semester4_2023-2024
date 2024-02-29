using System;

namespace Bai1
{
    internal class Student
    {
        private string fullName;
        private DateTime dateOfBirth;
        private string gender;

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

            Console.Write("Enter gender: ");
            gender = Console.ReadLine();
        }

        public void Print()
        {
            Console.WriteLine($"Full-name: {fullName}, date of birth: {dateOfBirth:dd/MM/yyyy}, gender: {gender}");
        }
    }
}
