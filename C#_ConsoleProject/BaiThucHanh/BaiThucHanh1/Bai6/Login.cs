using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bai6
{
    internal class Login
    {
        private string password;

        public void Input()
        {
            byte count_input = 0;
            string set_password = "123"; 
            while (count_input < 3)
            {
                Console.WriteLine("Nhap mat khau: ");
                password = Console.ReadLine();
                if (set_password == password)
                {
                    Console.WriteLine("Mat khau chinh xac");
                    break;
                }
                count_input++;
            }

            if (count_input == 3)
            {
                Console.WriteLine("Ban da nhap qua 3 lan.");
            }
        }
        
    }
}
