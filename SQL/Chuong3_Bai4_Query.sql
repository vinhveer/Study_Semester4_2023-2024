USE QLBongDa;

-- Câu 1: Cho biết thông tin (mã cầu thủ, họ tên , số áo. vị trí , ngày sinh , đại chỉ) của tất cả các cầu thủ.
SELECT MACT, HOTEN, SO, VITRI, NGAYSINH, DIACHI
FROM CAUTHU;

-- Câu 2: Hiển thị thông tin tất cả các cầu thủ có số áo là 7 chơi ở vị trí tiền vệ.
SELECT MACT, HOTEN, SO, VITRI, NGAYSINH, DIACHI
FROM CAUTHU
WHERE SO = 7 AND VITRI = N'Tiền vệ';

-- Câu 3: Cho biết tên, ngày sinh, địa chỉ, điện thoại của tất cả các huấn luyện viên.
SELECT TENHLV, NGAYSINH, DIACHI, DIENTHOAI
FROM HUANLUYENVIEN;

-- Câu 4: Hiển thị thông tin tất cả các cầu thủ có quốc tịch Việt Nam thuộc câu lạc bộ Becamex Bình Dương
SELECT *
FROM CAUTHU
WHERE MAQG = 'VN' AND MACLB = 'BBD';

-- Câu 5. Cho biết mã số, họ tên, ngày sinh, địa chỉ và vị trí của các cầu thủ thuộc đội bóng "SHB Đà Nẵng” có quốc tịch "Bra-xin".
SELECT CAUTHU.MACT, CAUTHU.HOTEN, CAUTHU.NGAYSINH, CAUTHU.DIACHI, CAUTHU.VITRI
FROM CAUTHU
JOIN CAULACBO ON CAUTHU.MACLB = CAULACBO.MACLB
JOIN QUOCGIA ON CAUTHU.MAQG = QUOCGIA.MAQG
WHERE CAULACBO.TENCLB = N'SHB ĐÀ NẴNG' AND QUOCGIA.TENQG = N'Bra-xin';

-- Câu 6. Hiển thị thông tin các cầu thủ đang thi đấu trong câu lạc bộ sân nhà “Long An”.
SELECT CAUTHU.MACT, CAUTHU.HOTEN, CAUTHU.NGAYSINH, CAUTHU.DIACHI, CAUTHU.VITRI
FROM CAUTHU
JOIN CAULACBO ON CAUTHU.MACLB = CAULACBO.MACLB
JOIN SANVD ON CAULACBO.MASAN = SANVD.MASAN
WHERE SANVD.TENSAN = 'Long An';

-- Câu 7: Cho biết kết quả(MATRAN, NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) các trận đấu vòng 2 của mùa bóng năm 2021
SELECT TRANDAU.MATRAN, TRANDAU.NGAYTD, SANVD.TENSAN, CAULACBO1.TENCLB AS TENCLB1, CAULACBO2.TENCLB AS TENCLB2, TRANDAU.KETQUA
FROM TRANDAU
INNER JOIN SANVD ON TRANDAU.MASAN = SANVD.MASAN
INNER JOIN CAULACBO AS CAULACBO1 ON TRANDAU.MACLB1 = CAULACBO1.MACLB
INNER JOIN CAULACBO AS CAULACBO2 ON TRANDAU.MACLB2 = CAULACBO2.MACLB
WHERE TRANDAU.VONG = 2 AND TRANDAU.NAM = 2021;

-- Câu 8: Cho biết mã HLV, họ tên, ngày sinh, địa chỉ, vai trò, và tên CLB đang làm việc của các hlv có quốc tịch "Việt Nam"
SELECT HUANLUYENVIEN.MAHLV, HUANLUYENVIEN.TENHLV, HUANLUYENVIEN.NGAYSINH, HUANLUYENVIEN.DIACHI, HLV_CLB.VAITRO, CAULACBO.TENCLB
FROM HUANLUYENVIEN
INNER JOIN HLV_CLB ON HUANLUYENVIEN.MAHLV = HLV_CLB.MAHLV
INNER JOIN CAULACBO ON HLV_CLB.MACLB = CAULACBO.MACLB
WHERE HUANLUYENVIEN.MAQG = 'VN';

-- Câu 9: Lấy tên 3 câu lạc bộ có điểm cao nhất sau vòng 3 năm 2023.
SELECT TOP 3 TENCLB
FROM BANGXH BX
JOIN CAULACBO CLB ON BX.MACLB = CLB.MACLB
WHERE BX.NAM = 2023
    AND BX.VONG = 3
ORDER BY BX.DIEM DESC;

-- Câu 10: Cho biết mã huấn luyện viên,họ tên ngày sinh , địa chỉ vai trò và tên clb đang làm việc mà câu lạc bộ đó đóng ở tỉnh Bình Dương.
SELECT HLV.MAHLV, HLV.TENHLV, HLV.NGAYSINH, HLV.DIACHI, HLV_CLB.VAITRO, CLB.TENCLB
FROM HUANLUYENVIEN HLV
JOIN HLV_CLB ON HLV.MAHLV = HLV_CLB.MAHLV
JOIN CAULACBO CLB ON HLV_CLB.MACLB = CLB.MACLB
JOIN TINH ON CLB.MATINH = TINH.MATINH
WHERE TINH.TENTINH = N'Bình Dương';

-- Câu 11:  Thống kê số lượng cầu thủ của mỗi câu lạc bộ.
SELECT MACLB, COUNT(MACT) AS SoLuongCauThu
FROM CAUTHU
GROUP BY MACLB;

-- Câu 12: Thống kê số lượng cầu thủ nước ngoài(có quốc tịch khác Việt Nam) của mỗi câu lạc bộ
SELECT CAULACBO.MACLB, CAULACBO.TENCLB, COUNT(CASE WHEN CAUTHU.MAQG != 'VN' THEN 1 END) AS SOCAUTHUNGOAI
FROM CAULACBO
JOIN CAUTHU ON CAULACBO.MACLB = CAUTHU.MACLB
GROUP BY CAULACBO.MACLB, CAULACBO.TENCLB;

-- Câu 13: Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, địa chỉ và số lượng cầu thủ nước ngoài (có quốc tịch khác "Viet Nam") tương ứng của các câu lạc bộ có nhiều hơn 2 cầu thủ nước ngoài.
SELECT clb.MACLB, clb.TENCLB, san.TENSAN, san.DIACHI, COUNT(cau.MAQG) AS SoLuongNuocNgoai
FROM CAULACBO clb
INNER JOIN SANVD san ON clb.MASAN = san.MASAN
INNER JOIN CAUTHU cau ON clb.MACLB = cau.MACLB
WHERE cau.MAQG <> 'Viet Nam'
GROUP BY clb.MACLB, clb.TENCLB, san.TENSAN, san.DIACHI
HAVING COUNT(cau.MAQG) > 2;

-- Câu 14:Cho biết tên tỉnh, số lượng cầu thủ đang thi đấu ở vị trí tiền đạo trong các câu lạc bộ thuộc địa bàn tỉnh đó quản lý.
SELECT tinh.TENTINH, COUNT(cau.MACT) AS SoLuongTienDao
FROM TINH tinh
INNER JOIN CAULACBO clb ON tinh.MATINH = clb.MATINH
INNER JOIN CAUTHU cau ON clb.MACLB = cau.MACLB
WHERE cau.VITRI = N'Tiền đạo'
GROUP BY tinh.MATINH, tinh.TENTINH;

--  Câu 15:Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng nằm ở vị trí cao nhất của bảng xếp hạng của vòng 3, năm 2023.
SELECT TOP 1 WITH TIES CLB.TENCLB, TINH.TENTINH
FROM BANGXH BXH
JOIN CAULACBO CLB ON BXH.MACLB = CLB.MACLB
JOIN TINH ON CLB.MATINH = TINH.MATINH
WHERE BXH.VONG = 3 AND BXH.NAM = 2023
ORDER BY BXH.DIEM DESC;

-- Câu 16:Cho biết tên huấn luyện viên đang nắm giữ một vị trí trong một câu lạc bộ mà chưa có số điện thoại
SELECT HLV.TENHLV
FROM HUANLUYENVIEN HLV
JOIN HLV_CLB HLV_CLB ON HLV.MAHLV = HLV_CLB.MAHLV
LEFT JOIN CAULACBO CLB ON HLV_CLB.MACLB = CLB.MACLB
WHERE HLV.DIENTHOAI IS NULL;

-- Câu 17. Liệt kê các huấn luyện viên thuộc quốc gia Việt Nam chưa làm công tác huấn luyện tại bất kỳ 1 câu lạc bộ nào.
SELECT *
FROM HUANLUYENVIEN
WHERE MAQG = 'VN'
AND MAHLV NOT IN (SELECT DISTINCT MAHLV FROM HLV_CLB);

-- Câu 18: Liệt kê các cầu thủ đang thi đấu trong các câu lạc bộ có thứ hạng ở vòng 3 năm 2023 lớn hơn 6 hoặc nhỏ hơn 3
SELECT CAUTHU.*
FROM CAUTHU
JOIN BANGXH ON CAUTHU.MACLB = BANGXH.MACLB
WHERE BANGXH.NAM = 2021 AND BANGXH.VONG = 3 AND (BANGXH.HANG > 6 OR BANGXH.HANG < 3);

-- Câu 19. Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) của câu lạc bộ CLB đang xếp hạng cao nhất tính đến hết vòng 3 năm 2023.
SELECT TRANDAU.NGAYTD, SANVD.TENSAN, CLB1.TENCLB AS TENCLB1, CLB2.TENCLB AS TENCLB2, TRANDAU.KETQUA
FROM TRANDAU
JOIN CAULACBO AS CLB1 ON TRANDAU.MACLB1 = CLB1.MACLB
JOIN CAULACBO AS CLB2 ON TRANDAU.MACLB2 = CLB2.MACLB
JOIN SANVD ON TRANDAU.MASAN = SANVD.MASAN
JOIN BANGXH ON TRANDAU.MACLB1 = BANGXH.MACLB
WHERE BANGXH.HANG = 1 AND TRANDAU.VONG <= 3 AND TRANDAU.NAM = 2023;

-- Câu 20: Cho biết NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA các trận đấu diễn ra vào tháng 3 trên sân nhà mà không bị thủng lưới
SELECT
    TRANDAU.NGAYTD,
    SANVD.TENSAN,
    CLB1.TENCLB AS TENCLB1,
    CLB2.TENCLB AS TENCLB2,
    TRANDAU.KETQUA
FROM TRANDAU
JOIN SANVD ON TRANDAU.MASAN = SANVD.MASAN
JOIN CAULACBO AS CLB1 ON TRANDAU.MACLB1 = CLB1.MACLB
JOIN CAULACBO AS CLB2 ON TRANDAU.MACLB2 = CLB2.MACLB
WHERE MONTH(TRANDAU.NGAYTD) = 3
  AND TRANDAU.KETQUA LIKE '%-0';

-- Câu 21: Cho biết mã số,  họ tên, ngày sinh của những cầu thủ có họ lót là "Công"
SELECT MACT, HOTEN, NGAYSINH
FROM CAUTHU
WHERE HOTEN LIKE N'% Công %';

-- Câu 22: Cho biết mã số,  họ tên, ngày sinh của những cầu thủ có họ không phải là họ "Nguyễn"
SELECT MACT, HOTEN, NGAYSINH
FROM CAUTHU
WHERE HOTEN NOT LIKE N'Nguyễn%';

-- Câu 23 Cho biết mã huấn luyện viên,họ tên,ngày sinh,địa chỉ của những huấn luyện viên Việt Nam có tuổi nằm trong khoảng 35-40
SELECT MAHLV, TENHLV, NGAYSINH, DIACHI
FROM HUANLUYENVIEN
WHERE MAQG = 'VN'
AND YEAR(GETDATE()) - YEAR(NGAYSINH) BETWEEN 35 AND 40;

-- Câu 24.Cho biết tên câu lạc bộ có huấn luyện viên trưởng sinh vào ngày 20 tháng 5
SELECT clb.TENCLB
FROM HLV_CLB hlv_clb
INNER JOIN CAULACBO clb ON hlv_clb.MACLB = clb.MACLB
INNER JOIN HUANLUYENVIEN hlv ON hlv_clb.MAHLV = hlv.MAHLV
WHERE DATEPART(DAY, hlv.NGAYSINH) = 20 AND DATEPART(MONTH, hlv.NGAYSINH) = 5;

-- Câu 25 Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng có số bàn thắng nhiều nhất tính đến hết vòng 3 năm 2021
SELECT CLB.TENCLB, TINH.TENTINH
FROM BANGXH BX
JOIN CAULACBO CLB ON BX.MACLB = CLB.MACLB
JOIN TINH ON CLB.MATINH = TINH.MATINH
WHERE BX.NAM = 2023 AND BX.VONG <= 3
GROUP BY CLB.TENCLB, TINH.TENTINH
HAVING SUM(BX.THANG) = (
    SELECT MAX(TOTAL_THANG)
    FROM (
        SELECT SUM(THANG) AS TOTAL_THANG
        FROM BANGXH
        WHERE NAM = 2023 AND VONG <= 3
        GROUP BY MACLB
    ) AS MAX_THANG
);

-- Câu 26 Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, địa chỉ và số lượng cầu thủ nước ngoài(có quốc tịch khác "Việt Nam") tương ứng của các câu lạc bộ có nhiều hơn 2 cầu thủ nước ngoài
SELECT CLB.MACLB, CLB.TENCLB, SANVD.TENSAN, SANVD.DIACHI,
COUNT(CASE WHEN CT.MAQG <> 'VN' THEN 1 END) AS 'SO_LUONG_CTNNUOCNGOAI'
FROM CAULACBO CLB
JOIN SANVD ON CLB.MASAN = SANVD.MASAN
JOIN CAUTHU CT ON CLB.MACLB = CT.MACLB
GROUP BY CLB.MACLB, CLB.TENCLB, SANVD.TENSAN, SANVD.DIACHI
HAVING COUNT(CASE WHEN CT.MAQG <> 'VN' THEN 1 END) > 2;

-- Câu 27: Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng có hiệu số bàn thắng bại cao nhất năm 2021:
SELECT TOP 1 CAULACBO.TENCLB, TINH.TENTINH
FROM CAULACBO
JOIN TINH ON CAULACBO.MATINH = TINH.MATINH
JOIN BANGXH ON CAULACBO.MACLB = BANGXH.MACLB
WHERE BANGXH.NAM = 2021
ORDER BY ABS(BANGXH.THANG - BANGXH.THUA) DESC;

-- Câu 28: Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2,( KETQUA) của câu lạc bộ CLB có thứ "hạng" thấp nhất trong "bảng xếp hạng" vòng 3 năm 2021
SELECT TRANDAU.NGAYTD, SANVD.TENSAN, CLB1.TENCLB AS TENCLB1, CLB2.TENCLB AS TENCLB2, BANGXH.HIEUSO AS KETQUA
FROM TRANDAU
JOIN SANVD ON TRANDAU.MASAN = SANVD.MASAN
JOIN CAULACBO AS CLB1 ON TRANDAU.MACLB1 = CLB1.MACLB
JOIN CAULACBO AS CLB2 ON TRANDAU.MACLB2 = CLB2.MACLB
JOIN BANGXH ON TRANDAU.MACLB1 = BANGXH.MACLB
WHERE BANGXH.NAM = 2021 AND BANGXH.VONG = 3
AND BANGXH.HANG = (SELECT MAX(HANG) FROM BANGXH WHERE NAM = 2021 AND VONG = 3);

-- Câu 29:( QLBD) Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đấu với tất cả các câu lạc bộ còn lại ( kể cả sân nhà và sân khách) trong mùa giải năm 2021.
SELECT DISTINCT c1.MACLB, clb.TENCLB
FROM CAULACBO clb
JOIN TRANDAU t1 ON clb.MACLB = t1.MACLB1
JOIN TRANDAU t2 ON clb.MACLB = t2.MACLB2
JOIN CAULACBO c1 ON t1.MACLB2 = c1.MACLB AND t1.MASAN = c1.MASAN
JOIN CAULACBO c2 ON t2.MACLB1 = c2.MACLB AND t2.MASAN = c2.MASAN
WHERE t1.NAM = 2021 AND t2.NAM = 2021;

-- Câu 30:( QLBD) Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đấu với tất cả các câu lạc bộ còn lại ( chỉ tính sân nhà) trong mùa giải năm 2021.
SELECT DISTINCT A.MACLB, A.TENCLB
FROM CAULACBO A
WHERE NOT EXISTS (
    SELECT *
    FROM CAULACBO B
    WHERE A.MACLB <> B.MACLB
    AND NOT EXISTS (
        SELECT *
        FROM TRANDAU TD
        WHERE (TD.MACLB1 = A.MACLB AND TD.MACLB2 = B.MACLB)
        AND TD.NAM = 2021
    )
);

-- Câu 31  Khi thêm cầu thủ mới, kiểm tra vị trí trên sân của cần thủ chỉ thuộc một trong các vị trí sau: Thủ môn, Tiền đạo, Tiền vệ, Trung vệ, Hậu vệ.

ALTER TABLE CAUTHU
ADD CONSTRAINT CHK_VITRI CHECK (VITRI IN (N'Thủ môn', N'Tiền đạo', N'Tiền vệ', N'Trung vệ', N'Hậu vệ'));

-- Câu 32 - Khi phân công huấn luyện viên, kiểm tra vai trò của huấn luyên viên chỉ thuộc một trong các vai trò sau : HLV chính, HLV phụ, HLV thể lực, HLV thủ môn
ALTER TABLE HLV_CLB
ADD CHECK (VAITRO IN (N'HLV CHÍNH', N'HLV PHỤ', N'HLV THỂ LỰC', N'HLV THỦ MÔN'));

-- Câu 33: (QLBD) Khi thêm cầu thủ mới, kiểm tra cầu thủ đó có tuổi phải đủ 18 trở lên ( chỉ tính năm sinh ).
ALTER TABLE CAUTHU
ADD CHECK (DATEDIFF(YEAR, NGAYSINH, GETDATE()) >= 18)

-- Câu 34(QLBD): kiểm tra kết quả có dạng số_bàn_thắng-số_bàn_thua
SELECT
    TRANDAU.MATRAN,
    TRANDAU.NGAYTD,
    CONCAT(BANGXH.THANG, '-', BANGXH.THUA) AS KETQUA
FROM
    TRANDAU
INNER JOIN
    BANGXH ON TRANDAU.MACLB1 = BANGXH.MACLB AND TRANDAU.NAM = BANGXH.NAM AND TRANDAU.VONG = BANGXH.VONG
