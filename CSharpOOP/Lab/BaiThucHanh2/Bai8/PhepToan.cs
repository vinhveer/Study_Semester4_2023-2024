using System;

class PhepToan
{
    //khai báo các thành phần dữ liệu
    float a, b;
    char c;
    //phương thức thiết lập có tham số có giá trị mặc định
    public PhepToan(float a1 = 0, float b1 = 0, char c1 = '+')
    {
        a = a1; b = b1;
        c = c1;
    }
    public void CapNhat()
    {
        Console.Write("nhap 2 so thuc:");
        a = float.Parse(Console.ReadLine());
        b = float.Parse(Console.ReadLine());
        Console.Write("nhap phep toan (+,-,*,/):");
        c = char.Parse(Console.ReadLine());
    }
    //tính toán và trả về giá trị
    float Tinhtoan()
    {
        float kq = 0;
        switch (c)
        {
            case '+': kq = a + b; break;
            case '-': kq = a - b; break;
            case '*': kq = a * b; break;
            case '/': kq = a / b; break;
        }
        return kq;
    }
    //xuất ra màn hình kết quả
    public void Xuat()
    {
        Console.WriteLine($"{a}{c}{b}={Tinhtoan()}");
    }
}