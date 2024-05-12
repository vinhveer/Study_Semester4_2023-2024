using System;
using System.Collections.Generic;

namespace Bai2
{
    internal class MotorbikeList
    {
        private readonly List<Motorbike> motorbikeList;

        public MotorbikeList()
        {
            motorbikeList = new List<Motorbike>();
        }

        // Method to get user input
        private int GetUserInput(string message, int minValue, int maxValue)
        {
            int choice;
            do
            {
                Console.Write(message);
            } while (!int.TryParse(Console.ReadLine(), out choice) || choice < minValue || choice > maxValue);
            return choice;
        }

        public void Input()
        {
            int n = GetUserInput("Enter number of motorbikes: ", 1, int.MaxValue);

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Enter information of motorbike {i + 1}");
                int choice = GetUserInput("Enter 1 for petrol motorbike, 2 for electric motorbike: ", 1, 2);

                if (choice == 1)
                {
                    PetrolMotorbike petrolMotorbike = new PetrolMotorbike();
                    petrolMotorbike.Input();
                    motorbikeList.Add(petrolMotorbike);
                }
                else
                {
                    ElectricMotorbike electricMotorbike = new ElectricMotorbike();
                    electricMotorbike.Input();
                    motorbikeList.Add(electricMotorbike);
                }
            }
        }

        public void Display()
        {
            foreach (Motorbike motorbike in motorbikeList)
            {
                motorbike.Output();
            }
        }

        public void CountExpiredWarranty()
        {
            int count = 0;
            foreach (Motorbike motorbike in motorbikeList)
            {
                if (motorbike.WarrantyExpirationCalculate() < DateTime.Now.Year)
                {
                    count++;
                }
            }
            Console.WriteLine($"Number of motorbikes that have expired warranty: {count}");
        }
    }
}
