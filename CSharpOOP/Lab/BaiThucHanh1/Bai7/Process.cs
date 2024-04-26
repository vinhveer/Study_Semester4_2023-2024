using System;

namespace Bai7
{
    internal class Process
    {
        private int[] array;

        public void InputArray()
        {
            Console.Write("Nhap so luong phan tu cua mang (nam trong khoang tu 3 den 20): ");
            int n;

            while (!int.TryParse(Console.ReadLine(), out n) || n < 3 || n > 20)
            {
                Console.WriteLine("Gia tri khong hop le. Vui long nhap lai so luong phan tu nam trong khoang tu 3 den 20.");
                Console.Write("Nhap so luong phan tu cua mang: ");
            }

            array = new int[n];
            InputArrayElements();
        }

        private void InputArrayElements()
        {
            for (int i = 0; i < array.Length; i++)
            {
                Console.Write($"Nhap phan tu thu {i + 1}: ");
                while (!int.TryParse(Console.ReadLine(), out array[i]))
                {
                    Console.WriteLine("Gia tri khong hop le. Vui long nhap lai mot so nguyen.");
                    Console.Write($"Nhap phan tu thu {i + 1}: ");
                }
            }
        }

        public void SortArrayAscending()
        {
            for (int i = 0; i < array.Length - 1; i++)
            {
                for (int j = i + 1; j < array.Length; j++)
                {
                    if (array[i] > array[j])
                    {
                        SwapElements(ref array[i], ref array[j]);
                    }
                }
            }
        }

        private void SwapElements(ref int a, ref int b)
        {
            int temp = a;
            a = b;
            b = temp;
        }

        public void PrintSortedArray()
        {
            Console.WriteLine("Mang sau khi sap xep theo thu tu tang dan: ");
            PrintArray();
        }

        private void PrintArray()
        {
            foreach (int element in array)
            {
                Console.Write($"{element} ");
            }
            Console.WriteLine();
        }

        private bool IsPrime(int number)
        {
            if (number < 2)
            {
                return false;
            }

            for (int i = 2; i <= Math.Sqrt(number); i++)
            {
                if (number % i == 0)
                {
                    return false;
                }
            }

            return true;
        }

        public int CountPrimes()
        {
            int count = 0;

            foreach (int element in array)
            {
                if (IsPrime(element))
                {
                    count++;
                }
            }

            return count;
        }

        public void PrintPrimeCount()
        {
            int primeCount = CountPrimes();
            Console.WriteLine($"So luong phan tu so nguyen to trong mang: {primeCount}");
        }
    }
}