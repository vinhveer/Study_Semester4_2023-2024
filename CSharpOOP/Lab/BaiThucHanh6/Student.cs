using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaiThucHanh6
{
    internal class Student
    {
        public string studentId { get; set; }
        public string studentName { get; set; }
        public string studentImage { get; set; }

        public Student(string studentId, string studentName, string studentImage)
        {
            this.studentId = studentId;
            this.studentName = studentName;
            this.studentImage = studentImage;
        }
    }
}
