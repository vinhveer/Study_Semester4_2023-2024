using System;
using System.Collections.Generic;

namespace Bai3
{
    internal class Program
    {
        static List<Vehicle> vehicles = new List<Vehicle>();

        public static void Input()
        {
            Console.Write("Enter number of vehicles: ");
            int n;
            while (!int.TryParse(Console.ReadLine(), out n) || n < 2 || n > 20)
            {
                Console.WriteLine("Number of vehicles must be a positive number");
                Console.Write("Enter number of vehicles: ");
            }

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine("Enter vehicle {0} information", i + 1);
                Console.WriteLine("1: Car");
                Console.WriteLine("2: Motorbike");
                Console.Write("Enter vehicle type: ");
                byte vehicleType;
                while (!byte.TryParse(Console.ReadLine(), out vehicleType) || vehicleType < 1 || vehicleType > 2)
                {
                    Console.WriteLine("Invalid input");
                    Console.Write("Enter vehicle type (1: Car, 2: Motorbike): ");
                }

                switch (vehicleType)
                {
                    case 1:
                        Car car = new Car();
                        car.Input();
                        vehicles.Add(car);
                        break;
                    case 2:
                        MotorBike motorBike = new MotorBike();
                        motorBike.Input();
                        vehicles.Add(motorBike);
                        break;
                }
            }
        }

        public static void Output()
        {
            foreach (Vehicle vehicle in vehicles)
            {
                vehicle.Output();
                Console.WriteLine("Registration fee: {0}", vehicle.RegistrationFee());
            }
        }

        public static int CountMotorBike()
        {
            int count = 0;
            foreach (Vehicle vehicle in vehicles)
            {
                if (vehicle is MotorBike)
                {
                    count++;
                }
            }
            return count;
        }

        public static double AverageCarRegistrationFee()
        {
            double sum = 0;
            int count = 0;
            foreach (Vehicle vehicle in vehicles)
            {
                if (vehicle is Car)
                {
                    sum += vehicle.RegistrationFee();
                    count++;
                }
            }
            return count == 0 ? 0 : sum / count;
        }

        static void Main(string[] args)
        {
            Input();
            Output();
            Console.WriteLine("Number of motorbikes: {0}", CountMotorBike());
            Console.WriteLine("Average car registration fee: {0}", AverageCarRegistrationFee());
        }
    }
}
