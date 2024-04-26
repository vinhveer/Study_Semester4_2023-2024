using System;

namespace BaiTap32_ChuDe3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Student student1 = new Student("SV001", "Nguyen Van A", "Nam", 120);

            student1.Input();
            student1.Display();

            Console.WriteLine($"Diem trung binh: {student1.GPA()}");

            Console.WriteLine(student1.IsGraduated() ? "Du dieu kien tot nghiep" : "Chua du dieu kien tot nghiep");
        }
    }
}
