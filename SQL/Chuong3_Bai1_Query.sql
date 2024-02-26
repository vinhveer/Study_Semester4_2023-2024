-- BÀI TẬP 1: Dùng CSDL Quản lý sinh viên (Bài tập 1, Chương 2) thực hiện các câu truy vấn sau:
USE QLSV

-- Phần cơ bản:
-- Câu 1. Cho biết tên, địa chỉ, điện thoại của tất cả các sinh viên.
SELECT Ten, DiaChi, DienThoai FROM SINHVIEN;

-- Câu 2. Cho biết tên các môn học và số tín chỉ của từng môn học.
SELECT TenMH, SoTC FROM MONHOC;

-- Câu 3. Cho biết kết quả học tập của sinh viên có Mã số "SV03".
SELECT m.TenMH, m.SoTC, g.MaKhoaHoc, k.Diem
FROM KETQUA k, MONHOC m, GIANGDAY g
WHERE k.MaSV = 'SV003' AND k.MaMH = m.MaMH AND k.MaKhoaHoc = g.MaKhoaHoc;

-- Câu 4. Cho biết tên các môn học và số tín chỉ của những môn học có cấu trúc của mã môn học như sau: ký tự thứ 1 là “C”, ký tự thứ 3 là “D”.
SELECT * FROM MONHOC 
WHERE MaMH LIKE 'C_D%';

-- Câu 5. Cho biết tên các giáo viên có ký tự thứ 3 là "A".
SELECT TenGV FROM GIAOVIEN
WHERE TenGV LIKE '__A%';

-- Câu 6. Cho biết tên những môn học có chứa chữ "DU" (Ví dụ như các môn Cơ sở dữ liệu, Cấu trúc dữ liệu, ...).
SELECT TenMH FROM MONHOC 
WHERE TenMH LIKE '%DU%';

-- Câu 7. Cho biết tên các giáo viên có ký tự đầu tiên của họ và tên là các ký tự "P" hoặc "L".
SELECT TenGV FROM GIAOVIEN 
WHERE TenGV LIKE 'P%' OR TenGV LIKE 'L%';

-- Câu 8. Cho biết tên, địa chỉ của những sinh viên có địa chỉ trên đường “Cống Quỳnh”.
SELECT Ten, DiaChi FROM SINHVIEN 
WHERE DiaChi LIKE '%CONG_QUYNH%';

-- Câu 9. Cho biết danh sách các môn học được dạy trong năm 2020.
SELECT m.MaMH, m.TenMH FROM MONHOC m, GIANGDAY g 
WHERE m.MaMH = g.MaMH AND g.Nam = 2020;

-- Câu 10. Cho biết mã, tên, địa chỉ của các sinh viên theo từng Khoa sắp theo thứ tự A-Z của tên sinh viên.
SELECT s.MSSV, s.Ten, s.DiaChi FROM SINHVIEN s, KHOA k 
WHERE s.MaKhoa = k.MaKhoa 
ORDER BY s.Ten ASC;

-- Câu 11. Cho biết điểm của các sinh viên theo từng môn học và mã khóa học.
SELECT m.TenMH, g.MaKhoaHoc, s.Ten, k.Diem
FROM MONHOC m
JOIN GIANGDAY g ON g.MaMH = m.MaMH
JOIN KETQUA k ON k.MaKhoaHoc = g.MaKhoaHoc
JOIN SINHVIEN s ON s.MSSV = k.MaSV;

-- Câu 12. Cho biết các sinh viên học môn "CSDL" có điểm từ 8 đến 10.
SELECT m.TenMH, g.MaKhoaHoc, s.Ten, k.Diem
FROM MONHOC m
JOIN GIANGDAY g ON g.MaMH = m.MaMH
JOIN KETQUA k ON k.MaKhoaHoc = g.MaKhoaHoc
JOIN SINHVIEN s ON s.MSSV = k.MaSV
WHERE m.MaMH = 'CSDL' AND k.Diem >= 8 AND k.Diem <= 10;

-- Câu 13. Cho biết bảng điểm của sinh viên có tên là "TUNG".
SELECT s.Ten, m.TenMH, m.SoTC, g.MaKhoaHoc, k.Diem
FROM MONHOC m
JOIN GIANGDAY g ON g.MaMH = m.MaMH
JOIN KETQUA k ON k.MaKhoaHoc = g.MaKhoaHoc
JOIN SINHVIEN s ON s.MSSV = k.MaSV
WHERE s.Ten LIKE '%TUNG%';

-- Câu 14. Cho biết tên khoa, tên môn học mà những sinh viên trong khoa đã học.


-- Câu 15. Cho biết tên khoa, mã khóa học mà giáo viên của khoa có tham gia giảng dạy.

-- Câu 16. Cho biết các sinh viên đã học môn 'CSDL' hoặc 'CTDL'.
SELECT SV.MSSV, SV.Ten, MH.MaMH, MH.TenMH, KQ.Diem
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
JOIN MONHOC MH ON GD.MaMH = MH.MaMH
WHERE MH.MaMH IN ('CSDL', 'CTDL');

-- Câu 17. Cho biết tên những giáo viên tham gia giảng dạy môn "KY THUAT LAP TRINH".
SELECT gv.TenGV
FROM GIAOVIEN gv
JOIN GIANGDAY gi ON gi.MaGV = gv.MaGV
JOIN MONHOC mh ON mh.MaMH = gi.MaMH WHERE mh.TenMH = 'KY THUAT LAP TRINH';

-- Câu 18. Cho biết tên môn học mà giáo viên "Tran Van Tien" tham gia giảng dạy trong học kỳ 1 năm học 2020.

-- Câu 19. Cho biết mà, tên các sinh viên có kết quả 1 môn học nào đó trên 8 điểm (Kết quả các môn khác có thể <= 8). 20. Cho biết mã, tên các sinh viên có kết quả các môn học đều trên 8 điểm.