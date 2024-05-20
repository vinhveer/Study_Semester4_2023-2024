USE QLDA;

-- Câu 1: Cho biết tên, tuổi của từng nhân viên
SELECT TENNV AS 'TÊN NHÂN VIÊN', DATEDIFF(YEAR, NGAYSINH, GETDATE()) AS 'TUỔI'
FROM NHANVIEN;

-- Câu 2: Cho biết thông tin về những người có phái là nam và địa chỉ trên đường "Tran Hung Dao"
SELECT *
FROM NHANVIEN
WHERE PHAI = 'nam' AND DIACHI LIKE '%Tran Hung Dao%';

-- Câu 3: Cho biết những người có họ là "Le" và tên bắt đầu bằng ký tự "N".
SELECT HoNV, TenLot, TenNV
FROM NhanVien
WHERE HoNV = 'Le' AND TenNV LIKE 'N%';

-- Câu 4: Cho biết những người có ngày sinh trong tháng 7  năm 1978
SELECT *
FROM NHANVIEN
WHERE MONTH(NGAYSINH) = 7 AND YEAR(NGAYSINH) = 1978;

-- câu 5 : hãy cho biết những người có ngày sinh trong quý 3
SELECT MANV, HONV, TENLOT, TENNV
FROM NHANVIEN
WHERE MONTH(NGAYSINH) BETWEEN 7 AND 9;

-- Câu 6: Cho biết số đề án được phân công của từng nhân viên (gồm mã số, tên, số lượng đề án được phân công)
SELECT NV.MANV, NV.TENNV, COUNT(PC.MADA) AS SoDeAnPhanCong
FROM NHANVIEN NV
LEFT JOIN PHANCONG PC ON NV.MANV = PC.MANV
GROUP BY NV.MANV, NV.TENNV;

-- Câu 7: Cho biết tên nhân viên có từ 2 thân nhân trơ lên.
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
WHERE NV.MANV IN (
    SELECT TN.MANV
    FROM THANNHAN TN
    GROUP BY TN.MANV
    HAVING COUNT(TN.MANV) >= 2
);

-- Câu 8 : Tên nhân viên >= 30 tuổi được phân công làm việc cho đề án ở TPHCM.
SELECT DISTINCT NV.TENNV
FROM NHANVIEN NV
INNER JOIN PHANCONG PC ON NV.MANV = PC.MANV
INNER JOIN DEAN DA ON PC.MADA = DA.MADA
INNER JOIN DDIEMPB DPB ON DA.MAPB = DPB.MAPB
WHERE YEAR(GETDATE()) - YEAR(NV.NGAYSINH) >= 30
AND DPB.DIADIEM = 'TPHCM';

-- Câu 9: Cho biết bao nhieu de an o tphcm
SELECT COUNT(*) AS SoLuongDeAn
FROM DEAN
WHERE DDIEM_DA = 'TPHCM';

-- Câu 10 (Quản lý đề án): Đối với mỗi thành phố, cho biết tên và số lượng đề án được thực hiện ở đó.
SELECT DDIEM_DA AS ThanhPho,
       COUNT(MADA) AS SoLuongDeAn
FROM DEAN
GROUP BY DDIEM_DA;

-- Câu 11: Cho biết số năm thâm niên (số năm làm việc) của từng trưởng phòng.
SELECT
    NV.HONV,
    NV.TENLOT,
    NV.TENNV,
    DATEDIFF(YEAR, PB.NG_NHANCHUC, GETDATE()) AS SoNamThamNien
FROM
    NHANVIEN NV
JOIN
    PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG;

-- Câu 12: Cho biết số lượng địa điểm của từng phòng ban:
SELECT PHONGBAN.MAPB, PHONGBAN.TENPB, COUNT(DDIEMPB.DIADIEM) AS SoLuongDiaDiem
FROM PHONGBAN
LEFT JOIN DDIEMPB ON PHONGBAN.MAPB = DDIEMPB.MAPB
GROUP BY PHONGBAN.MAPB, PHONGBAN.TENPB;

-- Câu 13 : cho biết có bao nhiêu tên đề án là sản phẩm
SELECT COUNT (TENDA) AS [so luong san pham]
FROM DEAN
WHERE TENDA like '%san pham%';

-- Câu 14. Cho biết tên phòng, địa điểm phòng, tên đề án, địa điểm đề án của những đề án có địa điểm của đề án trùng với địa điểm của phòng.
SELECT
    PHONGBAN.TENPB AS TenPhong,
    DDIEMPB.DIADIEM AS DiaDiemPhong,
    DEAN.TENDA AS TenDeAn,
    DEAN.DDIEM_DA AS DiaDiemDeAn
FROM
    PHONGBAN
JOIN
    DDIEMPB ON PHONGBAN.MAPB = DDIEMPB.MAPB
JOIN
    DEAN ON PHONGBAN.MAPB = DEAN.MAPB AND DDIEMPB.DIADIEM = DEAN.DDIEM_DA;

-- Câu 15 - ten truong phong co luong thap hon luong trung binh nhan vien trong phong do
select a.MANV, a.LUONG
from NHANVIEN a join PHONGBAN b on a.MANV=b.TRUONGPHONG
group by a.MANV, a.LUONG, b.MAPB
having a.LUONG < all(
	select AVG(LUONG)
	from NHANVIEN
	where MAPB=b.MAPB and MANV<>a.MANV
	);

-- Câu 16: Xóa các nhân viên có số thân nhân >=3.
DELETE FROM NHANVIEN
WHERE MANV IN (
    SELECT MANV
    FROM THANNHAN
    GROUP BY MANV
    HAVING COUNT(*) >= 3
);

-- Câu 17: Mã nhân viên "NV5" có mức lương cao nhất hay không? (Trả lời "có" hay "không).
SELECT CASE
    WHEN LUONG = (SELECT MAX(LUONG) FROM NHANVIEN) THEN 'có'
    ELSE 'không'
END AS MucLuongCaoNhat
FROM NHANVIEN
WHERE MANV = 'NV5';

-- câu 18: Tên nhân viên đã có gia đình(thân nhân) nhưng chưa có con
SELECT DISTINCT NV.TENNV
FROM NHANVIEN NV
INNER JOIN THANNHAN TN ON NV.MANV = TN.MANV
WHERE NV.MANV NOT IN (
    SELECT MANV
    FROM THANNHAN
    WHERE QUANHE = N'CON TRAI' OR QUANHE = N'CON GÁI'
);

-- Câu 19: Đối với từng đề án, cho biết tên nhân viên, tên đề án, số giờ làm việc nhiều nhất
SELECT NHANVIEN.TENNV, DEAN.TENDA, MAX(PHANCONG.THOIGIAN) as 'Số giờ làm việc nhiều nhất'
FROM PHANCONG
INNER JOIN DEAN ON PHANCONG.MADA = DEAN.MADA
INNER JOIN NHANVIEN ON PHANCONG.MANV = NHANVIEN.MANV
GROUP BY DEAN.TENDA, NHANVIEN.TENNV;

-- Câu 20 - ten nhan vien lam tat ca cac de an o Ha Noi
SELECT distinct a.HONV+' '+a.TENLOT+' '+a.TENNV as Hoten
FROM PHANCONG R1 join NHANVIEN a on R1.MANV=a.MANV
WHERE NOT EXISTS (
	SELECT S.MADA
	FROM DEAN S
	WHERE DDIEM_DA='HA NOI' AND NOT EXISTS (
		SELECT R2.MANV
		FROM PHANCONG R2
		WHERE R2.MADA=S.MADA AND R1.MANV=R2.MANV));

-- Câu 21 - ten phong ban co truong phong la nu
select b.TENPB
from NHANVIEN a join PHONGBAN b on a.MANV=b.TRUONGPHONG
where a.PHAI='NU';

--Câu 22: đối với từng đề án, cho biết số lượng nhân viên tham gia đề án, tổng số giờ làm việc của đề án
SELECT PHANCONG.MADA AS MADA,
       COUNT(PHANCONG.MANV) AS SoLuongNhanVien,
       SUM(PHANCONG.THOIGIAN) AS TongGioLamViec
FROM PHANCONG
GROUP BY PHANCONG.MADA;

-- Câu 23: Đối với từng phòng ban, cho biết tên phòng ban, tổng số nam, tổng số nữ
select PB.TENPB as [Tên phòng ban],
count(case when NV.PHAI = 'NAM' then 1 end) as [Tổng số nam],
count(case when NV.PHAI = 'NU' then 1 end) as [Tổng số nữ]
from PHONGBAN PB
join NHANVIEN NV on PB.MAPB = NV.MAPB
group by PB.TENPB;

-- Câu 24 - ten phong ban co nhieu nv nu nhat
select b.TENPB, count(a.PHAI) as [SL Nhan vien nu]
from NHANVIEN a join PHONGBAN b on a.MAPB=b.MAPB
where a.PHAI='NU'
group by b.MAPB,b.TENPB
having count (a.PHAI) >=all(
	select count(PHAI)
	from NHANVIEN
	where PHAI='NU'
	group by MAPB
);

-- Câu 25: Viết query in ra Nhân viên có mã số là 'NV4' lớn tuổi nhất hay không? (Trả lời "Có"/"Không") thôi
SELECT
    CASE
        WHEN NV.MANV = 'NV4' THEN 'Có'
        ELSE 'Không'
    END AS CoPhaiNhanVienLonTuoiNhat
FROM
    NHANVIEN NV
WHERE
    NV.NGAYSINH = (
        SELECT MIN(NGAYSINH)
        FROM NHANVIEN
    );

-- Câu 27: Tăng 10% lương đối với các nhân viên nữ và được phân công làm việc cho đề án DDiem_AN ở Vũng Tàu và Nha Trang
UPDATE NHANVIEN
SET LUONG = LUONG * 1.1 -- Tăng lương lên 10%
WHERE PHAI = 'NU' -- Là nhân viên nữ
AND MANV IN (
    SELECT MANV
    FROM PHANCONG
    WHERE MADA IN (
        SELECT MADA
        FROM DEAN
        WHERE DDIEM_DA IN ('VUNG TAU', 'NHA TRANG')
    )
);

-- Câu 26.Đối với từng phòng ban, cho biết tên phòng ban,
--lương trung bình của nữ nhân viên, lương trung bình của nam nhân viên.
SELECT PB.MAPB, TENPB, CASE WHEN [LUONG TB NU] IS NULL
THEN 0 ELSE [LUONG TB NU] END AS [LUONG TB NU],
CASE WHEN [LUONG TB NAM] IS NULL THEN 0
ELSE [LUONG TB NAM] END AS [LUONG TB NAM]
FROM PHONGBAN PB FULL JOIN (SELECT MAPB, AVG(LUONG)
AS [LUONG TB NU] FROM NHANVIEN WHERE PHAI = 'NU'
GROUP BY MAPB) NU ON PB.MAPB = NU.MAPB
FULL JOIN (SELECT MAPB, AVG(LUONG) AS [LUONG TB NAM] FROM NHANVIEN
WHERE PHAI = 'NAM' GROUP BY MAPB) NAM ON PB.MAPB = NAM.MAPB;

-- Câu 28: Tên và địa chỉ các nhân viên làm việc cho một đề án ở thành phố nhưng địa điểm phòng ban mà họ trực thuộc đều không ở trong thành phố đó
SELECT NHANVIEN.TENNV, NHANVIEN.DIACHI
FROM NHANVIEN
JOIN DEAN ON NHANVIEN.MAPB = DEAN.MAPB
JOIN DDIEMPB ON NHANVIEN.MAPB = DDIEMPB.MAPB
JOIN PHONGBAN ON NHANVIEN.MAPB = PHONGBAN.MAPB
WHERE DEAN.DDIEM_DA != DDIEMPB.DIADIEM;

-- Câu 29: tên các đề án thuộc các phòng ban có địa điểm ở Hà Nội
SELECT DEAN.TENDA
FROM DEAN
JOIN DDIEMPB ON DEAN.MAPB = DDIEMPB.MAPB
JOIN PHONGBAN ON DDIEMPB.MAPB = PHONGBAN.MAPB
WHERE DDIEMPB.DIADIEM = 'HA NOI';

-- Câu 30: tên nhân viên có chức vụ là trưởng phòng và cư ngụ ở thành phố Hồ Chí Minh
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
JOIN DDIEMPB DPB ON PB.MAPB = DPB.MAPB
WHERE NV.DIACHI LIKE '%TPHCM%';

-- Câu 31: Tên nhân viên là trưởng phòng có ngày nhận chức sau cùng (mới nhất)
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
WHERE PB.NG_NHANCHUC = (SELECT MAX(NG_NHANCHUC) FROM PHONGBAN);

-- câu 32(Quản lý đề án): Phòng ban nào chỉ phụ trách các đề án ở Hà Nội
SELECT DISTINCT pb.MaPB, pb.TENPB
FROM PHONGBAN pb
JOIN DEAN d ON pb.MAPB = d.MAPB
JOIN DDIEMPB dpb ON pb.MAPB = dpb.MAPB
WHERE dpb.DIADIEM LIKE N'%Ha Noi%';

-- Cau 33: Thêm vào quan hệ PHANCONG các bộ là các đề án mà nhân viên NV3 chưa được phân công--
insert into PHANCONG
select 'NV3', MADA, 0
from DEAN
where MADA not in (select MADA from PHANCONG where MANV = 'NV3');

-- Câu 34.Liệt kê tên phòng ban, tên trưởng phòng của các phòng ban có nhiều nhân viên nữ nhất.
SELECT PHONGBAN.TENPB, NHANVIEN.HONV, NHANVIEN.TENNV
FROM PHONGBAN
JOIN NHANVIEN ON PHONGBAN.TRUONGPHONG = NHANVIEN.MANV
WHERE PHONGBAN.MAPB IN (
    SELECT NHANVIEN.MAPB
    FROM NHANVIEN
    WHERE NHANVIEN.PHAI = 'NU'
    GROUP BY NHANVIEN.MAPB
    HAVING COUNT(NHANVIEN.MANV) = (
        SELECT MAX(COUNT_NU)
        FROM (
            SELECT COUNT(NHANVIEN.MANV) AS COUNT_NU
            FROM NHANVIEN
            WHERE NHANVIEN.PHAI = 'NU'
            GROUP BY NHANVIEN.MAPB
        ) AS SUBQUERY
    )
);

-- câu 35 tên nhân viên được phân công làm việc cho tất cả đề án ở phòng P2
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
WHERE NOT EXISTS (
    SELECT *
    FROM DEAN D
    WHERE NOT EXISTS (
        SELECT *
        FROM PHANCONG PC
        WHERE PC.MADA = D.MADA AND PC.MANV = NV.MANV
    )
    AND D.MAPB = 'P2'
);

-- Câu 36. Cho biết tên đề án, tên nhân viên, số giờ của từng để ăn được phân công và số giờ làm việc nhiều nhất
SELECT TENDA, HONV + ' ' + TENLOT + ' ' + TENNV AS [HO TEN NV], THOIGIAN
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MANV = PC.MANV
				 JOIN DEAN DA ON PC.MADA = DA.MADA
WHERE THOIGIAN >= ALL (SELECT MAX(THOIGIAN) FROM PHANCONG WHERE MADA = PC.MADA);

-- câu 37:Đối với từng nhân viên: cho biết tên nhân viên, mã phòng ban và tên của trưởng phòng
SELECT
    NV.TENNV AS 'Tên nhân viên',
    NV.MAPB AS 'Mã phòng ban',
    TP.TENNV AS 'Tên trưởng phòng'
FROM
    NHANVIEN NV
INNER JOIN
    PHONGBAN PB ON NV.MAPB = PB.MAPB
INNER JOIN
    NHANVIEN TP ON PB.TRUONGPHONG = TP.MANV;
