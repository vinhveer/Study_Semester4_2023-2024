using System;

namespace Bai3
{
    internal class PhieuLuuTru
    {
        public int SoPhong { get; set; }
        public string HoTenKhach { get; set; }
        public DateTime NgayDen { get; set; }
        public DateTime NgayDi { get; set; }
        public int LoaiPhong { get; set; }
        public object SoNgay0 { get; internal set; }

        private const int GiaSan = 300;

        public PhieuLuuTru() { }

        public PhieuLuuTru(int soPhong, string hoTenKhach, DateTime ngayDen, DateTime ngayDi, int loaiPhong)
        {
            SoPhong = soPhong;
            HoTenKhach = hoTenKhach;
            NgayDen = ngayDen;
            NgayDi = ngayDi;
            LoaiPhong = loaiPhong;
        }

        public void NhapThongTin()
        {
            Console.Write("Số phòng: ");
            SoPhong = int.Parse(Console.ReadLine());
            Console.Write("Họ tên khách: ");
            HoTenKhach = Console.ReadLine();
            Console.Write("Ngày đến (dd/MM/yyyy): ");
            NgayDen = DateTime.ParseExact(Console.ReadLine(), "dd/MM/yyyy", null);
            Console.Write("Ngày đi (dd/MM/yyyy): ");
            NgayDi = DateTime.ParseExact(Console.ReadLine(), "dd/MM/yyyy", null);
            Console.Write("Loại phòng (1, 2, 3): ");
            LoaiPhong = int.Parse(Console.ReadLine());
        }

        public double TinhTienPhong()
        {
            int soNgay = (int)(NgayDi - NgayDen).TotalDays;
            double giaPhong;

            if (soNgay > 0)
            {
                if (LoaiPhong == 1)
                    giaPhong = 1.5 * GiaSan;
                else if (LoaiPhong == 2)
                    giaPhong = 1.3 * GiaSan;
                else
                    giaPhong = GiaSan;
                return soNgay * giaPhong;
            }
            else
            {
                return 0;
            }
        }

        public void XuatThongTin()
        {
            double giaPhong = TinhTienPhong();
            Console.WriteLine($"Số phòng: {SoPhong}");
            Console.WriteLine($"Họ tên khách: {HoTenKhach}");
            Console.WriteLine($"Ngày đến: {NgayDen.ToString("dd/MM/yyyy")}");
            Console.WriteLine($"Ngày đi: {NgayDi.ToString("dd/MM/yyyy")}");
            Console.WriteLine($"Loại phòng: {LoaiPhong}");
            Console.WriteLine($"Tiền phòng: {giaPhong}");
        }

        public static bool operator <(PhieuLuuTru phieu1, PhieuLuuTru phieu2)
        {
            int soNgayO1 = (int)(phieu1.NgayDi - phieu1.NgayDen).TotalDays;
            int soNgayO2 = (int)(phieu2.NgayDi - phieu2.NgayDen).TotalDays;
            return soNgayO1 < soNgayO2;
        }

        public static bool operator >(PhieuLuuTru phieu1, PhieuLuuTru phieu2)
        {
            int soNgayO1 = (int)(phieu1.NgayDi - phieu1.NgayDen).TotalDays;
            int soNgayO2 = (int)(phieu2.NgayDi - phieu2.NgayDen).TotalDays;
            return soNgayO1 > soNgayO2;
        }

        public int SoNgayO()
        {
            return (int)(NgayDi - NgayDen).TotalDays;
        }
    }
}
