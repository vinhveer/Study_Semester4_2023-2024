using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            LinearEquation linearEquation = new LinearEquation();
            linearEquation.Input();
            linearEquation.Output();
            linearEquation.Solve();

            QuadraticEquation quadraticEquation = new QuadraticEquation();
            quadraticEquation.Input();
            quadraticEquation.Output();
            quadraticEquation.Solve();
        }
    }
}
