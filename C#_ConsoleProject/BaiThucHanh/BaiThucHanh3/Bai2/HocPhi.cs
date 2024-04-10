using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2
{
    internal class HocPhi
    {
        public string MaSinhVien { get; set; }
        public string HoTen { get; set; }
        public List<HocPhan> DanhSachHocPhan { get; set; }

        // Khởi tạo không tham số
        public HocPhi()
        {
            DanhSachHocPhan = new List<HocPhan>();
        }

        // Khởi tạo có tham số
        public HocPhi(string maSV, string hoTen)
        {
            MaSinhVien = maSV;
            HoTen = hoTen;
            DanhSachHocPhan = new List<HocPhan>();
        }

        // Nhập thông tin hóa đơn học phí
        public void NhapThongTin()
        {
            Console.Write("Mã số sinh viên: ");
            MaSinhVien = Console.ReadLine();
            Console.Write("Họ tên sinh viên: ");
            HoTen = Console.ReadLine();

            int n;
            do
            {
                Console.Write("Nhập số lượng học phần đăng ký (2-9): ");
                n = int.Parse(Console.ReadLine());
            } while (n < 2 || n > 9);

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Nhập thông tin học phần thứ {i + 1}:");
                HocPhan hp = new HocPhan();
                hp.NhapThongTin();
                DanhSachHocPhan.Add(hp);
            }
        }

        // Tính tổng số tín chỉ thực hành trong kỳ của sinh viên
        public int TongSoTinChiThucHanh()
        {
            int tong = 0;
            foreach (var hocPhan in DanhSachHocPhan)
            {
                tong += hocPhan.SoTinChiThucHanh;
            }
            return tong;
        }

        // Xuất thông tin hóa đơn học phí
        public void XuatThongTin()
        {
            Console.WriteLine($"Mã số sinh viên: {MaSinhVien}");
            Console.WriteLine($"Họ tên sinh viên: {HoTen}");
            Console.WriteLine("Danh sách học phần đăng ký:");
            foreach (var hocPhan in DanhSachHocPhan)
            {
                hocPhan.XuatThongTin();
                Console.WriteLine();
            }
            Console.WriteLine($"Tổng tiền học phí: {TongTienHocPhi()}");
        }

        // Tính tổng tiền học phí
        public double TongTienHocPhi()
        {
            double tong = 0;
            foreach (var hocPhan in DanhSachHocPhan)
            {
                tong += hocPhan.TinhTienHocPhi();
            }
            return tong;
        }
    }
}
