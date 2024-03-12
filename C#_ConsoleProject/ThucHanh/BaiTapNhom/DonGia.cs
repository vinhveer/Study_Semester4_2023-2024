using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaiTapNhom
{
    internal class DonGia
    {
        private string soHoaDon;
        private int soLuongMucHang;
        private HangHoa[] danhSachMucHang;

        public DonGia(string soHoaDon, int soLuongMucHang)
        {
            this.soHoaDon = soHoaDon;
            this.soLuongMucHang = soLuongMucHang;
            danhSachMucHang = new HangHoa[soLuongMucHang];
        }

        public DonGia()
        {
        }   

        public void Nhap()
        {
            Console.WriteLine("Nhap thong tin hoa don:");
            Console.Write("So hoa don: ");
            soHoaDon = Console.ReadLine();

            Console.Write("So luong muc hang: ");
            while (!int.TryParse(Console.ReadLine(), out soLuongMucHang) || soLuongMucHang < 1 || soLuongMucHang > 20) 
            {
                Console.WriteLine("So luong muc hang phai la tu 1 < n < 20 va la so nguyen duong. Vui long nhap lai.");
                Console.Write("So luong muc hang: ");
            }
            //soLuongMucHang = int.Parse(Console.ReadLine());

            danhSachMucHang = new HangHoa[soLuongMucHang];
            for (int i = 0; i < soLuongMucHang; i++)
            {
                Console.WriteLine($"Nhap thong tin muc hang {i + 1}:");
                HangHoa hangHoa = new HangHoa();
                hangHoa.Nhap();
                danhSachMucHang[i] = hangHoa;
            }
        }

        public double TinhTongThanhTien()
        {
            double tongThanhTien = 0;
            foreach (var hangHoa in danhSachMucHang)
            {
                tongThanhTien += hangHoa.ThanhTien();
            }
            return tongThanhTien;
        }
        public void Xuat()
        {
            Console.WriteLine("------------------------------");
            Console.WriteLine("Thong tin hoa don:");
            Console.WriteLine("So hoa don: " + soHoaDon);
            Console.WriteLine("Danh sach muc hang:");
            foreach (var hangHoa in danhSachMucHang)
            {
                hangHoa.Xuat();
            }
            Console.WriteLine("Tong thanh tien: " + TinhTongThanhTien());
        }

        public int DemMucHangLoaiA()
        {
            int count = 0;
            foreach (var hangHoa in danhSachMucHang)
            {
                if (hangHoa.loaiHang == 'A')
                {
                    count++;
                }
            }
            return count;
        }
    }
}
