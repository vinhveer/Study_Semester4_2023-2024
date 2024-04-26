using System;

namespace BaiTap32_ChuDe3
{
    internal class CourseResult
    {
        public string CourseCode;
        public string CourseName;
        public double GradePoint;
        public int Credit;

        public void Input()
        {
            Console.Write("Ma HP: ");
            CourseCode = Console.ReadLine();

            Console.Write("Ten HP: ");
            CourseName = Console.ReadLine();

            do
            {
                Console.Write("Diem trung binh (0-10): ");
            } while (!double.TryParse(Console.ReadLine(), out GradePoint) || GradePoint < 0 || GradePoint > 10);

            do
            {
                Console.Write("So tin chi: ");
            } while (!int.TryParse(Console.ReadLine(), out Credit) || Credit <= 0);
        }

        public void Display() => Console.WriteLine($"  {CourseName}: {GradePoint}");
    }
}