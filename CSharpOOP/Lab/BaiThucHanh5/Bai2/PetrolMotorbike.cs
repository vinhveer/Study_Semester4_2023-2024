using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2
{
    internal class PetrolMotorbike : Motorbike
    {
        private float engineCapacity;

        public PetrolMotorbike(string licensePlate, int registrationYear, float engineCapacity) : base(licensePlate, registrationYear)
        {
            this.engineCapacity = engineCapacity;
        }

        public PetrolMotorbike() { }

        public override void Input()
        {
            base.Input();

            Console.Write("Enter engine capacity: ");
            while (!float.TryParse(Console.ReadLine(), out engineCapacity) || engineCapacity < 0)
            {
                Console.WriteLine("Invalid engine capacity. Please enter again.");
                Console.Write("Enter engine capacity: ");
            }
        }

        public override int WarrantyExpirationCalculate()
        {
            return RegistrationYear + 2;
        }
    }
}
