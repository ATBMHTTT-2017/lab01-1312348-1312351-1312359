create table CHI_NHANH (
    MACN varchar2(10) constraint chi_nhanh_pk primary key,
    TENCN varchar2(30),
    TRUONGCN varchar2(10)
);
/


create table NHAN_VIEN (
    MANV varchar2(10) constraint nhan_vien_pk primary key,
    HOTEN varchar2(30),
    DIACHI varchar2(50),
    DIENTHOAI varchar2(20),
    EMAIL varchar2(30),
    MAPHONG varchar2(10),
    CHINHANH varchar2(10),
    LUONG number
);
/


create table PHONG_BAN (
    MAPHONG varchar2(10) constraint phong_ban_pk primary key,
    TENPHONG varchar2(30) not null,
    TRUONGPHONG varchar2(30),
    NGAYNHAMCHUC date,
    SONHANVIEN number,
    CHINHANH varchar2(10)
);
/

/*
create or replace trigger biu_phong_ban
before insert or update on PHONG_BAN
for each row
begin
    if inserting then
         null;
    end if;
    if updating then
         null;
    end if;
end;
/
*/


create table DU_AN (
    MADA varchar2(10) constraint du_an_pk primary key,
    TENDA varchar2(30),
    KINHPHI number,
    PHONGCHUTRI varchar2(10),
    TRUONGDA varchar2(10)
);
/


create table PHAN_CONG (
    MANV varchar2(10),
    DUAN varchar2(10),
    VAITRO varchar2(30),
    PHUCAP number,
    constraint phan_cong_pk primary key (MANV, DUAN)
);
/

create table CHI_TIEU (
    MACHITIEU varchar2(10) constraint chi_tieu_pk primary key,
    TENCHITIEU varchar2(30) not null,
    SOTIEN number,
    DUAN varchar2(10)
);
/

alter table NHAN_VIEN 
add constraint nhan_vien_fk1 foreign key (MAPHONG) references PHONG_BAN(MAPHONG);
/

alter table NHAN_VIEN 
add constraint nhan_vien_fk2 foreign key (CHINHANH) references CHI_NHANH(MACN);
/

alter table CHI_NHANH
add constraint chi_nhanh_fk foreign key (TRUONGCN) references NHAN_VIEN(MANV);
/

alter table PHONG_BAN
add constraint phong_ban_fk1 foreign key (TRUONGPHONG) references NHAN_VIEN(MANV);
/

alter table PHONG_BAN
add constraint phong_ban_fk2 foreign key (CHINHANH) references CHI_NHANH(MACN);
/

alter table DU_AN
add constraint du_an_fk1 foreign key (PHONGCHUTRI) references PHONG_BAN(MAPHONG);
/

alter table DU_AN
add constraint du_an_fk2 foreign key (TRUONGDA) references NHAN_VIEN(MANV);
/

alter table PHAN_CONG
add constraint phan_cong_fk1 foreign key (MANV) references NHAN_VIEN(MANV);
/

alter table PHAN_CONG
add constraint phan_cong_fk2 foreign key (DUAN) references DU_AN(MADA);
/

alter table CHI_TIEU
add constraint chi_tieu_fk foreign key (DUAN) references DU_AN(MADA);
/
