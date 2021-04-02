create view view_count as
select count(id_dich_vu_di_kem) as so_lan
from hop_dong_chi_tiet
group by id_dich_vu_di_kem;

select dvdk.ten_dich_vu,count(id_dich_vu_di_kem)'so_lan_su_dung'
from hop_dong_chi_tiet hdct
left join dich_vu_di_kem dvdk on dvdk.id = hdct.id_dich_vu_di_kem
group by id_dich_vu_di_kem
having count(id_dich_vu_di_kem) = (select max(view_count.so_lan) from view_count);