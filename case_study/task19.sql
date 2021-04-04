update dich_vu_di_kem
inner join (
	select dvdk.ten_dich_vu as ten_dich_vu_di_kem
    from hop_dong_chi_tiet hdct
    inner join dich_vu_di_kem dvdk on dvdk.id = hdct.id_dich_vu_di_kem
    group by dvdk.id
    having count(hdct.id_dich_vu_di_kem) > 7) as temp
	set dich_vu_di_kem.gia = dich_vu_di_kem.gia * 2
    where dich_vu_di_kem.ten_dich_vu = temp.ten_dich_vu_di_kem;