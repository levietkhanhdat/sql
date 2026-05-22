-- TẠO THÊM CỘT HỌ TÊN
ALTER TABLE nhanvien
ADD [Ho Ten] AS (HoNV + ' ' + ISNULL(Dem + ' ', '') + TenNV);


--1. Cho biết mã số, họ tên, ngày sinh của các nhân viên phòng số 4. 
SELECT 
      manv,
      honv+
      CASE 
          WHEN Dem IS NULL THEN ' '
          ELSE ' ' + Dem +' ' 
      END +
      TenNV AS 'Ho Ten',
      ngaysinh
FROM nhanvien
WHERE mapb=4


--2. Tìm những nhân viên có mức lương trên 30,000. 
SELECT 
   *
FROM 
    nhanvien
WHERE 
   luong>30000

--3. Tìm những nhân viên có mức lương trên 25,000 ở phòng số 4 hoặc có mức lương trên 30,000 ở phòng số 5. 
SELECT 
    *
FROM 
    nhanvien
WHERE 
    (luong>25000 AND mapb=4) 
     OR ( luong>30000 AND  mapb=5)

--4. Cho biết họ tên, ngày sinh, địa chỉ của các nhân viên ở TpHCM. 
SELECT 
    CONCAT_WS(' ', honv,dem,tennv) AS hoten,
    ngaysinh,
    diachi
FROM 
    nhanvien
WHERE 
    diachi LIKE '%TpHCM';


--5. Cho biết ngày sinh, địa chỉ của nhân viên có tên là “Nguyen Bao Hung”. 
SELECT 
     NgaySinh ,
     Diachi
FROM 
    nhanvien
WHERE 
    HoNV + ' ' + ISNULL(Dem + ' ', '') + TenNV LIKE 'Nguyen Bao Hung';


--6. Tìm những nhân viên có địa chỉ thuộc quận “Phu Nhuan”. 
SELECT 
      *
FROM 
     nhanvien
WHERE DiaChi Like '%Phu Nhuan%';


--7. Tìm những nhân viên sinh vào thập niên 1950. 
SELECT 
     *
FROM 
    nhanvien
WHERE 
    YEAR(Ngaysinh) BETWEEN 1950 AND 1959


--8. Cho biết các mức lương riêng biệt của các nhân viên. 
SELECT 
    DISTINCT Luong
FROM 
    nhanvien;


--9. Tìm những nhân viên không có người giám sát. 
SELECT 
     *
FROM 
    nhanvien
WHERE 
    MaGS IS NULL


--10. Với mỗi phòng ban, cho biết tên phòng ban và trụ sở của phòng.
SELECT 
    TenPB,
    TruSo
FROM 
    phongban AS pb
    LEFT JOIN truso_phong AS trp
    ON PB.MaPB=TRP.MaPB;


--11. Với mỗi phòng ban, cho biết tên phòng ban và tên người trưởng phòng. 
SELECT 
    TenPB,
    HoNV + ' ' + ISNULL(Dem + ' ', '') + TenNV AS 'ho ten'
FROM 
    phongban AS pb
    LEFT JOIN nhanvien AS nv
    ON PB.MaQL=nv.MaNV;

--12. Với mỗi nữ nhân viên, cho biết họ tên và tên người thân của nhân viên đó.
SELECT
     HoNV + ' ' + ISNULL(Dem + ' ', '') + TenNV AS 'ho ten',
     Tentn
FROM 
    nhanvien AS nv
    LEFT JOIN thannhan AS tn
    ON nv.manv=tn.manv
WHERE 
    nv.gioitinh IN ('F' , 'f');
--13. Tìm tên và địa chỉ của các nhân viên làm việc trong phòng “Nghien cuu”. 
SELECT 
    HoNV + ' ' + ISNULL(Dem + ' ', '') + TenNV AS 'ho ten',
    Diachi
FROM 
    phongban AS pb
    JOIN nhanvien AS nv
    ON PB.Mapb=nv.Mapb
WHERE 
    TenPB='Nghien cuu';

--14. Cho biết mã dự án, tên phòng điều phối và họ tên, địa chỉ, ngày sinh của 
--người trưởng phòng điều phối của các dự án có địa điểm là “Go Vap”.
SELECT 
    Mada,
    tenpb,
    honv + ' ' + ISNULL(dem +' ' ,'') + tennv AS 'HO TEN',
    nv.diachi,
    ngaysinh
FROM 
    Duan AS d
    join phongban AS pb
    ON d.Mapb=pb.mapb
    join nhanvien AS nv
    on pb.maql=nv.manv
WHERE d.diadiem Like '%Go Vap%';


--15. Với mỗi nhân viên, cho biết họ tên của nhân viên và họ tên của người giám 
--sát nhân viên đó. 
SELECT 
     nv1.honv + ' ' + ISNULL(nv1.dem +' ' ,'') + nv1.tennv AS 'HO TEN nv',
     nv2.honv + ' ' + ISNULL(nv2.dem +' ' ,'') + nv2.tennv AS 'HO TEN giam sat'
FROM 
    nhanvien AS nv1
    LEFT JOIN nhanvien AS nv2
    ON NV1.mags = nv2.manv
--16. Cho biết kết quả lương mới của các nhân viên tham gia dự án “San pham 
--X” nếu như họ được tăng thêm 10% lương. 

SELECT 
    honv + ' ' + ISNULL(dem +' ' ,'') + tennv AS 'HO TEN',
    Luong * 110/100 AS 'LUONG MOI'
FROM 
   nhanvien AS nv
   JOIN thamgia AS tg
   ON nv.manv=tg.manv
   JOIN DUAN AS d
   ON d.mada=tg.mada
WHERE tenda='San pham X';
--17. Cho biết họ tên của nhân viên có người thân cùng tên và cùng giới tính với 
--nhân viên đó. 
SELECT 
    honv + ' ' + ISNULL(dem +' ' ,'') + tennv AS 'HO TEN'
FROM 
    nhanvien AS nv
    JOIN thannhan AS tn
    ON nv.manv=tn.manv
WHERE 
    nv.tennv=tn.tentn
    AND nv.gioitinh=tn.gioitinh;