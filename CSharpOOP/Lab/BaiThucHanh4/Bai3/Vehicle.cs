using System;

namespace Bai3
{
    internal class Vehicle
    {
        protected string vehicleName;
        protected string vehicleColor;
        protected double vehiclePrice;

        public Vehicle()
        {
        }

        public Vehicle(string vehicleName, string vehicleColor, double vehiclePrice)
        {
            this.vehicleName = vehicleName;
            this.vehicleColor = vehicleColor;
            this.vehiclePrice = vehiclePrice;
        }

        public void Input()
        {
            Console.Write("Enter vehicle name: ");
            vehicleName = Console.ReadLine();
            Console.Write("Enter vehicle color: ");
            vehicleColor = Console.ReadLine();
            Console.Write("Enter vehicle price: ");
            while (!double.TryParse(Console.ReadLine(), out vehiclePrice) || vehiclePrice <= 0)
            {
                Console.WriteLine("Vehicle price must be a positive number");
                Console.Write("Enter vehicle price: ");
            }
        }

        public void Output()
        {
            Console.WriteLine("Vehicle name: {0}", vehicleName);
            Console.WriteLine("Vehicle color: {0}", vehicleColor);
            Console.WriteLine("Vehicle price: {0}", vehiclePrice);
        }

        public double RegistrationFee()
        {
            return 0;
        }
    }
}
