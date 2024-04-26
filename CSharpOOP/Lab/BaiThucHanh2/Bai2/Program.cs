namespace Bai2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Rectangle r1 = new Rectangle(3, 4);
            Rectangle r2 = new Rectangle();
            Rectangle r3 = new Rectangle();
            r1.Update();
            r1.Area();
            r1.Perimeter();
            r2.Update();
            r2.Area();
            r2.Perimeter();
            r3.Update();
            r3.Area();
            r3.Perimeter();
        }
    }
}
