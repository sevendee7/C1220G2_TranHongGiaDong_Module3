select dv.id, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu dv
left join loai_dich_vu ldv on ldv.id = dv.id_loai_dich_vu
left join hop_dong hd on hd.id_dich_vu = dv.id
where (year(hd.ngay_lam_hop_dong) = 2019 and month(hd.ngay_lam_hop_dong) > 3)
or year(hd.ngay_lam_hop_dong) <> 2019
or hd.ngay_lam_hop_dong is null;

select dv.id, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu dv
left join loai_dich_vu ldv on ldv.id = dv.id_loai_dich_vu
left join hop_dong hd on hd.id_dich_vu = dv.id
where dv.id not in (
	select distinct id_dich_vu
    from hop_dong
    where (month(ngay_lam_hop_dong) between 1 and 3
		and year(ngay_lam_hop_dong) = 2019)
	);