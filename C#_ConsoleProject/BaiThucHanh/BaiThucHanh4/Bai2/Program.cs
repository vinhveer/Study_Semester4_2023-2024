using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai2
{
    internal class Program
    {
        int n;
        List<SmartPhone> list = new List<SmartPhone>();

        public void Input()
        {
            Console.Write("Nhap so luong dien thoai: ");
            n = int.Parse(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine("Nhap thong tin dien thoai thu {0}", i + 1);
                SmartPhone sp = new SmartPhone();
                sp.Input();
                list.Add(sp);
            }
        }

        public void Sort()
        {
            list.Sort();
        }

        public void Output()
        {
            foreach (SmartPhone sp in list)
            {
                sp.Output();
            }
        }

        public void Delete()
        { 
            Console.Write("Nhap ten dien thoai can xoa: ");
            string name = Console.ReadLine();
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PhoneName == name)
                {
                    list.RemoveAt(i);
                    i--;
                }
            }
        }

        public void Insert()
        {
            Console.WriteLine("Nhap vi tri can them: ");
            int index = int.Parse(Console.ReadLine());
            Console.WriteLine("Nhap thong tin dien thoai can them");
            SmartPhone sp = new SmartPhone();
            sp.Input();
            list.Insert(index, sp);
        }

        static void Main(string[] args)
        {
            Program program = new Program();
            program.Input();
            program.Sort();
            program.Output();
            program.Delete();
            program.Output();
            program.Insert();
            program.Output();
        }
    }
}
