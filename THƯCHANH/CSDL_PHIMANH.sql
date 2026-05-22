-- Kịch bản tạo cơ sở dữ liệu Phim Ảnh
CREATE DATABASE csdl_phimanh;
GO

USE csdl_phimanh;
GO

-- CREATE TABLE theloai
CREATE TABLE theloai (
	matl			INT				NOT NULL,
	tentl			VARCHAR(15) 	NOT NULL,
	CONSTRAINT KC_THELOAI 
	    PRIMARY KEY (matl)
);

-- CREATE TABLE phim
CREATE TABLE phim (
	maphim			INT				NOT NULL,
	tenphim			VARCHAR(50) 	NOT NULL,
	daodien			VARCHAR(50) 	NOT NULL,
	nam_congchieu	INT				NOT NULL,
	matl			INT				NOT NULL,
	thoiluong		INT				NOT NULL,
	doanhthu		DECIMAL(8,3) 	NOT NULL,
	CONSTRAINT KC_PHIM 
	    PRIMARY KEY (maphim)
);

-- CREATE TABLE dienvien
CREATE TABLE dienvien (
	madv			INT				NOT NULL,
	nghedanh		VARCHAR(50) 	NOT NULL,
	tenthat			VARCHAR(50) 	NOT NULL,
	gioitinh		CHAR			NOT NULL CHECK (gioitinh IN ('m','f','F','M')),
	ngaysinh		DATE			NOT NULL,
	CONSTRAINT KC_DIENVIEN 
	    PRIMARY KEY (madv)
);

-- CREATE TABLE vaidien
CREATE TABLE vaidien (
	manv			INT				NOT NULL,
	maphim			INT				NOT NULL,
	nhanvat			VARCHAR(20) 	NOT NULL,
	madv			INT				NOT NULL,
	CONSTRAINT KC_VAIDIEN 
	    PRIMARY KEY (manv)
);

-- THIET LAP KHOA NGOAI
ALTER TABLE PHIM 
    ADD CONSTRAINT KN_PHIM_THELOAI 
        FOREIGN KEY (matl) REFERENCES THELOAI(matl);

ALTER TABLE VAIDIEN 
    ADD CONSTRAINT KN_VAIDIEN_PHIM 
        FOREIGN KEY (maphim) REFERENCES PHIM(maphim);

ALTER TABLE VAIDIEN 
    ADD CONSTRAINT KN_VAI_DIEN_DIENVIEN 
        FOREIGN KEY (madv) REFERENCES DIENVIEN(madv);

-- NHAP DU LIEU
ALTER TABLE PHIM NOCHECK CONSTRAINT ALL;
ALTER TABLE DIENVIEN NOCHECK CONSTRAINT ALL;

INSERT INTO THELOAI 
VALUES 
	(1, 'Hanh dong'),
	(2, 'Lich su'),
	(3, 'Hai huoc');

INSERT INTO PHIM 
VALUES 
	(101, 'Hai Phuong', 'Le Van Kiet', 2019, 1, 98, 237.029),
	(102, 'Dia dao: Mat troi trong bong toi', 'Bui Thac Chuyen', 2025, 2, 128, 72.6),
	(103, 'Cua lai vo bau', 'Nhat Trung', 2019, 3, 100, 191.8);

INSERT INTO DIENVIEN 
VALUES 
	(201, 'Veronica Ngo', 'Ngo Thanh Van', 'F', '1979-02-26'),
	(202, 'Thai Hoa', 'Ho Thai Hoa', 'M', '1974-08-10'),
	(203, 'Tran Thanh', 'Huynh Tran Thanh', 'M', '1987-02-05'),
	(204, 'Ninh Duong Lan Ngoc', 'Ninh Duong Lan Ngoc', 'F', '1990-04-04');

INSERT INTO VAIDIEN 
VALUES 
	(111, 101, 'Hai phuong', 201),
	(112, 102, 'Bay Theo', 202),
	(113, 103, 'Trong Thoai', 203),
	(114, 103, 'Nha Linh', 204);

ALTER TABLE PHIM CHECK CONSTRAINT ALL;
ALTER TABLE DIENVIEN CHECK CONSTRAINT ALL;

-- 3.1 Cập nhật doanh thu phim
UPDATE PHIM
SET 
	doanhthu = 81
WHERE 
	tenphim = 'Dia dao: Mat troi trong bong toi';

-- 3.2 Xóa nhân vật có mã 114
DELETE FROM 
	vaidien
WHERE 
	manv = 114;