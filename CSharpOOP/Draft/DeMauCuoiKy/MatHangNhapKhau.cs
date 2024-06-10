using System;

namespace DeMauCuoiKy
{
    internal class MatHangNhapKhau : MatHang, IThue
    {
        public DateTime ngayNhap = new DateTime(2023, 05, 02);
        public double thueNhapKhau { get; set; }

        public MatHangNhapKhau()
        {
        }

        public MatHangNhapKhau(int maSo, string tenHang, double donGiaNhap) : base(maSo, tenHang, donGiaNhap)
        {
        }

        public override void NhapMatHang()
        {
            base.NhapMatHang();
            Console.Write("Ngay nhap: ");
            while (!DateTime.TryParse(Console.ReadLine(), out ngayNhap))
            {
                Console.WriteLine("Dinh dang ngay khong hop le, hay nhap lai!");
            }

            Console.Write("Nhap thue nhap khau: ");
            double thue;
            while (!double.TryParse(Console.ReadLine(), out thue))
            {
                Console.WriteLine("Dinh dang ngay khong hop le, hay nhap lai!");
            }

            thueNhapKhau = thue;
        }

        public override double TinhGiaBan()
        {
            return base.TinhGiaBan() + TinhTienThue();
        }

        public double TinhTienThue()
        {
            return thueNhapKhau * donGiaNhap;
        }

        public override void XuatMatHang()
        {
            base.XuatMatHang();
            Console.WriteLine($"Tien thue nhap khau: {TinhTienThue()}");
            Console.WriteLine($"Gia ban mat hang nhap khau: {TinhGiaBan()}");
        }
    }
}
