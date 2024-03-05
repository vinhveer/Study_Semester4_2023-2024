using System;

namespace Bai1
{
    internal class Time
    {
        private int hour;
        private int minute;
        private int second;

        public Time()
        {
        }

        public Time(int h, int m, int s)
        {
            this.hour = h;
            this.minute = m;
            this.second = s;
        }

        public int Minute { get => minute; set => minute = value; }
        public int Second { get => second; set => second = value; }

        public int GetHour()
        {
            return hour;
        }

        public void SetHour(int i)
        {
            this.hour = i;
        }

        public void Show()
        {
            Console.WriteLine("Time: {0}:{1}:{2}", hour, minute, second);
        }

    }
}
