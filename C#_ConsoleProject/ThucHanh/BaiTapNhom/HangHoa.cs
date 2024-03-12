using System;

namespace BaiTapNhom
{
    internal class HangHoa
    {
        public string maHang { get; set; }
        public string tenHang { get; set; }
        public int soLuong { get; set; }
        public double donGia { get; set; }
        public char loaiHang { get; set; }

        public HangHoa()
        {
        }

        public HangHoa(string maHang, string tenHang, int soLuong, double donGia, char loaiHang)
        {
            this.maHang = maHang;
            this.tenHang = tenHang;
            this.soLuong = soLuong;
            this.donGia = donGia;
            this.loaiHang = loaiHang;
        }

        public void Nhap()
        {
            Console.Write("Nhap ma hang: ");
            maHang = Console.ReadLine();

            Console.Write("Nhap ten hang: ");
            tenHang = Console.ReadLine();

            // Yêu cầu nhập lại nếu soLuong là số âm
            do
            {
                Console.Write("Nhap so luong: ");
                if (int.TryParse(Console.ReadLine(), out int parsedSoLuong) && parsedSoLuong >= 0)
                {
                    soLuong = parsedSoLuong;
                    break; // Thoát khỏi vòng lặp khi nhập đúng giá trị
                }
                else
                {
                    Console.WriteLine("So luong khong hop le. Vui long nhap lai.");
                }
            } while (true);

            // Yêu cầu nhập lại nếu donGia là số âm
            do
            {
                Console.Write("Nhap don gia: ");
                if (double.TryParse(Console.ReadLine(), out double parsedDonGia) && parsedDonGia >= 0)
                {
                    donGia = parsedDonGia;
                    break; // Thoát khỏi vòng lặp khi nhập đúng giá trị
                }
                else
                {
                    Console.WriteLine("Don gia khong hop le. Vui long nhap lai.");
                }
            } while (true);

            Console.Write("Nhap loai hang (A/B/Khac): ");
            loaiHang = char.Parse(Console.ReadLine());
        }


        public double GiaTheoLoai()
        {
            switch (loaiHang)
            {
                case 'A':
                    return (soLuong * donGia * 1.5);
                case 'B':
                    return (soLuong * donGia * 1.2);
                default:
                    return (soLuong * donGia);
            }
        }

        public double ThanhTien()
        {
            return GiaTheoLoai() + (GiaTheoLoai() * 0.08);
        }

        public void Xuat()
        {
            Console.WriteLine("------------------------------");
            //Xuat thong tin hang hoa
            Console.WriteLine("Ma hang: " + maHang);
            Console.WriteLine("Ten hang: " + tenHang);
            Console.WriteLine("So luong: " + soLuong);
            Console.WriteLine("Gia theo loai: " + GiaTheoLoai());
            Console.WriteLine("Thanh tien: " + ThanhTien());
        }
    }
}
