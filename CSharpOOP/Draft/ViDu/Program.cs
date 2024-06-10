using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViDu
{
    internal class Program
    {
        static void Main(string[] args)
        {
        }
    }

    class Car
    {
        private int name;
        private int age;
        private int price;

        public int Name { get => name; set => name = value; }
        public int Age { get => age; set => age = value; }
        public int Price { get => price; set => price = value; }

        public Car()
        {
        }

        public Car(int name, int age, int price)
        {
            this.name = name;
            this.age = age;
            this.price = price;
        }

        public virtual void Show()
        {
            Console.WriteLine("Name: " + name);
            Console.WriteLine("Age: " + age);
            Console.WriteLine("Price: " + price);
        }

        public virtual void Input()
        {
            Console.Write("Name: ");
            name = int.Parse(Console.ReadLine());
            Console.Write("Age: ");
            age = int.Parse(Console.ReadLine());
            Console.Write("Price: ");
            price = int.Parse(Console.ReadLine());
        }
    }

    class Truck : Car
    {
        public override void Input()
        {
            base.Input();
        }

        public override void Show()
        {
            base.Show();
        }
    }
}
