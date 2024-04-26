using System;

namespace Bai3
{
    internal class Car : Vehicle
    {
        private byte carType;

        public Car()
        {
        }

        public Car(string vehicleName, string vehicleColor, double vehiclePrice, byte carType) : base(vehicleName, vehicleColor, vehiclePrice)
        {
            this.carType = carType;
        }

        public new void Input()
        {
            base.Input();
            Console.WriteLine("Enter car type: ");
            Console.WriteLine("1: Car less than 9 gasoline seats");
            Console.WriteLine("2: Electric vehicle");
            Console.WriteLine("3: Other vehicle types");
            while (!byte.TryParse(Console.ReadLine(), out carType) || carType < 1 || carType > 3)
            {
                Console.WriteLine("Invalid input");
                Console.Write("Enter car type (1: Sedan, 2: SUV, 3: Coupe): ");
            }
        }

        public new void Output()
        {
            base.Output();
            Console.WriteLine("Car type: {0}", carType);
        }

        public new double RegistrationFee()
        {
            switch (carType)
            {
                case 1:
                    return vehiclePrice + vehiclePrice * 0.1;
                case 2:
                    return vehiclePrice;
                default:
                    return vehiclePrice + vehiclePrice * 0.02;
            }
        }
    }
}
