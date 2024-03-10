using System;

namespace Bai1
{
    internal class Time
    {
        private int hour;

        // Ham dong goi
        public int Minute { get; set; }
        public int Second { get; set; }

        // Phuong thuc khoi tao khong doi so
        public Time()
        {
        }

        // Phuong thuc khoi tao co doi so
        public Time(int h, int m, int s)
        {
            this.hour = h;
            this.Minute = m;
            this.Second = s;
        }

        // Phuong thuc truy nhap
        public int GetHour()
        {
            return this.hour;
        }

        public int SetHour(int h)
        {
            this.hour = h;
            return this.hour;
        }

        // Phuong thuc in thong tin
        public void Display()
        {
            Console.WriteLine("Time: {0}:{1}:{2}", this.hour, this.Minute, this.Second);
        }
    }
}
