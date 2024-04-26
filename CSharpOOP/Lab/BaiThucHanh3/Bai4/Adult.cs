using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    internal class Adult
    {
        private string fullName;
        private double weight;
        private double height;

        // Default constructor
        public Adult()
        {
            fullName = "";
            weight = 0;
            height = 0;
        }

        // Parameterized constructor
        public Adult(string fullName, double weight, double height)
        {
            this.fullName = fullName;
            this.weight = weight;
            this.height = height;
        }

        // Copy constructor
        public Adult(Adult other)
        {
            fullName = other.fullName;
            weight = other.weight;
            height = other.height;
        }

        // Display person information and health status based on BMI index
        public void DisplayInformation()
        {
            Console.OutputEncoding = Encoding.UTF8;
            Console.BackgroundColor = ConsoleColor.DarkBlue;
            Console.ForegroundColor = ConsoleColor.White;

            Console.Clear();
            Console.WriteLine("Person information:");
            Console.WriteLine($"Full name: {fullName}");
            Console.WriteLine($"Weight: {weight} kg");
            Console.WriteLine($"Height: {height} m");

            double bmi = CalculateBMI();
            Console.WriteLine($"BMI index: {bmi}");

            if (bmi < 18.5)
            {
                Console.WriteLine("Health status: Underweight");
                double weightToGain = CalculateWeightToGain(18.5);
                Console.WriteLine($"Weight to gain: {weightToGain} kg");
            }
            else if (bmi >= 18.5 && bmi < 24.9)
            {
                Console.WriteLine("Health status: Normal");
            }
            else if (bmi >= 24.9 && bmi < 29.9)
            {
                Console.WriteLine("Health status: Overweight");
                double weightToLose = CalculateWeightToLose(24.9);
                Console.WriteLine($"Weight to lose: {weightToLose} kg");
            }
            else
            {
                Console.WriteLine("Health status: Obese");
                double weightToLose = CalculateWeightToLose(24.9);
                Console.WriteLine($"Weight to lose: {weightToLose} kg");
            }
        }

        // Calculate BMI index
        public double CalculateBMI()
        {
            return weight / (height * height);
        }

        // Calculate weight to gain for good health
        private double CalculateWeightToGain(double targetBMI)
        {
            return targetBMI * height * height - weight;
        }

        // Calculate weight to lose for good health
        private double CalculateWeightToLose(double targetBMI)
        {
            return weight - targetBMI * height * height;
        }
    }
}
