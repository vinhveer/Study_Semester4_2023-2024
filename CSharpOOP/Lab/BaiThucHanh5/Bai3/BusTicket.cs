using System;

namespace Bai3
{
    public class BusTicket
    {
        public int Route { get; set; }
        public static int BasePrice { get; } = 5000;
        public string Category { get; set; }

        public virtual void Input()
        {
            Console.Write("Enter route: ");
            Route = int.Parse(Console.ReadLine());
            Console.Write("Enter category: ");
            Category = Console.ReadLine();
        }

        public virtual void Output()
        {
            Console.WriteLine($"Route: {Route}");
            Console.WriteLine($"Category: {Category}");
            Console.WriteLine($"Price: {CalculatePrice()}");
        }

        public virtual float CalculatePrice()
        {
            return Category == "student" ? BasePrice : BasePrice * 1.2f;
        }
    }
}
