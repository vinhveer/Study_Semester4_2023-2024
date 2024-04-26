using System;

namespace Bai1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Time time1 = new Time(7, 30, 45);
            Time time2 = new Time();
            time1.Display();
            time2.Display();

            time2.SetHour(10);

            int d = (time1.GetHour() - time2.GetHour()) * 3600 + (time1.Minute - time2.Minute) * 60 + time1.Second - time2.Second;
            d = Math.Abs(d);
            Console.WriteLine($"Khoang cach t1 - t2 la: {d} giay");
        }
    }
}
