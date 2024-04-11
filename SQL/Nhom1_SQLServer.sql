CREATE DATABASE BookStore;
GO

USE BookStore;
GO


CREATE TABLE users (
    user_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi người dùng
    first_name NVARCHAR(15) NOT NULL, -- Tên
    middle_name NVARCHAR(250) NOT NULL,
    last_name NVARCHAR(40) NOT NULL, -- Họ
    date_of_birth DATE NOT NULL, -- Ngày sinh
    gender BIT NOT NULL, -- Giới tính (0: Nữ, 1: Nam)
    address NVARCHAR(255) NOT NULL, -- Địa chỉ
    phone VARCHAR(15) NOT NULL, -- Số điện thoại
    email VARCHAR(255) NOT NULL, -- Địa chỉ email
    image_user NVARCHAR(MAX) -- Tên name ảnh đại diện
);
GO

CREATE TABLE roles (
    role_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi vai trò
    role_name NVARCHAR(255) NOT NULL -- Tên của vai trò
);
GO

CREATE TABLE user_roles (
    user_role_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi quyền của người dùng
    user_id BIGINT NOT NULL, -- ID của người dùng
    role_id BIGINT NOT NULL, -- ID của vai trò
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (role_id) REFERENCES roles (role_id)
);
GO

CREATE TABLE user_accounts (
    account_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi tài khoản người dùng
    username VARCHAR(255) NOT NULL, -- Tên đăng nhập
    password VARCHAR(255) NOT NULL, -- Mật khẩu
    user_role_id BIGINT NOT NULL, -- ID của quyền người dùng
    FOREIGN KEY (user_role_id) REFERENCES user_roles (user_role_id)
);
GO

CREATE TABLE education_level(
    education_level_id INT IDENTITY(1,1) PRIMARY KEY,
    education_level_name NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE employees (
    employee_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi nhân viên
    user_id BIGINT NOT NULL, -- ID của người dùng (nhân viên)
    education_level_id INT NOT NULL, -- Trình độ học vấn
    work_date DATE NOT NULL, -- Ngày làm việc
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (education_level_id) REFERENCES education_level (education_level_id)
);
GO

CREATE TABLE salary_coefficient (
    salary_coefficient_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    salary_coefficient_value DECIMAL(10, 3) NOT NULL, -- Hệ số lương
    update_coefficient_date DATETIME NOT NULL, -- Ngày cập nhật hệ số lương
    role_id BIGINT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles (role_id)
);
GO

CREATE TABLE employee_salary (
    employee_salary_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi bảng lương nhân viên
    employee_id BIGINT NOT NULL, -- ID của người dùng (nhân viên)
    salary_base DECIMAL(10, 3) NOT NULL, -- Mức lương cơ bản
    salary_coefficient_id BIGINT NOT NULL, -- ID Hệ số lương
    salary_date DATE NOT NULL, -- Ngày thanh toán lương
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (salary_coefficient_id) REFERENCES salary_coefficient (salary_coefficient_id)
);
GO

CREATE TABLE employee_attendance (
    employee_attendance_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi bảng chấm công nhân viên
    employee_id BIGINT NOT NULL, -- ID của người dùng (nhân viên)
    attendance_date DATE NOT NULL, -- Ngày chấm công
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
GO

CREATE TABLE product_categories (
    category_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi danh mục sản phẩm
    category_name NVARCHAR(255) NOT NULL -- Tên của danh mục sản phẩm
);
GO

CREATE TABLE suppliers (
    supplier_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi nhà cung cấp
    supplier_name NVARCHAR(MAX) NOT NULL, -- Tên nhà cung cấp
    supplier_origin NVARCHAR(255) NOT NULL -- Nguồn gốc của nhà cung cấp
);
GO

CREATE TABLE products (
    product_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi sản phẩm
    category_id BIGINT NOT NULL, -- ID của danh mục sản phẩm
    product_price DECIMAL(10, 3) NOT NULL, -- Giá của sản phẩm
    product_image NVARCHAR(MAX) NOT NULL, -- Đường dẫn ảnh của sản phẩm
    product_quantity INT NOT NULL, -- Số lượng tồn kho của sản phẩm
    supplier_id BIGINT NOT NULL, -- ID của nhà cung cấp
    product_status NVARCHAR(100) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_categories (category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
);
GO

CREATE TABLE book_categories (
    book_category_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi danh mục sách
    book_category_name NVARCHAR(MAX) NOT NULL -- Tên của danh mục sách
);
GO

CREATE TABLE book_publishers (
    book_publisher_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi nhà xuất bản
    book_publisher_name NVARCHAR(MAX) NOT NULL -- Tên nhà xuất bản
);
GO

CREATE TABLE book_languages (
    book_language_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi ngôn ngữ sách
    book_language NVARCHAR(MAX) NOT NULL -- Ngôn ngữ của sách
);
GO

CREATE TABLE author (
    author_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    author_name NVARCHAR (255) NOT NULL
);
GO

CREATE TABLE books (
    product_id BIGINT PRIMARY KEY, -- ID duy nhất cho mỗi sách
    book_name NVARCHAR(MAX) NOT NULL, -- Tên sách
    book_category_id BIGINT NOT NULL, -- ID của danh mục sách
    book_description NVARCHAR(MAX) NULL, -- Mô tả sách
    book_language_id BIGINT NOT NULL, -- ID của ngôn ngữ sách
    book_publication_year SMALLINT NOT NULL, -- Năm xuất bản
    book_packaging_size VARCHAR(50) NOT NULL, -- Kích thước đóng gói sách
    book_format VARCHAR(50) NOT NULL, -- Định dạng sách
    book_ISBN VARCHAR(50) NOT NULL,
    book_publisher_id BIGINT NOT NULL, -- ID của nhà xuất bản
    FOREIGN KEY (book_category_id) REFERENCES book_categories (book_category_id),
    FOREIGN KEY (book_language_id) REFERENCES book_languages (book_language_id),
    FOREIGN KEY (book_publisher_id) REFERENCES book_publishers (book_publisher_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
GO

CREATE TABLE book_author (
    author_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    PRIMARY KEY (author_id,product_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (product_id) REFERENCES books(product_id),
);
GO

CREATE TABLE brands (
    brand_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi thương hiệu
    brand_name NVARCHAR(MAX) NOT NULL, -- Tên thương hiệu
    brand_origin NVARCHAR(MAX) NOT NULL -- Xuất xứ thương hiệu
);
GO

CREATE TABLE others_products (
    product_id BIGINT PRIMARY KEY, -- ID duy nhất cho mỗi sản phẩm khác
    others_product_name NVARCHAR(MAX) NOT NULL, -- Tên sản phẩm khác
    others_product_description NVARCHAR(MAX) NULL, -- Mô tả sản phẩm khác
    others_product_brand_id BIGINT NOT NULL, -- ID của thương hiệu sản phẩm khác
    others_product_color NVARCHAR(50) NOT NULL, -- Màu sắc sản phẩm khác
    others_product_material NVARCHAR(MAX) NOT NULL, -- Chất liệu sản phẩm khác
    others_product_weight DECIMAL(10,2) NOT NULL, -- Trọng lượng sản phẩm khác
    others_product_size VARCHAR(100) NOT NULL,
    FOREIGN KEY (others_product_brand_id) REFERENCES brands (brand_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
GO

CREATE TABLE orders_offline (
    order_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi đơn đặt hàng
    order_date_off DATE NOT NULL, -- Ngày đặt hàng
    total_amount_off DECIMAL(10, 3) NOT NULL, -- Tổng số tiền
    note_off NVARCHAR(255),
);
GO

CREATE TABLE customers (
    customer_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi khách hàng
    user_id BIGINT NOT NULL, -- ID của người dùng
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
GO

CREATE TABLE orders_online (
    order_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi đơn đặt hàng
    customer_id BIGINT NOT NULL, -- ID của người dùng đặt hàng
    order_date_on DATE NOT NULL, -- Ngày đặt hàng
    total_amount_on DECIMAL(10, 3) NOT NULL, -- Tổng số tiền
    status_on NVARCHAR(20) CHECK (status_on IN ('Pending', 'Confirmed', 'Shipped', 'Completed')), -- Trạng thái đơn đặt hàng
    note_on NVARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
);
GO

CREATE TABLE order_details_off (
    order_id BIGINT NOT NULL, -- ID duy nhất cho mỗi chi tiết đơn đặt hàng
    product_id BIGINT NOT NULL, -- ID của sản phẩm
    quantity INT NOT NULL, -- Số lượng sản phẩm
    discount DECIMAL(10, 3), -- Giảm giá
    FOREIGN KEY (order_id) REFERENCES orders_offline (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
GO

CREATE TABLE order_details_on (
    order_id BIGINT NOT NULL, -- ID duy nhất cho mỗi chi tiết đơn đặt hàng
    product_id BIGINT NOT NULL, -- ID của sản phẩm
    quantity INT NOT NULL, -- Số lượng sản phẩm
    discount DECIMAL(10, 3), -- Giảm giá
    FOREIGN KEY (order_id) REFERENCES orders_online (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
GO

CREATE TABLE payments_off(
    payment_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi thanh toán
    order_id BIGINT NOT NULL,
    payment_date DATE NOT NULL, -- Ngày thanh toán
    payment_method NVARCHAR(50) NOT NULL, -- Phương thức thanh toán
    amount DECIMAL(10, 3) NOT NULL, -- Số tiền thanh toán
    status_pay NVARCHAR(20) NOT NULL, -- Trạng thái thanh toán
    FOREIGN KEY (order_id) REFERENCES orders_offline (order_id)
);
GO

CREATE TABLE payments_on(
    payment_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi thanh toán
    order_id BIGINT NOT NULL,
    payment_date DATE NOT NULL, -- Ngày thanh toán
    payment_method NVARCHAR(50) NOT NULL, -- Phương thức thanh toán
    amount DECIMAL(10, 3) NOT NULL, -- Số tiền thanh toán
    status_pay NVARCHAR(20) NOT NULL, -- Trạng thái thanh toán
    FOREIGN KEY (order_id) REFERENCES orders_online (order_id)
);
GO

-- Bảng Nhập kho
CREATE TABLE stock_in (
	stock_in_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID của phiếu nhập kho, tự tăng
	inflow_date DATE NOT NULL,
    employee_id BIGINT NOT NULL, -- ID của nhân viên thực hiện
    tolal_amount_in DECIMAL(10, 3), -- Tổng giá phiếu nhập
    note_in NVARCHAR(MAX), -- Ghi chú
    FOREIGN KEY (employee_id) REFERENCES users (user_id)
);
GO

CREATE TABLE stock_out (
	stock_out_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID của phiếu xuất kho, tự tăng
	outflow_date DATE NOT NULL,
    employee_id BIGINT NOT NULL, -- ID của nhân viên thực hiện
    tolal_amount_out DECIMAL(10, 3), -- Tổng giá phiếu xuất
    note_out NVARCHAR(MAX), -- Ghi chú
    FOREIGN KEY (employee_id) REFERENCES users (user_id)
);
GO

-- Bảng Chi tiết nhập hàng
CREATE TABLE stock_in_details (
	stock_in_id BIGINT NOT NULL, -- ID của phiếu nhập kho
	product_id BIGINT NOT NULL, -- ID của sản phẩm
	quantity_in INT NOT NULL, -- Số lượng nhập
	unit_price_in DECIMAL(10, 3) NOT NULL, -- Giá mỗi đơn vị
	PRIMARY KEY (stock_in_id, product_id), -- Khóa chính
	FOREIGN KEY (stock_in_id) REFERENCES stock_in(stock_in_id), -- Khóa ngoại liên kết với bảng phiếu nhập kho
	FOREIGN KEY (product_id) REFERENCES products(product_id) -- Khóa ngoại liên kết với bảng sản phẩm
);
GO

--Bảng Chi tiết xuất hàng
CREATE TABLE stock_out_details (
	stock_out_id BIGINT NOT NULL, -- ID của phiếu xuất kho
	product_id BIGINT NOT NULL, -- ID của sản phẩm
	quantity_out INT NOT NULL, -- Số lượng xuất
	unit_price_out DECIMAL(10, 3) NOT NULL, -- Giá mỗi đơn vị
	PRIMARY KEY (stock_out_id, product_id), -- Khóa chính
	FOREIGN KEY (product_id) REFERENCES products(product_id), -- Khóa ngoại liên kết với bảng sản phẩm
	FOREIGN KEY (stock_out_id) REFERENCES stock_out(stock_out_id) -- Khóa ngoại liên kết với bảng phiếu xuất kho
);
GO
