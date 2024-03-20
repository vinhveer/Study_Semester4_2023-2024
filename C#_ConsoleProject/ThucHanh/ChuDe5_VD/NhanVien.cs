public class NhanVien : CanBo
{
    public int soNgay { get; set; }
    public double luongThang { get; set; }

    public override double TinhTienLuong()
    {
        double luong = (soNgay * luongThang) / 26;
        return luong;
    }

    public override void Nhap()
    {
        base.Nhap();

        do
        {
            Console.WriteLine("Nhập số ngày làm việc trong tháng: ");
            if (int.TryParse(Console.ReadLine(), out int soNgayInput) && soNgayInput > 0 && soNgayInput <= 31)
            {
                soNgay = soNgayInput;
            }
            else
            {
                Console.WriteLine("Số ngày làm việc không hợp lệ. Vui lòng nhập lại.");
            }
        } while (soNgay <= 0 || soNgay > 31); // Kiểm tra số ngày làm việc phải là số nguyên dương và không vượt quá 31 ngày

        do
        {
            Console.WriteLine("Nhập lương tháng: ");
            if (double.TryParse(Console.ReadLine(), out double luongThangInput) && luongThangInput >= 0)
            {
                luongThang = luongThangInput;
            }
            else
            {
                Console.WriteLine("Lương tháng không hợp lệ. Vui lòng nhập lại.");
            }
        } while (luongThang < 0); // Kiểm tra lương tháng phải là số thực không âm
    }

    public override void InThongTin()
    {
        base.InThongTin();
        Console.WriteLine($"Số ngày làm việc trong tháng: {soNgay}");
        Console.WriteLine($"Lương tháng: {TinhTienLuong()}");
    }
}
