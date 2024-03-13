using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai7
{
    class Adult
    {
        private string hoTen;
        private double canNang;
        private double chieuCao;

        // Khởi tạo không tham số
        public Adult()
        {
            hoTen = "";
            canNang = 0;
            chieuCao = 0;
        }

        // Khởi tạo có tham số
        public Adult(string hoTen, double canNang, double chieuCao)
        {
            this.hoTen = hoTen;
            this.canNang = canNang;
            this.chieuCao = chieuCao;
        }

        // Khởi tạo sao chép
        public Adult(Adult other)
        {
            hoTen = other.hoTen;
            canNang = other.canNang;
            chieuCao = other.chieuCao;
        }

        // Xuất ra màn hình thông tin người và tình trạng sức khỏe theo chỉ số BMI
        public void XuatThongTin()
        {
            Console.OutputEncoding = Encoding.UTF8;
            Console.BackgroundColor = ConsoleColor.DarkBlue;
            Console.ForegroundColor = ConsoleColor.White;

            Console.Clear();
            Console.WriteLine("Thông tin người:");
            Console.WriteLine($"Họ tên: {hoTen}");
            Console.WriteLine($"Cân nặng: {canNang} kg");
            Console.WriteLine($"Chiều cao: {chieuCao} m");

            double bmi = TinhBMI();
            Console.WriteLine($"Chỉ số BMI: {bmi}");

            if (bmi < 18.5)
            {
                Console.WriteLine("Tình trạng sức khỏe: Thiếu cân");
                double canTang = CanTangCanNang(18.5);
                Console.WriteLine($"Cần tăng cân: {canTang} kg");
            }
            else if (bmi >= 18.5 && bmi < 24.9)
            {
                Console.WriteLine("Tình trạng sức khỏe: Bình thường");
            }
            else if (bmi >= 24.9 && bmi < 29.9)
            {
                Console.WriteLine("Tình trạng sức khỏe: Thừa cân");
                double canGiam = CanGiamCanNang(24.9);
                Console.WriteLine($"Cần giảm cân: {canGiam} kg");
            }
            else
            {
                Console.WriteLine("Tình trạng sức khỏe: Béo phì");
                double canGiam = CanGiamCanNang(24.9);
                Console.WriteLine($"Cần giảm cân: {canGiam} kg");
            }
        }

        // Tính chỉ số BMI
        private double TinhBMI()
        {
            return canNang / (chieuCao * chieuCao);
        }

        // Tính số cân cần tăng để có sức khỏe tốt
        private double CanTangCanNang(double bmiMucTieu)
        {
            return bmiMucTieu * chieuCao * chieuCao - canNang;
        }

        // Tính số cân cần giảm để có sức khỏe tốt
        private double CanGiamCanNang(double bmiMucTieu)
        {
            return canNang - bmiMucTieu * chieuCao * chieuCao;
        }
    }
}
