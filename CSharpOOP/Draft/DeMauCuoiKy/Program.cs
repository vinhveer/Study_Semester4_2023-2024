using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeMauCuoiKy
{
    internal class Program
    {
        static List<MatHangNhapKhau> matHangNhapKhaus = new List<MatHangNhapKhau>();

        static void Nhap()
        {
            int n;
            Console.Write("Nhap so luong mat hang: ");
            while (!int.TryParse(Console.ReadLine(), out n) == false && n < 0 || n >= 30 )
            {
                Console.WriteLine("So luong khong hop le, hay nhap lai!");
            }

            for (int i = 0; i < n; i++)
            {
                MatHangNhapKhau matHangNhapKhau = new MatHangNhapKhau();
                matHangNhapKhau.NhapMatHang();
                matHangNhapKhaus.Add(matHangNhapKhau);
            }
            
        }

        static void Xuat()
        {
            foreach (MatHangNhapKhau matHang in matHangNhapKhaus) 
            {
                matHang.XuatMatHang();
            }
        }

        static double TongMatHang()
        {
            double sum = 0;
            foreach (MatHangNhapKhau matHang in matHangNhapKhaus)
            {
                if (matHang.ngayNhap.Year == 2023)
                {
                    sum += matHang.TinhGiaBan();
                }
            }

            return sum;
        }

        static double TrungBinhThue()
        {
            double sum = 0;
            double count = 0;
            foreach (MatHangNhapKhau matHang in matHangNhapKhaus)
            {
                sum += matHang.TinhTienThue();
                count++;
            }

            return sum / count;
        }

        static void Main(string[] args)
        {
            Nhap();
            Xuat();
            Console.WriteLine($"Tong gia ban mat hang: {TongMatHang()}");
            Console.WriteLine($"Trung binh thue mat hang: {TrungBinhThue()}");
        }
    }
}
