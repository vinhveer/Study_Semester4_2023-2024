using System;

namespace Bai5
{
    internal class Student
    {
        private int studentId;
        private string studentName;
        private char classType;
        private int lessonNumber;
        private static double lessonFee = 100;

        public Student(int studentId, string studentName, char classType, int lessonNumber)
        {
            this.studentId = studentId;
            this.studentName = studentName;
            this.classType = classType;
            this.lessonNumber = lessonNumber;
        }

        public Student()
        {
        }

        public void Input()
        {
            Console.Write("Enter student ID: ");
            while (!int.TryParse(Console.ReadLine(), out studentId))
            {
                Console.Write("Invalid value. Re-Enter student ID: ");
            }

            Console.Write("Enter student name: ");
            studentName = Console.ReadLine();

            Console.Write("Enter class type (A, B, C): ");
            while (!char.TryParse(Console.ReadLine(), out classType) || (classType != 'A' && classType != 'B' && classType != 'C'))
            {
                Console.WriteLine("Invalid value. Re-Enter class type (A, B, C): ");
            }

            Console.Write("Enter lesson number: ");
            while (!int.TryParse(Console.ReadLine(), out lessonNumber) || lessonNumber < 0)
            {
                Console.Write("Invalid value. Re-Enter lesson number: ");
            }
        }

        public double CalculateTotalFee()
        {
            double totalFee = lessonNumber * lessonFee;
            double discount = 0;

            if (lessonNumber > 50)
            {
                discount = 0.1 * totalFee;
            }
            else if (lessonNumber >= 30 && lessonNumber <= 50)
            {
                discount = 0.07 * totalFee;
            }

            return totalFee - discount;
        }

        public void DisplayInfo()
        {
            Console.WriteLine("Student Information:");
            Console.WriteLine($"Student Name: {studentName}");
            Console.WriteLine($"Class Type: {classType}");
            Console.WriteLine($"Lesson Number: {lessonNumber}");
            Console.WriteLine($"Total Fee: {CalculateTotalFee()}");

        }

        public static bool operator >(Student s1, Student s2)
        {
            return s1.lessonNumber > s2.lessonNumber;
        }

        public static bool operator <(Student s1, Student s2)
        {
            return s1.lessonNumber < s2.lessonNumber;
        }

        public static double operator +(Student s, double amount)
        {
            return s.CalculateTotalFee() + amount;
        }
    }
}
