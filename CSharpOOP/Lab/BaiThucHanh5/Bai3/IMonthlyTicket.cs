using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai3
{
    internal interface IMonthlyTicket
    {
        int MonthCount { get; set; }
        float CalculateDiscount();
    }
}
