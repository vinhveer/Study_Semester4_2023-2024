using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2
{
    internal class SmartPhone : Phone, IComparable<SmartPhone>
    {
        private int phoneStorage;

        public SmartPhone()
        {
        }

        public SmartPhone(int phoneId, string phoneName, double phonePrice, DateTime productionYear, int phoneStorage) : base(phoneId, phoneName, phonePrice, productionYear)
        {
            this.phoneStorage = phoneStorage;
        }

        public override void Input()
        {
            base.Input();
            Console.Write("Enter phone storage: ");
            while (!int.TryParse(Console.ReadLine(), out phoneStorage) || phoneStorage <= 0)
            {
                Console.WriteLine("Phone storage must be a positive number");
                Console.Write("Enter phone storage: ");
            }
        }

        public override void Output()
        {
            base.Output();
            Console.WriteLine("Phone storage: {0}", phoneStorage);
        }

        public double CalculatePrice()
        {
            if (phoneStorage >= 128)
            {
                return 1.2f * phonePrice + Discount();
            }
            else if (phoneStorage >= 16)
            {
                return 1.1f * phonePrice + Discount();
            }
            else
            {
                return 1.05f * phonePrice + Discount();
            }
        }

        public int CompareTo(SmartPhone other)
        {
            if (phonePrice < other.phonePrice)
            {
                return 1;
            }
            else if (phonePrice > other.phonePrice)
            {
                return 0;
            }
            else
            {
                return -1;
            }
        }
    }
}
