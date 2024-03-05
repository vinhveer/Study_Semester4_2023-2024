using System;

namespace Bai4
{
    internal class MovingString
    {
        private string s;
        private int x;
        private int y;
        private ConsoleColor foregroundColor;
        private ConsoleColor backgroundColor;

        public MovingString(string s, int x, int y, ConsoleColor foregroundColor, ConsoleColor backgroundColor)
        {
            this.s = s;
            this.x = x;
            this.y = y;
            this.foregroundColor = foregroundColor;
            this.backgroundColor = backgroundColor;
        }

        public MovingString()
        {
        }

        public void Show()
        {
            Console.SetCursorPosition(this.x, this.y);
            Console.ForegroundColor = this.foregroundColor;
            Console.BackgroundColor = this.backgroundColor;
            Console.WriteLine(this.s);
        }
    }
}
