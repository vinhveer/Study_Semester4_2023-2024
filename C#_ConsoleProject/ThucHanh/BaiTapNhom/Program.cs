using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaiTapNhom
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //DonGia donGia = new DonGia();
            //donGia.Nhap();
            //donGia.Xuat();
            //Console.WriteLine("------------------------------");
            //Console.WriteLine($"So luong muc hang loai A trong hoa don: {donGia.DemMucHangLoaiA()}");

            HangHoa hangHoa = new HangHoa();
            hangHoa.Nhap();
        }
    }
}
