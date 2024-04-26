using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Fraction ps1 = new Fraction(1, 2);
            Fraction ps2 = new Fraction(3, 4);

            Fraction tong = ps1.Cong(ps2);
            Fraction hieu = ps1.Tru(ps2);
            Fraction tich = ps1.Nhan(ps2);
            Fraction thuong = ps1.Chia(ps2);

            Console.WriteLine("Phan So 1: ");
            ps1.Xuat();

            Console.WriteLine("Phan So 2: ");
            ps2.Xuat();

            Console.WriteLine("Tong: ");
            tong.Xuat();

            Console.WriteLine("Hieu: ");
            hieu.Xuat();

            Console.WriteLine("Tich: ");
            tich.Xuat();

            Console.WriteLine("Thuong: ");
            if (thuong != null)
                thuong.Xuat();
        }
    }
}
