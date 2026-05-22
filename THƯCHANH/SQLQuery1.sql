 ---Vớimỗiphòngban, chobiếttênphòng, tổng số nhânviên, mứclương cao nhất, mức lươngthấpnhất
SELECT tenpb , COUNT(manv), MAX (luong) , MIN (luong)
FROM phongban AS pb
LEFT JOIN nhanvien AS nv
ON pb.mapb=nv.mapb
GROUP BY pb.tenpb;
 --Q13-Vớimỗinhânviênhãychobiếtmãsố, tênnhânviênvà tổngsố người thânlà nữcủanhânviênđó.

-- Q14-Vớimỗinhânviên, hãychobiếtmãsố, họtên, mứclươngvà độ chênh lệch với mứclương trungbình của côngty


SELECT 
    manv,
    honv,
    tennv,
    luong,
    ABS(luong - (SELECT AVG(luong) FROM nhanvien)) AS DoChenhLech
FROM nhanvien;
---Q16-Lậpdanhsáchnhânviêngồmmãsố, họtên, mứclương, mứclương trung bình của phòng ban mànhânviênlàmviệc vàmứclươngtrungbình của công ty
WITH tb_phongban AS (
     SELECT tenpb, AVG(luong) AS 'LUONG TB PHONG BAN'
     FROM phongban AS pb
     LEFT JOIN nhanvien AS nv
     ON pb.mapb=nv.mapb
     GROUP BY pb.tenpb
)
SELECT manv,
       honv,
       tennv,
       luong,
       tb_phongban.[LUONG TB PHONG BAN],

FROM nhanvien AS nv
LEFT JOIN phongban
ON phongban.mapb=nv.mapb
LEFT JOIN tb_phongban 
ON tb_phongban.tenpb=phongban.tenpb
