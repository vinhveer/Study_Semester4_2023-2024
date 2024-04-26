using System;

namespace Bai2
{
    internal class Course
    {
        private string courseId;
        private string courseName;
        private int credit;
        private int practicalCredit;
        private static double course_fee = 350;

        public int PracticalCredit { get => practicalCredit; set => practicalCredit = value; }

        public Course(string courseId, string courseName, int credit, int practicalCredit)
        {
            this.courseId = courseId;
            this.courseName = courseName;
            this.credit = credit;
            this.PracticalCredit = practicalCredit;
        }

        public Course()
        {
        }

        public void Input()
        {
            Console.WriteLine("Input course information: ");
            Console.Write("Enter courseId: ");
            courseId = Console.ReadLine();

            Console.Write("Enter courseName: ");
            courseName = Console.ReadLine();

            Console.Write("Enter credit: ");
            while (!int.TryParse(Console.ReadLine(), out credit))
            {
                Console.WriteLine("Invalid input. Please try again!");
                Console.Write("Enter credit: ");
            }

            Console.Write("Enter practical credit: ");
            while (!int.TryParse(Console.ReadLine(), out PracticalCredit))
            {
                Console.WriteLine("Invalid input. Please try again!");
                Console.Write("Enter practical credit: ");
            }
        }

        public double CaculateCourseFee()
        {
            return PracticalCredit * course_fee * 1.5f * (credit - PracticalCredit) * course_fee;
        }

        public void Info()
        {
            Console.WriteLine($"Course ID: {courseId}");
            Console.WriteLine($"Course name: {courseName}");
            Console.WriteLine($"Credit: {credit}");
            Console.WriteLine($"Practical credit: {PracticalCredit}");
            Console.WriteLine($"Course fee: {CaculateCourseFee()}");
        }

        public static Course operator +(int number, Course course)
        {
            course.PracticalCredit += number;
            return course;
        }
    }
}
