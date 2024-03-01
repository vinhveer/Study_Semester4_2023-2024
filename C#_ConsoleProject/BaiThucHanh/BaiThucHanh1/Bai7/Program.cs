using System;

namespace Bai7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Process process = new Process();
            process.InputArray();
            process.SortArrayAscending();
            process.PrintSortedArray();
            process.PrintPrimeCount();
        }
    }
}
