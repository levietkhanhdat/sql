USE csdl_xebuyt
-- TẤT CẢ PHẢI CÓ PHÉP CHIA 
--13.    Với các đơn vị vận hành có tổng số tuyến xe buýt mà đơn vị đảm nhận nhỏ hơn 2, cho biết tên đơn vị và tổng số tuyến xe buýt tương ứng.
SELECT
      dv.tendonvi,
      COUNT (tb.matb) AS 'TONG SO TUYEN'
FROM dvvanhanh AS dv
LEFT JOIN tuyenbuyt AS tb
ON tb.madv=dv.madv
GROUP BY 
      dv.tendonvi
HAVING COUNT(tb.matb) <2;







--14.    Với các tuyến xe buýt có lộ trình có số trạm dừng nhỏ hơn 40, cho biết mã số, tên tuyến, cự ly và tổng số trạm dừng tương ứng.
SELECT 
    tb.matb, 
    tb.tentuyen, 
    tb.culy, 
    COUNT(lt.matd) AS so_luong_tram
FROM lotrinh AS lt
LEFT JOIN tuyenbuyt AS tb 
ON lt.matb = tb.matb
GROUP BY 
    tb.matb, 
    tb.tentuyen, 
    tb.culy
HAVING COUNT(lt.matd)<40;





--15.    Với các trạm dừng có nhiều hơn 1 tuyến xe buýt có lộ trình đi qua, cho biết mã số, tên trạm và tổng số tuyến xe buýt có lộ trình đi qua trạm.
SELECT
     td.matd,
     td.tentram,
     COUNT(lt.matb) AS 'TONG SO TUYEN'
FROM tramdung AS td
LEFT JOIN lotrinh AS lt
ON lt.matd=td.matd
GROUP BY 
     td.matd,
     td.tentram
HAVING 
     COUNT( lt.matb)>1;
--16.    Với mỗi trạm dừng, cho biết mã số trạm và tổng số tuyến buýt có lộ trình đi qua trạm đó.
SELECT
     matd,
     COUNT(matb) AS 'TONG SO TUYEN'
FROM lotrinh
GROUP BY 
     matd;
 

--17.    Với mỗi lộ trình, cho biết mã số tuyến, loại trạm dừng và tổng số trạm dừng thuộc loại đó.
SELECT
      lt.matb,
      td.loai,
      COUNT (lt.matd) AS 'TONG SO TRAM DUNG'
FROM lotrinh AS lt
LEFT JOIN tramdung AS td
ON lt.matd=td.matd
GROUP BY 
      lt.matb,
      td.loai;
--18.    Với mỗi lộ trình, cho biết mã số tuyến và tổng số trạm dừng thuộc loại Nhà chờ. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
SELECT
      lt.matb,
      td.loai,
      COUNT (lt.matd) AS 'TONG SO TRAM DUNG'
FROM lotrinh AS lt
LEFT JOIN tramdung AS td
ON lt.matd=td.matd
GROUP BY 
      lt.matb,
      td.loai
HAVING td.loai LIKE 'NHA CHO';
--19.    Cho biết các tuyến buýt có cự ly dài nhất.
SELECT *
FROM tuyenbuyt
WHERE culy IN (
              SELECT MAX(culy)
              FROM tuyenbuyt
              )

--20.    Cho biết các trạm dừng có nhiều tuyến buýt đi qua nhất.
WITH tong_tuyen AS (
     SELECT 
          matd,
          COUNT(matb) AS TONG_SO_TUYEN
     FROM lotrinh
     GROUP BY matd
)

SELECT 
       matd,
       TONG_SO_TUYEN
FROM tong_tuyen
WHERE TONG_SO_TUYEN = ( 
       SELECT MAX(TONG_SO_TUYEN) 
       FROM tong_tuyen
);

               
--21.    Cho biết mã số, tên tuyến của tuyến xe buýt có lộ trình nhiều trạm dừng nhất.
WITH TONG_TRAM_DUNG AS (
      SELECT  
            tb.matb,
            tb.tentuyen,
            COUNT (lt.matd) AS 'TONG_TRAM_DUNG'
      FROM tuyenbuyt AS tb
      LEFT JOIN lotrinh AS lt
      ON lt.matb=tb.matb
      GROUP BY 
              tb.matb,
              tb.tentuyen
)

SELECT 
      matb,
      tentuyen,
      TONG_TRAM_DUNG
FROM TONG_TRAM_DUNG
WHERE TONG_TRAM_DUNG = (
                        SELECT MAX (TONG_TRAM_DUNG)
                        FROM TONG_TRAM_DUNG
                        )





--22.    Cho biết mã số, tên đơn vị của đơn vị vận hành đảm nhận nhiều tuyến xe buýt nhất.
WITH count_tb AS (
      SELECT  dv.madv,
              tendonvi,
              COUNT (matb) AS 'TONG_TUYEN_BUYT'
      FROM dvvanhanh AS dv
      LEFT JOIN tuyenbuyt AS tb
      ON tb.madv=dv.madv
      GROUP BY 
               dv.madv,
               tendonvi
)

SELECT *
FROM count_tb
WHERE TONG_TUYEN_BUYT = (
                         SELECT MAX(TONG_TUYEN_BUYT)
                         FROM count_tb
                         )
            
--23.Cho biết các tuyến xe buýt có lộ trình đi qua cả hai trạm dừng có tên là TDH xe buýt Sài Gòn và Công viên 30/4. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
WITH lotrinh_tramdung AS (
     SELECT lt.matb,  
            tentram
    FROM  lotrinh AS lt
    JOIN tramdung AS td
    ON td.matd=lt.matd
    WHERE tentram IN ('TDH xe buyt sai gon', 'cong vien 30/4')
)
SELECT 
    tb.*
FROM lotrinh_tramdung AS lt
LEFT JOIN tuyenbuyt AS tb
ON lt.matb=tb.matb
GROUP BY 
    tb.matb,
    tb.tentuyen,
    tb.culy,
    tb.sochuyen,
    tb.madv
HAVING 
    COUNT(DISTINCT tentram) = 2;            
           
               

--24.    Cho biết các tuyến xe buýt có lộ trình đi qua tất cả các trạm dừng có mã số 31, 35, 81.
 SELECT 
            tb.*
 FROM tuyenbuyt AS tb
 JOIN lotrinh AS lt    
 ON tb.matb = lt.matb
 WHERE lt.matd IN (31, 35, 81)
 GROUP BY 
       tb.matb,
       tentuyen,
       culy,
       sochuyen,
       madv
HAVING COUNT(DISTINCT matd) = 3;
