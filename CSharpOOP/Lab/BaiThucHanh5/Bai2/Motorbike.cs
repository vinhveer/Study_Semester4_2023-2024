using System;

namespace Bai2
{
    abstract internal class Motorbike
    {
        private string licensePlate;
        private int registrationYear;

        public string LicensePlate { get => licensePlate; set => licensePlate = value; }
        public int RegistrationYear { get => registrationYear; set => registrationYear = value; }

        public Motorbike(string licensePlate, int registrationYear)
        {
            this.licensePlate = licensePlate;
            this.registrationYear = registrationYear;
        }

        public Motorbike() { }

        public virtual void Input()
        {
            Console.Write("Enter license plate: ");
            licensePlate = Console.ReadLine();

            Console.Write("Enter registration year: ");
            while (!int.TryParse(Console.ReadLine(), out registrationYear) || registrationYear < 0)
            {
                Console.WriteLine("Invalid registration year. Please enter again.");
                Console.Write("Enter registration year: ");
            }
        }

        public abstract int WarrantyExpirationCalculate();

        public void Output()
        {
            Console.WriteLine($"License plate: {licensePlate}");
            Console.WriteLine($"Registration year: {registrationYear}");
            Console.WriteLine($"Warranty expiration year: {WarrantyExpirationCalculate()}");
        }
    }
}
