public class CanBo
{
    public int? maSo { get; set; }
    public string? hoTen { get; set; }
    public bool? gioiTinh { get; set; }

    public virtual double TinhTienLuong()
    {
        return 0;
    }

    public virtual void Nhap()
    {
        do
        {
            Console.WriteLine("Nhập mã số: ");
            int maSoInput;
            if (int.TryParse(Console.ReadLine(), out maSoInput))
            {
                maSo = maSoInput;
            }
            else
            {
                Console.WriteLine("Mã số không hợp lệ. Vui lòng nhập lại.");
            }
        } while (maSo == null); // Kiểm tra mã số không được để trống

        do
        {
            Console.WriteLine("Nhập họ tên: ");
            hoTen = Console.ReadLine();
            if (string.IsNullOrWhiteSpace(hoTen))
            {
                Console.WriteLine("Họ tên không hợp lệ. Vui lòng nhập lại.");
            }
        } while (string.IsNullOrWhiteSpace(hoTen)); // Kiểm tra họ tên không được để trống

        do
        {
            Console.WriteLine("Nhập giới tính (1: Nam, 0: Nữ): ");
            int gioiTinhInput;
            if (int.TryParse(Console.ReadLine(), out gioiTinhInput))
            {
                if (gioiTinhInput == 1)
                {
                    gioiTinh = true;
                }
                else if (gioiTinhInput == 0)
                {
                    gioiTinh = false;
                }
                else
                {
                    Console.WriteLine("Giới tính không hợp lệ. Vui lòng nhập lại.");
                }
            }
            else
            {
                Console.WriteLine("Giới tính không hợp lệ. Vui lòng nhập lại.");
            }
        } while (gioiTinh == null); // Kiểm tra giới tính không được để trống
    }


    public virtual void InThongTin()
    {
        Console.WriteLine($"Mã số: {maSo}");
        Console.WriteLine($"Họ tên: {hoTen}");
        Console.WriteLine($"Giới tính: {(gioiTinh.Value ? "Nam" : "Nữ")}");
    }
}
