using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2
{
    internal class HocPhan
    {
        public string MaHocPhan { get; set; }
        public string TenHocPhan { get; set; }
        public int SoTinChi { get; set; }
        public int SoTinChiThucHanh { get; set; }
        private static float HocPhiMotTinChi = 350; // Học phí 1 tín chỉ

        // Khởi tạo không tham số
        public HocPhan()
        {
        }

        // Khởi tạo có tham số
        public HocPhan(string maHP, string tenHP, int soTC, int soTCTH)
        {
            MaHocPhan = maHP;
            TenHocPhan = tenHP;
            SoTinChi = soTC;
            SoTinChiThucHanh = soTCTH;
        }

        // Nhập thông tin học phần
        public void NhapThongTin()
        {
            Console.Write("Mã học phần: ");
            MaHocPhan = Console.ReadLine();
            Console.Write("Tên học phần: ");
            TenHocPhan = Console.ReadLine();
            Console.Write("Số tín chỉ: ");
            SoTinChi = int.Parse(Console.ReadLine());
            Console.Write("Số tín chỉ thực hành: ");
            SoTinChiThucHanh = int.Parse(Console.ReadLine());
        }

        // Tính tiền học phí
        public double TinhTienHocPhi()
        {
            return SoTinChiThucHanh * HocPhiMotTinChi * 1.5 + (SoTinChi - SoTinChiThucHanh) * HocPhiMotTinChi;
        }

        // Xuất thông tin học phần
        public void XuatThongTin()
        {
            Console.WriteLine($"Mã học phần: {MaHocPhan}");
            Console.WriteLine($"Tên học phần: {TenHocPhan}");
            Console.WriteLine($"Số tín chỉ: {SoTinChi}");
            Console.WriteLine($"Tiền học phí: {TinhTienHocPhi()}");
        }

        // Toán tử cộng một số nguyên với tín chỉ thực hành của học phần
        public static int operator +(int number, HocPhan hp)
        {
            return number + hp.SoTinChiThucHanh;
        }
    }
}
