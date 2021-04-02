select hd.id,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,count(hdct.id_dich_vu_di_kem) 'Số lượng dịch vụ đi kèm'
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.id = hdct.id_hop_dong
group by hd.id;
