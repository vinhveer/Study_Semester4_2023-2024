namespace BaiThucHanh6
{
    partial class StudentList
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lblTitle = new Label();
            lblStudentId = new Label();
            lblStudentName = new Label();
            txtStudentId = new TextBox();
            txtStudentName = new TextBox();
            pictureBox1 = new PictureBox();
            lblStudentImg = new Label();
            btnAdd = new Button();
            btnEdit = new Button();
            btnDelete = new Button();
            dataGridView1 = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // lblTitle
            // 
            lblTitle.AutoSize = true;
            lblTitle.Font = new Font("Segoe UI Semibold", 18F, FontStyle.Bold, GraphicsUnit.Point, 0);
            lblTitle.Location = new Point(52, 33);
            lblTitle.Name = "lblTitle";
            lblTitle.Size = new Size(344, 48);
            lblTitle.TabIndex = 0;
            lblTitle.Text = "Danh sách sinh viên";
            // 
            // lblStudentId
            // 
            lblStudentId.AutoSize = true;
            lblStudentId.Location = new Point(52, 109);
            lblStudentId.Name = "lblStudentId";
            lblStudentId.Size = new Size(135, 25);
            lblStudentId.TabIndex = 1;
            lblStudentId.Text = "Mã số sinh viên";
            // 
            // lblStudentName
            // 
            lblStudentName.AutoSize = true;
            lblStudentName.Location = new Point(52, 184);
            lblStudentName.Name = "lblStudentName";
            lblStudentName.Size = new Size(112, 25);
            lblStudentName.TabIndex = 2;
            lblStudentName.Text = "Tên sinh viên";
            // 
            // txtStudentId
            // 
            txtStudentId.Location = new Point(52, 137);
            txtStudentId.Name = "txtStudentId";
            txtStudentId.Size = new Size(370, 31);
            txtStudentId.TabIndex = 3;
            // 
            // txtStudentName
            // 
            txtStudentName.Location = new Point(52, 212);
            txtStudentName.Name = "txtStudentName";
            txtStudentName.Size = new Size(370, 31);
            txtStudentName.TabIndex = 4;
            // 
            // pictureBox1
            // 
            pictureBox1.Location = new Point(456, 137);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(185, 167);
            pictureBox1.TabIndex = 5;
            pictureBox1.TabStop = false;
            pictureBox1.Click += pictureBox1_Click;
            // 
            // lblStudentImg
            // 
            lblStudentImg.AutoSize = true;
            lblStudentImg.Location = new Point(456, 109);
            lblStudentImg.Name = "lblStudentImg";
            lblStudentImg.Size = new Size(118, 25);
            lblStudentImg.TabIndex = 6;
            lblStudentImg.Text = "Ảnh sinh viên";
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(52, 264);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(101, 40);
            btnAdd.TabIndex = 7;
            btnAdd.Text = "Thêm";
            btnAdd.UseVisualStyleBackColor = true;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnEdit
            // 
            btnEdit.Location = new Point(159, 264);
            btnEdit.Name = "btnEdit";
            btnEdit.Size = new Size(101, 40);
            btnEdit.TabIndex = 8;
            btnEdit.Text = "Sửa";
            btnEdit.UseVisualStyleBackColor = true;
            btnEdit.Click += btnEdit_Click;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(266, 264);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(101, 40);
            btnDelete.TabIndex = 9;
            btnDelete.Text = "Xóa";
            btnDelete.UseVisualStyleBackColor = true;
            btnDelete.Click += btnDelete_Click;
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(52, 347);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 62;
            dataGridView1.Size = new Size(589, 225);
            dataGridView1.TabIndex = 10;
            dataGridView1.CellClick += dataGridView1_CellClick;
            // 
            // StudentList
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(708, 610);
            Controls.Add(dataGridView1);
            Controls.Add(btnDelete);
            Controls.Add(btnEdit);
            Controls.Add(btnAdd);
            Controls.Add(lblStudentImg);
            Controls.Add(pictureBox1);
            Controls.Add(txtStudentName);
            Controls.Add(txtStudentId);
            Controls.Add(lblStudentName);
            Controls.Add(lblStudentId);
            Controls.Add(lblTitle);
            Name = "StudentList";
            Text = "Danh sách sinh viên";
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblTitle;
        private Label lblStudentId;
        private Label lblStudentName;
        private TextBox txtStudentId;
        private TextBox txtStudentName;
        private PictureBox pictureBox1;
        private Label lblStudentImg;
        private Button btnAdd;
        private Button btnEdit;
        private Button btnDelete;
        private DataGridView dataGridView1;
    }
}