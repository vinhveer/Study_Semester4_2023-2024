using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai1
{
    internal class Course
    {
        private string courseId;
        private string courseName;
        private int courseCredit;

        public string CourseId { get => courseId; set => courseId = value; }
        public string CourseName { get => courseName; set => courseName = value; }
        public int CourseCredit { get => courseCredit; set => courseCredit = value; }

        public Course(string courseId, string courseName, int courseCredit)
        {
            this.CourseId = courseId;
            this.CourseName = courseName;
            this.CourseCredit = courseCredit;
        }

        public Course() { }

        // ToString
        public override string ToString()
        {
            return $"Course ID: {CourseId}, Course Name: {CourseName}, Course Credit: {CourseCredit}";
        }
    }
}
