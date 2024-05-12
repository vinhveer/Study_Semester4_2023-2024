using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    public abstract class Computer
    {
        public string Brand { get; set; }
        public int Ram { get; set; }
        public int Memory { get; set; }
        public double Price { get; set; }

        public Computer() { }

        public Computer(string brand, int ram, int memory, double price)
        {
            Brand = brand;
            Ram = ram;
            Memory = memory;
            Price = price;
        }

        public virtual void Input() 
        {
            Console.Write("Enter brand: ");
            Brand = Console.ReadLine();
            Console.Write("Enter ram: ");
            Ram = int.Parse(Console.ReadLine());
            Console.Write("Enter memory: ");
            Memory = int.Parse(Console.ReadLine());
            Console.Write("Enter price: ");
            Price = double.Parse(Console.ReadLine());
        }

        public abstract double CalculateSalePrice();

        public void Output()
        {
            Console.WriteLine($"Brand: {Brand}, Ram: {Ram}GB, Memory: {Memory}GB, Sale Price: {CalculateSalePrice()}");
        }
    }

}
