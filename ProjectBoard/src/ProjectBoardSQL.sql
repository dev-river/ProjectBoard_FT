-- 트럭 테이블
create table truckinfo(	
	tNum		 number(5) PRIMARY KEY, 
	tPhone		 varchar2(13)	not null,
	tIntro		 varchar2(150),
	tInfo		 varchar2(1000),
	tName		 varchar2(30)	not null,
	tOpen		 number(1)		not null,
	tTime		 varchar2(50),
	foodCategory varchar2(30)	not null,
	tAddress	 varchar2(200)	not null,
	tNotice		 varchar2(1000),
	tMenu		 varchar2(30)
)

COMMENT ON COLUMN truckinfo.tNum		 IS '트럭 가게번호';
COMMENT ON COLUMN truckinfo.tPhone		 IS '트럭 전화번호';
COMMENT ON COLUMN truckinfo.tIntro		 IS '트럭 가게소개';
COMMENT ON COLUMN truckinfo.tInfo		 IS '트럭 가게정보';
COMMENT ON COLUMN truckinfo.tName		 IS '트럭 가게이름';
COMMENT ON COLUMN truckinfo.tOpen		 IS '트럭 영업중';
COMMENT ON COLUMN truckinfo.tTime		 IS '트럭 영업시간';
COMMENT ON COLUMN truckinfo.foodCategory IS '트럭 음식카테고리';
COMMENT ON COLUMN truckinfo.tAddress	 IS '트럭 주소';
COMMENT ON COLUMN truckinfo.tNotice		 IS '트럭 공지';
COMMENT ON COLUMN truckinfo.tMenu		 IS '트럭 메뉴';

-- drop table truckinfo;

-- delete from truckinfo;

insert into truckinfo
values(1, '010-1111-1111', 'truckintro_Kor', 'truckinfo1_Kor', 'truckname1_Kor', 1, 'truckOpenTime_Kor' ,'Korea', 'address name_Kor', 'truckNotice1_Kor', ' truckMenu1_Kor');

insert into truckinfo
values(2, '010-1111-2222', 'truckintro2_Chi', 'truckinfo1_Chi', 'truckname1_Chi', 1, 'truckOpenTime_Chi', 'China', 'address name_Chi', 'truckNotice1_Chi', ' truckMenu1_Chi');

insert into truckinfo
values(3, '010-1111-3333', 'truckintro3_Jap', 'truckinfo1_Jap', 'truckname1_Jap', 1, 'truckOpenTime_Jap', 'Japan', 'address name_Jap', 'truckNotice1_Jap', ' truckMenu1_Jap');

insert into truckinfo
values(4, '010-1111-4444', 'truckintro4_Boon', 'truckinfo1_Boon', 'truckname1_Boon', 1, 'truckOpenTime_Boon', 'Boonsik', 'address name_Boon', 'truckNotice1_Boon', ' truckMenu1_Boon');

insert into truckinfo
values(5, '010-1111-5555', 'truckintro5_West', 'truckinfo1_West', 'truckname1_West', 1, 'truckOpenTime_West', 'Western', 'address name_West', 'truckNotice1_West', ' truckMenu1_West');

insert into truckinfo
values(6, '010-1111-6666', 'truckintro6_Lun', 'truckinfo1_Lun', 'truckname1_Lun', 1, 'truckOpenTime_Lun', 'Lunchbox', 'address name_Lun', 'truckNotice1_Lun', ' truckMenu1_Lun');

insert into truckinfo
values(7, '010-1111-7777', 'truckintro7_Des', 'truckinfo1_Des', 'truckname1_Des', 1, 'truckOpenTime_Des', 'Dessert', 'address name_Des', 'truckNotice1_Des', ' truckMenu1_Des');

insert into truckinfo
values(8, '010-1111-8888', 'truckintro8', 'truckinfo1', 'truckname1', 1, 'truckOpenTime_Kor', 'Korea', 'address name', 'truckNotice1', ' truckMenu1');

insert into truckinfo
values(9, '010-1111-9999', 'truckintro9', 'truckinfo1', 'truckname1', 1, 'truckOpenTime_Kor', 'Korea', 'address name', 'truckNotice1', ' truckMenu1');

select * from truckinfo;

update truckinfo set foodcategory='Japan' where foodcategory='Japan_Jap'

select * from truckinfo  where foodCategory='Korea'

drop table truckinfo

commit