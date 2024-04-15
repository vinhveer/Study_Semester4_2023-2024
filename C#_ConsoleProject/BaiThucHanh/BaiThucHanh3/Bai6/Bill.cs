using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai6
{
    internal class Bill
    {
        private string name;
        private byte num;
        public static float price = 10.5f;

        public Bill()
        {
            name = "Dell Latitude E7440";
            num = 1;
            price = 9.5f;
        }

        public Bill(string na, byte n, float p)
        {
            name = na;
            num = n;
            price = p;
        }

        public float CalBill()
        {
            return num * price;
        }

        public void Print()
        {
            Console.Write($"{name}\t{num}\t{CalBill()}");
        }
    }
}
