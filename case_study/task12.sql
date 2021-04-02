select all hd.id,nv.ho_ten'ho_ten_nhan_vien',kh.ho_ten'ho_ten_khach_hang',kh.so_dien_thoai,dv.ten_dich_vu,
count(hdct.id) 'so_luong_dich_vu_di_kem',hd.tien_dat_coc,hd.ngay_lam_hop_dong
from hop_dong hd
inner join nhan_vien nv on nv.id = hd.id_nhan_vien
inner join khach_hang kh on kh.id = hd.id_khach_hang
inner join dich_vu dv on dv.id = hd.id_dich_vu
inner join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id
where hd.id in (
			select id
            from hop_dong
            where ((month(ngay_lam_hop_dong) between 9 and 12)
            and year(ngay_lam_hop_dong) = 2019)
            ) and hd.id not in (
            select id
            from hop_dong
            where ((month(ngay_lam_hop_dong) between 1 and 6)
            and year(ngay_lam_hop_dong) = 2019)
)
group by hd.id;
            