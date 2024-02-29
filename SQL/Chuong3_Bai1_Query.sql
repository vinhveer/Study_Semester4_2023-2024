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
SELECT DISTINCT K.TenKhoa, M.TenMH
FROM KHOA K
JOIN SINHVIEN SV ON K.MaKhoa = SV.MaKhoa
JOIN KETQUA Q ON SV.MSSV = Q.MaSV
JOIN GIANGDAY GD ON Q.MaKhoaHoc = GD.MaKhoaHoc
JOIN MONHOC M ON GD.MaMH = M.MaMH;

-- Câu 15. Cho biết tên khoa, mã khóa học mà giáo viên của khoa có tham gia giảng dạy.
SELECT DISTINCT K.TenKhoa, GD.MaKhoaHoc
FROM KHOA K
JOIN GIAOVIEN GV ON K.MaKhoa = GV.MaKhoa
JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV;

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
SELECT mh.TenMH
FROM MONHOC mh
JOIN GIANGDAY gd ON gd.MaMH = mh.MaMH
JOIN GIAOVIEN gv ON gv.MaGV = gd.MaGV
WHERE gv.TenGV = 'Tran Van Tien';

-- Câu 19. Cho biết mã, tên các sinh viên có kết quả 1 môn học nào đó trên 8 điểm (Kết quả các môn khác có thể <= 8).
SELECT DISTINCT sv.MSSV, sv.Ten
FROM SINHVIEN sv
JOIN KETQUA kq ON kq.MaSV = sv.MSSV
WHERE kq.Diem >= 8;

-- Câu 20. Cho biết mã, tên các sinh viên có kết quả các môn học đều trên 8 điểm.
SELECT SV.MSSV, SV.Ten
FROM SINHVIEN SV
JOIN KETQUA Q ON SV.MSSV = Q.MaSV
GROUP BY SV.MSSV, SV.Ten
HAVING MIN(Q.Diem) > 8;

-- Aggregate Functions:
-- Câu 21. Có bao nhiêu sinh viên.
SELECT COUNT(MSSV) FROM SINHVIEN;

-- Câu 22. Có bao nhiêu giáo viên.
SELECT COUNT(MaGV) FROM GIAOVIEN;

-- Câu 23. Có bao nhiêu sinh viên có giới tính nữ và thuộc khoa "CNTT".
SELECT COUNT(*)
FROM SINHVIEN sv
JOIN KHOA kh ON kh.MaKhoa = sv.MaKhoa
WHERE sv.GioiTinh = 'Nu' AND kh.MaKhoa = 'CNTT';

-- Câu 24. Có bao nhiêu giáo viên khoa CNTT.
SELECT COUNT(*) 
FROM GIAOVIEN gv
JOIN KHOA kh ON kh.MaKhoa = gv.MaKhoa
WHERE kh.MaKhoa = 'CNTT';

-- Câu 25. Có bao nhiêu sinh viên học môn CSDL.
SELECT *
FROM SINHVIEN sv
JOIN KETQUA kq ON sv.MSSV = kq.MaSV
JOIN GIANGDAY gd ON kq.MaKhoaHoc = gd.MaKhoaHoc
JOIN MONHOC mh ON gd.MaMH = mh.MaMH
WHERE mh.MaMH = N'CSDL';

-- Câu 26. Có bao nhiêu môn học được giảng dạy trong học kỳ 1 năm 2021.

-- Câu 27. Cho biết điểm trung bình của sinh viên có mã số ‘SV004".

-- Câu 28. Cho biết mã, tên, địa chỉ và điểm trung bình của từng sinh viên.

-- Câu 29. Cho biết số lượng điểm >= 8 của từng sinh viên.

-- Câu 30. Cho biết tên khoa, số lượng sinh viên có trong từng khoa.

-- Câu 31. Cho biết tên khoa, số lượng khóa học mà giáo viên của khoa có tham gia giảng dạy.

-- Câu 32. Cho biết tên tất cả các sinh viên, điểm trung bình, số lượng khóa học đã tham gia.

-- Câu 33. Cho biết số lượng tín chỉ mà từng sinh viên đã tham gia (gồm MSSV, tên SV, Số lượng tín chỉ).

-- Having:

-- Câu 34. Cho biết tên những sinh viên chỉ mới thì đúng một môn.

-- Câu 35. Cho biết mã, tên, địa chỉ và điểm của các sinh viên có điểm trung bình > 8.5

-- Câu 36. Cho biết Mã khóa học, học kỳ, năm, số lượng sinh viên tham gia của những khóa học có số lượng sinh viên tham gia (đã có điểm) từ 2 đến 4 sinh viên. 

-- Câu 37. Cho biết các sinh viên học cả 2 môn 'CSDL và CTDL' học có điểm của 1 trong 2 môn >= 8 

-- Câu 38. Điểm cao nhất mà sinh viên đã đạt được trong các khóa học.

-- Câu 39. Trong các môn học, số tín chỉ nhỏ nhất là bao nhiêu?

-- Câu 40. Cho biết tên của môn học có số tín chỉ nhiều nhất.

-- Câu 41. Cho biết tên của khoa có số lượng CBGD ít nhất.

-- Câu 42. Tên các sinh viên có điểm cao nhất trong môn Kỹ Thuật Lập Trinh".

-- Câu 43. Cho biết thông tin sinh viên có điểm thi môn CSDL lớn nhất.

