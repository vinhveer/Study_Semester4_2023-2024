using System;

namespace Chude5_BaiTap3_3_DaHinh
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int n;
            do
            {
                Console.Write("Nhập số lượng cán bộ nhân viên (5<=n<=30): ");
            } while (!int.TryParse(Console.ReadLine(), out n) || n < 5 || n > 30);
            CanBo[] danhSachCanBo = new CanBo[n];

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Nhập thông tin cho cán bộ thứ {i + 1}:");
                Console.Write("Loại cán bộ (1 - Nhân viên hành chính, 2 - Giáo viên): ");
                int loaiCanBo;
                while (!int.TryParse(Console.ReadLine(), out loaiCanBo) || (loaiCanBo != 1 && loaiCanBo != 2))
                {
                    Console.WriteLine("Loại cán bộ không hợp lệ. Vui lòng nhập lại.");
                    Console.Write("Loại cán bộ (1 - Nhân viên hành chính, 2 - Giáo viên): ");
                }

                if (loaiCanBo == 1)
                {
                    NhanVienHanhChinh nvhc = new NhanVienHanhChinh();
                    nvhc.NhapThongTin();
                    danhSachCanBo[i] = nvhc;
                }
                else if (loaiCanBo == 2)
                {
                    GiaoVien gv = new GiaoVien();
                    gv.NhapThongTin();
                    danhSachCanBo[i] = gv;
                }
            }

            Console.WriteLine("\nBảng lương cán bộ nhân viên:");
            foreach (var cb in danhSachCanBo)
            {
                cb.InThongTin();
                Console.WriteLine();
            }
        }
    }
}
