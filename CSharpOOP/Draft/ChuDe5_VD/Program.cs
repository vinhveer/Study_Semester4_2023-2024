using System.Text;

namespace ChuDe5_VD
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.InputEncoding = Encoding.UTF8;
            Console.OutputEncoding = Encoding.UTF8;
            Console.WriteLine("Nhập số lượng cán bộ: ");
            int count = int.Parse(Console.ReadLine());

            List<CanBo> canBos = new List<CanBo>();

            for (int i = 0; i < count; i++)
            {
                Console.WriteLine("Chọn loại cán bộ (1: Nhân viên, 2: Giáo viên): ");
                int choice = int.Parse(Console.ReadLine());

                CanBo canBo;
                if (choice == 1)
                {
                    canBo = new NhanVien(); // Upcasting: NhanVien được ép kiểu lên thành CanBo
                }
                else if (choice == 2)
                {
                    canBo = new GiaoVien(); // Upcasting: GiaoVien được ép kiểu lên thành CanBo
                }
                else
                {
                    Console.WriteLine("Lựa chọn không hợp lệ. Nhập lại.");
                    i--; // Giảm i để nhập lại thông tin cho cán bộ hiện tại
                    continue;
                }

                Console.WriteLine("Nhập thông tin cán bộ thứ " + (i + 1));
                canBo.Nhap();
                canBos.Add(canBo);
            }
            Console.WriteLine("--------------------------------------");
            Console.WriteLine("Thông tin các cán bộ:");
            foreach (CanBo canBo in canBos)
            {
                if (canBo is NhanVien)
                {
                    NhanVien nhanVien = (NhanVien)canBo;
                    nhanVien.InThongTin();
                }
                else if (canBo is GiaoVien)
                {
                    GiaoVien giaoVien = (GiaoVien)canBo;
                    giaoVien.InThongTin();
                }
            }

            Console.ReadLine();

        }
    }
}
