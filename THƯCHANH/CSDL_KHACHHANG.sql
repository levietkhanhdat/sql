-- MSSV: 24280085
-- Họ và tên: Võ Hoàng Nam
-- DBMS: SQL Server
-- Scripts to create database schema
CREATE DATABASE csdl_khachhang;
GO 
USE csdl_khachhang;

-- CREATE TABLE sieuthi
CREATE TABLE sieuthi (
	mast			INT				NOT NULL,
	tenst			VARCHAR(50) 	NOT NULL,
	diadiem			VARCHAR(100)	NOT NULL,
	CONSTRAINT PK_sieuthi 
	    PRIMARY KEY (mast),
	CONSTRAINT AK_sieuthi_tenst 
	    UNIQUE (tenst)
);

-- CREATE TABLE thanhvien
CREATE TABLE thanhvien (
	matv			INT				NOT NULL,
	madinhdanh		CHAR(12) 		NOT NULL,
	hoten			VARCHAR(50) 	NOT NULL,
	ngaysinh		DATE			NOT NULL,
	gioitinh		CHAR			CHECK (gioitinh IN ('0', '1')) NOT NULL,
	diachi			VARCHAR(100)	NOT NULL,
	sodt			CHAR(10)		NOT NULL,
	CONSTRAINT PK_thanhvien 
	    PRIMARY KEY (matv),
	CONSTRAINT AK_thanhvien_sodt 
	    UNIQUE (sodt)
);

-- CREATE TABLE thetv
CREATE TABLE thetv (
	mathe			INT				NOT NULL,
	mast			INT				NOT NULL,
	matv			INT				NOT NULL,
	hangtv			INT				CHECK (hangtv IN (0, 1, 2, 3)) NOT NULL,
	ngaycap			DATE			NOT NULL,
	ngayhethan		DATE			NOT NULL,
	CONSTRAINT PK_thetv 
	    PRIMARY KEY (mathe)
);

-- CREATE TABLE diemtv
CREATE TABLE diemtv (
	mathe			INT				NOT NULL,
	kydiem			INT				NOT NULL,
	diemtichluy		INT				DEFAULT 0 NOT NULL,
	CONSTRAINT PK_diemtv 
	    PRIMARY KEY (mathe, kydiem)
);

-- Add referential constraints for thetv
ALTER TABLE thetv
    ADD CONSTRAINT FK_thetv_sieuthi 
        FOREIGN KEY (mast) REFERENCES sieuthi (mast);

ALTER TABLE thetv
    ADD CONSTRAINT FK_thetv_thanhvien 
        FOREIGN KEY (matv) REFERENCES thanhvien (matv);

-- Add referential constraints for diemtv
ALTER TABLE diemtv
    ADD CONSTRAINT FK_diemtv_thetv 
        FOREIGN KEY (mathe) REFERENCES thetv (mathe);

-- INSERT tuples INTO sieuthi
INSERT INTO sieuthi 
VALUES (1, 'COOP Ly Thuong Kiet', '497 Hoa Hao, P. 7, Q. 10, Tp. Ho Chi Minh'),
	   (2, 'COOP Cong Quynh', '189C Cong Quynh, P. Nguyen Cu Trinh, Q. 1, Tp. Ho Chi Minh'),
	   (3, 'COOP Phu My Hung', 'KDC My Phuoc Nguyen Van Linh, P. Tan Phong, Q. 7, Tp. Ho Chi Minh');

-- INSERT tuples INTO thanhvien
INSERT INTO thanhvien 
VALUES (1, '052888665555', 'Nguyen Thi Ngoc', '1972-11-10', '0', '127 Nguyen Van Cu, P. 4, Q. 5, Tp. Ho Chi Minh', '0902493592'),
	   (2, '0123456789', 'Nguyen Van Hung', '1982-05-15', '1', '159 Tran Hung Đao, Q. 5, Tp. Ho Chi Minh', '0903666545');

-- INSERT tuples INTO thetv
INSERT INTO thetv 
VALUES (1, 1, 1, 0, '2011-04-19', '2014-04-19'),
	   (2, 2, 2, 2, '2012-07-25', '2015-07-25');

-- INSERT tuples INTO diemtv
INSERT INTO diemtv 
VALUES (1, 2013, 38),
	   (2, 2013, 36);

--3.1 - Cập nhật lại ngày cấp thẻ thành viên là ngày hiện tại và ngày hết hạn là sau 3 năm kể từ ngày cấp cho tất cả các thẻ thành viên.
UPDATE
	thetv
SET
	ngaycap = GETDATE(),
	ngayhethan = DATEADD(year, 3, GETDATE());

--3.2 - Xóa điểm tích lũy của tất cả thẻ thành viên trong kỳ điểm 2013.
DELETE
FROM
	diemtv
WHERE
	kydiem = 2013;