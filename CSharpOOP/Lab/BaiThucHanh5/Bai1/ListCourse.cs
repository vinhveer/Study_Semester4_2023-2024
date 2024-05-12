using System;
using System.Collections.Generic;
using System.IO;

namespace Bai1
{
    internal class ListCourse
    {
        List<Course> listCourse = new List<Course>();

        public void ReadFile()
        {
            try
            {
                // ../../ because file .exe in bin/obj.
                FileStream fileStream = new FileStream("../../course.txt", FileMode.Open, FileAccess.Read);
                using (StreamReader reader = new StreamReader(fileStream))
                {
                    int n = int.Parse(reader.ReadLine());
                    for (int i = 0; i < n; i++)
                    {
                        string[] readArray = reader.ReadLine().Split(';');
                        Course course = new Course();
                        course.CourseId = readArray[0];
                        course.CourseName = readArray[1];
                        course.CourseCredit = int.Parse(readArray[2]);
                        listCourse.Add(course);
                    }
                }
            }
            catch (FileNotFoundException)
            {
                Console.WriteLine("File not found.");
            }
            catch (IOException ex)
            {
                Console.WriteLine("Error reading the file: " + ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }
        }

        public void Print()
        {
            foreach (var course in listCourse)
            {
                Console.WriteLine($"{course.CourseId} \t {course.CourseName} \t {course.CourseCredit}");
            }
        }
    }
}
