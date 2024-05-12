using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Macbook : Computer
    {
        public string Type { get; set; }

        public Macbook() : base() { }

        public Macbook(string brand, int ram, int memory, double price, string type) : base(brand, ram, memory, price)
        {
            Type = type;
        }

        public override void Input()
        {
            base.Input();
            Console.Write("Enter type: ");
            Type = Console.ReadLine();
        }

        public override double CalculateSalePrice()
        {
            switch (Type)
            {
                case "MacBook Air":
                    return Price + Price * 0.5;
                case "MacBook Pro 13 inch":
                    return Price + Price * 0.8;
                case "MacBook Pro 16 inch":
                    return 2 * Price;
                default:
                    return Price;
            }
        }
    }
}
