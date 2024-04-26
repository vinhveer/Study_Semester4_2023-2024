using System;

namespace Vidu32
{
    internal class KetQuaHocPhan
    {
        private string maHocPhan;
        private string tenHocPhan;
        private byte soTinChi;
        private float diemTrungBinh;

        public string MaHocPhan { get => maHocPhan; set => maHocPhan = value; }
        public string TenHocPhan { get => tenHocPhan; set => tenHocPhan = value; }
        public byte SoTinChi { get => soTinChi; set => soTinChi = value; }
        public float DiemTrungBinh { get => diemTrungBinh; set => diemTrungBinh = value; }

        public void Nhap()
        {
            Console.Write("Nhap ma hoc phan: ");
            string maHocPhan = Console.ReadLine();
            while (string.IsNullOrWhiteSpace(maHocPhan))
            {
                Console.Write("Ma hoc phan khong duoc de trong. Nhap lai: ");
                maHocPhan = Console.ReadLine();
            }

            Console.Write("Nhap ten hoc phan: ");
            string tenHocPhan = Console.ReadLine();
            while (string.IsNullOrWhiteSpace(tenHocPhan))
            {
                Console.Write("Ten hoc phan khong duoc de trong. Nhap lai: ");
                tenHocPhan = Console.ReadLine();
            }

            Console.Write("Nhap so tin chi: ");
            byte soTinChi;
            while (!byte.TryParse(Console.ReadLine(), out soTinChi))
            {
                Console.Write("Nhap so tin chi khong hop le. Nhap lai: ");
            }

            Console.Write("Nhap diem trung binh: ");
            float diemTrungBinh;
            while (!float.TryParse(Console.ReadLine(), out diemTrungBinh))
            {
                Console.Write("Nhap diem trung binh khong hop le. Nhap lai: ");
            }
        }

        public KetQuaHocPhan(string maHocPhan, string tenHocPhan, byte soTinChi, float diemTrungBinh)
        {
            this.MaHocPhan = maHocPhan;
            this.TenHocPhan = tenHocPhan;
            this.SoTinChi = soTinChi;
            this.DiemTrungBinh = diemTrungBinh;
        }

        public KetQuaHocPhan()
        {
        }


    }
}
