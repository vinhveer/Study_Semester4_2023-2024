namespace Bai2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            MotorbikeList motorbikeList = new MotorbikeList();
            motorbikeList.Input();
            motorbikeList.Display();
            motorbikeList.CountExpiredWarranty();
        }
    }
}
