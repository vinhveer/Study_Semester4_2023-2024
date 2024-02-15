using System;
using System.Collections.Generic;
using System.Linq;

namespace Vidu2_Chude2_LTHDT
{
    internal class Program
    {
        // Nhập giá trị vào biến, minValue và maxValue không bắt buộc
        private static int GetValidIntegerInput(string prompt, int? minValue = null, int? maxValue = null)
        {
            int result;
            bool isValidInput;

            do
            {
                Console.Write(prompt);
                string userInput = Console.ReadLine();
                
                isValidInput = int.TryParse(userInput, out result);

                if (isValidInput && (minValue.HasValue && result < minValue.Value || maxValue.HasValue && result >= maxValue.Value))
                {
                    isValidInput = false;
                }

                if (!isValidInput)
                {
                    Console.WriteLine($"Error: Please enter a valid integer{(minValue.HasValue ? $" greater than or equal to {minValue.Value}" : "")}{(maxValue.HasValue ? $" and less than {maxValue.Value}" : "")}.");
                }

            } while (!isValidInput);

            return result;
        }

        public static void Input(out int n, out List<int> a)
        {
            n = GetValidIntegerInput("Enter the value of N (with 2 < n < 20): ", 2, 20);

            a = new List<int>();

            Console.WriteLine("Enter values into the array...");
            for (int i = 0; i < n; i++)
            {
                a.Add(GetValidIntegerInput($"a[{i}] = "));
            }
        }

        public static int Sum(List<int> a)
        {
            return a.Sum();
        }

        static void Main(string[] args)
        {
            int n;
            List<int> a;

            try
            {
                Input(out n, out a);

                int result = Sum(a);
                Console.WriteLine($"Sum of elements in the list: {result}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return;
            }
        }
    }
}
