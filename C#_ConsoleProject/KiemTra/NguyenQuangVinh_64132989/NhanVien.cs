class NhanVien
{
    private int maSo;
    private string? hoTen;
    private DateTime ngayVaoLam;
    private double heSoLuong;
    private double luongCoBan = 1500;
    private char loaiNhanVien;

    public double HeSoLuong { get => heSoLuong; set => heSoLuong = value; }

    public NhanVien(int maSo, string hoTen, DateTime ngayVaoLam, double heSoLuong, char loaiNhanVien)
    {
        this.maSo = maSo;
        this.hoTen = hoTen;
        this.ngayVaoLam = ngayVaoLam;
        this.HeSoLuong = heSoLuong;
        this.loaiNhanVien = loaiNhanVien;
    }

    public NhanVien()
    {
    }

    public void NhapThongTin()
    {
        Console.WriteLine("Nhập thông tin nhân viên:");

        Console.Write("Mã số: ");
        while (!int.TryParse(Console.ReadLine(), out maSo) || maSo < 0)
        {
            Console.WriteLine("Mã số phải là số nguyên dương. Hãy nhập lại!");
            Console.Write("Mã số: ");
        }

        Console.Write("Họ tên: ");
        hoTen = Console.ReadLine();

        Console.Write("Ngày vào làm (dd/MM/yyyy): ");
        while (!DateTime.TryParse(Console.ReadLine(), out ngayVaoLam) || ngayVaoLam < DateTime.MinValue || ngayVaoLam > DateTime.MaxValue)
        {
            Console.WriteLine("Ngày vừa nhập không hợp lệ, hãy nhập đúng định dạng (dd/MM/yyyy).");
            Console.Write("Ngày vào làm (dd/MM/yyyy): ");
        }

        Console.Write("Hệ số lương: ");
        while (!double.TryParse(Console.ReadLine(), out heSoLuong) || heSoLuong < 0)
        {
            Console.WriteLine("Hệ số lương phải là số dương. Hãy nhập lại!");
            Console.Write("Hệ số lương: ");
        }

        Console.Write("Loại nhân viên (A, B, C): ");
        char input;
        while (!char.TryParse(Console.ReadLine(), out input) || input.ToString().Length > 1)
        {
            Console.WriteLine("Loại nhân viên chỉ được nhập 1 ký tự. Hãy nhập lại!");
            Console.Write("Loại nhân viên (A, B, C): ");
        }
        loaiNhanVien = input;
    }

    public static NhanVien operator +(NhanVien nhanVien, double soTien)
    {
        nhanVien.HeSoLuong += soTien;
        return nhanVien;
    }

    public double TinhTongLuong()
    {
        double tongLuong = TinhLuong() + HeSoLuong;
        return tongLuong;
    }

    public void InTongLuong()
    {
        Console.WriteLine("Tổng lương thực nhận: " + TinhTongLuong());
    }

    public double TinhLuong()
    {
        double luong = 0;
        if (loaiNhanVien == 'A')
        {
            luong = luongCoBan * 1.3;
        }
        else if (loaiNhanVien == 'B')
        {
            luong = luongCoBan * 1.5;
        }
        else
        {
            luong = luongCoBan;
        }
        return luong * HeSoLuong;
    }

    public void XuatThongTin()
    {
        Console.WriteLine("Thông tin nhân viên:");
        Console.WriteLine("Mã số: " + maSo);
        Console.WriteLine("Họ tên: " + hoTen);
        Console.WriteLine("Ngày vào làm: " + ngayVaoLam.ToString("dd/MM/yyyy"));
        Console.WriteLine("Hệ số lương: " + HeSoLuong);
        Console.WriteLine("Loại nhân viên: " + loaiNhanVien);
        Console.WriteLine("Lương: " + TinhLuong());
    }
}