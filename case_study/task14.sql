select hd.id, dv.ten_dich_vu, dvdk.ten_dich_vu,count(hdct.id_dich_vu_di_kem)'so_lan_su_dung'
from hop_dong hd
left join dich_vu dv on dv.id = hd.id_dich_vu
left join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id
left join dich_vu_di_kem dvdk on dvdk.id = hdct.id_dich_vu_di_kem
group by hdct.id_dich_vu_di_kem
having count(hdct.id_dich_vu_di_kem) = 1;
