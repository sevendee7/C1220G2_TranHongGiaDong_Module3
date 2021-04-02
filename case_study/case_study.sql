drop database if exists furama_resort_management;

create database furama_resort_management;

use furama_resort_management;

create table vi_tri (
	id int primary key not null auto_increment,
    ten_vi_tri varchar(45)
);

insert into vi_tri (ten_vi_tri)
values
('Lễ tân'),
('Phục vụ'),
('Chuyên viên'),
('Giám sát'),
('Quản lý'),
('Giám đóc');

create table trinh_do (
	id int primary key auto_increment,
    trinh_do varchar(45)
);

insert into trinh_do (trinh_do)
values
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');

create table bo_phan (
	id int primary key not null auto_increment,
    ten_bo_phan varchar(45)
);

insert into bo_phan (ten_bo_phan)
values
('Sale - Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

create table nhan_vien (
	id int primary key not null auto_increment,
    ho_ten varchar(50),
    ngay_sinh date,
    cmnd varchar(12),
    luong int,
    so_dien_thoai varchar(15),
    email varchar(30),
    dia_chi varchar(45),
    id_vi_tri int,
    id_trinh_do int,
    id_bo_phan int,
    
    foreign key (id_vi_tri) references vi_tri (id),
    foreign key (id_trinh_do) references trinh_do (id),
    foreign key (id_bo_phan) references bo_phan (id)
);

insert into nhan_vien (ho_ten, ngay_sinh, cmnd, so_dien_thoai, email, dia_chi, id_trinh_do, id_vi_tri, id_bo_phan, luong)
values
('Bui Thanh Tai','1994/03/13','123456780','0123123111','tuilatai@gmail.com','Hue',3,1,3,1000),
('Ho Quang Kha','1995/02/07','123456781','0123123112','tuilakha@gmail.com','Binh Dinh',4,2,4,2000),
('Dinh Van Thang','1991/01/19','123456782','0123123113','tuilathang@gmail.com','Da Nang',3,3,2,2500),
('Phan Thanh Hau','1998/05/20','123456783','0123123114','tuilahau@gmail.com','Quang Nam',2,5,2,2000),
('Nguyen Thanh Tam','1999/10/12','123456784','0123123115','tuilatam@gmail.com','Quang Tri',1,6,1,1000),
('Le Duc Sang','1992/02/19','123456785','0123123116','tuilasang@gmail.com','Quang Nam',3,3,3,2500),
('Nguyen Huy','1992/05/13','123456786','0123123117','tuilahuy@gmail.com','Da Nang',3,5,3,2500);

create table dich_vu_di_kem (
	id int primary key not null auto_increment,
    ten_dich_vu varchar(50),
    gia int,
    don_vi int,
    trang_thai varchar(50)
);

insert into dich_vu_di_kem (ten_dich_vu,gia,don_vi)
values
('Massage',100,10),
('Karaoke',200,20),
('Thức ăn',300,30),
('Nước uống',400,40),
('Thuê xe',500,50);

create table loai_khach (
	id int primary key not null auto_increment,
    ten_loai_khach varchar(50)
);

insert into loai_khach (ten_loai_khach)
values
('Member'),
('Silver'),
('Gold'),
('Platinum'),
('Diamond');


create table khach_hang (
	id int primary key not null auto_increment,
    ho_ten varchar(50),
    ngay_sinh date,
    cmnd varchar(12),
	so_dien_thoai varchar(15),
    email varchar(30),
    dia_chi varchar(50),
    id_loai_khach int,
    
    foreign key (id_loai_khach) references loai_khach (id) on delete cascade
);

insert into khach_hang (ho_ten,ngay_sinh,cmnd,so_dien_thoai,email,dia_chi,id_loai_khach)	
values
('Nguyễn Thanh Công','1992/07/26','209132455','0123124121','tuitencong@gmail.com','Hà Nội',5),
('Nguyễn Thanh Công','1992/07/26','209132459','0123124125','tuitencong1@gmail.com','Hà Nội',5),
('Trần Quốc Tuấn','1996/07/17','209132473','0123124122','tuitentuan@gmail.com','Quảng Trị',4),
('Nguyễn Đức Hậu','1998/08/25','209132413','0123124123','tuitenhaucoduc@gmail.com','Đà Nẵng',5),
('Nguyễn Trung Kiên','2005/08/25','209132414','0123124124','tuitenkien@gmail.com','Đà Nẵng',1);

create table kieu_thue (
	id int primary key not null auto_increment,
    ten_kieu_thue varchar(50),
    gia int
);

insert into kieu_thue (ten_kieu_thue, gia)
values
('Thuê theo ngày', 100),
('Thuê theo tuần', 500),
('Thuê theo tháng', 2500),
('Thuê theo năm', 17500);

create table loai_dich_vu (
	id int primary key not null auto_increment,
    ten_loai_dich_vu varchar(50)
);

insert into loai_dich_vu (ten_loai_dich_vu)
values
('Villa'),
('House'),
('Room');

create table dich_vu (
	id int primary key not null auto_increment,
    ten_dich_vu varchar(50),
    dien_tich double,
    so_tang tinyint,
    so_nguoi_toi_da int,
    chi_phi_thue int,
    trang_thai varchar(50),
	id_kieu_thue int,
    id_loai_dich_vu int,
    
    foreign key (id_kieu_thue) references kieu_thue (id) on delete cascade,
    foreign key (id_loai_dich_vu) references loai_dich_vu (id) on delete cascade
);

insert into dich_vu (ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,trang_thai,id_kieu_thue,id_loai_dich_vu)
values
('Beach villa',77.5,1,4,700,'Đã cho thuê',1,1),
('Pool villa',70.5,2,8,1000,'trống',2,1),
('Nest House', 83.5,1,4,500,'Đã cho thuê',3,2),
('Sun House', 81.5,1,4,750,'trống',3,2),
('King Room', 62.5,1,2,400,'trống',1,3),
('Queen Room', 62.5,1,2,450,'Đã cho thuê',3,3);

create table hop_dong (
	id int primary key not null auto_increment,
    ngay_lam_hop_dong date,
    ngay_ket_thuc date,
    tien_dat_coc int,
    tong_tien int,
    id_nhan_vien int,
    id_khach_hang int,
    id_dich_vu int,
    
    foreign key (id_nhan_vien) references nhan_vien (id) on delete cascade,
    foreign key (id_khach_hang) references khach_hang (id) on delete cascade,
    foreign key (id_dich_vu) references dich_vu (id) on delete cascade
);

insert into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien,id_nhan_vien,id_khach_hang,id_dich_vu)
values
('2018/01/01','2019/01/01',5000,50000,1,2,3),
('2018/10/01','2018/10/01',7000,70000,2,1,2),
('2019/02/01','2021/01/01',9000,90000,3,3,3),
('2020/05/01','2021/01/01',9000,90000,4,1,4);

create table hop_dong_chi_tiet (
	id int primary key not null auto_increment,
    id_dich_vu_di_kem int,
    id_hop_dong int,
    so_luong int,
    
    foreign key (id_hop_dong) references hop_dong (id) on delete cascade,
    foreign key (id_dich_vu_di_kem) references dich_vu_di_kem (id) on delete cascade
);

insert into hop_dong_chi_tiet (id_dich_vu_di_kem,id_hop_dong)
values
(1,2),
(2,3),
(3,1)