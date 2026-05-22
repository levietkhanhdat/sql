 --Sửa đổi lại hạn sử dụng của giấy phép lái xe có số 799876543210 thành ngày 5/7/2031.
 USE CSDL_TAXI
 GO
 UPDATE  LAIXE 
 SET HanGP='2031-7-5'
 WHERE SoGP='799876543210'
--Xóa ca làm việc của lái xe có mã số là 2.
DELETE 
FROM CALAMVIEC
WHERE MaLX=2


---Cập nhật đội trưởng cho các đội thi công như sau: công nhân có mã số 138 làm đội trưởng cho đội thi công số 2.
USE CSDL_THI_CONG
GO
UPDATE DOITHICONG
SET DoiTruong=138
WHERE MaDoi=2

---Xóa các ngày chấm công trong tháng 4/2024.
DELETE 
FROM CHAMCONG
WHERE YEAR(NgayLamViec)=2024 and MONTH(NgayLamViec)=4