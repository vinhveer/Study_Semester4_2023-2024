using System;
using System.Collections.Generic;

namespace Bai3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<PhieuLuuTru> danhSachPhieu = new List<PhieuLuuTru>();

            // Nhập n phiếu lưu trú (1 < n < 30)
            int n;
            do
            {
                Console.Write("Nhập số lượng phiếu lưu trú (1 < n < 30): ");
            } while (!int.TryParse(Console.ReadLine(), out n) || n <= 0 || n >= 30);

            for (int i = 0; i < n; i++)
            {
                PhieuLuuTru phieu = new PhieuLuuTru();
                phieu.NhapThongTin();
                danhSachPhieu.Add(phieu);
            }

            // Xuất thông tin n phiếu ra màn hình theo thứ tự giảm dần của số ngày ở
            danhSachPhieu.Sort((a, b) => b.SoNgay0.CompareTo(a.SoNgay0));
            Console.WriteLine("\nThông tin các phiếu lưu trú theo số ngày ở giảm dần:");
            foreach (var phieu in danhSachPhieu)
            {
                phieu.XuatThongTin();
                Console.WriteLine();
            }

            // Đếm và xuất ra màn hình số lượng phiếu lưu trú trong quý 1 năm 2024
            int countQuy1 = 0;
            foreach (var phieu in danhSachPhieu)
            {
                if (phieu.NgayDen.Year == 2024 && phieu.NgayDen.Month >= 1 && phieu.NgayDen.Month <= 3)
                    countQuy1++;
            }
            Console.WriteLine($"\nSố lượng phiếu lưu trú trong quý 1 năm 2024: {countQuy1}");

            // Tính và in ra màn hình tiền phòng trung bình của n phiếu lưu trú
            double tongTienPhong = 0;
            foreach (var phieu in danhSachPhieu)
            {
                tongTienPhong += phieu.TinhTienPhong();
            }
            double tienPhongTrungBinh = tongTienPhong / n;
            Console.WriteLine($"Tiền phòng trung bình của {n} phiếu lưu trú: {tienPhongTrungBinh}");
        }
    }
}
