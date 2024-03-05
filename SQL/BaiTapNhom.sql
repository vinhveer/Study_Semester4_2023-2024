CREATE DATABASE IF NOT EXISTS BookStore CHARACTER SET UTF8 COLLATE utf8_unicode_ci;
USE BookStore;

-- Chủ thể: Con người
CREATE TABLE users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender BOOLEAN NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    image_dir TEXT
);

CREATE TABLE roles (
    role_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL
);

CREATE TABLE user_roles (
    user_role_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (role_id) REFERENCES roles (role_id)
);

CREATE TABLE user_accounts (
    account_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_role_id BIGINT NOT NULL,
    FOREIGN KEY (user_role_id) REFERENCES user_roles (user_role_id)
);

-- Chủ thể: Sản phẩm
CREATE TABLE product_categories (
    category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE suppliers (
    supplier_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    supplier_name TEXT NOT NULL,
    supplier_origin VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_id BIGINT NOT NULL,
    product_price DOUBLE NOT NULL,
    product_image TEXT NOT NULL,
    product_quantity INT NOT NULL,
    supplier_id BIGINT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_categories (category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
);

CREATE TABLE book_categories (
    book_category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    book_category_name TEXT NOT NULL
);

CREATE TABLE book_publishers (
    book_publisher_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    book_publisher_name TEXT NOT NULL
);

CREATE TABLE book_authors (
    book_author_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    book_author_name TEXT NOT NULL
);

CREATE TABLE book_languages (
    book_language_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    book_language TEXT NOT NULL
);

CREATE TABLE books (
    book_id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    book_name TEXT NOT NULL,
    book_category_id BIGINT NOT NULL,
    book_description TEXT NOT NULL,
    book_language_id BIGINT NOT NULL,
    book_publication_year SMALLINT NOT NULL,
    book_packaging_size VARCHAR(15) NOT NULL,
    book_format_id VARCHAR(50) NOT NULL,
    book_publisher_id BIGINT NOT NULL,
    book_author_id BIGINT NOT NULL,
    FOREIGN KEY (book_category_id) REFERENCES book_categories (book_category_id),
    FOREIGN KEY (book_language_id) REFERENCES book_languages (book_language_id),
    FOREIGN KEY (book_publisher_id) REFERENCES book_publishers (book_publisher_id),
    FOREIGN KEY (book_author_id) REFERENCES book_authors (book_author_id),
    FOREIGN KEY (book_id) REFERENCES products (product_id)
);

CREATE TABLE brands (
    brand_id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    brand_name TEXT NOT NULL,
    brand_origin TEXT NOT NULL
);

CREATE TABLE others_products (
    others_product_id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    others_product_name TEXT NOT NULL,
    others_product_description TEXT NOT NULL,
    others_product_brand_id BIGINT NOT NULL,
    others_product_color VARCHAR(50) NOT NULL,
    others_product_material TEXT NOT NULL,
    others_product_weight INT NOT NULL,
    FOREIGN KEY (others_product_brand_id) REFERENCES brands (brand_id),
    FOREIGN KEY (others_product_id) REFERENCES products (product_id)
);

-- Mua hàng
CREATE TABLE orders (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DOUBLE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE order_details (
    order_detail_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DOUBLE NOT NULL,
    subtotal DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE customers (
    customer_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    shipping_address VARCHAR(255) NOT NULL,
    billing_address VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
-- Thêm hình thức mua hàng
-- Thêm chiết khấu
CREATE TABLE payments (
    payment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DOUBLE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

CREATE TABLE online_orders (
    online_order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DOUBLE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- Chủ thể: Nhân viên
CREATE TABLE employee_salary (
    employee_salary_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    salary DOUBLE NOT NULL,
    salary_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE employee_attendance (
    employee_attendance_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    attendance_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE warehouses (
    warehouse_id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    warehouse_name VARCHAR(255),
    location VARCHAR(255),
    manager_id BIGINT,
    description TEXT,
    FOREIGN KEY (manager_id) REFERENCES users(user_id)
);

-- Bảng Vị trí hàng hóa trong kho
CREATE TABLE product_locations (
    product_location_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id BIGINT,
    product_id BIGINT, -- Đảm bảo kiểu dữ liệu phù hợp với cột được tham chiếu
    quantity INT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Bảng Nhập kho
CREATE TABLE stock_in (
    stock_in_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id BIGINT,
    supplier_id BIGINT,
    product_id BIGINT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Bảng Xuất kho
CREATE TABLE stock_out (
    stock_out_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id BIGINT,
    product_id BIGINT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Bảng Loại hàng hóa
CREATE TABLE product_types (
    product_type_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_type_name VARCHAR(255)
);

-- Bảng Đơn vị đo lường
CREATE TABLE measurement_units (
    unit_id INT AUTO_INCREMENT PRIMARY KEY, 
    unit_name VARCHAR(255)
);

-- Bảng Chi tiết nhập hàng
CREATE TABLE stock_in_details (
    stock_in_detail_id INT AUTO_INCREMENT PRIMARY KEY, 
    stock_in_id BIGINT,
    product_id BIGINT,
    quantity INT,
    import_date DATE,
    unit_price DECIMAL(10, 2),
    note TEXT,
    FOREIGN KEY (stock_in_id) REFERENCES stock_in(stock_in_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Bảng Chi tiết xuất hàng
CREATE TABLE stock_out_details (
    stock_out_detail_id INT AUTO_INCREMENT PRIMARY KEY, 
    stock_out_id BIGINT,
    product_id BIGINT,
    quantity INT,
    export_date DATE,
    unit_price DECIMAL(10, 2),
    note TEXT,
    FOREIGN KEY (stock_out_id) REFERENCES stock_out(stock_out_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Bảng Đơn vị đóng gói sản phẩm
CREATE TABLE packaging_units (
    packaging_unit_id INT AUTO_INCREMENT PRIMARY KEY, 
    packaging_unit_name VARCHAR(255)
);

-- Bảng Trạng thái sản phẩm
CREATE TABLE product_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(255)
);

-- Bảng Phiếu kiểm kê
CREATE TABLE inventory_checks (
    check_id INT AUTO_INCREMENT PRIMARY KEY, 
    warehouse_id BIGINT,
    status_id INT,
    check_date DATE,
    result VARCHAR(255),
    note TEXT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

