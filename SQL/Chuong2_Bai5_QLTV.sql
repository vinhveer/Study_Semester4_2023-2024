-- 5.1. Tạo database
CREATE DATABASE QLTV;

-- 5.2. Tạo bảng
USE QLTV;

CREATE TABLE DocGia
(
    Ma_DocGia NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Ho NVARCHAR(10) NOT NULL,
    TenLot NVARCHAR(20) NOT NULL,
    Ten NVARCHAR(10) NOT NULL,
    NgaySinh DATE NOT NULL
);

CREATE TABLE NguoiLon
(
	Ma_DocGia NUMERIC PRIMARY KEY,
	SoNha VARCHAR(10) NOT NULL,
	Duong NVARCHAR(50) NOT NULL,
	Quan NVARCHAR(20) NOT NULL,
	DienThoai VARCHAR(15) NOT NULL,
	HanSuDung DATE,
	FOREIGN KEY (Ma_DocGia) REFERENCES DocGia (Ma_DocGia)
);

CREATE TABLE TreEm
(
	Ma_DocGia NUMERIC PRIMARY KEY,
	Ma_DocGia_NguoiLon NUMERIC NOT NULL,
	FOREIGN KEY (Ma_DocGia) REFERENCES DocGia (Ma_DocGia),
	FOREIGN KEY (Ma_DocGia_NguoiLon) REFERENCES NguoiLon (Ma_DocGia)
);

CREATE TABLE TuaSach
(
	Ma_TuaSach VARCHAR(5) PRIMARY KEY,
	TuaSach NVARCHAR(255) NOT NULL,
	TacGia NVARCHAR(255) NOT NULL,
	TomTat NVARCHAR(255) NOT NULL
);

CREATE TABLE DauSach
(
	ISBN VARCHAR(20) PRIMARY KEY,
	Ma_TuaSach VARCHAR(5) NOT NULL,
	NgonNgu NVARCHAR(15) NOT NULL,
	Bia NVARCHAR(50) NOT NULL,
	TrangThai NVARCHAR(15) NOT NULL,
	FOREIGN KEY (Ma_TuaSach) REFERENCES TuaSach (Ma_TuaSach)
);

CREATE TABLE CuonSach
(
	ISBN VARCHAR(20) NOT NULL,
	Ma_CuonSach VARCHAR(5) NOT NULL,
	TinhTrang VARCHAR(255) NOT NULL,
	PRIMARY KEY (ISBN, Ma_CuonSach),
	FOREIGN KEY (ISBN) REFERENCES DauSach (ISBN)
);

CREATE TABLE DangKy
(
	ISBN VARCHAR(20) NOT NULL,
	Ma_DocGia NUMERIC NOT NULL,
	NgayDK DATE NOT NULL,
	GhiChu NVARCHAR(255) NOT NULL,
	PRIMARY KEY (ISBN, Ma_DocGia),
	FOREIGN KEY (ISBN) REFERENCES DauSach (ISBN),
	FOREIGN KEY (Ma_DocGia) REFERENCES DocGia (Ma_DocGia)
);

CREATE TABLE Muon
(
	ISBN VARCHAR(20) NOT NULL,
	Ma_CuonSach VARCHAR(5) NOT NULL, 
	Ma_DocGia NUMERIC NOT NULL,
	NgayMuon DATE NOT NULL,
	NgayHetHan DATE NOT NULL,
	PRIMARY KEY (ISBN, Ma_CuonSach),
	FOREIGN KEY (ISBN, Ma_CuonSach) REFERENCES CuonSach (ISBN, Ma_CuonSach),
	FOREIGN KEY (Ma_DocGia) REFERENCES DocGia (Ma_DocGia)
);

CREATE TABLE QuaTrinhMuon
(
	ISBN VARCHAR(20) NOT NULL,
	Ma_CuonSach VARCHAR(5) NOT NULL,
	NgayMuon DATE NOT NULL,
	MaDocGia NUMERIC NOT NULL,
	NgayHetHan DATE NOT NULL,
	NgayTra DATE NOT NULL,
	TienMuon MONEY NOT NULL,
	TienDaTra MONEY NOT NULL,
	TienDatCoc MONEY NOT NULL,
	GhiChu NVARCHAR(255) NOT NULL,
	PRIMARY KEY (ISBN, Ma_CuonSach, NgayMuon),
	FOREIGN KEY (ISBN, Ma_CuonSach) REFERENCES CuonSach (ISBN, Ma_CuonSach),
	FOREIGN KEY (MaDocGia) REFERENCES DocGia (Ma_DocGia)
);

-- Insert into DocGia
INSERT INTO DocGia (Ho, TenLot, Ten, NgaySinh) VALUES 
('Nguyen', 'Van', 'A', '1990-01-01'),
('Tran', 'Thi', 'B', '1985-02-15'),
('Le', 'Minh', 'C', '1998-05-20'),
('Pham', 'Dinh', 'D', '1982-09-08'),
('Hoang', 'Thi', 'E', '1995-12-12'),
('Vo', 'Nam', 'F', '1980-07-30');

-- Insert into NguoiLon
INSERT INTO NguoiLon (Ma_DocGia, SoNha, Duong, Quan, DienThoai, HanSuDung) VALUES 
(1, '123', 'Duong 1', 'Quan 1', '123456789', '2024-12-31'),
(2, '456', 'Duong 2', 'Quan 2', '987654321', '2023-10-15'),
(3, '789', 'Duong 3', 'Quan 3', '111222333', '2025-06-30'),
(4, '101', 'Duong 4', 'Quan 4', '555666777', '2023-08-20'),
(5, '202', 'Duong 5', 'Quan 5', '999888777', '2022-05-15'),
(6, '303', 'Duong 6', 'Quan 6', '444333222', '2026-03-10');

-- Insert into TreEm
INSERT INTO TreEm (Ma_DocGia, Ma_DocGia_NguoiLon) VALUES 
(3, 2),
(5, 4),
(6, 1),
(2, 5);

-- Insert into TuaSach
INSERT INTO TuaSach (Ma_TuaSach, TuaSach, TacGia, TomTat) VALUES 
('TS001', 'To Kill a Mockingbird', 'Harper Lee', 'A classic novel'),
('TS002', '1984', 'George Orwell', 'Dystopian fiction'),
('TS003', 'Pride and Prejudice', 'Jane Austen', 'Romantic novel'),
('TS004', 'The Great Gatsby', 'F. Scott Fitzgerald', 'American classic'),
('TS005', 'The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age novel');

-- Insert into DauSach
INSERT INTO DauSach (ISBN, Ma_TuaSach, NgonNgu, Bia, TrangThai) VALUES 
('ISBN001', 'TS001', 'English', 'Hardcover', 'Available'),
('ISBN002', 'TS002', 'English', 'Paperback', 'Not Available'),
('ISBN003', 'TS003', 'English', 'Hardcover', 'Available'),
('ISBN004', 'TS004', 'English', 'Paperback', 'Available'),
('ISBN005', 'TS005', 'English', 'Hardcover', 'Not Available');

-- Insert into CuonSach
INSERT INTO CuonSach (ISBN, Ma_CuonSach, TinhTrang) VALUES 
('ISBN001', 'CS001', 'Good'),
('ISBN001', 'CS002', 'Fair'),
('ISBN002', 'CS003', 'Excellent'),
('ISBN003', 'CS004', 'Good'),
('ISBN004', 'CS005', 'Excellent'),
('ISBN005', 'CS006', 'Fair');

-- Insert into DangKy
INSERT INTO DangKy (ISBN, Ma_DocGia, NgayDK, GhiChu) VALUES 
('ISBN001', 1, '2024-01-10', 'Member since 2024'),
('ISBN002', 2, '2023-05-22', 'Member since 2023'),
('ISBN003', 3, '2025-03-15', 'Member since 2025'),
('ISBN004', 4, '2023-09-01', 'Member since 2023'),
('ISBN005', 5, '2022-06-10', 'Member since 2022');

-- Insert into Muon
INSERT INTO Muon (ISBN, Ma_CuonSach, Ma_DocGia, NgayMuon, NgayHetHan) VALUES 
('ISBN001', 'CS001', 1, '2024-02-01', '2024-02-15'),
('ISBN002', 'CS003', 2, '2023-06-01', '2023-06-15'),
('ISBN003', 'CS004', 3, '2025-04-01', '2025-04-15'),
('ISBN004', 'CS005', 4, '2023-09-15', '2023-09-30'),
('ISBN005', 'CS006', 5, '2022-06-15', '2022-06-30');

-- Insert into QuaTrinhMuon
INSERT INTO QuaTrinhMuon (ISBN, Ma_CuonSach, NgayMuon, MaDocGia, NgayHetHan, NgayTra, TienMuon, TienDaTra, TienDatCoc, GhiChu) VALUES 
('ISBN001', 'CS001', '2024-02-01', 1, '2024-02-15', '2024-02-10', 5.00, 3.00, 2.00, 'Returned on time'),
('ISBN002', 'CS003', '2023-06-01', 2, '2023-06-15', '2023-06-12', 7.50, 7.50, 0.00, 'Returned late'),
('ISBN003', 'CS004', '2025-04-01', 3, '2025-04-15', '2025-04-10', 4.00, 4.00, 0.00, 'Returned on time'),
('ISBN004', 'CS005', '2023-09-15', 4, '2023-09-30', '2023-09-25', 6.00, 6.00, 0.00, 'Returned on time'),
('ISBN005', 'CS006', '2022-06-15', 5, '2022-06-30', '2022-06-25', 8.00, 8.00, 0.00, 'Returned on time');
