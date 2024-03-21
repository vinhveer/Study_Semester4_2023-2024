using System;

namespace Bai3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            FlightTicket ticket1 = new FlightTicket("Hanoi", "Ho Chi Minh City", 1000000);
            FlightTicket ticket2 = new FlightTicket();

            ticket2.Input();

            Console.WriteLine("Ticket 1:");
            ticket1.Output();

            Console.WriteLine("Ticket 2:");
            ticket2.Output();

            FlightTicket maxPriceTicket = ticket1.CalculatePrice() > ticket2.CalculatePrice() ? ticket1 : ticket2;
            Console.WriteLine("Ticket with the highest price:");
            maxPriceTicket.Output();
        }
    }
}
