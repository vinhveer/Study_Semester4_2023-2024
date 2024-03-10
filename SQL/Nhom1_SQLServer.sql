﻿DROP DATABASE BookStore;

CREATE DATABASE BookStore;

USE BookStore;

-- Chủ thể: Con người
CREATE TABLE users (
    user_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi người dùng
    first_name NVARCHAR(15) NOT NULL, -- Tên
    last_name NVARCHAR(40) NOT NULL, -- Họ
    date_of_birth DATE NOT NULL, -- Ngày sinh
    gender BIT NOT NULL, -- Giới tính (0: Nữ, 1: Nam)
    address NVARCHAR(255) NOT NULL, -- Địa chỉ
    phone NVARCHAR(15) NOT NULL, -- Số điện thoại
    email NVARCHAR(255) NOT NULL, -- Địa chỉ email
    image_dir NVARCHAR(MAX) -- Đường dẫn ảnh đại diện
);

CREATE TABLE roles (
    role_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi vai trò
    role_name NVARCHAR(255) NOT NULL -- Tên của vai trò
);

CREATE TABLE user_roles (
    user_role_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi quyền của người dùng
    user_id BIGINT NOT NULL, -- ID của người dùng
    role_id BIGINT NOT NULL, -- ID của vai trò
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (role_id) REFERENCES roles (role_id)
);

CREATE TABLE user_accounts (
    account_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi tài khoản người dùng
    username NVARCHAR(255) NOT NULL, -- Tên đăng nhập
    password NVARCHAR(255) NOT NULL, -- Mật khẩu
    user_role_id BIGINT NOT NULL, -- ID của quyền người dùng
    FOREIGN KEY (user_role_id) REFERENCES user_roles (user_role_id)
);

-- Chủ thể: Nhân viên
CREATE TABLE employee_salary (
    employee_salary_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi bảng lương nhân viên
    user_id BIGINT NOT NULL, -- ID của người dùng (nhân viên)
    salary DECIMAL(10, 2) NOT NULL, -- Mức lương
    salary_date DATE NOT NULL, -- Ngày thanh toán lương
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE employee_attendance (
    employee_attendance_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi bảng chấm công nhân viên
    user_id BIGINT NOT NULL, -- ID của người dùng (nhân viên)
    attendance_date DATE NOT NULL, -- Ngày chấm công
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Chủ thể: Sản phẩm
CREATE TABLE product_categories (
    category_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi danh mục sản phẩm
    category_name NVARCHAR(255) NOT NULL -- Tên của danh mục sản phẩm
);

CREATE TABLE suppliers (
    supplier_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi nhà cung cấp
    supplier_name NVARCHAR(MAX) NOT NULL, -- Tên nhà cung cấp
    supplier_origin NVARCHAR(255) NOT NULL -- Nguồn gốc của nhà cung cấp
);

CREATE TABLE products (
    product_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi sản phẩm
    category_id BIGINT NOT NULL, -- ID của danh mục sản phẩm
    product_price DECIMAL(10, 2) NOT NULL, -- Giá của sản phẩm
    product_image NVARCHAR(MAX) NOT NULL, -- Đường dẫn ảnh của sản phẩm
    product_quantity INT NOT NULL, -- Số lượng tồn kho của sản phẩm
    supplier_id BIGINT NOT NULL, -- ID của nhà cung cấp
    product_status NVARCHAR(100) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_categories (category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
);

CREATE TABLE book_categories (
    book_category_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi danh mục sách
    book_category_name NVARCHAR(MAX) NOT NULL -- Tên của danh mục sách
);

CREATE TABLE book_publishers (
    book_publisher_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi nhà xuất bản
    book_publisher_name NVARCHAR(MAX) NOT NULL -- Tên nhà xuất bản
);

CREATE TABLE book_authors (
    book_author_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi tác giả sách
    book_author_name NVARCHAR(MAX) NOT NULL -- Tên của tác giả sách
);

CREATE TABLE book_languages (
    book_language_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi ngôn ngữ sách
    book_language NVARCHAR(MAX) NOT NULL -- Ngôn ngữ của sách
);

CREATE TABLE books (
    book_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi sách
    book_name NVARCHAR(MAX) NOT NULL, -- Tên sách
    book_category_id BIGINT NOT NULL, -- ID của danh mục sách
    book_description NVARCHAR(MAX) NOT NULL, -- Mô tả sách
    book_language_id BIGINT NOT NULL, -- ID của ngôn ngữ sách
    book_publication_year SMALLINT NOT NULL, -- Năm xuất bản
    book_packaging_size NVARCHAR(15) NOT NULL, -- Kích thước đóng gói sách
    book_format_id NVARCHAR(50) NOT NULL, -- Định dạng sách
    book_publisher_id BIGINT NOT NULL, -- ID của nhà xuất bản
    book_author_id BIGINT NOT NULL, -- ID của tác giả sách
    FOREIGN KEY (book_category_id) REFERENCES book_categories (book_category_id),
    FOREIGN KEY (book_language_id) REFERENCES book_languages (book_language_id),
    FOREIGN KEY (book_publisher_id) REFERENCES book_publishers (book_publisher_id),
    FOREIGN KEY (book_author_id) REFERENCES book_authors (book_author_id),
    FOREIGN KEY (book_id) REFERENCES products (product_id)
);

CREATE TABLE brands (
    brand_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi thương hiệu
    brand_name NVARCHAR(MAX) NOT NULL, -- Tên thương hiệu
    brand_origin NVARCHAR(MAX) NOT NULL -- Xuất xứ thương hiệu
);

CREATE TABLE others_products (
    others_product_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi sản phẩm khác
    others_product_name NVARCHAR(MAX) NOT NULL, -- Tên sản phẩm khác
    others_product_description NVARCHAR(MAX) NOT NULL, -- Mô tả sản phẩm khác
    others_product_brand_id BIGINT NOT NULL, -- ID của thương hiệu sản phẩm khác
    others_product_color NVARCHAR(50) NOT NULL, -- Màu sắc sản phẩm khác
    others_product_material NVARCHAR(MAX) NOT NULL, -- Chất liệu sản phẩm khác
    others_product_weight INT NOT NULL, -- Trọng lượng sản phẩm khác
    FOREIGN KEY (others_product_brand_id) REFERENCES brands (brand_id),
    FOREIGN KEY (others_product_id) REFERENCES products (product_id)
);

-- Mua hàng

CREATE TABLE order_details (
    order_detail_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi chi tiết đơn đặt hàng
    product_id BIGINT NOT NULL, -- ID của sản phẩm
    quantity INT NOT NULL, -- Số lượng sản phẩm
    discount DECIMAL(10, 4), -- Giảm giá
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE payments (
    payment_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi thanh toán
    payment_date DATE NOT NULL, -- Ngày thanh toán
    payment_method NVARCHAR(50) NOT NULL, -- Phương thức thanh toán
    amount DECIMAL(10, 2) NOT NULL, -- Số tiền thanh toán
    status NVARCHAR(20) NOT NULL -- Trạng thái thanh toán
);

-- Mua hàng trực tiếp
CREATE TABLE orders_offline (
    order_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi đơn đặt hàng
    order_date DATE NOT NULL, -- Ngày đặt hàng
    total_amount DECIMAL(10, 2) NOT NULL, -- Tổng số tiền
    payment_id BIGINT NOT NULL,
    note NVARCHAR(255),
    FOREIGN KEY (payment_id) REFERENCES payments (payment_id)
);


-- Mua hàng online
CREATE TABLE customers (
    customer_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi khách hàng
    user_id BIGINT NOT NULL, -- ID của người dùng
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE orders_online (
    order_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID duy nhất cho mỗi đơn đặt hàng
    customer_id BIGINT NOT NULL, -- ID của người dùng đặt hàng
    order_date DATE NOT NULL, -- Ngày đặt hàng
    total_amount DECIMAL(10, 2) NOT NULL, -- Tổng số tiền
    payment_id BIGINT NOT NULL, -- Thanh toán
    status NVARCHAR(20) CHECK (status IN ('Pending', 'Confirmed', 'Shipped', 'Completed')), -- Trạng thái đơn đặt hàng
    note NVARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (payment_id) REFERENCES payments (payment_id)
);

CREATE TABLE order_list_on (
    order_id BIGINT NOT NULL, -- ID của đơn hàng
    order_detail_id BIGINT NOT NULL, -- ID của chi tiết đơn hàng
    PRIMARY KEY (order_id, order_detail_id), -- Thiết lập khóa chính gồm cả hai trường
    FOREIGN KEY (order_id) REFERENCES orders_online (order_id) ON DELETE CASCADE, -- Tham chiếu đến đơn hàng online
    FOREIGN KEY (order_detail_id) REFERENCES order_details (order_detail_id) ON DELETE CASCADE -- Tham chiếu đến chi tiết đơn hàng
);
CREATE TABLE order_list_off (
    order_id BIGINT NOT NULL, -- ID của đơn hàng
    order_detail_id BIGINT NOT NULL, -- ID của chi tiết đơn hàng
    PRIMARY KEY (order_id, order_detail_id), -- Thiết lập khóa chính gồm cả hai trường
    FOREIGN KEY (order_id) REFERENCES orders_offline (order_id) ON DELETE CASCADE, -- Tham chiếu đến đơn hàng offline
    FOREIGN KEY (order_detail_id) REFERENCES order_details (order_detail_id) ON DELETE CASCADE -- Tham chiếu đến chi tiết đơn hàng
);

-- Bảng Nhập kho
CREATE TABLE stock_in (
	stock_in_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID của phiếu nhập kho, tự tăng
	outflow_date DATE NOT NULL,
    employee_id BIGINT NOT NULL, -- ID của nhân viên thực hiện
    tolal_amount_in DECIMAL(10, 4), -- Tổng giá phiếu nhập
    note NVARCHAR(MAX), -- Ghi chú
    FOREIGN KEY (employee_id) REFERENCES users (user_id)
);
-- Bảng Xuất kho
CREATE TABLE stock_out (
	stock_out_id BIGINT IDENTITY(1,1) PRIMARY KEY, -- ID của phiếu xuất kho, tự tăng
	outflow_date DATE NOT NULL,
    employee_id BIGINT NOT NULL, -- ID của nhân viên thực hiện
    tolal_amount_in DECIMAL(10, 4), -- Tổng giá phiếu xuất
    note NVARCHAR(MAX), -- Ghi chú
    FOREIGN KEY (employee_id) REFERENCES users (user_id)
);

-- Bảng Chi tiết nhập hàng
CREATE TABLE stock_in_details (
	stock_in_id BIGINT NOT NULL, -- ID của phiếu nhập kho
	product_id BIGINT NOT NULL, -- ID của sản phẩm
	quantity_in INT NOT NULL, -- Số lượng nhập
	unit_price DECIMAL(10, 3) NOT NULL, -- Giá mỗi đơn vị
	PRIMARY KEY (stock_in_id, product_id), -- Khóa chính
	FOREIGN KEY (stock_in_id) REFERENCES stock_in(stock_in_id), -- Khóa ngoại liên kết với bảng phiếu nhập kho
	FOREIGN KEY (product_id) REFERENCES products(product_id) -- Khóa ngoại liên kết với bảng sản phẩm
);

--Bảng Chi tiết xuất hàng
CREATE TABLE stock_out_details (
	stock_out_id BIGINT NOT NULL, -- ID của phiếu xuất kho
	product_id BIGINT NOT NULL, -- ID của sản phẩm
	quantity_out INT NOT NULL, -- Số lượng xuất
	unit_price DECIMAL(10, 3) NOT NULL, -- Giá mỗi đơn vị
	PRIMARY KEY (stock_out_id, product_id), -- Khóa chính
	FOREIGN KEY (product_id) REFERENCES products(product_id), -- Khóa ngoại liên kết với bảng sản phẩm
	FOREIGN KEY (stock_out_id) REFERENCES stock_out(stock_out_id) -- Khóa ngoại liên kết với bảng phiếu xuất kho
);