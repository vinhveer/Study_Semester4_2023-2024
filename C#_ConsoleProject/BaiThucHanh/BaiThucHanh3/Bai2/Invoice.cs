using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2
{
    internal class Invoice
    {
        private string studentId;
        private string fullName;
        private List<Course> courses;

        public Invoice(string studentId, string fullName, List<Course> courses)
        {
            this.studentId = studentId;
            this.fullName = fullName;
            this.courses = courses;
        }

        public Invoice()
        {
        }

        public void Input()
        {
            Console.WriteLine("Enter studentId: ");
            studentId = Console.ReadLine();

            Console.WriteLine("Enter fullName: ");
            fullName = Console.ReadLine();

            courses = new List<Course>();
            int n;
            Console.WriteLine("Enter n (2 - 9): ");
            while (!int.TryParse(Console.ReadLine(), out n) || n <= 2 || n >= 9)
            {
                Console.WriteLine("Invalid input. Please try again!");
            }

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Enter course {i}");
                Course course = new Course();
                course.Input();

                courses.Add(course);
            }
        }

        public void Info()
        {
            Console.WriteLine($"Student ID: {studentId}");
            Console.WriteLine($"Fullname: {fullName}");

            double sumCourseFee = 0;
            int sumPracticalCredits = 0;
            foreach (Course course in courses)
            {
                course.Info();
                sumCourseFee += course.CaculateCourseFee();
                sumPracticalCredits += course.PracticalCredit;
            }

            Console.WriteLine($"Total fee: {sumCourseFee}");
            Console.WriteLine($"Total practical credits: {sumPracticalCredits}");
        }
    }
}
