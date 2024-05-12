namespace Bai1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ListCourse listCourse = new ListCourse();
            listCourse.ReadFile();
            listCourse.Print();
        }
    }
}
