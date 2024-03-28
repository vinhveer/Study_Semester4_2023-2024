using System;

namespace YourNamespace
{
    class Program
    {
        static void Nhap(int n, NhanVien[] nhanViens)
        {
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Nhập thông tin nhân viên thứ {i + 1}:");
                nhanViens[i] = new NhanVien();
                nhanViens[i].NhapThongTin();
            }
        }
        static void Xuat(int n, NhanVien[] nhanViens)
        {
            Console.WriteLine("Nhập hệ số lương của nhân viên cần tìm:");
            double heSoLuong;
            while (!double.TryParse(Console.ReadLine(), out heSoLuong) || heSoLuong < 0)
            {
                Console.WriteLine("Hệ số lương phải là số dương. Hãy nhập lại!");
                Console.Write("Hệ số lương: ");
            }

            Console.WriteLine("Danh sách nhân viên:");
            for (int i = 0; i < n; i++)
            {
                if (nhanViens[i].HeSoLuong == heSoLuong)
                {
                    Console.WriteLine($"Nhân viên thứ {i + 1}:");
                    nhanViens[i].XuatThongTin();
                }
            }
        }

        static void LuongThucNhan(NhanVien[] nhanViens)
        {
            double tongLuongThucNhan = 0;
            foreach (NhanVien nhanVien in nhanViens)
            {
                tongLuongThucNhan += nhanVien.TinhTongLuong();
            }

            Console.WriteLine($"Tổng lương thực nhận của tất cả nhân viên: {tongLuongThucNhan}");
        }

        static void Main(string[] args)
        {
            Console.Write("Nhập số lượng nhân viên: ");
            int n;

            while (!int.TryParse(Console.ReadLine(), out n) || n < 2 && n > 10)
            {
                Console.WriteLine("Giá trị phải nằm trong khoảng từ 2 <= n <= 10. Hãy nhập lại!");
                Console.Write("Nhập số lượng nhân viên: ");
            }

            NhanVien[] nhanViens = new NhanVien[n];

            Nhap(n, nhanViens);
            Xuat(n, nhanViens);
            LuongThucNhan(nhanViens);
        }
    }
}