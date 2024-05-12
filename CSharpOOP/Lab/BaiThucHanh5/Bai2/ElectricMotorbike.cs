using System;

namespace Bai2
{
    internal class ElectricMotorbike : Motorbike
    {
        private float batteryCapacity;

        public ElectricMotorbike(string licensePlate, int registrationYear, float batteryCapacity) : base(licensePlate, registrationYear)
        {
            this.batteryCapacity = batteryCapacity;
        }

        public ElectricMotorbike() { }

        public override void Input()
        {
            base.Input();

            Console.Write("Enter battery capacity: ");
            while (!float.TryParse(Console.ReadLine(), out batteryCapacity) || batteryCapacity < 0)
            {
                Console.WriteLine("Invalid battery capacity. Please enter again.");
                Console.Write("Enter battery capacity: ");
            }
        }

        public override int WarrantyExpirationCalculate()
        {
            return RegistrationYear + 3;
        }
    }
}
