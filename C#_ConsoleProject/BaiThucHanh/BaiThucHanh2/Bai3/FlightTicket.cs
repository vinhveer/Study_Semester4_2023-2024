using System;

namespace Bai3
{
    internal class FlightTicket
    {
        private string flightNumber;
        private string flightName;
        private DateTime departureDate;
        private double ticketPrice;
        private bool seatAvailability;

        public string FlightNumber { get => flightNumber; set => flightNumber = value; }
        public string FlightName { get => flightName; set => flightName = value; }
        public DateTime DepartureDate { get => departureDate; set => departureDate = value; }
        public double TicketPrice { get => ticketPrice; set => ticketPrice = value; }
        public bool SeatAvailability { get => seatAvailability; set => seatAvailability = value; }

        public FlightTicket(string flightNumber, string flightName, DateTime departureDate, double ticketPrice, bool seatAvailability)
        {
            this.FlightNumber = flightNumber;
            this.FlightName = flightName;
            this.DepartureDate = departureDate;
            this.TicketPrice = ticketPrice;
            this.SeatAvailability = seatAvailability;
        }

        public FlightTicket()
        {
        }

        public void CaculateTicketPrice()
        {
            if (this.SeatAvailability)
            {
                this.TicketPrice = this.TicketPrice + 350 + 50;
                Console.WriteLine("Ticket price: " + this.TicketPrice);
            }
        }

        public void Show()
        {
            Console.WriteLine($"Ten chuyen bay: {this.flightName}, ngay bay: {this.departureDate}, so tien: {this.ticketPrice}");
        }
    }
}
