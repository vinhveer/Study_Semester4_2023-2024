using System;

namespace Bai4
{
    internal class MovingString
    {
        private string s;
        private int x, y;
        private ConsoleColor foregroundColor, backgroundColor;

        public MovingString()
        {
            s = "Hello, OOP!";
            x = 0;
            y = 0;
            foregroundColor = ConsoleColor.White;
            backgroundColor = ConsoleColor.DarkBlue;
        }

        public MovingString(string str, int posX, int posY, ConsoleColor fgColor, ConsoleColor bgColor)
        {
            s = str;
            x = posX;
            y = posY;
            foregroundColor = fgColor;
            backgroundColor = bgColor;
        }

        public void Show()
        {
            Console.Clear();
            Console.ForegroundColor = foregroundColor;
            Console.BackgroundColor = backgroundColor;
            Console.CursorVisible = false;

            Console.SetCursorPosition(x, y);
            Console.Write(s);
        }

        public void Motion()
        {
            while (true)
            {
                ConsoleKeyInfo key = Console.ReadKey(true);

                switch (key.Key)
                {
                    case ConsoleKey.LeftArrow:
                        x--;
                        break;
                    case ConsoleKey.RightArrow:
                        x++;
                        break;
                    case ConsoleKey.UpArrow:
                        y--;
                        break;
                    case ConsoleKey.DownArrow:
                        y++;
                        break;
                    case ConsoleKey.Escape:
                        return;
                }
                if (x < 0)
                {
                    x = 0;
                }
                if (y < 0)
                {
                    y = 0;
                }
                if (x > Console.WindowWidth - s.Length)
                {
                    x = Console.WindowWidth - s.Length;
                }
                if (y > Console.WindowHeight - 1)
                {
                    y = Console.WindowHeight - 1;
                }
                Show();
            }
        }
    }
}
