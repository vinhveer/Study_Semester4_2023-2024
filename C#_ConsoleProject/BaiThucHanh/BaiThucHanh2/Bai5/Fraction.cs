using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai5
{
    internal class Fraction
    {
        private int tuSo;
        private int mauSo;

        public Fraction()
        {
            // Thiết lập không tham số
            tuSo = 0;
            mauSo = 1;
        }

        public Fraction(int tu, int mau)
        {
            // Thiết lập có tham số
            tuSo = tu;
            mauSo = mau != 0 ? mau : 1;
        }

        public Fraction(Fraction Fraction)
        {
            // Sao chép phân số
            tuSo = Fraction.tuSo;
            mauSo = Fraction.mauSo;
        }

        public Fraction Cong(Fraction ps)
        {
            // Cộng hai phân số
            int tu = tuSo * ps.mauSo + ps.tuSo * mauSo;
            int mau = mauSo * ps.mauSo;
            return RutGon(new Fraction(tu, mau));
        }

        public Fraction Tru(Fraction ps)
        {
            // Trừ hai phân số
            int tu = tuSo * ps.mauSo - ps.tuSo * mauSo;
            int mau = mauSo * ps.mauSo;
            return RutGon(new Fraction(tu, mau));
        }

        public Fraction Nhan(Fraction ps)
        {
            // Nhân hai phân số
            int tu = tuSo * ps.tuSo;
            int mau = mauSo * ps.mauSo;
            return RutGon(new Fraction(tu, mau));
        }

        public Fraction Chia(Fraction ps)
        {
            // Chia hai phân số
            if (ps.tuSo == 0)
            {
                Console.WriteLine("Không thể chia cho phân số có tử số bằng 0.");
                return null;
            }

            int tu = tuSo * ps.mauSo;
            int mau = mauSo * ps.tuSo;
            return RutGon(new Fraction(tu, mau));
        }

        private int UCLN(int a, int b)
        {
            // Tìm ước chung lớn nhất
            a = Math.Abs(a);
            b = Math.Abs(b);
            while (b != 0)
            {
                int r = a % b;
                a = b;
                b = r;
            }
            return a;
        }

        private Fraction RutGon(Fraction ps)
        {
            // Rút gọn phân số về dạng tối giản
            int ucln = UCLN(ps.tuSo, ps.mauSo);
            ps.tuSo /= ucln;
            ps.mauSo /= ucln;
            return ps;
        }

        public void Xuat()
        {
            // Xuất phân số dạng tử số/mẫu số
            Console.WriteLine($"{tuSo}/{mauSo}");
        }
    }
}
