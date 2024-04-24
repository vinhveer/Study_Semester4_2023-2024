using System;

namespace Bai2
{
    internal class Phone
    {
        protected int phoneId;
        private string phoneName;
        protected double phonePrice;
        protected DateTime productionYear;

        public string PhoneName { get => phoneName; set => phoneName = value; }

        public Phone()
        {
        }

        public Phone(int phoneId, string phoneName, double phonePrice, DateTime productionYear)
        {
            this.phoneId = phoneId;
            this.PhoneName = phoneName;
            this.phonePrice = phonePrice;
            this.productionYear = productionYear;
        }

        public virtual void Input()
        {
            Console.Write("Enter phone id: ");
            while (!int.TryParse(Console.ReadLine(), out phoneId))
            {
                Console.WriteLine("Phone id must be a number");
                Console.Write("Enter phone id: ");
            }

            Console.Write("Enter phone name: ");
            PhoneName = Console.ReadLine();

            Console.Write("Enter phone price: ");
            while (!double.TryParse(Console.ReadLine(), out phonePrice))
            {
                Console.WriteLine("Phone price must be a number");
                Console.Write("Enter phone price: ");
            }

            Console.Write("Enter production year: ");
            while (!DateTime.TryParse(Console.ReadLine(), out productionYear))
            {
                Console.WriteLine("Production year must be a date");
                Console.Write("Enter production year: ");
            }
        }

        public virtual void Output()
        {
            Console.WriteLine("Phone id: {0}", phoneId);
            Console.WriteLine("Phone name: {0}", PhoneName);
            Console.WriteLine("Phone price: {0}", phonePrice);
            Console.WriteLine("Production year: {0}", productionYear);
        }

        public double Discount()
        {
            if (PhoneName == "iPhone")
            {
                return phonePrice *= 0.1;
            }
            else
            {
                return phonePrice *= 0.05;
            }
        }
    }
}
