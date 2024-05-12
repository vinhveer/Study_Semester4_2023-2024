using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Laptop : Computer
    {
        public double Weight { get; set; }

        public Laptop() : base() { }

        public Laptop(string brand, int ram, int memory, double price, double weight) : base(brand, ram, memory, price)
        {
            Weight = weight;
        }

        public override void Input()
        {
            base.Input();
            Console.Write("Enter weight: ");
            Weight = double.Parse(Console.ReadLine());
        }

        public override double CalculateSalePrice()
        {
            return Weight >= 2 ? Price + Price * 0.15 : Price + Price * 0.2;
        }
    }
}
