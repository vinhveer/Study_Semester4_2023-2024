using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeMauCuoiKy
{
    abstract class MatHang
    {
        protected int maSo;
        protected string tenHang;
        protected double donGiaNhap;

        public MatHang()
        {
        }

        public MatHang(int maSo, string tenHang, double donGiaNhap)
        {
            this.maSo = maSo;
            this.tenHang = tenHang;
            this.donGiaNhap = donGiaNhap;
        }

        public virtual void NhapMatHang()
        {
            Console.Write("Nhap ma so: ");
            while (!int.TryParse(Console.ReadLine(), out maSo))
            {
                Console.WriteLine("Ma so khong hop le! Nhap lai ma so!");
            }

            do
            {
                Console.Write("Nhap ten hang: ");
                tenHang = Console.ReadLine();
            } while (tenHang.Length < 0);

            Console.WriteLine("Nhap don gia: ");
            while (!double.TryParse(Console.ReadLine(),out donGiaNhap))
            {
                Console.WriteLine("Don gia khong hop le, nhap lai!");
            }
        }

        public virtual void XuatMatHang()
        {
            Console.WriteLine($"Ma so: {maSo}");
            Console.WriteLine($"Ten hang: {tenHang}");
            Console.WriteLine($"Don gia: {donGiaNhap}");
        }

        public virtual double TinhGiaBan()
        {
            return donGiaNhap * 1.2;
        }
    }
}
