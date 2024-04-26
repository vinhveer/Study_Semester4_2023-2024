using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Bai8
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // int a = 10, b = 15;
            // Console.Write("{1}, {0}", a, b);
            // Ket qua: 15, 10
               
            // int a = 10, b = 15;
            // Console.Write($"{1}, {0}", a, b);
            // Ket qua: 1, 0
               
            // int a = Console.ReadLine();
            // Console.Write($"{a}");
            // Loi: Cannot implicitly convert type 'string' to 'int'
               
            // int a = 10; bool chk;
            // if (chk)
            //     Console.Write("{0}", a);
            // else
            //     Console.Wrte("false");
            // Loi: 'Console' does not contain a definition for 'Wrte'
               
            int a = 1;
            switch (a)
            {
                case 1:
                case 2:
                case 3: Console.Write("{0}", a); break;
            }
            // Ket qua: 1
        }

    }
}
