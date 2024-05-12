using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Computer> computers = new List<Computer>();

            // Input a computer
            Computer computer = new Laptop(); // or new Macbook();
            computer.Input();
            computers.Add(computer);

            // Output the computer
            computer.Output();

            // Input n computers
            int n = 5; // for example
            for (int i = 0; i < n; i++)
            {
                computer = new Laptop(); // or new Macbook();
                computer.Input();
                computers.Add(computer);
            }

            // Output the computers
            foreach (var comp in computers)
            {
                comp.Output();
            }

            // Count and print the number of each type
            int laptopCount = computers.OfType<Laptop>().Count();
            int macbookCount = computers.OfType<Macbook>().Count();
            Console.WriteLine($"Number of Laptops: {laptopCount}, Number of Macbooks: {macbookCount}");
        }
    }
}
