using System;

namespace Bai3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            FlightTicket ticket = new FlightTicket();
            ticket.Input();
            Console.WriteLine("Price: " + ticket.CalculatePrice());
        }
    }
}
