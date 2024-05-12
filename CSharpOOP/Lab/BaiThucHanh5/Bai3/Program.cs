using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<InterDistrictBusTicket> tickets = new List<InterDistrictBusTicket>();

            // Input tickets
            foreach (var ticket in tickets)
            {
                ticket.Input();
            }

            // Output tickets
            foreach (var ticket in tickets)
            {
                ticket.Output();
            }

            // Count and print the number of tickets with route length in range [a, b]
            int a = 10, b = 20;
            int count = tickets.Count(x => x.RouteLength >= a && x.RouteLength <= b);
            Console.WriteLine($"Number of tickets with route length in range [{a}, {b}]: {count}");

            tickets.RemoveAll(x => x.Route == 1); // Remove all tickets with route 1
        }
    }
}
