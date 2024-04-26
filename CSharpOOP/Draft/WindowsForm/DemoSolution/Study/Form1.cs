using System;
using System.Windows.Forms;

namespace Study
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int number1, number2;

            if (!int.TryParse(txtNumber1.Text, out number1) || !int.TryParse(txtNumber2.Text, out number2))
            {
                MessageBox.Show("Vui lòng nhập số nguyên hợp lệ cho cả hai số.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (number1 == 0)
            {
                if (number2 == 0)
                {
                    MessageBox.Show("Phương trình có vô số nghiệm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Phương trình vô nghiệm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                double x = -((double)number2 / number1); // Tính giá trị của x
                txtResult.Text = x.ToString(); // Hiển thị giá trị của x
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void txtResult_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
