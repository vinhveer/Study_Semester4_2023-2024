USE QLTV;

-- Câu 1: Có bao nhiêu phiếu mượn sách thư viện trong năm qua?
SELECT COUNT(*) AS SoLuongPhieuMuon
FROM QuaTrinhMuon
WHERE YEAR(NgayMuon) = YEAR(GETDATE()) - 1;
-- Câu 2: Cho biết danh sách số ngày mượn của các lần đã mượn sách
SELECT
    DATEDIFF(day, NgayMuon, NgayTra) AS SoNgayMuon
FROM QuaTrinhMuon;
-- Câu 3: Cho biết danh sách số ngày mượn sách trung bình của các lần đã mượn sách?
SELECT
    AVG(DATEDIFF(day, NgayMuon, NgayTra)) AS SoNgayMuonTrungBinh
FROM QuaTrinhMuon;
-- Câu 4: Cho biết danh sách những phiếu mượn trả sách quá hạn?
SELECT *
FROM QuaTrinhMuon
WHERE NgayTra > NgayHetHan;
-- Câu 5 : Cho biết danh sách (đọc giả, sách được mượn) những độc giả đã được mượn quá hạn?
SELECT DISTINCT
    DG.Ma_DocGia,
    DG.Ho,
    DG.TenLot,
    DG.Ten,
    QTM.ISBN,
    QTM.Ma_CuonSach
FROM DocGia DG
INNER JOIN QuaTrinhMuon QTM ON DG.Ma_DocGia = QTM.Ma_DocGia
WHERE QTM.NgayTra > QTM.NgayHetHan AND QTM.NgayTra IS NULL;

-- Câu 6: Cho biết danh sách (đọc giả, sách được mượn) những độc giả đã và đang được mượn quá hạn?
SELECT DISTINCT
    DG.Ma_DocGia,
    DG.Ho,
    DG.TenLot,
    DG.Ten,
    QTM.ISBN,
    QTM.Ma_CuonSach
FROM DocGia DG
INNER JOIN QuaTrinhMuon QTM ON DG.Ma_DocGia = QTM.Ma_DocGia
WHERE QTM.NgayTra > QTM.NgayHetHan
    AND QTM.NgayTra > GETDATE();
-- Câu 7: Số lượng sách nhiều nhất mà một người đã mượn?
SELECT TOP 1
    QT.Ma_DocGia,
    DG.Ho,
    DG.TenLot,
    DG.Ten,
    COUNT(*) AS SoLuongSachMuon
FROM
    QuaTrinhMuon QT
INNER JOIN
    DocGia DG ON QT.Ma_DocGia = DG.Ma_DocGia
GROUP BY
    QT.Ma_DocGia, DG.Ho, DG.TenLot, DG.Ten
ORDER BY
    COUNT(*) DESC;
-- Câu 8 : bạn đọc mược sách nhiều nhất là ngày nào
SELECT TOP 1
    QT.Ma_DocGia,
    DG.Ho,
    DG.TenLot,
    DG.Ten,
    QT.NgayMuon,
    COUNT(*) AS SoLuongSachMuon
FROM
    QuaTrinhMuon QT
INNER JOIN
    DocGia DG ON QT.Ma_DocGia = DG.Ma_DocGia
GROUP BY
    QT.Ma_DocGia, DG.Ho, DG.TenLot, DG.Ten, QT.NgayMuon
ORDER BY
    COUNT(*) DESC, QT.NgayMuon DESC;



-- Bai tập Hàm,Thủ tuc, trigger
-- Câu 4.1: Xem thông tin đọc giả:
CREATE PROCEDURE sp_ThongtinDocGia
    @MaDocGia INT
AS
BEGIN
    -- Kiểm tra độc giả này thuộc loại người lớn hay trẻ em
    DECLARE @LoaiDocGia NVARCHAR(50)

    SELECT @LoaiDocGia = CASE
                            WHEN EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @MaDocGia) THEN 'NguoiLon'
                            WHEN EXISTS (SELECT 1 FROM TreEm WHERE Ma_DocGia = @MaDocGia) THEN 'TreEm'
                            ELSE NULL
                         END

    -- Nếu là người lớn thì in thông tin độc giả và thông tin người lớn
    IF @LoaiDocGia = 'NguoiLon'
    BEGIN
        SELECT *
        FROM DocGia dg
        INNER JOIN NguoiLon nl ON dg.Ma_DocGia = nl.Ma_DocGia
        WHERE dg.Ma_DocGia = @MaDocGia
    END
    -- Nếu là trẻ em thì in thông tin độc giả và thông tin trẻ em
    ELSE IF @LoaiDocGia = 'TreEm'
    BEGIN
        SELECT *
        FROM DocGia dg
        INNER JOIN TreEm te ON dg.Ma_DocGia = te.Ma_DocGia
        WHERE dg.Ma_DocGia = @MaDocGia
    END
    ELSE
    BEGIN
        PRINT 'Không tồn tại độc giả này.'
    END
END;


-- 4.2: Thu tuc Liệt kê những thông tin của đầu sách,
-- thông tin tựa sách và số lượng sách hiện
-- chưa được mượn của một đầu sách cụ thể (ISBN)
create proc sp_ThongTinDauSach
(@ISBN int = null)
as
begin
	print 'Thong tin dau sach';
	select * from DauSach where ISBN=@ISBN
	print 'Thong tin tua sach';
	select a.* from TuaSach a join DauSach b
	on a.Ma_TuaSach=b.Ma_TuaSach where b.ISBN=@ISBN
	print 'So luong sach chua duoc muon';
	select COUNT(Ma_CuonSach) from CuonSach
	where ISBN=@ISBN and Ma_CuonSach not in
		      (select Ma_CuonSach from Muon)
end
--su dung thu tuc
exec sp_ThongTinDauSach 1;


-- Bài 4.3. Liệt kê những độc giả người lớn đang mượn sách
-- Tên: sp_ThongtinNguoilonDangmuon
-- Nội dung: Liệt kê những thông tin của tất cả độc giả đang mượn sách của thư viện
CREATE PROCEDURE sp_ThongtinNguoilonDangmuon
AS
BEGIN
    SELECT *
    FROM DocGia DG
    JOIN NguoiLon NL ON DG.Ma_DocGia = NL.Ma_DocGia
    JOIN QuaTrinhMuon QTM ON DG.Ma_DocGia = QTM.Ma_DocGia
    WHERE DG.Ma_DocGia IN (SELECT DISTINCT Ma_DocGia FROM Muon);
END;

-- 4.4 Liệt kê những độc giả người lớn đang mượn sách quá hạn:
-- Tên: sp_ThongtinNguoilon Quahan
-- Nội dung: Liệt kê những thông tin của tất cả độc giả đang mượn sách của thư viện đang trong tình trạng mượn quá hạn 14 ngày.
CREATE PROCEDURE sp_ThongtinNguoilonQuahan
AS
BEGIN
    SELECT
        *
    FROM
        DocGia dg
    JOIN
        NguoiLon nl ON dg.Ma_DocGia = nl.Ma_DocGia
    JOIN
        Muon mu ON dg.Ma_DocGia = mu.Ma_DocGia
    JOIN
        QuaTrinhMuon ds ON mu.ISBN = ds.ISBN AND mu.Ma_CuonSach = ds.Ma_CuonSach
    WHERE
        ds.NgayHetHan < GETDATE() AND DATEDIFF(day, ds.NgayHetHan, GETDATE()) > 14
    ORDER BY
        dg.Ma_DocGia;
END;

-- 4.5/ Liệt kê những độc giả người lớn đang mượn sách có trẻ em cũng đang mượn sách:
-- Tên: sp_DocGiaCoTreEmMuon
-- Nội dung: Liệt kê những những độc giả đang trong tình trạng mượn sách và những trẻ em độc giả này đang bảo lãnh cũng đang trong tình trạng mượn sách
CREATE PROCEDURE sp_DocGiaCoTreEmMuon
AS
BEGIN
    SELECT DISTINCT
        dg.Ma_DocGia AS Ma_DocGiaNguoiLon,
        dg.Ho AS HoNguoiLon,
        dg.TenLot AS TenLotNguoiLon,
        dg.Ten AS TenNguoiLon,
        dg.NgaySinh AS NgaySinhNguoiLon,
        te.Ma_DocGia AS Ma_DocGiaTreEm,
        te.Ho AS HoTreEm,
        te.TenLot AS TenLotTreEm,
        te.Ten AS TenTreEm,
        te.NgaySinh AS NgaySinhTreEm
    FROM
        DocGia dg
    JOIN
        NguoiLon nl ON dg.Ma_DocGia = nl.Ma_DocGia
    JOIN
        TreEm t ON dg.Ma_DocGia = t.Ma_DocGia_NguoiLon
    JOIN
        DocGia te ON t.Ma_DocGia = te.Ma_DocGia
    JOIN
        Muon m ON dg.Ma_DocGia = m.Ma_DocGia OR te.Ma_DocGia = m.Ma_DocGia
    ORDER BY
        dg.Ma_DocGia, te.Ma_DocGia;
END;



-- Chương 6 - bài 4.6: Cập nhật trạng thái của đầu sách
-- Tên: sp_CapnhatTrangthaiDausach
-- Nội dung: Cập nhật trạng thái của một đầu sách cụ thể tương ứng với ISBN: nếu đầu sách không còn cuốn sách nào trong thư viện thì tình trạng là no; nếu đầu sách còn một quyển sách trở lên thì tình trạng là yes.
CREATE PROCEDURE sp_CapnhatTrangthaiDausach
    @ISBN INT
AS
BEGIN
    DECLARE @SoCuon INT;
    SELECT @SoCuon = COUNT(*)
    FROM CuonSach
    WHERE ISBN = @ISBN;
    IF @SoCuon = 0
    BEGIN
        UPDATE DauSach
        SET TrangThai = 'no'
        WHERE ISBN = @ISBN;
    END
    ELSE
    BEGIN
        UPDATE DauSach
        SET TrangThai = 'yes'
        WHERE ISBN = @ISBN;
    END
END;


-- Chương 6 Bài 4.7: Thêm tựa sách mới:
CREATE PROCEDURE sp_ThemTuaSach
    @TuaSach NVARCHAR(150),
    @TacGia NVARCHAR(150),
    @TomTat NVARCHAR(200)
AS
BEGIN
    -- [1] Xác định mã tựa sách sẽ cấp cho tựa sách này thỏa quy định QĐ-1.
    DECLARE @Ma_TuaSach INT;
    SELECT @Ma_TuaSach = ISNULL(MAX(Ma_TuaSach), 0) + 1 FROM TuaSach;

    -- [2] Kiểm tra phải có ít nhất 1 trong 3 thuộc tính tựa sách, tác giả, tóm tắt khác với các bộ trong bảng tựa sách đã có.
    IF NOT EXISTS (
        SELECT 1
        FROM TuaSach
        WHERE TuaSach = @TuaSach AND TacGia = @TacGia AND TomTat = @TomTat
    )
    BEGIN
        -- [3] Nếu thỏa điều kiện này thì:
        -- [3.1] Thêm vào tựa sách.
        INSERT INTO TuaSach (Ma_TuaSach, TuaSach, TacGia, TomTat)
        VALUES (@Ma_TuaSach, @TuaSach, @TacGia, @TomTat);
        PRINT 'Thêm tựa sách thành công.';
    END
    ELSE
    BEGIN
        -- [4] Nếu không thỏa điều kiện thì:
        -- [4.1] Thông báo lỗi.
        PRINT 'Tựa sách đã tồn tại trong hệ thống.';
    END
END;

-- 4.8/ Thêm cuốn sách mới:
-- Tên: sp ThemCuonSach
-- Nội dung: Thêm cuốn sách vào hệ thống với điều kiện phải bảo đảm quy định QĐ-2 được tuân thủ. Và phải cập nhật trạng thái của đầu sách.
CREATE PROCEDURE sp_ThemCuonSach
    @ISBN VARCHAR(20),
    @TinhTrang NVARCHAR(50)
AS
BEGIN
    -- [1] Kiểm tra mã isbn nếu không tồn tại thì thông báo & return.
    IF NOT EXISTS (
        SELECT 1
        FROM DauSach
        WHERE ISBN = @ISBN
    )
    BEGIN
        PRINT 'Mã ISBN không tồn tại.';
        RETURN;
    END

    -- [2] Xác định mã cuốn sách sẽ cấp cho cuốn sách này thỏa quy định QĐ-2.
    DECLARE @Ma_CuonSach INT;
    SELECT @Ma_CuonSach = ISNULL(MAX(Ma_CuonSach), 0) + 1 FROM CuonSach;

    -- [3] Thêm cuốn sách mới với mã cuốn sách đã xác định và tình trạng là yes.
    INSERT INTO CuonSach (ISBN, Ma_CuonSach, TinhTrang)
    VALUES (@ISBN, @Ma_CuonSach, @TinhTrang);

    -- [4] Thay đổi trạng thái của đầu sách là yes
    UPDATE DauSach
    SET TrangThai = 'Yes'
    WHERE ISBN = @ISBN;

    PRINT 'Thêm cuốn sách mới thành công.';
END;


-- Bai4.9: Thêm độc giả người lớn:
CREATE PROCEDURE sp_ThemNguoiLon
    @Ho NVARCHAR(20),
    @TenLot NVARCHAR(200),
    @Ten NVARCHAR(10),
    @NgaySinh DATE,
    @SoNha NVARCHAR(20),
    @Duong NVARCHAR(30),
    @Quan NVARCHAR(20),
    @DienThoai NVARCHAR(20),
    @HanSuDung DATE
AS
BEGIN
    -- [1] Xác định mã độc giả sẽ cấp cho độc giả người lớn này thỏa quy định QĐ-2.
    DECLARE @Ma_DocGia INT;
    SELECT @Ma_DocGia = ISNULL(MAX(Ma_DocGia), 0) + 1 FROM DocGia;

    -- [2] Thêm một bộ dữ liệu vào bảng độc giả.
    INSERT INTO DocGia (Ma_DocGia, Ho, TenLot, Ten, NgaySinh)
    VALUES (@Ma_DocGia, @Ho, @TenLot, @Ten, @NgaySinh);

    -- [3] Kiểm tra tuổi của độc giả này có đủ 18 tuổi.
    IF DATEDIFF(YEAR, @NgaySinh, GETDATE()) < 18
    BEGIN
        -- [4] Nếu không đủ tuổi :
        -- [4.1] Thông báo lỗi.
        PRINT 'Độc giả chưa đủ tuổi để được đăng ký.';
        -- [4.2] Chấm dứt stored procedure.
        RETURN;
    END
    ELSE
    BEGIN
        -- [5] Nếu đủ tuổi thì:
        -- [5.1] Thêm một bộ dữ liệu vào bảng người lớn.
        INSERT INTO NguoiLon (Ma_DocGia, SoNha, Duong, Quan, DienThoai, HanSuDung)
        VALUES (@Ma_DocGia, @SoNha, @Duong, @Quan, @DienThoai, @HanSuDung);
        PRINT 'Thêm độc giả người lớn thành công.';
    END
END;

-- Bài4.10 : Thêm Độc Giả Trẻ Em:
CREATE PROCEDURE sp_ThemTreEm
    @Ho NVARCHAR(20),
    @TenLot NVARCHAR(200),
    @Ten NVARCHAR(10),
    @NgaySinh DATE,
    @Ma_DocGia_NguoiLon INT
AS
BEGIN
    -- [1] Xác định mã độc giả sẽ cấp cho độc giả trẻ em này thỏa quy định QĐ-2.
    DECLARE @Ma_DocGia INT;
    SELECT @Ma_DocGia = ISNULL(MAX(Ma_DocGia), 0) + 1 FROM DocGia;

    -- [2] Thêm một bộ dữ liệu vào bảng độc giả.
    INSERT INTO DocGia (Ma_DocGia, Ho, TenLot, Ten, NgaySinh)
    VALUES (@Ma_DocGia, @Ho, @TenLot, @Ten, @NgaySinh);

    -- [3] Đếm số trẻ em của độc giả người lớn bảo lãnh trẻ em mới này.
    DECLARE @SoTreEm INT;
    SELECT @SoTreEm = COUNT(*) FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia_NguoiLon;

    -- [4] Kiểm tra, nếu không thỏa quy định QĐ-3 thì:
    IF @SoTreEm >= 3
    BEGIN
        -- [4.1] Thông báo lỗi.
        PRINT 'Độc giả người lớn đã bảo lãnh quá số trẻ em cho phép.';
        -- [4.2] Chấm dứt stored procedure.
        RETURN;
    END
    ELSE
    BEGIN
        -- [5] Nếu thỏa quy định QĐ-3 thì:
        -- [5.1] Thêm một bộ dữ liệu vào bảng trẻ em.
        INSERT INTO TreEm (Ma_DocGia, Ma_DocGia_NguoiLon)
        VALUES (@Ma_DocGia, @Ma_DocGia_NguoiLon);
        PRINT 'Thêm độc giả trẻ em thành công.';
    END
END;

-- 4.11: Xóa đọc giả
CREATE PROCEDURE sp_XoaDocGia
    @Ma_DocGia INT
AS
BEGIN
    -- [1] Kiểm tra xem độc giả có tồn tại hay không.
    IF NOT EXISTS (SELECT 1 FROM DocGia WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT 'Không tồn tại độc giả với mã số này.';
        RETURN;
    END

    -- [2] Kiểm tra độc giả có đang mượn sách hay không.
    IF EXISTS (SELECT 1 FROM Muon WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        PRINT 'Độc giả đang mượn sách, không thể xóa.';
        RETURN;
    END

    -- [3] Kiểm tra độc giả này là độc giả người lớn hay trẻ em.
    IF EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia)
    BEGIN
        -- [3.1] Nếu độc giả là người lớn.
        DECLARE @BaoLanhTreEm BIT;
        SELECT @BaoLanhTreEm = COUNT(*) FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia;

        IF @BaoLanhTreEm = 0
        BEGIN
            -- [3.1.3.1] Xóa trong bảng NguoiLon, QuaTrinhMuon, DangKy, sau cùng là xóa trong bảng DocGia.
            BEGIN TRANSACTION;
            DELETE FROM QuaTrinhMuon WHERE Ma_DocGia = @Ma_DocGia;
            DELETE FROM DangKy WHERE Ma_DocGia = @Ma_DocGia;
            DELETE FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia;
            DELETE FROM DocGia WHERE Ma_DocGia = @Ma_DocGia;
            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- [3.1.3] Nếu độc giả này có bảo lãnh trẻ em.
            PRINT 'Không thể xóa người lớn vì trẻ em mà người lớn này bảo lãnh vẫn đang mượn sách.';
            RETURN;
        END
    END
    ELSE
    BEGIN
        -- [3.2] Nếu độc giả là trẻ em.
        -- [3.2.1] Xóa trong bảng TreEm, QuaTrinhMuon, DangKy, sau cùng là xóa trong bảng DocGia.
        BEGIN TRANSACTION;
        DELETE FROM QuaTrinhMuon WHERE Ma_DocGia = @Ma_DocGia;
        DELETE FROM DangKy WHERE Ma_DocGia = @Ma_DocGia;
        DELETE FROM TreEm WHERE Ma_DocGia = @Ma_DocGia;
        DELETE FROM DocGia WHERE Ma_DocGia = @Ma_DocGia;
        COMMIT TRANSACTION;
    END
    PRINT 'Đã xóa độc giả thành công.';
END;


-- 4.13: Mượn sách
CREATE PROCEDURE sp_MuonSach
    @Ma_DocGia INT,
    @ISBN VARCHAR(20),
    @Ma_CuonSach INT
AS
BEGIN
    -- [1] Kiểm tra độc giả có đang mượn quyển sách cùng loại không?
    IF EXISTS (
        SELECT 1
        FROM Muon
        WHERE Ma_DocGia = @Ma_DocGia AND ISBN = @ISBN
    )
    BEGIN
        -- [1.1] Báo lỗi
        PRINT 'Độc giả đã mượn quyển sách cùng loại này.';
        RETURN;
    END

    -- [2] Kiểm tra số lượng sách độc giả đang mượn
    DECLARE @SoLuongSachDangMuon INT;
    DECLARE @IsNguoiLon BIT;

    SELECT @IsNguoiLon = CASE WHEN EXISTS (SELECT 1 FROM NguoiLon WHERE Ma_DocGia = @Ma_DocGia) THEN 1 ELSE 0 END;

    IF @IsNguoiLon = 1
    BEGIN
        -- [2.1] Kiểm tra Nếu là người lớn
        SELECT @SoLuongSachDangMuon = COUNT(*)
        FROM Muon
        WHERE Ma_DocGia = @Ma_DocGia;

        IF @SoLuongSachDangMuon >= 5
        BEGIN
            -- [2.1.1] Báo lỗi
            PRINT 'Độc giả người lớn đã mượn đủ 5 cuốn sách.';
            RETURN;
        END
    END
    ELSE
    BEGIN
        -- [2.2] Nếu là trẻ em
        SELECT @SoLuongSachDangMuon = COUNT(*)
        FROM Muon
        WHERE Ma_DocGia = @Ma_DocGia;

        IF @SoLuongSachDangMuon >= 1
        BEGIN
            -- [2.2.1] Báo lỗi
            PRINT 'Độc giả trẻ em đã mượn đủ 1 cuốn sách.';
            RETURN;
        END
    END

    -- [3] Kiểm tra có còn sách trong thư viện không?
    IF EXISTS (
        SELECT 1
        FROM CuonSach
        WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach AND TinhTrang = N'Bình Thường'
    )
    BEGIN
        -- [3.1] Nếu còn:
        -- [3.1.1] Thêm một record vào bảng mượn
        INSERT INTO Muon (ISBN, Ma_CuonSach, Ma_DocGia, NgayMuon, NgayHetHan)
        VALUES (@ISBN, @Ma_CuonSach, @Ma_DocGia, GETDATE(), DATEADD(DAY, 30, GETDATE()));

        -- [3.1.2] Cập nhật tình trạng cuốn sách
        UPDATE CuonSach
        SET TinhTrang = N'Đang Mượn'
        WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach;

        -- [3.1.3] Cập nhật trạng thái đầu sách
        UPDATE DauSach
        SET TrangThai = N'Đang Mượn'
        WHERE ISBN = @ISBN;

        -- [3.1.4] Thông báo mượn sách thành công
        PRINT 'Mượn sách thành công.';
    END
    ELSE
    BEGIN
        -- [3.2] Nếu không còn
        -- [3.2.1] Thêm một record vào bảng DangKy
        INSERT INTO DangKy (ISBN, Ma_DocGia, NgayDK, GhiChu)
        VALUES (@ISBN, @Ma_DocGia, GETDATE(), N'Chờ mượn sách.');

        -- [3.2.2] Thông báo cho độc giả chờ
        PRINT 'Sách đã hết trong thư viện, bạn được chờ mượn.';
    END
END;


-- 4.14: Trả Sách:
CREATE PROCEDURE sp_TraSach
    @ISBN VARCHAR(20),
    @Ma_CuonSach INT,
    @Ma_DocGia INT,
    @NgayTra DATE
AS
BEGIN
    DECLARE @NgayHetHan DATE;
    DECLARE @SoNgayTreHan INT;
    DECLARE @TienPhat DECIMAL(10,2);

    -- [1] Xác định tiền phạt nếu trả quá hạn ( = 1000 * số ngày trễ hạn)
    SELECT @NgayHetHan = NgayHetHan
    FROM Muon
    WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach AND Ma_DocGia = @Ma_DocGia;

    SET @SoNgayTreHan = DATEDIFF(DAY, @NgayHetHan, @NgayTra);

    IF @SoNgayTreHan > 0
    BEGIN
        SET @TienPhat = @SoNgayTreHan * 1000;
        PRINT CONCAT('Tiền phạt: ', @TienPhat);
    END
    ELSE
    BEGIN
        SET @TienPhat = 0;
    END

    -- [2] Thêm vào bảng quá trình mượn.
    INSERT INTO QuaTrinhMuon (ISBN, Ma_CuonSach, NgayMuon, Ma_DocGia, NgayHetHan, NgayTra, TienMuon, TienDaTra, TienDatCoc, GhiChu)
    VALUES (@ISBN, @Ma_CuonSach, NULL, @Ma_DocGia, @NgayHetHan, @NgayTra, @TienPhat, 0, 0, N'Trả sách');

    -- [3] Xóa dữ liệu trong bảng mượn.
    DELETE FROM Muon
    WHERE ISBN = @ISBN AND Ma_CuonSach = @Ma_CuonSach AND Ma_DocGia = @Ma_DocGia;

    PRINT 'Trả sách thành công.';
END;


-- 4.15: Tạo trigger
-- a. Trigger tg_delMuon:
CREATE TRIGGER tg_delMuon
ON Muon
AFTER DELETE
AS
BEGIN
    UPDATE CuonSach
    SET TinhTrang = 'yes'
    FROM CuonSach cs
    INNER JOIN deleted d ON cs.ISBN = d.ISBN AND cs.Ma_CuonSach = d.Ma_CuonSach;
END;

-- b. Trigger tg_insMuon:
CREATE TRIGGER tg_insMuon
ON Muon
AFTER INSERT
AS
BEGIN
    UPDATE CuonSach
    SET TinhTrang = 'no'
    FROM CuonSach cs
    INNER JOIN inserted i ON cs.ISBN = i.ISBN AND cs.Ma_CuonSach = i.Ma_CuonSach;
END;

-- c. Trigger tg_updCuonSach:
CREATE TRIGGER tg_updCuonSach
ON CuonSach
AFTER UPDATE
AS
BEGIN
    UPDATE DauSach
    SET TrangThai = i.TinhTrang
    FROM DauSach ds
    INNER JOIN inserted i ON ds.ISBN = i.ISBN;
END;

-- d. Trigger Tg_themmoi:
CREATE TRIGGER Tg_themmoi
ON TuaSach
AFTER INSERT, UPDATE
AS
BEGIN
    PRINT 'Đã thêm mới';
END;

-- e. Trigger Tg_suathongtin:
CREATE TRIGGER Tg_suathongtin
ON TuaSach
AFTER UPDATE
AS
BEGIN
    DECLARE @Ma_TuaSach INT;
    DECLARE @TacGiaCu NVARCHAR(150);
    DECLARE @TacGiaMoi NVARCHAR(150);

    DECLARE cur CURSOR FOR
    SELECT i.Ma_TuaSach, d.TacGia, i.TacGia
    FROM inserted i
    INNER JOIN deleted d ON i.Ma_TuaSach = d.Ma_TuaSach;

    OPEN cur;
    FETCH NEXT FROM cur INTO @Ma_TuaSach, @TacGiaCu, @TacGiaMoi;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Vừa sửa thông tin của tựa sách có mã số ' + CAST(@Ma_TuaSach AS NVARCHAR(10)) + ' từ tác giả ' + @TacGiaCu + ' sang tác giả ' + @TacGiaMoi;
        FETCH NEXT FROM cur INTO @Ma_TuaSach, @TacGiaCu, @TacGiaMoi;
    END;
    CLOSE cur;
    DEALLOCATE cur;
END;


-- 4.16: Tg_themtuasach
CREATE PROCEDURE Tg_themtuasach
    @TuaSach NVARCHAR(150),
    @TacGia NVARCHAR(150),
    @TomTat NVARCHAR(200)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM TuaSach
        WHERE TuaSach = @TuaSach
    )
    BEGIN
        -- Nếu tựa sách trùng tên đã tồn tại, thông báo và không cho phép insert.
        PRINT 'Tựa sách đã tồn tại trong hệ thống.';
    END
    ELSE
    BEGIN
        -- Nếu tựa sách không trùng tên, cho phép insert.
        INSERT INTO TuaSach (TuaSach, TacGia, TomTat)
        VALUES (@TuaSach, @TacGia, @TomTat);
        PRINT 'Thêm tựa sách thành công.';
    END
END;
