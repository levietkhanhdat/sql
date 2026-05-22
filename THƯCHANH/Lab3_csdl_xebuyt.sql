USE csdl_xebuyt;
GO
--1.Cho biết mã số tuyến, tên tuyến, cự ly, tên đơn vị vận hành của các tuyến xe buýt có cự ly lớn hơn 20,000m.
SELECT 
    MaTB,
    TenTuyen,
    Culy,
    TenDonVi
FROM 
    TUYENBUYT AS TB
    JOIN DVVANHANH AS DV
    ON TB.MaDV=DV.MaDV
WHERE 
    TB.CuLy >20000;


--2.Với mỗi trạm dừng ở đường Hàm Nghi, Quận 1, cho biết mã số trạm, tên trạm và mã số các tuyến xe buýt có lộ trình qua trạm đó. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT 
    TD.MaTD,
    TD.TenTram,
    LT.MaTB
FROM 
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
WHERE 
    DiaDiem like '%HAM NGHI, QUAN 1';


--3.Cho biết mã số trạm, tên trạm, loại của các trạm dừng ở Quận 12 thuộc lộ trình của các tuyến xe buýt số 3. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT 
    TD.MaTD,
    TD.TenTram,
    TD.Loai
FROM 
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
WHERE 
    DiaDiem like '%QUAN 12'
    AND LT.MaTB=3;


--4.Cho biết mã số trạm, tên trạm, loại của các trạm dừng khởi hành của các tuyến xe buýt.
SELECT 
    TD.MaTD,
    TD.TenTram,
    TD.Loai
FROM 
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
    JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
WHERE 
	LT.thututram=1;


--5.Cho biết tên mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Chợ Cũ ở Quận 1. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT 
    TB.MaTB,
    TB.TenTuyen
FROM
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
    RIGHT JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
WHERE 
    Tentram like 'Cho Cu'
    AND DiaDiem like '%QUAN 1';


--6.Cho biết tên đơn vị vận hành có tuyến xe buýt có lộ trình đi qua trạm dừng có mã số 53.
SELECT
    TenDonVi
FROM 
    DVVANHANH AS DV
    JOIN TUYENBUYT AS TB
    ON TB.MaDV=DV.MaDV
    JOIN LOTRINH AS LT
    ON TB.MaTB=LT.MaTB
WHERE 
    MaTD=53;



--7.Với các tuyến buýt có số chuyến trong ngày nhỏ hơn 250, cho biết mã số, tên tuyến, cự ly và tên trạm dừng khởi hành.
SELECT 
    TB.MaTB,
    TB.TenTuyen,
    TB.Culy,
    TenTram AS 'TRAM DUNG KHOI HANH'
FROM
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
    RIGHT JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
WHERE 
    SoChuyen<250
    AND ThuTuTram=1;

--8.cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng là bến xe trên đường Phạm Ngũ Lão ở Quận 1. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT
    TB.MaTB,
    TB.TenTuyen
FROM
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
    RIGHT JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
WHERE 
    loai like 'ben xe'
    AND Diadiem like '%Pham Ngu Lao, Quan 1';


--9.Với các tuyến xe buýt do đơn vị HTX Vận tải 19/5 vận hành, cho biết mã số tuyến, tên tuyến, cự ly và lộ trình (số thứ tự trạm dừng, tên trạm, địa điểm). Sắp xếp theo mã số tuyến và số thứ tự trạm. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT
    TB.MaTB,
    TB.TenTuyen,
    TB.CuLy,
    LT.ThuTuTram,
    TD.TenTram,
    TD.DiaDiem
FROM
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
    RIGHT JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
    JOIN DVVANHANH AS DV
    ON DV.MaDV=TB.MaDV
WHERE 
    TenDonVi like 'HTX VAN TAI 19/5'
ORDER BY 
     MaTB,
     ThuTuTram;
    
--10.Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Đền Thờ Ấn Giáo, Pastuer. Sắp xếp kết quả theo mã số tuyến. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT
    TB.MaTB,
    TB.TenTuyen
FROM
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
    RIGHT JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
WHERE 
    TenTram like 'DEN THO AN GIAO, PASTEUR'
ORDER BY
    MaTB;


--11.Với các trạm dừng ở Quận 1, cho biết mã số trạm, tên trạm, địa điểm, và mã số các tuyến xe buýt có lộ trình đi qua trạm đó. Sắp xếp theo tên trạm và mã số tuyến. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT
    TD.MaTD,
    TD.TenTram,
    TD.DiaDiem,
    TB.MaTB
FROM
    TRAMDUNG AS TD
    JOIN LOTRINH AS LT
    ON TD.MaTD=LT.MaTD
    JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
WHERE 
    DiaDiem like '%QUAN 1'
ORDER BY
    TenTram,
    MaTB;

--12.Với mỗi đơn vị vận hành cho biết tên đơn vị và mã số tuyến, cự ly của các tuyến xe buýt có lộ trình đi qua trạm dừng số 36 mà đơn vị đó đảm nhận. Sắp xếp theo tên đơn vị vận hành và mã số tuyến.
SELECT
    DV.tendonvi,
    TB.matb,
    TB.CuLy
FROM
    LOTRINH AS LT
    JOIN TUYENBUYT AS TB
    ON LT.MaTB=TB.MaTB
    JOIN DVVANHANH AS DV
    ON DV.MaDV=TB.MaDV
WHERE 
     LT.MaTD=36
    
ORDER BY 
     tendonvi,
     MaTB;