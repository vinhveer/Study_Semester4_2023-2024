﻿-- 4.1. Tạo database
CREATE DATABASE QLBongDa;

-- 4.2. Tạo bảng
USE QLBongDa;

CREATE TABLE CAUTHU
(
	MACT NUMERIC IDENTITY(1,1),
	HOTEN NVARCHAR(100) NOT NULL,
	VITRI NVARCHAR(20) NOT NULL,
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(200),
	MACLB VARCHAR(5) NOT NULL,
	MAQG VARCHAR(5) NOT NULL,
	SO INT NOT NULL
);

CREATE TABLE QUOCGIA
(
	MAQG VARCHAR(5) NOT NULL,
	TENQG NVARCHAR(60) NOT NULL
);

CREATE TABLE CAULACBO
(
	MACLB VARCHAR(5) NOT NULL,
	TENCLB NVARCHAR(100) NOT NULL,
	MASAN VARCHAR(5) NOT NULL,
	MATINH VARCHAR(5) NOT NULL,
);

CREATE TABLE TINH
(
	MATINH VARCHAR(5) NOT NULL,
	TENTINH NVARCHAR(100) NOT NULL
);

CREATE TABLE SANVD
(
	MASAN VARCHAR(5) NOT NULL,
	TENSAN NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(200) NOT NULL
);

CREATE TABLE HUANLUYENVIEN
(
	MAHLV VARCHAR(5) NOT NULL,
	TENHLV NVARCHAR(100) NOT NULL,
	NGAYSINH DATETIME NOT NULL,
	DIACHI NVARCHAR(200) NOT NULL,
	DIENTHOAI NVARCHAR(20) NOT NULL,
	MAQG VARCHAR(5) NOT NULL
);

CREATE TABLE HLV_CLB
(
	MAHLV VARCHAR(5) NOT NULL,
	MACLB VARCHAR(5) NOT NULL,
	VAITRO NVARCHAR(100) NOT NULL
);

CREATE TABLE TRANDAU
(
	MATRAN NUMERIC NOT NULL,
	NAM INT NOT NULL,
	VONG INT NOT NULL,
	NGAYTD DATETIME NOT NULL,
	MACLB1 VARCHAR(5) NOT NULL,
	MACLB2 VARCHAR(5) NOT NULL,
	MASAN VARCHAR(5) NOT NULL,
	KETQUA VARCHAR(5) NOT NULL
);

CREATE TABLE BANGXH
(
	MACLB VARCHAR(5) NOT NULL,
	NAM INT NOT NULL,
	VONG INT NOT NULL,
	SOTRAN INT NOT NULL,
	THANG INT NOT NULL,
	HOA INT NOT NULL,
	THUA INT NOT NULL,
	HIEUSO VARCHAR(5) NOT NULL,
	DIEM INT NOT NULL,
	HANG INT NOT NULL
);

-- 4.3. Tạo Primary Key và Foreign Key

-- a. Tạo Primary Key

ALTER TABLE TRANDAU
ADD CONSTRAINT trandau_pk PRIMARY KEY (MATRAN);

ALTER TABLE BANGXH 
ADD CONSTRAINT bangxh_pk PRIMARY KEY (MACLB, NAM, VONG);

ALTER TABLE TINH
ADD CONSTRAINT tinh_pk PRIMARY KEY (MATINH);

ALTER TABLE SANVD
ADD CONSTRAINT sanvd_pk PRIMARY KEY (MASAN);

ALTER TABLE CAULACBO
ADD CONSTRAINT caulacbo_pk PRIMARY KEY (MACLB);

ALTER TABLE CAUTHU
ADD CONSTRAINT cauthu_pk PRIMARY KEY (MACT);

ALTER TABLE HUANLUYENVIEN
ADD CONSTRAINT huanluyenvien_pk PRIMARY KEY (MAHLV);

ALTER TABLE HLV_CLB
ADD CONSTRAINT hlv_clb_pk PRIMARY KEY (MAHLV, MACLB);

ALTER TABLE QUOCGIA
ADD CONSTRAINT quocgia_pk PRIMARY KEY (MAQG);

-- b. Tạo khóa ngoại

ALTER TABLE TRANDAU
ADD CONSTRAINT trandau_maclb1_fk FOREIGN KEY (MACLB1) REFERENCES CAULACBO (MACLB),
	CONSTRAINT trandau_maclb2_fk FOREIGN KEY (MACLB2) REFERENCES CAULACBO (MACLB),
	CONSTRAINT trandau_masan_fk FOREIGN KEY (MASAN) REFERENCES SANVD (MASAN);

ALTER TABLE BANGXH
ADD CONSTRAINT bangxh_maclb_fk FOREIGN KEY (MACLB) REFERENCES CAULACBO (MACLB);

ALTER TABLE CAULACBO
ADD CONSTRAINT caulacbo_masan_fk FOREIGN KEY (MASAN) REFERENCES SANVD (MASAN),
	CONSTRAINT caulacbo_matinh_fk FOREIGN KEY (MATINH) REFERENCES TINH (MATINH);

ALTER TABLE CAUTHU
ADD CONSTRAINT cauthu_maclb_fk FOREIGN KEY (MACLB) REFERENCES CAULACBO (MACLB),
	CONSTRAINT cauthu_maqg_fk FOREIGN KEY (MAQG) REFERENCES QUOCGIA (MAQG);

ALTER TABLE HUANLUYENVIEN
ADD CONSTRAINT huanluyenvien_maqg_fk FOREIGN KEY (MAQG) REFERENCES QUOCGIA (MAQG);

ALTER TABLE HLV_CLB
ADD CONSTRAINT hlv_clb_mahlv_fk FOREIGN KEY (MAHLV) REFERENCES HUANLUYENVIEN (MAHLV),
	CONSTRAINT hlv_clb_maclb_fk FOREIGN KEY (MACLB) REFERENCES CAULACBO (MACLB);

