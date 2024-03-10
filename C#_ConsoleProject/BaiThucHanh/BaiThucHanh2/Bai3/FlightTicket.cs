using System;

namespace Bai3
{
    internal class FlightTicket
    {
        private string flightNumber;
        private string flightName;
        private DateTime departureDate;
        private float ticketPrice;
        private bool seatAvailable;

        public FlightTicket()
        {
            flightNumber = "VN123";
            flightName = "Nha Trang - Ha Noi";
            departureDate = DateTime.Today;
            ticketPrice = 500;
            seatAvailable = false;
        }

        public FlightTicket(string flightName, DateTime departureDate, bool seatAvailable)
        {
            this.flightName = flightName;
            this.departureDate = departureDate;
            this.seatAvailable = seatAvailable;
            this.flightNumber = "VN123";
            this.ticketPrice = 500;
        }
        
        public float TicketPrice
        {
            get => ticketPrice;
            set => ticketPrice = value;
        }

        public void Input()
        {
            Console.WriteLine("Enter flight number: ");
            flightNumber = Console.ReadLine();
            Console.WriteLine("Enter flight name: ");
            flightName = Console.ReadLine();
            Console.WriteLine("Enter departure date: ");
            departureDate = DateTime.Parse(Console.ReadLine());
            Console.WriteLine("Enter ticket price: ");
            ticketPrice = float.Parse(Console.ReadLine());
            Console.WriteLine("Enter seat available: ");
            seatAvailable = bool.Parse(Console.ReadLine());
        }

        public float CalculatePrice()
        {
            if (seatAvailable)
            {
                return ticketPrice + 350 + 50;
            }
            else
            {
                return ticketPrice + 350;
            }
        }
        
        public void Print()
        {
            Console.WriteLine("Flight Number: " + flightNumber);
            Console.WriteLine("Flight Name: " + flightName);
            Console.WriteLine("Departure Date: " + departureDate);
            Console.WriteLine("Ticket Price: " + ticketPrice);
            Console.WriteLine("Seat Available: " + seatAvailable);
        }
    }
}