﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Invoice invoice = new Invoice();

            invoice.Input();

            invoice.Info();
        }
    }
}
