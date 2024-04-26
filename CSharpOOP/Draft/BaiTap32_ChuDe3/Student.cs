using System;
using System.Collections.Generic;
using System.Linq;

namespace BaiTap32_ChuDe3
{
    internal class Student
    {
        public string StudentId;
        public string Name;
        public string Gender;
        public int TotalCredits;
        public List<CourseResult> CourseResults;

        public Student(string studentId, string name, string gender, int totalCredits)
        {
            StudentId = studentId;
            Name = name;
            Gender = gender;
            TotalCredits = totalCredits;
            CourseResults = new List<CourseResult>();
        }

        public void Input()
        {
            Console.Write("Ma SV: ");
            StudentId = Console.ReadLine();

            Console.Write("Ten SV: ");
            Name = Console.ReadLine();

            Console.Write("Gioi tinh: ");
            Gender = Console.ReadLine();

            string inputTotalCredits;
            do
            {
                Console.Write("Tong so tin chi (lon hon 0): ");
                inputTotalCredits = Console.ReadLine();
            } while (!int.TryParse(inputTotalCredits, out TotalCredits) || TotalCredits <= 0);

            int numCourses;
            do
            {
                Console.Write("So mon hoc: ");
            } while (!int.TryParse(Console.ReadLine(), out numCourses) || numCourses <= 0);

            for (int i = 0; i < numCourses; i++)
            {
                var result = new CourseResult();
                Console.WriteLine($"Nhap thong tin mon hoc {i + 1}:");
                result.Input();
                CourseResults.Add(result);
            }
        }

        public void Display()
        {
            Console.WriteLine("-----------------------------------------------");
            Console.WriteLine($"SV {Name} - Ma so: {StudentId}");
            Console.WriteLine("Ket qua hoc phan:");
            foreach (var result in CourseResults)
            {
                result.Display();
            }
        }

        public double GPA()
        {
            double totalGradePoints = 0;
            int totalCredits = 0;

            foreach (var result in CourseResults)
            {
                totalGradePoints += result.GradePoint * result.Credit;
                totalCredits += result.Credit;
            }

            if (totalCredits == 0)
                return 0;

            return totalGradePoints / totalCredits;
        }

        public bool IsGraduated() => TotalCredits <= CourseResults.Sum(result => result.Credit);
    }
}
