USE QLHH;

-- Câu 1. Cho biết danh sách các đối tác cung cấp hàng cho công ty.
SELECT * FROM NHACUNGCAP;

-- Câu 2 (QLHH): Cho biết mã hàng, tên hàng và số lượng hiện có của các mặt hàng trong công ty.
select MAHANG, TENHANG, SOLUONG
from MATHANG

-- Câu 3: Cho biết họ, tên, địa chỉ, và năm đầu làm việc của nhân viên
SELECT HO, TEN, DIACHI,  YEAR(NGAYLAMVIEC) NamLAMVIEC FROM NHANVIEN;

-- Câu 4(qlhh):Cho biết địa chỉ và điện thoại của nhà cung cấp có tên giao dịch VINAMILK là gì?
SELECT DIACHI, DIENTHOAI
FROM NHACUNGCAP
WHERE TENGIAODICH = 'VINAMILK';

-- Câu 5: Cho biết mã và tên của các mặt hàng có giá > 100000 và số lượng có ít hơn 50:
SELECT MAHANG, TENHANG
FROM MATHANG
WHERE GIAHANG > 100000 AND SOLUONG < 50;

-- Câu 6: Cho biết mỗi mặt hàng trong công ty do ai cũng cấp
SELECT MH.TENHANG, NCC.TENCONGTY AS NHACUNGCAP
FROM MATHANG MH
JOIN NHACUNGCAP NCC ON MH.MACONGTY = NCC.MACONGTY;

-- Câu 7: Công Ty Việt Tiến đã cung cấp những mặt hàng nào.
SELECT TENHANG
FROM MATHANG
WHERE MACONGTY IN (SELECT MACONGTY FROM NHACUNGCAP WHERE TENCONGTY = 'Việt Tiến');

-- Câu 8: Loại hàng thực phẩm do những công ty nào cung cấp và địa chỉ các công ty đó là gì? bài làm:
SELECT NHACUNGCAP.TENCONGTY, NHACUNGCAP.DIACHI, LOAIHANG.TENLOAIHANG
FROM NHACUNGCAP
INNER JOIN MATHANG ON NHACUNGCAP.MACONGTY = MATHANG.MACONGTY
INNER JOIN LOAIHANG ON MATHANG.MALOAIHANG = LOAIHANG.MALOAIHANG
WHERE LOAIHANG.TENLOAIHANG = N'Thực phẩm';

-- Câu 9: Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng Sữa hộp XYZ
SELECT DISTINCT KHACHHANG.TENGIAODICH
FROM KHACHHANG
INNER JOIN DONDATHANG ON KHACHHANG.MAKHACHHANG = DONDATHANG.MAKHACHHANG
INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
INNER JOIN MATHANG ON CHITIETDATHANG.MAHANG = MATHANG.MAHANG
WHERE MATHANG.TENHANG = 'Sữa hộp XYZ';

-- Câu 10(Quản lý hàng hóa):Cho biết đơn đặt hàng số 1 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu?
SELECT KH.TENCONGTY AS KHACHHANG, NV.HO AS NHANVIEN_HO, NV.TEN AS NHANVIEN_TEN, DDH.NGAYGIAOHANG, DDH.NOIGIAOHANG
FROM DONDATHANG DDH
JOIN KHACHHANG KH ON DDH.MAKHACHHANG = KH.MAKHACHHANG
JOIN NHANVIEN NV ON DDH.MANHANVIEN = NV.MANHANVIEN
WHERE DDH.SOHOADON = 'DH001';

-- Câu 11. Cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương = lương cơ bản + phụ cấp)
SELECT MANHANVIEN,
       HO,
       TEN,
       LUONGCOBAN,
       PHUCAP,
       (LUONGCOBAN + PHUCAP) AS TONG_LUONG
FROM NHANVIEN;

-- Câu 12( Quản lí hàng hoá ) : cho biết đơn đặt hàng số 3 đã đặt mua những mặt hàng nào và số tiền mà khách hàng phải trả cho mỗi mặt hàng là bao nhiêu(tienphaitra = soluong * giaban - soluong * giaban *( mucgiamgia/100 ) )
SELECT MATHANG.TENHANG,
       CHITIETDATHANG.SOLUONG,
       CHITIETDATHANG.GIABAN,
       CHITIETDATHANG.MUCGIAMGIA,
       (CHITIETDATHANG.SOLUONG * CHITIETDATHANG.GIABAN - CHITIETDATHANG.SOLUONG * CHITIETDATHANG.GIABAN * (CHITIETDATHANG.MUCGIAMGIA / 100)) AS TIENPHAITRA
FROM CHITIETDATHANG
INNER JOIN MATHANG ON CHITIETDATHANG.MAHANG = MATHANG.MAHANG
WHERE CHITIETDATHANG.SOHOADON = 'DH003';

-- câu 13 Hãy cho biết những khách hàng nào lại chính là đối tác cung cấp hàng cho công ty
SELECT *
FROM KHACHHANG
WHERE TENGIAODICH IN (
    SELECT TENGIAODICH
    FROM NHACUNGCAP
);

-- Cau 14: Trong CTY co nhung nhan vien nao co cung ngay sinh
select nv1.HO + ' ' + nv1.TEN as HOTEN1,
nv2.HO + ' ' + nv2.TEN as HOTEN2, nv1.NGAYSINH
from NHANVIEN nv1 join NHANVIEN nv2
on nv1.MANHANVIEN<>nv2.MANHANVIEN and nv1.NGAYSINH=nv2.NGAYSINH;

-- Câu 15: Những đơn đặt hàng nào yêu cầu giao hàng ngay  tại công ty đặt hàng và những đơn đó là của công ty nào?
SELECT DONDATHANG.SOHOADON, KHACHHANG.TENCONGTY AS CONGTYDATHANG
FROM DONDATHANG
INNER JOIN KHACHHANG ON DONDATHANG.MAKHACHHANG = KHACHHANG.MAKHACHHANG
WHERE DONDATHANG.NOIGIAOHANG = KHACHHANG.DIACHI;


-- Câu 16: Cho biết tên công ty, tên giao dịch, địa chỉ và điện thoại của các khách hàng và các nhà cung cấp hàng cho công ty.
SELECT TENCONGTY , TENGIAODICH, DIACHI, DIENTHOAI
FROM KHACHHANG
UNION
SELECT TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI
FROM NHACUNGCAP;

-- câu 17. (quản lý hàng hoá) Những mặt hàng nào chưa từng được khách hàng đặt mua?
SELECT  TENHANG
FROM MATHANG
WHERE MAHANG NOT IN (
    SELECT DISTINCT MAHANG
    FROM CHITIETDATHANG );

-- Cau 18: Những nv nao cua CTY chua tung lap bat ki 1 hoa don đặt hang nào?
select nv.MANHANVIEN, nv.HO+ ' ' + nv.TEN as HOTEN
from NHANVIEN nv
where nv.MaNhanVien not in ( select dh.MANHANVIEN from DONDATHANG dh);

-- Câu 19: Những nhân viên nào của công ty có lương cơ bản cao nhất?
SELECT *
FROM NHANVIEN
WHERE LUONGCOBAN = (
    SELECT MAX(LUONGCOBAN)
    FROM NHANVIEN
);

-- câu 20:  tổng số tiền khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu?
SELECT DONDATHANG.SOHOADON,
       SUM(CHITIETDATHANG.SOLUONG * CHITIETDATHANG.GIABAN - CHITIETDATHANG.SOLUONG * CHITIETDATHANG.GIABAN * (CHITIETDATHANG.MUCGIAMGIA / 100)) AS TONGTIEN
FROM DONDATHANG
INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
GROUP BY DONDATHANG.SOHOADON;

-- câu 21:  Trong năm 2021, những mặt hàng nào chỉ được đặt mua đúng một lần
SELECT MAHANG, TENHANG
FROM (
    SELECT MATHANG.MAHANG, TENHANG, COUNT(*) AS SoLanDat
    FROM DONDATHANG
    JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
    JOIN MATHANG ON CHITIETDATHANG.MAHANG = MATHANG.MAHANG
    WHERE YEAR(NGAYDATHANG) = 2021
    GROUP BY MATHANG.MAHANG, TENHANG
) AS Subquery
WHERE SoLanDat = 1;

-- Câu 22: Cho biết mỗi một khách hàng đã phải bỏ ra bao nhiêu tiền để đặt mua hàng?
SELECT KH.MAKHACHHANG,
       KH.TENCONGTY,
       SUM(CT.GIABAN * CT.SOLUONG) AS TongTienDatHang
FROM KHACHHANG KH
INNER JOIN DONDATHANG DDH ON KH.MAKHACHHANG = DDH.MAKHACHHANG
INNER JOIN CHITIETDATHANG CT ON DDH.SOHOADON = CT.SOHOADON
GROUP BY KH.MAKHACHHANG, KH.TENCONGTY;

-- Câu 23: Mỗi một nhân viên của công ty đã lập bao nhiêu đơn đặt hàng (nếu nhân viên chưa hề lập một hóa đơn nào thì cho kết quả là 0)
SELECT NHANVIEN.MANHANVIEN, CONCAT(NHANVIEN.HO, ' ', NHANVIEN.TEN) AS 'HỌ TÊN NHÂN VIÊN',
COUNT(DONDATHANG.SOHOADON) AS 'SỐ LƯỢNG ĐƠN ĐẶT HÀNG'
FROM NHANVIEN
LEFT JOIN DONDATHANG ON NHANVIEN.MANHANVIEN = DONDATHANG.MANHANVIEN
GROUP BY NHANVIEN.MANHANVIEN, NHANVIEN.HO, NHANVIEN.TEN;

-- Câu 24: Cho biết tổng số tiền hàng mà cửa hàng thu được trong mỗi tháng của năm 2021 (thời gian  được tính theo thời gian ngày đặt hàng)
SELECT MONTH(NGAYDATHANG) AS THANG,
       YEAR(NGAYDATHANG) AS NAM,
       SUM(CHITIETDATHANG.GIABAN * CHITIETDATHANG.SOLUONG) AS TONGTIEN
FROM DONDATHANG
INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
WHERE YEAR(NGAYDATHANG) = 2021
GROUP BY MONTH(NGAYDATHANG), YEAR(NGAYDATHANG)
ORDER BY NAM, THANG;

-- Câu 25:  Hãy cho biết tổng số tiền lời mà công ty thu được từ mỗi mặt hàng trong năm 2021.
SELECT MATHANG.MAHANG,
       MATHANG.TENHANG,
       SUM(CHITIETDATHANG.GIABAN * CHITIETDATHANG.SOLUONG * (1 - CHITIETDATHANG.MUCGIAMGIA / 100)) - SUM(CHITIETDATHANG.GIABAN * CHITIETDATHANG.SOLUONG) AS Loi_2021
FROM MATHANG
INNER JOIN CHITIETDATHANG ON MATHANG.MAHANG = CHITIETDATHANG.MAHANG
INNER JOIN DONDATHANG ON CHITIETDATHANG.SOHOADON = DONDATHANG.SOHOADON
WHERE YEAR(DONDATHANG.NGAYDATHANG) = 2021
GROUP BY MATHANG.MAHANG, MATHANG.TENHANG;

-- Câu 26: Hãy cho biết tổng số  lượng hàng của mỗi mặt hàng mà công ty đã có (tổng số lượng hàng hiện có và đã bán
SELECT MATHANG.MAHANG, MATHANG.TENHANG, MATHANG.MACONGTY,
       SUM(MATHANG.SOLUONG) AS TONG_SOLUONG
FROM MATHANG
LEFT JOIN CHITIETDATHANG ON MATHANG.MAHANG = CHITIETDATHANG.MAHANG
GROUP BY MATHANG.MAHANG, MATHANG.TENHANG, MATHANG.MACONGTY;

-- câu 27 : hãy cho biết nhân viên nào của công ty bán được số lượng mặt hàng nhiều nhất  và số lượng mặt hàng bán được của những nhân viên này là bao nhiêu?
SELECT TOP 1 NHANVIEN.MANHANVIEN, NHANVIEN.HO, NHANVIEN.TEN, SUM(CHITIETDATHANG.SOLUONG) AS TONG_SOLUONG
FROM NHANVIEN
INNER JOIN DONDATHANG ON NHANVIEN.MANHANVIEN = DONDATHANG.MANHANVIEN
INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
GROUP BY NHANVIEN.MANHANVIEN, NHANVIEN.HO, NHANVIEN.TEN
ORDER BY TONG_SOLUONG DESC;

-- Câu 28: Đơn đặt hàng nào có số lượng mặt hàng được đặt mua ít nhất?
SELECT DONDATHANG.SOHOADON, SUM(CT.SOLUONG)
FROM DONDATHANG
INNER JOIN CHITIETDATHANG CT ON DONDATHANG.SOHOADON = CT.SOHOADON
GROUP BY DONDATHANG.SOHOADON
HAVING SUM(CT.SOLUONG) <= ALL (
    SELECT SUM(CTD.SOLUONG)
    FROM DONDATHANG
    INNER JOIN CHITIETDATHANG CTD ON DONDATHANG.SOHOADON = CTD.SOHOADON
    GROUP BY DONDATHANG.SOHOADON
);

-- Câu 29: Hiển thị  Số tiền nhiều nhất mà mỗi khách hàng đã từng bỏ ra để đặt hàng trong các đơn đặt hàng là bao nhiêu
SELECT DONDATHANG.MAKHACHHANG, MAX(CHITIETDATHANG.GIABAN * CHITIETDATHANG.SOLUONG) AS 'TongSoTien'
FROM DONDATHANG
INNER JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON
GROUP BY DONDATHANG.MAKHACHHANG;

-- Câu 30 : Thống kê xem mỗi mặt hàng trong tháng và cả năm 2021, bán được với số lượng bao nhiêu. Kết quả hiển thị dưới dạng bảng, 2 cột đầu là mã hàng và tên bảng, các cột còn lại tương ứng với các tháng từ 1 đến 12 và cả năm.
SELECT
    MH.MAHANG,
    MH.TENHANG,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 1 THEN CTDH.SOLUONG ELSE 0 END) AS Thang1,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 2 THEN CTDH.SOLUONG ELSE 0 END) AS Thang2,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 3 THEN CTDH.SOLUONG ELSE 0 END) AS Thang3,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 4 THEN CTDH.SOLUONG ELSE 0 END) AS Thang4,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 5 THEN CTDH.SOLUONG ELSE 0 END) AS Thang5,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 6 THEN CTDH.SOLUONG ELSE 0 END) AS Thang6,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 7 THEN CTDH.SOLUONG ELSE 0 END) AS Thang7,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 8 THEN CTDH.SOLUONG ELSE 0 END) AS Thang8,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 9 THEN CTDH.SOLUONG ELSE 0 END) AS Thang9,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 10 THEN CTDH.SOLUONG ELSE 0 END) AS Thang10,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 11 THEN CTDH.SOLUONG ELSE 0 END) AS Thang11,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 12 THEN CTDH.SOLUONG ELSE 0 END) AS Thang12,
    SUM(CTDH.SOLUONG) AS CaNam
FROM
    DONDATHANG DDH
JOIN
    CHITIETDATHANG CTDH ON DDH.SOHOADON = CTDH.SOHOADON
JOIN
    MATHANG MH ON CTDH.MAHANG = MH.MAHANG
WHERE
    YEAR(DDH.NGAYDATHANG) = 2021
GROUP BY
    MH.MAHANG, MH.TENHANG;

-- câu 31(quản lí hàng hoá) :Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG chưa xác định (NULL) trong bảng DONDA THANG bằng với giá trị của trường NGAYDATHANG.
UPDATE DONDATHANG
SET NGAYCHUYENHANG = NGAYDATHANG
WHERE NGAYCHUYENHANG IS NULL;

-- Câu 32: Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi.
UPDATE MATHANG
SET SOLUONG = SOLUONG * 2
WHERE MACONGTY IN (
    SELECT MACONGTY
    FROM NHACUNGCAP
    WHERE TENCONGTY = N'VINAMILK'
);

-- Câu 33: Cập nhật giá trị của trường NOIGIAOHANG trong bảng ĐONATHANG bằng địa chỉ của khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
UPDATE DONDATHANG
SET NOIGIAOHANG = KHACHHANG.DIACHI
FROM DONDATHANG
INNER JOIN KHACHHANG ON DONDATHANG.MAKHACHHANG = KHACHHANG.MAKHACHHANG
WHERE DONDATHANG.NOIGIAOHANG IS NULL;

-- Câu 34: Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công tu và tên giao dịch khách hàng trùng với tên công ty và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại, fax và e-mail phải giống nhau:
UPDATE KHACHHANG
SET DIACHI = NC.DIACHI,
    EMAIL = NC.EMAIL,
    DIENTHOAI = NC.DIENTHOAI,
    FAX = NC.FAX
FROM KHACHHANG KH
INNER JOIN NHACUNGCAP NC ON KH.TENCONGTY = NC.TENCONGTY AND KH.TENGIAODICH = NC.TENGIAODICH;

-- câu 35 : Tăng lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2018
UPDATE NHANVIEN SET LUONGCOBAN = LUONGCOBAN * 2
WHERE MANHANVIEN IN (
    SELECT DISTINCT NV.MANHANVIEN
    FROM NHANVIEN NV
    JOIN DONDATHANG DDH ON NV.MANHANVIEN = DDH.MANHANVIEN
    JOIN CHITIETDATHANG CTDH ON DDH.SOHOADON = CTDH.SOHOADON
    WHERE YEAR(NGAYDATHANG) = 2018
    GROUP BY NV.MANHANVIEN
    HAVING SUM(SOLUONG) > 100
);
-- Câu 36:  Tăng phụ cấp lên bằng 25% lương cho những nhân viên bán được hàng nhiều nhất
UPDATE NHANVIEN
SET PHUCAP = PHUCAP + (LUONGCOBAN * 0.25)
WHERE MANHANVIEN IN (
    SELECT TOP 1 WITH TIES MANHANVIEN
    FROM CHITIETDATHANG
    JOIN DONDATHANG ON CHITIETDATHANG.SOHOADON = DONDATHANG.SOHOADON
    GROUP BY MANHANVIEN
    ORDER BY COUNT(*) DESC
);

-- Câu 37(Quản lý hàng hoá): giảm 25% lương của những nhân viên trong năm 2018 không lặp được bất kỳ đơn đặt hàng nào?
UPDATE NHANVIEN
SET LUONGCOBAN = LUONGCOBAN * 0.75
WHERE MANHANVIEN NOT IN (
    SELECT MANHANVIEN
    FROM DONDATHANG
    WHERE YEAR(NGAYDATHANG) = 2018
);

-- Câu 38: Giả sử trong bảng DONDATHANG có thêm trường SOTIEN cho biết số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng. Hãy tính giá trị cho trường này.
ALTER TABLE DONDATHANG
ADD SOTIEN Money;
UPDATE DONDATHANG
SET SOTIEN = (SELECT SUM((GIABAN * (1 - MUCGIAMGIA/100)) * SOLUONG) FROM CHITIETDATHANG WHERE CHITIETDATHANG.SOHOADON = DONDATHANG.SOHOADON);

-- Câu 39: Xóa khỏi bảng NHANVIEN những nhân viên đã làm việc trong công ty quá 40 năm.
DELETE FROM NHANVIEN
WHERE DATEDIFF(year, NGAYLAMVIEC, GETDATE()) > 40;

-- Câu 40: Xóa những đơn hàng trước năm 2022 ra khỏi cơ sở dữ liệu trên.
DELETE FROM CHITIETDATHANG
WHERE SOHOADON IN (
    SELECT SOHOADON
    FROM DONDATHANG
    WHERE YEAR(NGAYDATHANG) < 2022
);

-- Câu 41: Xóa khỏi bảng LOAIHANG những loại hàng hiện không có mặt hàng
DELETE FROM LOAIHANG
WHERE NOT EXISTS (
    SELECT 1 FROM MATHANG
    WHERE LOAIHANG.MaLoaiHang = MATHANG.MaLoaiHang
);

-- Câu 42:  Xóa khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty
DELETE FROM KHACHHANG
WHERE NOT EXISTS (
    SELECT 1
    FROM DONDATHANG
    WHERE DONDATHANG.MAKHACHHANG = KHACHHANG.MAKHACHHANG
);

-- Câu 43: Xóa khỏi bảng MATHANG những mặt hàng có số lượng bằng 0 và không được đặt mua trong bất kỳ đơn đặt hàng nào.
DELETE FROM MATHANG
WHERE SOLUONG = 0
AND MAHANG NOT IN (
    SELECT MAHANG
    FROM CHITIETDATHANG
);

-- Chương 6, Bài 1.1: Tạo thủ tục lưu trữ dể thông qua thủ tục này có thể bổ sung thêm một bản ghi mới cho bảng MATHANG (thủ tục phải thực hiện kiểm tra tính hợp lệ của dữ liệu cần bổ sung: không trùng khóa chính và đảm bảo toàn vẹn tham chiếu)
CREATE PROCEDURE ThemMatHang (
    @MAHANG VARCHAR(10),
    @TENHANG NVARCHAR(100),
    @MACONGTY VARCHAR(10),
    @MALOAIHANG VARCHAR(10),
    @SOLUONG DECIMAL(10, 2),
    @DONVITINH NVARCHAR(20),
    @GIAHANG MONEY
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM MATHANG WHERE MAHANG = @MAHANG)
    BEGIN
        RETURN
    END

    IF NOT EXISTS (SELECT 1 FROM NHACUNGCAP WHERE MACONGTY = @MACONGTY)
    BEGIN
        RETURN
    END

    IF NOT EXISTS (SELECT 1 FROM LOAIHANG WHERE MALOAIHANG = @MALOAIHANG)
    BEGIN
        RETURN
    END

    INSERT INTO MATHANG (MAHANG, TENHANG, MACONGTY, MALOAIHANG, SOLUONG, DONVITINH, GIAHANG)
    VALUES (@MAHANG, @TENHANG, @MACONGTY, @MALOAIHANG, @SOLUONG, @DONVITINH, @GIAHANG)
END;


-- Chương 6, Bài 1.2: Tạo thủ tục lưu trữ có chức năng thống kê tổng số lượng hàng bán được của một mặt hàng có mã bất kỳ (mã mặt hàng cần thống kê là tham số của thủ tục)
CREATE FUNCTION TongSoLuongHangBanDuoc (@MaHang VARCHAR(10))
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @SoLuongBanDuoc DECIMAL(10,2);

    SELECT @SoLuongBanDuoc = SUM(SOLUONG)
    FROM CHITIETDATHANG
    WHERE MAHANG = @MaHang;

    RETURN @SoLuongBanDuoc;
END;

-- Chương 6, Bài 1.3: Ham tra ve mot bang tong so luong hang cua moi mat hang, hien co va da ban
create function fn_TongSLMH()
returns table
as
return (select a.MaHang,a.SoLuong as SLHienCo, b.SoLuong as SLDaBan
		from MatHang a join ChiTietDatHang b on a.MaHang=b.MaHang);

-- VD Sử dụng hàm
select * from fn_TongSLMH();


-- CHƯƠNG 6, Bài 1.4 : viết trigger cho bảng chi tiết đặt hàng theo yêu cầu sau:
-- khi một bảng ghi mới được bổ sung vào bảng này thì giảm số lượng hàng hiện có nếu số lượng hàng hiện có lớn hơn hoặc bằng số lượng hàng được bán ra. ngược lại thìu hủy nỏ thao tác bổ sung.
-- khi cập nhật lại số lượng hàng đc bán, kiểm tra số lượng hàng đc cập nhật lại có phù hợp hay không( số lượng hàng đc bán ra không đc vượt quá số lượng hàng hiện có và không đc nhỏ hơn 1). nếu dữ liệu hợp lệ thì giảm (hoặc tăng) số lượng hàng hiện có trong công ty , ngược lại thì hủy bỏ thao tác cập nhật.
-- Trigger  INSERT
CREATE TRIGGER trg_after_insert_chitietdathang
ON CHITIETDATHANG
AFTER INSERT
AS
BEGIN
    DECLARE @MAHANG VARCHAR(10), @SOLUONG DECIMAL(10,2)

    SELECT @MAHANG = i.MAHANG, @SOLUONG = i.SOLUONG
    FROM INSERTED i

    IF EXISTS (SELECT 1 FROM MATHANG WHERE MAHANG = @MAHANG AND SOLUONG >= @SOLUONG)
    BEGIN
        UPDATE MATHANG
        SET SOLUONG = SOLUONG - @SOLUONG
        WHERE MAHANG = @MAHANG
    END
    ELSE
    BEGIN
        RAISERROR('Không đủ số lượng hàng để bán.', 16, 1)
        ROLLBACK TRANSACTION
    END
END;


-- Trigger UPDATE
CREATE TRIGGER trg_after_update_chitietdathang
ON CHITIETDATHANG
AFTER UPDATE
AS
BEGIN
    DECLARE @SOHOADON VARCHAR(10), @MAHANG VARCHAR(10), @SOLUONG_OLD DECIMAL(10,2), @SOLUONG_NEW DECIMAL(10,2)

    SELECT @SOHOADON = i.SOHOADON, @MAHANG = i.MAHANG, @SOLUONG_OLD = d.SOLUONG, @SOLUONG_NEW = i.SOLUONG
    FROM INSERTED i
    JOIN DELETED d ON i.SOHOADON = d.SOHOADON AND i.MAHANG = d.MAHANG

    IF @SOLUONG_NEW < 1
    BEGIN
        RAISERROR('Số lượng hàng bán ra phải lớn hơn hoặc bằng 1.', 16, 1)
        ROLLBACK TRANSACTION
    END

    IF EXISTS (SELECT 1 FROM MATHANG WHERE MAHANG = @MAHANG AND SOLUONG + @SOLUONG_OLD - @SOLUONG_NEW >= 0)
    BEGIN
        UPDATE MATHANG
        SET SOLUONG = SOLUONG + @SOLUONG_OLD - @SOLUONG_NEW
        WHERE MAHANG = @MAHANG
    END
    ELSE
    BEGIN
        RAISERROR('Không đủ số lượng hàng để bán.', 16, 1)
        ROLLBACK TRANSACTION
    END
END;


-- Chương 6: Câu 1.5: Viết trigger cho bảng CTDATHANG để sao cho chỉ chấp nhận giá hàng bán ra phải lớn hơn hoặc bằng giá gốc  (giá của mặt hàng trong bảng MATHANG)
CREATE TRIGGER CheckSellingPrice
ON CTDATHANG
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN MATHANG m ON i.MAHANG = m.MAHANG
        WHERE i.GIABAN < m.GIAHANG
    )
    BEGIN
        RAISERROR ('Giá bán phải lớn hơn hoặc bằng giá gốc của mặt hàng.', 16, 1)
        ROLLBACK TRANSACTION
    END
END;
