using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai3
{
    internal class InterDistrictBusTicket : BusTicket, IMonthlyTicket
    {
        public int RouteLength { get; set; }
        public int MonthCount { get; set; }

        public override void Input()
        {
            base.Input();
            Console.Write("Enter route length: ");
            RouteLength = int.Parse(Console.ReadLine());
            Console.Write("Enter month count: ");
            MonthCount = int.Parse(Console.ReadLine());
        }

        public override void Output()
        {
            base.Output();
            Console.WriteLine($"Route length: {RouteLength}");
            Console.WriteLine($"Month count: {MonthCount}");
            Console.WriteLine($"Price: {CalculatePrice()}");
        }

        public override float CalculatePrice()
        {
            return base.CalculatePrice() - CalculateDiscount();
        }

        public float CalculateDiscount()
        {
            return MonthCount >= 3 && RouteLength >= 20 ? base.CalculatePrice() * 0.15f : base.CalculatePrice() * 0.1f;
        }
    }
}
