delete from nhan_vien 
where nhan_vien.id not in (select temp.idnv from(
	select id_nhan_vien idnv
    from hop_dong
    where year(hop_dong.ngay_lam_hop_dong) between 2017 and 2019
)as temp);


