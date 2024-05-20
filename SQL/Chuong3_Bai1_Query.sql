USE QLSV;

-- Câu 1. Cho biết tên, địa chỉ, điện thoại của tất cả các sinh viên?
SELECT Ten, DiaChi, DienThoai FROM SINHVIEN;

-- Câu 2: Cho biết tên các môn học và số tín chỉ của từng môn học ?
SELECT TenMH, SoTC
FROM MONHOC;

-- Câu 3: Cho biết kết quả học tập của sinh viên có Mã số “SV03”
select Diem, MSSV, Ten
from SINHVIEN, KETQUA
where MSSV= 'SV003';

-- Câu 4: Cho biết tên các môn học và số tín chỉ của những môn học có cấu trúc của mã môn học như sau: kí tự thứ 1 là C, kí tự thứ 3 là D
SELECT TenMH, SoTC
FROM MONHOC
WHERE MaMH LIKE 'C_D%';

-- Câu 5: Cho biết tên giáo viên có kí tự thứ 3 là ' A '.
SELECT TenGV FROM GIAOVIEN WHERE TenGV LIKE '__A%';

-- Câu 6: Cho biết tên những môn học có chứa chữ “DU” (Ví dụ như các môn Cơ sở dữ liệu, Cấu trúc dữ liệu)
select TenMH, MaMH
from MONHOC
where TenMH LIKE '%DU%';

-- Câu 7: cho biết tên các giáo viên có ký tự đầu tiên của họ và tên là các kí tự "P" hoặc "L".
SELECT TenGV
FROM GIAOVIEN
WHERE LEFT(TenGV, 1) IN ('P', 'L');

-- Câu 8. Cho biết tên, địa chỉ của những sinh viên có địa chỉ trên đường "Cống Quỳnh".
SELECT Ten, DiaChi
FROM SINHVIEN
WHERE DiaChi LIKE '%Cống Quỳnh%';

--  Câu 9: Cho biết danh sách các môn học được dạy trong năm 2020.
SELECT DISTINCT MONHOC.TenMH
FROM MONHOC
INNER JOIN GIANGDAY ON MONHOC.MaMH = GIANGDAY.MaMH
WHERE GIANGDAY.Nam = 2020;

-- Câu 10. Cho biết mã, tên, địa chỉ của các sinh viên theo từng Khoa sắp theo thứ tự A-Z của tên sinh viên.
SELECT s.MSSV, s.Ten, s.DiaChi
FROM SINHVIEN s, KHOA k
WHERE s.MaKhoa = k.MaKhoa
ORDER BY s.Ten;

-- Câu 11: Cho biết điểm của các sinh viên theo từng môn học
select MSSV, MaMH, Diem
from KETQUA a, GIANGDAY b, SINHVIEN c
where  a.MaSV=c.MSSV and a.MaKhoaHoc= b.MaKhoaHoc;

-- Câu 12: Cho biết các sinh viên học môn 'CSDL' có điểm từ 8 đến 10
SELECT DISTINCT SV.MSSV, SV.Ten, SV.GioiTinh, SV.DiaChi, SV.DienThoai, SV.MaKhoa, KQ.Diem
FROM KETQUA KQ
JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
JOIN MONHOC MH ON GD.MaMH = MH.MaMH
JOIN SINHVIEN SV ON KQ.MaSV = SV.MSSV
WHERE MH.MaMH = 'CSDL' AND KQ.Diem BETWEEN 8 AND 10;

-- Câu 13: Cho biết bảng điểm của sinh viên có tên là 'TUNG'.
SELECT k.Diem
FROM KETQUA k
JOIN SINHVIEN s ON s.MSSV = k.MaSV
WHERE s.Ten LIKE '%TUNG%';

-- Câu 14: Cho biết tên khoa, tên môn học mà những sinh viên trong khoa đã học
select distinct TenKhoa,TenMH
from GIANGDAY a inner join MONHOC b on a.MaMH= b.MaMH
				inner join KETQUA c on c.MaKhoaHoc= a.MaKhoaHoc
				inner join SINHVIEN d on d.MSSV=c.MaSV
				inner join KHOA e on e.MaKhoa=d.MaKhoa;

-- Câu 15: Cho biết tên khoa, mã khóa học mà giảng viên tham gia giảng dạy
select TenKhoa, MaKhoaHoc
from GIANGDAY a inner join GIAOVIEN b on a.MaGV= b.MaGV
			inner join KHOA c on c.MaKhoa= b.MaKhoa;

-- Câu 16: Cho biết những sinh viên đã học môn CSDL
SELECT DISTINCT SV.MSSV, SV.Ten, SV.GioiTinh, SV.DiaChi, SV.DienThoai, SV.MaKhoa
FROM KETQUA KQ
JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
JOIN MONHOC MH ON GD.MaMH = MH.MaMH
JOIN SINHVIEN SV ON KQ.MaSV = SV.MSSV
WHERE MH.MaMH = 'CSDL';

--Câu 17: Cho biết tên những GV giảng dạy môn 'KTLT'
SELECT GIAOVIEN. TenGV
FROM GIAOVIEN
JOIN GIANGDAY ON GIAOVIEN. MaGV = GIANGDAY. MaGV
JOIN MONHOC ON GIANGDAY.MaMH = MONHOC. MaMH
WHERE MONHOC. MaMH = 'KTLT';

-- Câu 18: Cho biết tên môn học mà giáo viên "Tran Van Tien" tham gia giảng dạy trong học kỳ 1 năm học 2020.
SELECT MONHOC.TenMH
FROM MONHOC
JOIN GIANGDAY ON GIANGDAY.MaMH = MONHOC.MaMH
JOIN GIAOVIEN ON GIANGDAY.MaGV = GIAOVIEN.MaGV
WHERE GIAOVIEN.TenGV = 'TRAN VAN TIEN'
AND GIANGDAY.HocKy = 1
AND GIANGDAY.Nam = 2020;

-- Câu 19: Cho biết mã, tên các sv có kết quả 1 môn học nào đó trên 8 điểm ( kq các môn khác <=8)
select distinct MSSV, Ten
from SINHVIEN a , MONHOC b , GIANGDAY c, KETQUA d
where (a.MSSV=d.MaSV and c.MaMH= b.MaMH and c.MaKhoaHoc = d.MaKhoaHoc)
and d.Diem >= any (select Diem from KETQUA where Diem>8);

-- Câu 20: Cho biết mã, tên các sv có kết quả các môn học đều trên 8 điểm
select distinct MSSV, Ten
from SINHVIEN a , MONHOC b , GIANGDAY c, KETQUA d
where (a.MSSV=d.MaSV and c.MaMH= b.MaMH and c.MaKhoaHoc = d.MaKhoaHoc)
and d.Diem >= all ( select Diem from KETQUA where Diem>8);

-- câu 21: Có bao nhiêu sinh viên.
SELECT COUNT(MSSV) AS SoSinhVien
FROM SINHVIEN;

-- Câu 22: Có bao nhiêu giáo viên?
SELECT COUNT(MaGV) AS SoGiaoVien
FROM GIAOVIEN;

-- Câu 23: Có bao nhiêu sinh viên giới tính nữ và thuộc khoa "CNTT"
SELECT COUNT(*) AS SoLuongNuCNTT
FROM SINHVIEN
WHERE GioiTinh = N'Nữ' AND MaKhoa = 'CNTT';

-- Câu 24: Có bao nhiêu giáo viên khoa CNTT
SELECT COUNT(MaGV) AS SoLuongGiaoVienCNTT
FROM GIAOVIEN
WHERE MaKhoa = 'CNTT';

-- Câu 25: Có bao nhiêu sinh viên học môn CSDL
SELECT COUNT(DISTINCT KQ.MaSV) AS SoLuongSinhVien
FROM KETQUA KQ
JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
JOIN MONHOC MH ON GD.MaMH = MH.MaMH
WHERE MH.MaMH = 'CSDL';

-- Câu 26: Có bao nhiêu môn học được giảng dạy trong học kỳ 1 năm 2021
SELECT COUNT(DISTINCT MaMH) AS SoLuongMonHoc
FROM GIANGDAY
WHERE HocKy = 1 AND Nam = 2021;

-- Câu 27: Cho biết điểm trung bình của sinh viên có mã số 'SV004'
SELECT SV.MSSV, SV.Ten, AVG(KQ.Diem) AS DiemTrungBinh
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
WHERE SV.MSSV = 'SV004'
GROUP BY SV.MSSV, SV.Ten;

-- Câu 28 : Cho biết mã, tên, địa chỉ và điểm trung bình của từng sinh viên
SELECT SV.MSSV, SV.Ten, SV.DiaChi, AVG(KQ.Diem) AS DiemTrungBinh
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
GROUP BY SV.MSSV, SV.Ten, SV.DiaChi;

-- Câu 29: Cho biết số lượng điểm >= 8 của từng sinh viên:
SELECT SV.MSSV, SV.Ten, COUNT(KQ.Diem) AS SoLuongDiemLonHonHoacBang8
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
WHERE KQ.Diem >= 8
GROUP BY SV.MSSV, SV.Ten;

-- Câu 30: cho biết tên khoa, số lượng sinh viên có trong từng khoa.
SELECT KHOA. TenKhoa, COUNT(SinhVien.MaKhoa) AS SoLuongSinhVien
From Khoa LEFT JOIN SinhVien
ON  Khoa.MaKhoa =  SinhVien.MaKhoa
GROUP BY Khoa.TenKhoa;

-- Câu 31: Cho biết tên khoa, số lượng khóa học mà giáo viên của khoa có tham gia giảng dạy.
SELECT
KHOA.TenKhoa, COUNT(DISTINCT GIANGDAY.MaKhoaHoc) AS 'Số Lượng Khóa Học Giảng Dạy'
FROM KHOA
JOIN
GIAOVIEN ON KHOA.MaKhoa = GIAOVIEN.MaKhoa
JOIN
GIANGDAY ON GIAOVIEN.MaGV = GIANGDAY.MaGV
GROUP BY KHOA.TenKhoa;

-- Cầu 32 : Cho biet ten tat ca cac sv,dtb, SL khoa hoc da tham gia hoc tap
SELECT TEN, SUM(SOTC * DIEM) / SUM(SOTC) AS DIEMTRUNGBINH,
COUNT(KETQUA.MAKHOAHOC) AS TONGKHOAHOC
FROM SINHVIEN INNER JOIN KETQUA ON SINHVIEN.MSSV = KETQUA.MASV
           INNER JOIN GIANGDAY ON KETQUA.MAKHOAHOC = GIANGDAY.MAKHOAHOC
			INNER JOIN MONHOC ON GIANGDAY.MAMH = MONHOC.MAMH
GROUP BY TEN;

-- Câu 33: Cho biết số lượng tín chỉ mà từng sinh viên đã tham gia (gồm MSSV, tên SV, Số lượng tín chỉ).
SELECT sv.MSSV, sv.Ten, SUM(mh.SoTC) AS SoLuongTinChi
FROM SINHVIEN sv
JOIN KETQUA kq ON sv.MSSV = kq.MaSV
JOIN GIANGDAY gd ON kq.MaKhoaHoc = gd.MaKhoaHoc
JOIN MONHOC mh ON gd.MaMH = mh.MaMH
GROUP BY sv.MSSV, sv.Ten;

-- Câu 34: Cho biết tên những sinh viên chỉ mới thi đúng một môn
SELECT Ten
FROM SINHVIEN
WHERE MSSV IN (
    SELECT MaSV
    FROM KETQUA
    GROUP BY MaSV
    HAVING COUNT(*) = 1
);

-- Câu 35: Cho biết mã, tên, địa chỉ và điểm của các sinh viên có điểm trung bình > 8.5
SELECT SV.MSSV, SV.Ten, SV.DiaChi, AVG(KQ.Diem) AS DiemTrungBinh
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
GROUP BY SV.MSSV, SV.Ten, SV.DiaChi
HAVING AVG(KQ.Diem) > 8.5;

-- Câu 36: Cho biết mã khóa học, học kỳ, năm, số lượng sinh viên tham gia của những khóa học có số lượng sinh viên tham gia (đã có điểm) từ 2 đến 4 sinh viên
SELECT GD.MaKhoaHoc, GD.HocKy, GD.Nam, COUNT(KQ.MaSV) AS SoLuongSinhVien
FROM GIANGDAY GD
JOIN KETQUA KQ ON GD.MaKhoaHoc = KQ.MaKhoaHoc
GROUP BY GD.MaKhoaHoc, GD.HocKy, GD.Nam
HAVING COUNT(KQ.MaSV) BETWEEN 2 AND 4;

-- Câu 37: Cho biet cac sv hoc ca 2 mon CSDL,CTDL co diem 1 trong 2 mon >=8
SELECT kq.MaSV, sv.Ten
from SINHVIEN sv inner join KETQUA kq on sv.MSSV=kq.MaSV
				 inner join GIANGDAY gd on kq.MaKhoaHoc=gd.MaKhoaHoc
				 inner join MONHOC mh on mh.MaMH=gd.MaMH
WHERE mh.MAMH IN ('CSDL', 'CTDL') AND DIEM >= 8
GROUP BY kq.MaSV, sv.Ten
HAVING COUNT(gd.MAMH) >= 2;

-- Câu 38: Điểm cao nhất mà sinh viên đã đạt được trong các khóa học
select MaSV, max(kq.Diem) as[Diem cao nhat ma sinh vien dat duoc]
from KETQUA kq
Group By MaSV;

-- Câu 39: Trong các môn học, số tín chỉ nhỏ nhất là bao nhiêu?
SELECT MIN(SoTC) AS SoTinChiNhoNhat
FROM MONHOC;

-- Câu 40: Cho biết tên môn học có số tín chỉ nhiều nhất :
SELECT TenMH
FROM MONHOC
WHERE SoTC = (
    SELECT MAX(SoTC)
    FROM MONHOC
);

-- Câu 41: Cho biết tên khoa có số lượng CBGD ít nhất.
SELECT TenKhoa
FROM  KHOA
WHERE  SL_CBGD = ( SELECT  MIN(SL_CBGD)  FROM  KHOA );

-- Câu 42: Tên các sinh viên có điểm cao nhất trong môn 'Kỹ Thuật Lập Trình'
SELECT SV.Ten
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
JOIN MONHOC MH ON GD.MaMH = MH.MaMH
WHERE MH.TenMH = 'KY THUAT LAP TRINH' AND KQ.Diem = (
    SELECT MAX(Diem)
    FROM KETQUA
    WHERE MaKhoaHoc = (
        SELECT MaKhoaHoc
        FROM GIANGDAY
        WHERE MaMH = MH.MaMH
    )
);

-- Cau 43: Cho biet thong tin sv co diem thi mon CSDL lon nhat
select top 1 sv.Ten, MAX(kq.Diem) as[MAX CSDL]
From KETQUA kq,GIANGDAY gd, SINHVIEN sv
where kq.MaKhoaHoc=gd.MaKhoaHoc and kq.MaSV=sv.MSSV and gd.MaMH='CSDL'
group by sv.Ten, kq.Diem
order by kq.Diem DESC;

-- Cau 44: Cho biet ten cac mon hoc co nhieu sv tham gia nhat
select mh.TenMH, count(kq.MaSV) as [SLSV]
from MONHOC mh, KETQUA kq, GIANGDAY gd
where mh.MaMH= gd.MaMH and kq.MaKhoaHoc=gd.MaKhoaHoc
group by mh.TenMH
Having count(kq.MaSV)>=all(select count(kq1.MaSV)
from MONHOC mh1, KETQUA kq1, GIANGDAY gd1
where mh1.MaMH= gd1.MaMH and kq1.MaKhoaHoc=gd1.MaKhoaHoc
group by mh1.TenMH);

-- Câu 45: Đối với mỗi môn học, cho biết tên và điểm của các sinh viên có điểm cao nhất:
SELECT Ten, Diem, TenMH
FROM (
    SELECT s.Ten, kq.Diem, m.TenMH,
           ROW_NUMBER() OVER (PARTITION BY m.MaMH ORDER BY kq.Diem DESC) AS RowNum
    FROM KETQUA kq
    INNER JOIN SINHVIEN s ON kq.MaSV = s.MSSV
    INNER JOIN GIANGDAY gd ON kq.MaKhoaHoc = gd.MaKhoaHoc
    INNER JOIN MONHOC m ON gd.MaMH = m.MaMH
) AS SubQuer
WHERE RowNum = 1;

-- Cau 46: hk nao co nhieu mon giang day nhat
select gd.HocKy, count(mh.MaMH) as[So mon hoc duoc day nhieu nhat]
from  GIANGDAY gd inner join  MONHOC mh on gd.MaMH=mh.MaMH
group by gd.HocKy
having  count(mh.MaMH) >= all
(select count(mh1.MaMH) from  GIANGDAY gd1 inner join  MONHOC mh1 on gd1.MaMH=mh1.MaMH
group by gd1.HocKy);

-- Cau 47: Cho biet ten sv co nhieu diem 7
select sv.Ten, count(kq.Diem) as [SV co nhieu diem 7]
from SINHVIEN sv, KETQUA kq
where sv.MSSV = kq.MaSV and kq.Diem =7
group by sv.Ten
having count(kq.Diem)>=all (select count(kq1.Diem)
from SINHVIEN sv1, KETQUA kq1
where sv1.MSSV = kq1.MaSV and kq1.Diem =7
group by sv1.Ten);

-- Cau 48: Cho biet ten sv co so luong tin chi nhieu nhat
select sv.Ten, sum(mh.SoTC) as [So luong tin chi]
from SINHVIEN sv, MONHOC mh, KETQUA kq, GIANGDAY gd
where sv.MSSV = kq.MaSV and kq.MaKhoaHoc=gd.MaKhoaHoc
and mh.MaMH=gd.MaMH
group by sv.Ten
having sum(mh.SoTC) >= all (select sum(mh1.SoTC)
from MONHOC mh1, GIANGDAY gd1,
KETQUA kq1 where kq1.MaKhoaHoc = gd1.MaKhoaHoc
and gd1.MaMH = mh1.MaMH group by kq1.MaSV);

-- Câu 49: Cho biết Tên Môn Học, Tên Sinh Viên, Điểm Của Các Sinh Viên Học Những Môn Học Có Số Tín Chỉ Là Thấp Nhất
SELECT MH.TenMH, SV.Ten, KQ.Diem
FROM MONHOC MH
JOIN GIANGDAY GD ON MH.MaMH = GD.MaMH
JOIN KETQUA KQ ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN SINHVIEN SV ON KQ.MaSV = SV.MSSV
WHERE MH.SoTC = (
    SELECT MIN(SoTC)
    FROM MONHOC
)
ORDER BY MH.TenMH, SV.Ten;

-- Cau 50: Cho biet ten gv tg day nhieu nhat
 select gv.TenGV,count(gd.MaKhoaHoc) as [So luong khoa hoc da day]
 from GIAOVIEN gv, GIANGDAY gd
 where gv.MaGV=gd.MaGV
 group by gv.TenGV
 having count(gd.MaKhoaHoc) >= all( select count(gd.MaKhoaHoc)
 from GIANGDAY gd group by gd.MaGV);

 -- Cau 51: Ten cac gv khong tham gia gd trong nam 2021
 select gv.TenGV
 from GIAOVIEN  gv join GIANGDAY gd on gv.MaGV=gd.MaGV
 where gd.MaGV not in ( select gd.MaGV from GIANGDAY gd where gd.Nam=2021);

 -- Câu 52: Cho biết tên các môn học không được tổ chức trong năm 2021
SELECT TenMH
FROM MONHOC
WHERE MaMH NOT IN (
    SELECT DISTINCT MaMH
    FROM GIANGDAY
    WHERE Nam = 2021
);

 -- Cau 53: Ten nhung khoa chua co sv theo hoc
 select kh.TenKhoa
 from KHOA kh join SINHVIEN sv on kh.MaKhoa=sv.MaKhoa
 where kh.MaKhoa not in (select distinct  sv.MaKhoa from SINHVIEN sv);

 -- Câu 54. Cho biết tên những môn học chưa được tổ chức cho các khóa học.
SELECT MH.TenMH
FROM MONHOC MH
LEFT JOIN GIANGDAY GD ON MH.MaMH = GD.MaMH
WHERE GD.MaMH IS NULL;

-- Câu 55: Cho biết tên những sinh viên chưa có điểm kiểm tra
SELECT SV.Ten
FROM SINHVIEN SV
LEFT JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
WHERE KQ.MaSV IS NULL;

-- Câu 56: Cho biết những tên khóa không có sinh viên theo học
SELECT TenKhoa FROM KHOA
WHERE MaKhoa NOT IN (SELECT DISTINCT MaKhoa FROM SINHVIEN);

-- Câu 57: Cho biết tên sinh viên, số lượng môn mà Sinh viên chưa học.
SELECT sv.Ten, COUNT(*) as SoMonChuaHoc
FROM SinhVien sv
LEFT JOIN KETQUA kq on kq.MaSV = sv.MSSV
LEFT JOIN GIANGDAY gd on gd.MaKhoaHoc = kq.MaKhoaHoc
LEFT JOIN MonHoc mh ON gd.MaMH = mh.MaMH
WHERE mh.MaMH IS NULL
GROUP BY sv.Ten;

-- Câu 58: Cho biết các sinh viên chưa học "môn LTC trên windows"
SELECT sv.Ten AS TenSinhVien
FROM SINHVIEN sv
WHERE sv.MSSV NOT IN (
    SELECT kq.MaSV
    FROM KETQUA kq
    JOIN GIANGDAY gd ON kq.MaKhoaHoc = gd.MaKhoaHoc
    JOIN MONHOC mh ON gd.MaMH = mh.MaMH
    WHERE mh.TenMH = 'LAP TRINH C TREN WINDOW'
);

-- Câu 59: Cho biết tên tất cả các GV cùng với số lượng khóa học mà từng GV đã tham gia giảng dạy
SELECT GV.TenGV, COUNT(GD.MaKhoaHoc) AS SoLuongKhoaHoc
FROM GIAOVIEN GV
LEFT JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
GROUP BY GV.TenGV;

-- Cau 60: Ten sv, ten mon ma sv chua hoc
select sv.Ten, mh.TenMH as 'Mon hoc chua hoc'
from SINHVIEN sv, MONHOC mh
except
	select sv.Ten, mh.TenMH
	from SINHVIEN sv, MONHOC mh, KETQUA kq, GIANGDAY gd
	where sv.MSSV=kq.MaSV and kq.MaKhoaHoc=gd.MaKhoaHoc and gd.MaMH=mh.MaMH;

-- Cau 61: Cho biet ten nhung gv tham gia day du tat ca cac mon
select  gv.MaGV, gv.TenGV
from  GIAOVIEN gv
where not exists (select mh.MaMH from MONHOC mh
except (select distinct gd.MaMH from GIANGDAY gd where gd.MaGV= gv.MaGV));

-- Cau 62 - ten mon hoc tat ca giao vien deu day*/
select mh.TenMH as [Ten mon hoc tat ca giao vien deu day]
from GIANGDAY gd join MONHOC mh on gd.MaMH=mh.MaMH
where not exists (
	select *
	from GIAOVIEN gv
	where not exists (
		select *
		from GIANGDAY gd2
		where gd2.MaGV=gv.MaGV and gd2.MaMH=mh.MaMH
));

-- Cau 63:Khoa hoc ma tat ca sv deu tham gia
select kq.MaKhoaHoc
from GIANGDAY gd,KETQUA kq,SINHVIEN sv
where kq.MaSV = sv.MSSV and gd.MaKhoaHoc = kq.MaKhoaHoc and
not exists
	(   select *
		from SINHVIEN sv
		where
			not exists
				( select *
				  from KETQUA kq
				  where kq.MaSV = sv.MSSV and gd.MaKhoaHoc = kq.MaKhoaHoc)
	 )
	Group by kq.MaKhoaHoc;

-- Câu 64. Cho biết tên những sinh viên tham gia đủ tất cả các khóa học.
SELECT sv.Ten
FROM SINHVIEN sv
JOIN KETQUA kq ON sv.MSSV = kq.MaSV
JOIN GIANGDAY gd ON kq.MaKhoaHoc = gd.MaKhoaHoc
GROUP BY sv.MSSV, sv.Ten
HAVING COUNT(DISTINCT gd.MaKhoaHoc) = (SELECT COUNT(DISTINCT MaKhoaHoc) FROM GIANGDAY);

-- Cau 65: Ten mon hoc ma tat ca cac sv deu hoc
select distinct mh.TenMH
from KETQUA kq1 ,GIANGDAY gd,MONHOC mh
where  kq1.MaKhoaHoc = gd.MaKhoaHoc and gd.MaMH = mh.MaMH and
not exists
(	select *
	from GIANGDAY gd
	where not exists
		(	select *
			from KETQUA kq2
			where kq1.MaSV = kq2.MaSV and kq2.MaKhoaHoc=gd.MaKhoaHoc
		)
);

-- câu 66:Cho biết tên sinh viên đã học đủ tất cả các môn học
SELECT sv.Ten AS TenSinhVien
FROM SINHVIEN sv
INTERSECT
SELECT sv.Ten AS TenSinhVien
FROM SINHVIEN sv
JOIN KETQUA kq ON sv.MSSV = kq.MaSV
JOIN GIANGDAY gd ON kq.MaKhoaHoc = gd.MaKhoaHoc
JOIN MONHOC mh ON gd.MaMH = mh.MaMH
GROUP BY sv.Ten
HAVING COUNT(DISTINCT mh.MaMH) = (
    SELECT COUNT(*) FROM MONHOC
);

-- Câu 67: Cho biết tên các giáo viên dạy tất cả những môn mà giáo viên 'GV03' đã dạy
SELECT DISTINCT GV.TenGV
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
WHERE NOT EXISTS (
    SELECT MaMH
    FROM GIANGDAY
    WHERE MaGV = 'GV03'
    EXCEPT
    SELECT MaMH
    FROM GIANGDAY
    WHERE GV.MaGV = GD.MaGV
);

-- Câu 68: Cho biết các giáo viên dạy tất cả những môn học mà giáo viên 'GV03' đã dạy
SELECT DISTINCT GV.TenGV
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
WHERE NOT EXISTS (
    SELECT MaMH
    FROM GIANGDAY
    WHERE MaGV = 'GV03'
    EXCEPT
    SELECT MaMH
    FROM GIANGDAY
    WHERE GD.MaGV = 'GV03' AND GV.MaGV = GD.MaGV
);

-- Câu 69: Thêm các field SLMon (số lượng môn), DTB (điểm trung bình), XL (xếp loại) vào bảng SinhVien
ALTER TABLE SINHVIEN
ADD SLMon INT,
    DTB FLOAT,
    XL NVARCHAR(20);

-- Câu 70: Cập nhật thông tin cho các field vừa tạo theo yêu cầu
UPDATE SINHVIEN
SET SLMon = (
        SELECT COUNT(DISTINCT MaKhoaHoc)
        FROM KETQUA
        WHERE SINHVIEN.MSSV = KETQUA.MaSV
    ),
    DTB = (
        SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc)
        FROM KETQUA
        WHERE SINHVIEN.MSSV = KETQUA.MaSV
    ),
    XL = CASE
        WHEN (SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc) FROM KETQUA WHERE SINHVIEN.MSSV = KETQUA.MaSV) < 5.0 THEN 'Yếu'
        WHEN (SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc) FROM KETQUA WHERE SINHVIEN.MSSV = KETQUA.MaSV) >= 5.0 AND (SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc) FROM KETQUA WHERE SINHVIEN.MSSV = KETQUA.MaSV) < 6.5 THEN 'Trung Bình'
        WHEN (SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc) FROM KETQUA WHERE SINHVIEN.MSSV = KETQUA.MaSV) >= 6.5 AND (SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc) FROM KETQUA WHERE SINHVIEN.MSSV = KETQUA.MaSV) < 8.0 THEN 'Khá'
        WHEN (SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc) FROM KETQUA WHERE SINHVIEN.MSSV = KETQUA.MaSV) >= 8.0 AND (SELECT SUM(Diem) / COUNT(DISTINCT MaKhoaHoc) FROM KETQUA WHERE SINHVIEN.MSSV = KETQUA.MaSV) < 9.0 THEN 'Giỏi'
        ELSE 'Xuất sắc'
    END;

-- Câu 71: Xóa tất cả kết quả học tập của sinh viên 'SV002'
DELETE FROM KETQUA
WHERE MaSV = 'SV002';

-- Câu 72: Xoá tên những sinh viên có điểm trung bình dưới 5.
DELETE FROM SINHVIEN
WHERE MSSV IN (
    SELECT KQ.MaSV
    FROM KETQUA KQ
    INNER JOIN (
        SELECT MaSV, AVG(Diem) AS DiemTrungBinh
        FROM KETQUA
        GROUP BY MaSV
    ) AS DiemTB_SV ON KQ.MaSV = DiemTB_SV.MaSV
    WHERE DiemTrungBinh < 5
);

-- Câu 73: Xóa những khoa không có sinh viên theo học
DELETE FROM KHOA
WHERE MaKhoa NOT IN (
    SELECT DISTINCT MaKhoa
    FROM SINHVIEN
);

-- CHương 6:

-- Chương 6, Bài 2.1: (bảng MONHOC), hiển thị thông tin dựa vào mã truyền vào
CREATE PROC SP_SELECT_MonHoc
    @MaMonHoc VARCHAR(10) = NULL
AS
BEGIN
    IF (@MaMonHoc IS NULL)
        SELECT 'Ma mon hoc is null';
    ELSE
    BEGIN
        SELECT * FROM MONHOC WHERE MaMH = @MaMonHoc;
    END
END;

-- Chương 6 - Bài 2.1 (Bảng GIANGDAY): Tạo thủ tục select.
CREATE PROC Sp_Select_GiangDay
   @MaKhoaHoc VARCHAR(5) = NULL
AS
BEGIN
   SELECT *
   FROM GIANGDAY
   WHERE MaKhoaHoc = @MaKhoaHoc
END;


-- Chương 6 - Bài 2.1 (Bảng GIAOVIEN): Tạo thủ tục select.
CREATE PROCEDURE sp_Select_GiaoVien
    @MaGV VARCHAR(5)
AS
BEGIN
    SELECT *
    FROM GIAOVIEN
    WHERE MaGV = @MaGV;
END;


-- Chương 6 - Bài 2.1 (Bảng SINHVIEN): Hien thi thong tin dua tren ma truyen vao
create proc sp_Select_SinhVien
@MaSV varchar(10) = null
as
	begin
	if (@MaSV is null)
		select 'MaSV is null';
	else
	begin
		select * from SINHVIEN where MSSV=@MaSV
	end
end;

-- Chương 6 - Bài 2.1 (Bảng KETQUA): Hien thi thong tin dua tren ma truyen vao
CREATE PROCEDURE sp_Select_KetQua
    @MaSV VARCHAR(5),
    @MaKhoaHoc VARCHAR(5)
AS
BEGIN
    SELECT *
    FROM KETQUA
    WHERE MaSV = @MaSV AND MaKhoaHoc = @MaKhoaHoc;
END;


-- Chương 6 - Bài 2.1 (Bảng KHOA): Hien thi thong tin dua tren ma truyen vao
CREATE PROCEDURE sp_Select_Khoa
    @MaKhoa VARCHAR(10)
AS
BEGIN
    SELECT *
    FROM KHOA
    WHERE MaKhoa = @MaKhoa;
END;


-- Chương 6 : câu 2.2( Bảng Sinh viên )
CREATE PROCEDURE sp_Insert_Sinhvien
    @MSSV VARCHAR(5),
    @Ten NVARCHAR(50),
    @GioiTinh NVARCHAR(5),
    @DiaChi NVARCHAR(100),
    @DienThoai VARCHAR(20),
    @MaKhoa VARCHAR(10)
AS
BEGIN
    IF @MSSV IS NULL OR @Ten IS NULL OR @GioiTinh IS NULL OR @DiaChi IS NULL OR @MaKhoa IS NULL
    BEGIN
        PRINT 'Vui lòng nhập đầy đủ thông tin sinh viên.';
        RETURN;
    END;

    INSERT INTO SINHVIEN (MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa)
    VALUES (@MSSV, @Ten, @GioiTinh, @DiaChi, @DienThoai, @MaKhoa);

    PRINT 'Thêm sinh viên thành công.';
END;


-- Chương 6: câu 2.2: bảng KHOA
create proc sp_Insert_Khoa
(@MaKhoa varchar(10), @TenKhoa nvarchar(50), @SL_CBGD smallint)
as
begin
	if (@MaKhoa is null)
		raiserror ('Chua nhap MaKhoa!',16,1);
	else
	begin
		insert into KHOA(MaKhoa,TenKhoa,SL_CBGD)
		values(@MaKhoa,@TenKhoa,@SL_CBGD)
	end

end;


-- Chương 6: câu 2.2: bảng GIANGDAY
CREATE PROCEDURE InsertIntoGiangDay
    @MaKhoaHoc VARCHAR(5),
    @MaGV VARCHAR(5),
    @MaMH VARCHAR(5),
    @HocKy SMALLINT,
    @Nam INT
AS
BEGIN
    -- Kiểm tra xem các tham số đầu vào có bị thiếu không
    IF @MaKhoaHoc IS NULL OR @MaGV IS NULL OR @MaMH IS NULL OR @HocKy IS NULL OR @Nam IS NULL
    BEGIN
        -- Nếu có tham số nào thiếu, hiển thị thông báo lỗi
        PRINT 'ERROR: Missing parameter(s). All parameters are required.';
        RETURN;
    END;

    -- Thêm mới thông tin vào bảng GIANGDAY
    INSERT INTO GIANGDAY (MaKhoaHoc, MaGV, MaMH, HocKy, Nam)
    VALUES (@MaKhoaHoc, @MaGV, @MaMH, @HocKy, @Nam);

    -- Hiển thị thông báo thành công
    PRINT 'Insert into GIANGDAY successfully.';
END;


-- Chương 6 Bài 2.2 Bảng KETQUA
CREATE PROCEDURE sp_Insert_Ketqua
    @MaSV VARCHAR(5),
    @MaKhoaHoc VARCHAR(5),
    @Diem DECIMAL(3, 1)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM SINHVIEN WHERE MSSV = @MaSV) AND EXISTS (SELECT 1 FROM GIANGDAY WHERE MaKhoaHoc = @MaKhoaHoc)
    BEGIN
        INSERT INTO KETQUA (MaSV, MaKhoaHoc, Diem)
        VALUES (@MaSV, @MaKhoaHoc, @Diem);

        PRINT 'Thêm kết quả thành công.';
    END
    ELSE
    BEGIN
        PRINT 'Mã Sinh viên hoặc Mã Khóa học không tồn tại.';
    END
END;

-- Chương 6, Bài 2.2 (GIAOVIEN) Thực hiện các thủ tục tương tự đối với bảng giáo viên.
Create procedure Sp_Insert_GIAOVIEN
( @MaGV varchar(5),
  @TenGV nvarchar(50),
  @MaKhoa varchar(10) )
as
begin
insert into GIAOVIEN(MaGV,TenGV,MaKhoa)
values (@MaGV,@TenGV,@MaKhoa)
end;


-- Chương 6, Bài 2.2 (MONHOC) Thực hiện các thủ tục tương tự đối với môn học.
CREATE PROCEDURE InsertSubject
    @MaMH VARCHAR(5),
    @TenMH NVARCHAR(50),
    @SoTC SMALLINT
AS
BEGIN
    -- Kiểm tra xem tất cả các tham số có được truyền vào không
    IF @MaMH IS NULL OR @TenMH IS NULL OR @SoTC IS NULL
    BEGIN
        PRINT 'Vui lòng cung cấp đầy đủ thông tin cho môn học.';
        RETURN; -- Trả về ngay sau khi thông báo lỗi
    END;

    -- Thêm mới thông tin vào bảng MONHOC
    INSERT INTO MONHOC (MaMH, TenMH, SoTC)
    VALUES (@MaMH, @TenMH, @SoTC);

    PRINT 'Thêm mới môn học thành công.';
END;



-- Chương 6 bài 2.3: Bảng GIAOVIEN
CREATE PROCEDURE sp_Update_GIAOVIEN
    @MaGV VARCHAR(5),
    @TenGV NVARCHAR(50)=NULL,
    @MaKhoa VARCHAR(10)=NULL
AS
BEGIN
    UPDATE GIAOVIEN
    SET
       TenGV = ISNULL(@TenGV, TenGV),
       MaKhoa = ISNULL(@MaKhoa, MaKhoa)
    WHERE
       MaGV = @MaGV;
END;

-- Chương 6, Bài 2.3 Bảng GIANGDAY
CREATE PROCEDURE sp_Update_Giangday
    @MaKhoaHoc VARCHAR(5),
    @MaGV VARCHAR(5) = NULL,
    @MaMH VARCHAR(5) = NULL,
    @HocKy SMALLINT = NULL,
    @Nam INT = NULL
AS
BEGIN
    UPDATE GIANGDAY
    SET MaGV = ISNULL(@MaGV, MaGV),
        MaMH = ISNULL(@MaMH, MaMH),
        HocKy = ISNULL(@HocKy, HocKy),
        Nam = ISNULL(@Nam, Nam)
    WHERE MaKhoaHoc = @MaKhoaHoc;
END;

-- Chương 6, Bài 2.3 Bảng MONHOC
CREATE PROCEDURE sp_Update_MonHoc
    @MaMH VARCHAR(5),
    @TenMH NVARCHAR(50) = NULL,
    @SoTC SMALLINT = NULL
AS
BEGIN
    UPDATE MonHoc
    SET
        TenMH = CASE WHEN @TenMH IS NOT NULL THEN @TenMH ELSE TenMH END,
        SoTC = CASE WHEN @SoTC IS NOT NULL THEN @SoTC ELSE SoTC END
    WHERE MaMH = @MaMH;
END;

-- Chương 6, Bài 2.3: Bảng KETQUA
CREATE PROCEDURE sp_Update_KetQua
    @MaSV VARCHAR(5),
    @MaKhoaHoc VARCHAR(5),
    @Diem DECIMAL(3,1)
AS
BEGIN
    UPDATE KETQUA
    SET Diem = CASE
                    WHEN @Diem IS NOT NULL THEN @Diem
                    ELSE Diem
                END
    WHERE MaSV = @MaSV
    AND MaKhoaHoc = @MaKhoaHoc;
END;


-- Chương 6 Bài 2.3 Bảng SINHVIEN
CREATE PROCEDURE sp_Update_Sinhvien
    @Masv VARCHAR(5),
    @Hoten NVARCHAR(50) = NULL,
    @PhaiNu BIT = NULL,
    @Diachi NVARCHAR(100) = NULL,
    @DienThoai VARCHAR(20) = NULL,
    @MaKhoa VARCHAR(10) = NULL
AS
BEGIN
    UPDATE SinhVien
    SET
        Ten = CASE WHEN @Hoten IS NOT NULL THEN @Hoten ELSE Ten END,
        GioiTinh = CASE WHEN @PhaiNu IS NOT NULL THEN @PhaiNu ELSE GioiTinh END,
        DiaChi = CASE WHEN @Diachi IS NOT NULL THEN @Diachi ELSE DiaChi END,
        DienThoai = CASE WHEN @DienThoai IS NOT NULL THEN @DienThoai ELSE DienThoai END,
        MaKhoa = CASE WHEN @MaKhoa IS NOT NULL THEN @MaKhoa ELSE MaKhoa END
    WHERE MSSV = @Masv;
END;


-- Chương 6 Bài 2.3 Bảng KHOA
CREATE PROCEDURE sp_Update_Khoa
    @MaKhoa VARCHAR(10),
    @TenKhoa NVARCHAR(50) = NULL,
    @SL_CBGD SMALLINT = NULL
AS
BEGIN
    UPDATE KHOA
    SET
        TenKhoa = ISNULL(@TenKhoa, TenKhoa),
        SL_CBGD = ISNULL(@SL_CBGD, SL_CBGD)
    WHERE MaKhoa = @MaKhoa;
END;



-- Chương 6: Bài 2.4 (bảng GiaoVien): Xóa thông tin của bảng GIAOVIEN dựa vào mã truyền vào:
CREATE PROCEDURE sp_Delete_GiaoVien
    (@Magv VARCHAR(5))
AS
BEGIN
    DELETE FROM GIAOVIEN
    WHERE MaGV = @Magv;
END;

-- Chương 6: Bài 2.4 (bảng SinhVien): Xóa thông tin của bảng SINHVIEN dựa vào mã truyền vào:
CREATE PROCEDURE sp_Delete_SinhVien
    (@Masv VARCHAR(5))
AS
BEGIN
    DELETE FROM SINHVIEN
    WHERE MSSV = @Masv;
END;

-- Chương 6 bài 2.4(bảng giảng dạy) xoá thông tin bảng GIANGDAY dựa vào mã truyền vào.
CREATE PROCEDURE sp_Delete_Giangday
    @MaKhoaHoc VARCHAR(5)
AS
BEGIN
    DELETE FROM GIANGDAY
    WHERE MaKhoaHoc = @MaKhoaHoc;
END;

-- Chương 6: bài 2.4. Thực hiện tạo thủ tục xóa thông tin của bảng MONHOC dựa vào mã truyền vào.
create proc sp_Delete_MonHoc
(@MaMH varchar(5))
as
begin
    IF EXISTS (SELECT 1 FROM MONHOC WHERE MaMH LIKE @MaMH)
    begin
        DELETE FROM MONHOC WHERE MaMH = @MaMH;
        PRINT 'Da xoa thanh cong';
    end
    ELSE
    begin
        PRINT 'Khong tim thay mon ' + @MaMH + ' trong bang';
    end
end;

-- Chương 6: Bài 2.4 (bảng KetQua): Xóa thông tin của bảng KETQUA dựa vào mã truyền vào:
CREATE PROCEDURE sp_Delete_Ketqua
    @MaSV VARCHAR(5),
    @MaKhoaHoc VARCHAR(5)
AS
BEGIN
    DELETE FROM KETQUA
    WHERE MaSV = @MaSV AND MaKhoaHoc = @MaKhoaHoc;
END;

-- Chương 6: Bài 2.4 (bảng Khoa): Xóa thông tin của bảng KHOA dựa vào mã truyền vào:
CREATE PROCEDURE sp_Delete_Khoa
    @MaKhoa VARCHAR(10)
AS
BEGIN
    DELETE FROM KHOA
    WHERE MaKhoa = @MaKhoa;
END;
