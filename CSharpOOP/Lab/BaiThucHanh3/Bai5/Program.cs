using System;
using System.Collections.Generic;

namespace Bai5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;
            Console.InputEncoding = System.Text.Encoding.UTF8;

            Console.Write("Enter the number of students (2 < n < 30): ");
            int n;
            while (!int.TryParse(Console.ReadLine(), out n) || n <= 2 || n >= 30)
            {
                Console.Write("Invalid input! Please enter a number between 2 and 30: ");
            }

            List<Student> students = new List<Student>();
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"\nEnter information for student {i + 1}:");
                Student student = new Student();
                student.Input();
                students.Add(student);
            }

            Console.WriteLine("\nList of students sorted by lesson number:");
            students.Sort((s1, s2) => s1 > s2 ? 1 : -1);
            foreach (Student student in students)
            {
                student.DisplayInfo();
            }

            double totalFee = 0;
            foreach (Student student in students)
            {
                totalFee += student + 0; // Using the overloaded + operator to get the total fee
            }

            Console.WriteLine($"\nTotal fee of {n} students: {totalFee}");
        }
    }
}
