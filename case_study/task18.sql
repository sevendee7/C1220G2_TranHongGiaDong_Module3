delete
from khach_hang kh
where kh.id in (
	select temp.id
    from (
		select id_khach_hang id
        from hop_dong
        join khach_hang on khach_hang.id = hop_dong.id_khach_hang
        where year(ngay_lam_hop_dong) < 2016
        ) as temp
);