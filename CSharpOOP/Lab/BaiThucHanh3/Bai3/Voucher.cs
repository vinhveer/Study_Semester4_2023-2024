using System;

namespace Bai3
{
    internal class Voucher
    {
        private int roomId;
        private string customerName;
        private DateTime checkIn;
        private DateTime checkOut;
        private byte type;
        private static double price = 300;

        public Voucher() { }

        public Voucher(int roomId, string customerName, DateTime checkIn, DateTime checkOut, byte type)
        {
            this.roomId = roomId;
            this.customerName = customerName;
            this.checkIn = checkIn;
            this.checkOut = checkOut;
            this.type = type;
        }

        public void Input()
        {
            Console.Write("Enter room ID: ");
            while (!int.TryParse(Console.ReadLine(), out roomId) || roomId <= 0)
            {
                Console.Write("Invalid! Enter room ID again: ");
            }

            Console.Write("Enter customer name: ");
            customerName = Console.ReadLine();

            Console.Write("Enter check-in date (dd/mm/yyyy): ");
            while (!DateTime.TryParseExact(Console.ReadLine(), "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out checkIn))
            {
                Console.Write("Invalid! Enter check-in date again (dd/mm/yyyy): ");
            }

            Console.Write("Enter check-out date (dd/mm/yyyy): ");
            while (!DateTime.TryParseExact(Console.ReadLine(), "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out checkOut) || checkOut <= checkIn)
            {
                Console.Write("Invalid! Enter check-out date again (dd/mm/yyyy): ");
            }
        }

        public double CalculateTotalPrice()
        {
            double total = (checkOut - checkIn).TotalDays * price;
            if (type == 1)
            {
                total *= 1.5f;
            } 
            else if (type == 2)
            {
                total *= 1.3f;
            }
            return total;
        }

        public void Info()
        {
            Console.WriteLine($"Room ID: {roomId}");
            Console.WriteLine($"Customer name: {customerName}");
            Console.WriteLine($"Check-in date: {checkIn.ToString("dd/MM/yyyy")}");
            Console.WriteLine($"Check-out date: {checkOut.ToString("dd/MM/yyyy")}");
            Console.WriteLine($"Total price: {CalculateTotalPrice()}");
        }

        public static Boolean operator <(Voucher v1, Voucher v2)
        {
            return v1.CalculateTotalPrice() < v2.CalculateTotalPrice();
        }

        public static Boolean operator >(Voucher v1, Voucher v2)
        {
            return v1.CalculateTotalPrice() > v2.CalculateTotalPrice();
        }

        public static double operator +(double d, Voucher v)
        {
            return d + v.CalculateTotalPrice();
        }

        public bool IsInFirstQuarter()
        {
            return checkIn.Year == 2024 && checkIn.Month >= 1 && checkIn.Month <= 3;
        }
    }
}
