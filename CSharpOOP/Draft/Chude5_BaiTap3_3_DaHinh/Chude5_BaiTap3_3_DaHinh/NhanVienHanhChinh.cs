using System;

namespace Chude5_BaiTap3_3_DaHinh
{
    internal class NhanVienHanhChinh : CanBo
    {
        public int SoNgayCong { get; set; }
        public double LuongThang { get; set; }

        public override double TinhLuong()
        {
            return SoNgayCong * LuongThang / 26;
        }

        public override void NhapThongTin()
        {
            base.NhapThongTin();

            // Nhập số ngày công
            while (true)
            {
                Console.Write("Số ngày công: ");
                if (int.TryParse(Console.ReadLine(), out int ngayCong) && ngayCong >= 0)
                {
                    SoNgayCong = ngayCong;
                    break;
                }
                else
                {
                    Console.WriteLine("Số ngày công không hợp lệ. Vui lòng nhập lại.");
                }
            }

            // Nhập lương tháng
            while (true)
            {
                Console.Write("Lương tháng: ");
                if (double.TryParse(Console.ReadLine(), out double luongThang) && luongThang >= 0)
                {
                    LuongThang = luongThang;
                    break;
                }
                else
                {
                    Console.WriteLine("Lương tháng không hợp lệ. Vui lòng nhập lại.");
                }
            }
        }

        public override void InThongTin()
        {
            base.InThongTin();
            Console.WriteLine($"Tiền lương: {TinhLuong()}");
        }
    }
}

