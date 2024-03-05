using System;
using System.Collections.Generic;

namespace Vidu32
{
    internal class SinhVien
    {
        private string maSV;
        private string hoTen;
        private bool gioiTinh;
        private byte tongTC;
        private List<KetQuaHocPhan> ketQuaHocPhans = new List<KetQuaHocPhan>();

        public void Nhap()
        {
            // Validation for maSV
            Console.Write("Nhap ma sinh vien: ");
            maSV = Console.ReadLine();
            while (string.IsNullOrWhiteSpace(maSV))
            {
                Console.Write("Ma sinh vien khong duoc de trong. Nhap lai: ");
                maSV = Console.ReadLine();
            }

            // Validation for hoTen
            Console.Write("Nhap ho ten: ");
            hoTen = Console.ReadLine();
            while (string.IsNullOrWhiteSpace(hoTen))
            {
                Console.Write("Ho ten khong duoc de trong. Nhap lai: ");
                hoTen = Console.ReadLine();
            }

            // Validation for gioiTinh
            Console.Write("Nhap gioi tinh (Nam/Nu): ");
            string inputGender = Console.ReadLine();
            while (!inputGender.Equals("Nam", StringComparison.OrdinalIgnoreCase) && !inputGender.Equals("Nu", StringComparison.OrdinalIgnoreCase))
            {
                Console.Write("Gioi tinh khong hop le. Nhap lai (Nam/Nu): ");
                inputGender = Console.ReadLine();
            }
            gioiTinh = inputGender.Equals("Nam", StringComparison.OrdinalIgnoreCase);

            // Validation for soLuongHP
            Console.Write("Nhap so luong hoc phan: ");
            while (!int.TryParse(Console.ReadLine(), out soLuongHP) || soLuongHP <= 0)
            {
                Console.WriteLine("So luong hoc phan khong hop le. Nhap lai: ");
            }

            for (int i = 0; i < soLuongHP; i++)
            {
                KetQuaHocPhan ketQuaHocPhan = new KetQuaHocPhan();
                ketQuaHocPhan.Nhap();
                ketQuaHocPhans.Add(ketQuaHocPhan);
            }
        }


        public void InKetQuaHocPhan()
        {
            if (ketQuaHocPhans.Count > 0)
            {
                Console.WriteLine("\n--- Ket qua hoc phan ---");
                foreach (var ketQuaHocPhan in ketQuaHocPhans)
                {
                    Console.WriteLine($"Ma hoc phan: {ketQuaHocPhan.MaHocPhan}");
                    Console.WriteLine($"Ten hoc phan: {ketQuaHocPhan.TenHocPhan}");
                    Console.WriteLine($"So tin chi: {ketQuaHocPhan.SoTinChi}");
                    Console.WriteLine($"Diem trung binh: {ketQuaHocPhan.DiemTrungBinh}\n");
                }
            }
            else
            {
                Console.WriteLine("Chua co ket qua hoc phan.\n");
            }
        }

        public void TrungBinhChung()
        {
            if (ketQuaHocPhans.Count > 0)
            {
                double diemTong = 0;
                foreach (var ketQuaHocPhan in ketQuaHocPhans)
                {
                    diemTong += ketQuaHocPhan.DiemTrungBinh * ketQuaHocPhan.SoTinChi;
                }

                double diemTBChung = diemTong / tongTC;
                Console.WriteLine($"Diem Trung Binh Chung: {diemTBChung}\n");
            }
            else
            {
                Console.WriteLine("Chua co ket qua hoc phan.\n");
            }
        }

        public void TrungBinhTichLuy()
        {
            if (ketQuaHocPhans.Count > 0)
            {
                double diemTichLuy = 0;
                int tongTCTichLuy = 0;

                foreach (var ketQuaHocPhan in ketQuaHocPhans)
                {
                    diemTichLuy += ketQuaHocPhan.DiemTrungBinh * ketQuaHocPhan.SoTinChi;
                    tongTCTichLuy += ketQuaHocPhan.SoTinChi;
                }

                double diemTBTLuy = diemTichLuy / tongTCTichLuy;
                Console.WriteLine($"Diem Trung Binh Tich Luy: {diemTBTLuy:F2}\n");
            }
            else
            {
                Console.WriteLine("Chua co ket qua hoc phan.\n");
            }
        }

        public void XetTotNghiep()
        {
            if (ketQuaHocPhans.Count > 0)
            {
                int tongTCTichLuy = 0;

                foreach (var ketQuaHocPhan in ketQuaHocPhans)
                {
                    tongTCTichLuy += ketQuaHocPhan.SoTinChi;
                }

                if (tongTCTichLuy >= tongTC)
                {
                    Console.WriteLine("Sinh vien du dieu kien tot nghiep.\n");
                }
                else
                {
                    Console.WriteLine("Sinh vien chua du dieu kien tot nghiep.\n");
                }
            }
            else
            {
                Console.WriteLine("Chua co ket qua hoc phan.\n");
            }
        }

        public SinhVien(string maSV, string hoTen, bool gioiTinh, byte tongTC)
        {
            this.maSV = maSV;
            this.hoTen = hoTen;
            this.gioiTinh = gioiTinh;
            this.tongTC = tongTC;
            this.ketQuaHocPhans = new List<KetQuaHocPhan>();
        }

        public SinhVien()
        {
        }

        public void HienThiThongTin()
        {
            Console.WriteLine("Ma sinh vien: " + maSV);
            Console.WriteLine("Ho ten: " + hoTen);
            Console.WriteLine("Gioi tinh: " + (gioiTinh ? "Nam" : "Nu"));
            Console.WriteLine("Tong so tin chi: " + tongTC);
        }

    }
}
