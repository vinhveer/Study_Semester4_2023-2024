namespace Bai8
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // a. 0+0=0
            //PhepToan pt = new PhepToan();
            //pt.Xuat();
            // b. 7+8=15
            //PhepToan pt = new PhepToan();
            //pt.CapNhat();//giả sử nhập a=7, b=8, c=+
            //pt.Xuat();
            // c. Lỗi đối tượng không tồn tại (do tên đối tượng)
            //PhepToan pt = new PhepToan(3, 6,'*');
            //pt1.Xuat();
            // d. 7+8=15
            PhepToan pt = new PhepToan(3, 6,'*');
            pt.CapNhat();//giả sử nhập a=7, b=8, c=+
            pt.Xuat();
        }
    }
}
