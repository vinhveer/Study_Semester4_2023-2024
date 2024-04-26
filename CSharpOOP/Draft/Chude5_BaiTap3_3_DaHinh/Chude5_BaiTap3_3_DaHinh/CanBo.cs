namespace Chude5_BaiTap3_3_DaHinh
{
    internal class CanBo
    {
        public string? MaSo { get; set; }
        public string? HoTen { get; set; }
        public string? GioiTinh { get; set; }

        public virtual double TinhLuong()
        {
            return 0; // Mặc định trả về 0, sẽ được ghi đè ở các lớp con
        }

        public virtual void NhapThongTin()
        {
            Console.Write("Mã số: ");
            MaSo = Console.ReadLine();
            Console.Write("Họ tên: ");
            HoTen = Console.ReadLine();
            Console.Write("Giới tính: ");
            GioiTinh = Console.ReadLine();
        }

        public virtual void InThongTin()
        {
            Console.WriteLine($"Mã số: {MaSo}");
            Console.WriteLine($"Họ tên: {HoTen}");
            Console.WriteLine($"Giới tính: {GioiTinh}");
        }
    }
}
