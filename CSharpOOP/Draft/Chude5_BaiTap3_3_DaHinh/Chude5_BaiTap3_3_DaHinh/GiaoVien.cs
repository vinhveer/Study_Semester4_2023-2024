using System;

namespace Chude5_BaiTap3_3_DaHinh
{
    internal class GiaoVien : CanBo
    {
        public int SoTietGiang { get; set; }
        public double TienThueLaoMotTiet { get; set; }

        public override double TinhLuong()
        {
            return SoTietGiang * TienThueLaoMotTiet;
        }

        public override void NhapThongTin()
        {
            base.NhapThongTin();

            // Nhập số tiết giảng
            while (true)
            {
                Console.Write("Số tiết giảng: ");
                if (int.TryParse(Console.ReadLine(), out int soTiet) && soTiet >= 0)
                {
                    SoTietGiang = soTiet;
                    break;
                }
                else
                {
                    Console.WriteLine("Số tiết giảng không hợp lệ. Vui lòng nhập lại.");
                }
            }

            // Nhập tiền thù lao một tiết
            while (true)
            {
                Console.Write("Tiền thù lao một tiết: ");
                if (double.TryParse(Console.ReadLine(), out double tienThueLao) && tienThueLao >= 0)
                {
                    TienThueLaoMotTiet = tienThueLao;
                    break;
                }
                else
                {
                    Console.WriteLine("Tiền thù lao một tiết không hợp lệ. Vui lòng nhập lại.");
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
