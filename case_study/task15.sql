select nv.id, nv.ho_ten, td.trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.id)'so_luong_hop_dong'
from nhan_vien nv
left join trinh_do td on td.id = nv.id_trinh_do
left join bo_phan bp on bp.id = nv.id_bo_phan
left join hop_dong hd on hd.id_nhan_vien = nv.id
group by nv.id
having count(hd.id) < 4;