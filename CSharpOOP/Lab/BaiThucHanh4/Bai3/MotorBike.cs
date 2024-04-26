using System;

namespace Bai3
{
    internal class MotorBike : Vehicle
    {
        private bool isFirstRegistration;

        public MotorBike()
        {
        }

        public MotorBike(string vehicleName, string vehicleColor, double vehiclePrice, bool isFirstRegistration) : base(vehicleName, vehicleColor, vehiclePrice)
        {
            this.isFirstRegistration = isFirstRegistration;
        }

        public new void Input()
        {
            base.Input();
            Console.Write("Is first registration? (true/false): ");
            while (!bool.TryParse(Console.ReadLine(), out isFirstRegistration))
            {
                Console.WriteLine("Invalid input");
                Console.Write("Is first registration? (true/false): ");
            }
        }

        public new void Output()
        {
            base.Output();
            Console.WriteLine("Is first registration: {0}", isFirstRegistration);
        }

        public new double RegistrationFee()
        {
            return vehiclePrice + (isFirstRegistration ? vehiclePrice * 0.05 : vehiclePrice * 0.01);
        }
    }
}
