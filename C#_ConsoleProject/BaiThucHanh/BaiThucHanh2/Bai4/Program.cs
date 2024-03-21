using System;
using System.Text;

namespace Bai4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.InputEncoding = Encoding.Unicode;
            Console.OutputEncoding = Encoding.Unicode;
            MovingString ms = new MovingString("Hello, world!", 0, 0, ConsoleColor.White, ConsoleColor.DarkBlue);
            ms.Show();
            ms.Motion();
        }
    }
}
