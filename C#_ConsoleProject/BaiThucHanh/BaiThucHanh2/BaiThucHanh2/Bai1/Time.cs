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
            hour = 0;
            minute = 0;
            second = 0;
        }

        public Time(int h, int m, int s)
        {
            hour = h;
            minute = m;
            second = s;
        }

        public int Minute
        {
            get { return minute; }
            set { minute = value; }
        }

        public int Second
        {
            get { return second; }
            set { second = value; }
        }

        public int GetHour()
        {
            return hour;
        }

        public void SetHour(int i)
        {
            hour = i;
        }

        public void Show()
        {
            Console.WriteLine("{0}:{1}:{2}", hour, minute, second);
        }

    }
}
