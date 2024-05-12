using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    public interface IPaint
    {
        double UnitPrice { get; set; }
        double CalculatePaintCost();
    }
}
