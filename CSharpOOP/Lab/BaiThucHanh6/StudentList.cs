using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace BaiThucHanh6
{
    public partial class StudentList : Form
    {
        List<Student> students;
        string imagePath = "";

        public StudentList()
        {
            InitializeComponent();
            students = new List<Student>();
            LoadStudentsFromFile();
            UpdateDataGridView();
        }

        private void ClearInputFields()
        {
            txtStudentId.Text = "";
            txtStudentName.Text = "";
            imagePath = "";
            pictureBox1.Image = null;
        }

        private void UpdateDataGridView()
        {
            dataGridView1.DataSource = null;
            dataGridView1.DataSource = students;
        }

        private void SaveStudentsToFile()
        {
            try
            {
                using (StreamWriter sw = new StreamWriter(@"D:\OOP\SV_out.txt"))
                {
                    foreach (Student student in students)
                    {
                        sw.WriteLine(student.studentId);
                        sw.WriteLine(student.studentName);
                        sw.WriteLine(student.studentImage);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoadStudentsFromFile()
        {
            try
            {
                using (StreamReader sr = new StreamReader(@"../../../assets/student.txt"))
                {
                    string studentId;
                    while ((studentId = sr.ReadLine()) != null)
                    {
                        string studentName = sr.ReadLine();
                        string studentImage = sr.ReadLine();
                        students.Add(new Student(studentId, studentName, studentImage));
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string studentId = txtStudentId.Text;
            string studentName = txtStudentName.Text;
            string studentImage = imagePath;

            Student student = new Student(studentId, studentName, studentImage);
            students.Add(student);
            UpdateDataGridView();
            ClearInputFields();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int index = students.FindIndex(s => s.studentId == txtStudentId.Text);
            if (index != -1)
            {
                students[index].studentName = txtStudentName.Text;
                students[index].studentImage = imagePath;
                UpdateDataGridView();
                ClearInputFields();
            }
            else
            {
                MessageBox.Show("Sinh viên không tồn tại!");
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int index = students.FindIndex(s => s.studentId == txtStudentId.Text);
            if (index != -1)
            {
                students.RemoveAt(index);
                UpdateDataGridView();
                ClearInputFields();
            }
            else
            {
                MessageBox.Show("Sinh viên không tồn tại!");
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files|*.jpg;*.jpeg;*.png;"
            };
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                imagePath = openFileDialog.FileName;
                pictureBox1.Image = Image.FromFile(imagePath);
            }
        }

        private void StudentList_FormClosing(object sender, FormClosingEventArgs e)
        {
            SaveStudentsToFile();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                txtStudentId.Text = row.Cells["StudentId"].Value?.ToString() ?? string.Empty;
                txtStudentName.Text = row.Cells["StudentName"].Value?.ToString() ?? string.Empty;
                string relativePath = Path.Combine("../../../assets/", imagePath);
                string absolutePath = Path.GetFullPath(relativePath);

                if (File.Exists(absolutePath))
                {
                    pictureBox1.Image = Image.FromFile(absolutePath);
                }
                else
                {
                    pictureBox1.Image = null;
                }
            }
        }
    }
}
