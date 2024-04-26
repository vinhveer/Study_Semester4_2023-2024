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
            Console.OutputEncoding = Encoding.UTF8;
            Console.InputEncoding = Encoding.UTF8;

            Console.Write("Enter number of vouchers: ");
            int n;
            while (!int.TryParse(Console.ReadLine(), out n) || n <= 0)
            {
                Console.Write("Invalid! Enter number of vouchers again: ");
            }

            List<Voucher> vouchers = new List<Voucher>();
            for (int i = 0; i < n; i++)
            {
                Voucher voucher = new Voucher();
                voucher.Input();
                vouchers.Add(voucher);
            }

            Console.WriteLine("Vouchers:");
            foreach (Voucher voucher in vouchers)
            {
                Console.WriteLine(voucher);
            }

            int countFirstQuarter = vouchers.Count(v => v.IsInFirstQuarter());
            Console.WriteLine($"Number of vouchers in the first quarter of 2024: {countFirstQuarter}");

            double averagePrice = vouchers.Average(v => v.CalculateTotalPrice());
            Console.WriteLine($"Average price of {n} vouchers: {averagePrice}");
        }
    }
}
