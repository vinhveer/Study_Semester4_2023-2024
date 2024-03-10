-- Tạo hoặc chọn CSDL BookStore với bảng có bảng mã UTF-8 và so sánh utf8_unicode_ci
DROP DATABASE IF EXISTS BookStore;
CREATE DATABASE BookStore;
USE BookStore;

-- Chủ thể: Con người
CREATE TABLE users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi người dùng
    first_name VARCHAR(15) NOT NULL, -- Tên
    last_name VARCHAR(40) NOT NULL, -- Họ
    date_of_birth DATE NOT NULL, -- Ngày sinh
    gender BOOLEAN NOT NULL, -- Giới tính (0: Nữ, 1: Nam)
    address VARCHAR(255) NOT NULL, -- Địa chỉ
    phone VARCHAR(15) NOT NULL, -- Số điện thoại
    email VARCHAR(255) NOT NULL, -- Địa chỉ email
    image_dir TEXT -- Đường dẫn ảnh đại diện
);

CREATE TABLE roles (
    role_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi vai trò
    role_name VARCHAR(255) NOT NULL -- Tên của vai trò
);

CREATE TABLE user_roles (
    user_role_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi quyền của người dùng
    user_id BIGINT NOT NULL, -- ID của người dùng
    role_id BIGINT NOT NULL, -- ID của vai trò
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (role_id) REFERENCES roles (role_id)
);

CREATE TABLE user_accounts (
    account_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi tài khoản người dùng
    username VARCHAR(255) NOT NULL, -- Tên đăng nhập
    password VARCHAR(255) NOT NULL, -- Mật khẩu
    user_role_id BIGINT NOT NULL, -- ID của quyền người dùng
    FOREIGN KEY (user_role_id) REFERENCES user_roles (user_role_id)
);

-- Chủ thể: Nhân viên
CREATE TABLE employee_salary (
    employee_salary_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi bảng lương nhân viên
    user_id BIGINT NOT NULL, -- ID của người dùng (nhân viên)
    salary DECIMAL(10, 2) NOT NULL, -- Mức lương
    salary_date DATE NOT NULL, -- Ngày thanh toán lương
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE employee_attendance (
    employee_attendance_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi bảng chấm công nhân viên
    user_id BIGINT NOT NULL, -- ID của người dùng (nhân viên)
    attendance_date DATE NOT NULL, -- Ngày chấm công
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Chủ thể: Sản phẩm
CREATE TABLE product_categories (
    category_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi danh mục sản phẩm
    category_name VARCHAR(255) NOT NULL -- Tên của danh mục sản phẩm
);

CREATE TABLE suppliers (
    supplier_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi nhà cung cấp
    supplier_name TEXT NOT NULL, -- Tên nhà cung cấp
    supplier_origin VARCHAR(255) NOT NULL -- Nguồn gốc của nhà cung cấp
);

CREATE TABLE products (
    product_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi sản phẩm
    category_id BIGINT NOT NULL, -- ID của danh mục sản phẩm
    product_price DECIMAL(10, 2) NOT NULL, -- Giá của sản phẩm
    product_image TEXT NOT NULL, -- Đường dẫn ảnh của sản phẩm
    product_quantity INT NOT NULL, -- Số lượng tồn kho của sản phẩm
    supplier_id BIGINT NOT NULL, -- ID của nhà cung cấp
    product_status VARCHAR(100) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_categories (category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
);

CREATE TABLE book_categories (
    book_category_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi danh mục sách
    book_category_name TEXT NOT NULL -- Tên của danh mục sách
);

CREATE TABLE book_publishers (
    book_publisher_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi nhà xuất bản
    book_publisher_name TEXT NOT NULL -- Tên nhà xuất bản
);

CREATE TABLE book_authors (
    book_author_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi tác giả sách
    book_author_name TEXT NOT NULL -- Tên của tác giả sách
);

CREATE TABLE book_languages (
    book_language_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi ngôn ngữ sách
    book_language TEXT NOT NULL -- Ngôn ngữ của sách
);

CREATE TABLE books (
    book_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi sách
    book_name TEXT NOT NULL, -- Tên sách
    book_category_id BIGINT NOT NULL, -- ID của danh mục sách
    book_description TEXT NOT NULL, -- Mô tả sách
    book_language_id BIGINT NOT NULL, -- ID của ngôn ngữ sách
    book_publication_year SMALLINT NOT NULL, -- Năm xuất bản
    book_packaging_size VARCHAR(15) NOT NULL, -- Kích thước đóng gói sách
    book_format_id VARCHAR(50) NOT NULL, -- Định dạng sách
    book_publisher_id BIGINT NOT NULL, -- ID của nhà xuất bản
    book_author_id BIGINT NOT NULL, -- ID của tác giả sách
    FOREIGN KEY (book_category_id) REFERENCES book_categories (book_category_id),
    FOREIGN KEY (book_language_id) REFERENCES book_languages (book_language_id),
    FOREIGN KEY (book_publisher_id) REFERENCES book_publishers (book_publisher_id),
    FOREIGN KEY (book_author_id) REFERENCES book_authors (book_author_id),
    FOREIGN KEY (book_id) REFERENCES products (product_id)
);

CREATE TABLE brands (
    brand_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi thương hiệu
    brand_name TEXT NOT NULL, -- Tên thương hiệu
    brand_origin TEXT NOT NULL -- Xuất xứ thương hiệu
);

CREATE TABLE others_products (
    others_product_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi sản phẩm khác
    others_product_name TEXT NOT NULL, -- Tên sản phẩm khác
    others_product_description TEXT NOT NULL, -- Mô tả sản phẩm khác
    others_product_brand_id BIGINT NOT NULL, -- ID của thương hiệu sản phẩm khác
    others_product_color VARCHAR(50) NOT NULL, -- Màu sắc sản phẩm khác
    others_product_material TEXT NOT NULL, -- Chất liệu sản phẩm khác
    others_product_weight INT NOT NULL, -- Trọng lượng sản phẩm khác
    FOREIGN KEY (others_product_brand_id) REFERENCES brands (brand_id),
    FOREIGN KEY (others_product_id) REFERENCES products (product_id)
);

-- Mua hàng

CREATE TABLE order_details (
    order_detail_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi chi tiết đơn đặt hàng
    product_id BIGINT NOT NULL, -- ID của sản phẩm
    quantity INT NOT NULL, -- Số lượng sản phẩm
    discount DECIMAL(10, 4), -- Giảm giá
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE payments (
    payment_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi thanh toán
    payment_date DATE NOT NULL, -- Ngày thanh toán
    payment_method VARCHAR(50) NOT NULL, -- Phương thức thanh toán
    amount DECIMAL(10, 2) NOT NULL, -- Số tiền thanh toán
    status VARCHAR(20) NOT NULL -- Trạng thái thanh toán
);

-- Mua hàng trực tiếp
CREATE TABLE orders_offline (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi đơn đặt hàng
    order_date DATE NOT NULL, -- Ngày đặt hàng
    total_amount DECIMAL(10, 2) NOT NULL, -- Tổng số tiền
    payment_id BIGINT NOT NULL,
    note VARCHAR(255),
    FOREIGN KEY (payment_id) REFERENCES payments (payment_id)
);


-- Mua hàng online
CREATE TABLE customers (
    customer_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi khách hàng
    user_id BIGINT NOT NULL, -- ID của người dùng
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE orders_online (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi đơn đặt hàng
    customer_id BIGINT NOT NULL, -- ID của người dùng đặt hàng
    order_date DATE NOT NULL, -- Ngày đặt hàng
    total_amount DECIMAL(10, 2) NOT NULL, -- Tổng số tiền
    payment_id BIGINT NOT NULL, -- Thanh toán
    status ENUM('Pending', 'Confirmed', 'Shipped', 'Completed'), -- Trạng thái đơn đặt hàng
    note VARCHAR(255),
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
-- Warehouse Inflow Table
CREATE TABLE warehouse_inflow (
    warehouse_inflow_id INT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi luồng nhập kho
    product_id BIGINT, -- ID của sản phẩm (Khóa ngoại)
    transaction_type VARCHAR(50),
    quantity INT,
    inflow_date DATE,
    unit_price DECIMAL(10, 4),
    employee_id BIGINT, -- ID của nhân viên (Khóa ngoại)
    note TEXT,
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (employee_id) REFERENCES users (user_id)
);

-- Warehouse Outflow Table
CREATE TABLE warehouse_outflow (
    warehouse_outflow_id INT AUTO_INCREMENT PRIMARY KEY, -- ID duy nhất cho mỗi luồng xuất kho
    product_id BIGINT, -- ID của sản phẩm (Khóa ngoại)
    transaction_type VARCHAR(50),
    quantity INT,
    outflow_date DATE,
    unit_price DECIMAL(10, 4),
    employee_id BIGINT, -- ID của nhân viên (Khóa ngoại)
    note TEXT,
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (employee_id) REFERENCES users (user_id)
);
