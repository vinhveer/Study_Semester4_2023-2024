public class GiaoVien : CanBo
{
    public int soTiet { get; set; }
    public double thuLao { get; set; }

    public override double TinhTienLuong()
    {
        double luong = soTiet * thuLao;
        return luong;
    }

    public override void Nhap()
    {
        base.Nhap();

        do
        {
            Console.WriteLine("Nhập số tiết dạy: ");
            if (int.TryParse(Console.ReadLine(), out int soTietInput) && soTietInput > 0)
            {
                soTiet = soTietInput;
            }
            else
            {
                Console.WriteLine("Số tiết dạy không hợp lệ. Vui lòng nhập lại.");
            }
        } while (soTiet <= 0); // Kiểm tra số tiết dạy phải là số nguyên dương

        do
        {
            Console.WriteLine("Nhập thù lao mỗi tiết: ");
            if (double.TryParse(Console.ReadLine(), out double thuLaoInput) && thuLaoInput > 0)
            {
                thuLao = thuLaoInput;
            }
            else
            {
                Console.WriteLine("Thù lao mỗi tiết không hợp lệ. Vui lòng nhập lại.");
            }
        } while (thuLao <= 0);
    }

    public override void InThongTin()
    {
        base.InThongTin();
        Console.WriteLine($"Số tiết dạy: {soTiet}");
        Console.WriteLine($"Thù lao mỗi tiết: {TinhTienLuong()}");
    }
}
