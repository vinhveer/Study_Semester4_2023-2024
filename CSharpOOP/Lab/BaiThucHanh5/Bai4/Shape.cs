using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai4
{
    public abstract class Shape
    {
        public string Name { get; set; }

        public abstract void Set();
        public abstract double CalculateArea();
    }
}
