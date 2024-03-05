using System;

namespace Vidu32
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SinhVien sinhvien = new SinhVien();
            sinhvien.Nhap();
            sinhvien.HienThiThongTin();

            sinhvien.InKetQuaHocPhan();

            sinhvien.TrungBinhChung();
            sinhvien.TrungBinhTichLuy();
            sinhvien.XetTotNghiep();

            Console.ReadLine();
        }
    }
}
