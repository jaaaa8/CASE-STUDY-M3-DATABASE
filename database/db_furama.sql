create database m3_furama;
use m3_furama;

create table JobRole(
id int primary key auto_increment,
name varchar(45)
);

create table EducationLevel(
id int primary key auto_increment,
level varchar(45)
);

create table Department(
id int primary key auto_increment,
name varchar(45)
);

create table Employee(
id int primary key auto_increment,
name varchar(45),
birth_date datetime,
cmnd varchar(45),
salary double,
phone varchar(45),
email varchar(45),
address varchar(45),
role_id int,
level_id int,
department_id int,
foreign key (role_id) references JobRole(id),
foreign key (level_id) references EducationLevel(id),
foreign key (department_id) references Department(id)
);

create table CustomerType(
id int primary key auto_increment,
type varchar(45)
);

create table Customer(
id int primary key auto_increment,
type_id int,
name varchar(45),
birth_date datetime,
gender bit(1),
cmnd varchar(45),
phone varchar(45),
email varchar(45),
address varchar(45),
foreign key (type_id) references CustomerType(id)
);

create table ServiceType(
id int primary key auto_increment,
type varchar(45)
);

create table RentalType(
id int primary key auto_increment,
type varchar(45)
);

create table Service(
id int primary key auto_increment,
name varchar(45),
area varchar(45),
rent_fee double,
amount_labors int,
rental_id int,
service_id int,
room_quality varchar(45),
others_service varchar(45),
pool_area double,
floor int,
foreign key (rental_id) references RentalType(id),
foreign key (service_id) references ServiceType(id)
);

create table ExtraService(
id int primary key auto_increment,
name varchar(45),
price double,
unit varchar(45),
status varchar(45)
);

create table Contract(
id int primary key auto_increment,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
customer_id int,
service_id int,
foreign key (employee_id) references Employee(id),
foreign key (customer_id) references Customer(id),
foreign key (service_id) references Service(id)
);

create table ContractDetail(
id int primary key auto_increment,
contract_id int,
extra_service_id int,
amount int,
foreign key (contract_id) references Contract(id),
foreign key (extra_service_id) references ExtraService(id)
);

insert into JobRole values
(1,'manager'),
(2,'employee');

insert into EducationLevel values
(1,'Trung cấp'),
(2,'Cao đẳng'),
(3,'Đại học'),
(4,'Sau Đại học');

insert into Department values
(1,'Sale Marketing'),
(2,'Hành chính'),
(3,'Phục vụ'),
(4,'Quản lý');

insert into Employee (id, name, birth_date, cmnd, salary, phone, email, address, role_id, level_id, department_id) values
(1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
(2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
(3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
(4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
(5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
(6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
(7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
(8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
(9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
(10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);

insert into CustomerType(type) values
('Diamond'),
('Platinum'),
('Gold'),
('Silver'),
('Member');

insert into Customer (id, name, birth_date, gender, cmnd, phone, email, address, type_id) values
(1, 'Nguyễn Thị Hào', '1970-11-07', b'0', '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
(2, 'Phạm Xuân Diệu', '1992-08-08', b'1', '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
(3, 'Trương Đình Nghệ', '1990-02-27', b'1', '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
(4, 'Dương Văn Quan', '1981-07-08', b'1', '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
(5, 'Hoàng Trần Nhi Nhi', '1995-12-09', b'0', '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
(6, 'Tôn Nữ Mộc Châu', '2005-12-06', b'0', '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
(7, 'Nguyễn Mỹ Kim', '1984-04-08', b'0', '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
(8, 'Nguyễn Thị Hào', '1999-04-08', b'0', '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
(9, 'Trần Đại Danh', '1994-07-01', b'1', '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
(10, 'Nguyễn Tâm Đắc', '1989-07-01', b'1', '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);


insert into RentalType(type) values
('year'),
('month'),
('day'),
('hour');

insert into ServiceType(type) values
('Villa'),
('House'),
('Room');

insert into Service (name, area, rent_fee, amount_labors, rental_id, service_id, room_quality, others_service, pool_area, floor) values
(NULL, NULL, NULL, NULL, 3, 1, NULL, 'Có hồ bơi', 500, 4),
(NULL, NULL, NULL, NULL, 2, 2, NULL, 'Có thêm bếp nướng', NULL, 3),
(NULL, NULL, NULL, NULL, 4, 3, NULL, 'Có tivi', NULL, NULL),
(NULL, NULL, NULL, NULL, 3, 1, NULL, 'Có hồ bơi', 300, 3),
(NULL, NULL, NULL, NULL, 3, 2, NULL, 'Có thêm bếp nướng', NULL, 2),
(NULL, NULL, NULL, NULL, 4, 3, NULL, 'Có tivi', NULL, NULL);

insert into ExtraService (name, price, unit, status) values
('Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

insert into Contract (start_date, end_date, deposit, employee_id, customer_id, service_id) values
('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
('2021-07-14', '2021-07-15', 0, 7, 2, 6),
('2021-06-01', '2021-06-03', 0, 7, 7, 6),
('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
('2020-11-19', '2020-11-19', 0, 3, 4, 3),
('2021-04-12', '2021-04-14', 0, 10, 3, 5),
('2021-04-25', '2021-04-25', 0, 2, 2, 1),
('2021-05-25', '2021-05-27', 0, 7, 10, 1);

insert into ContractDetail (amount, contract_id, extra_service_id) values
(5, 2, 4),
(8, 2, 5),
(15, 2, 6),
(1, 3, 1),
(11, 3, 2),
(1, 1, 3),
(2, 1, 2),
(2, 12, 2);

-- c2
select * from Employee
where name like 'H%' or name like 'T%' or 'K%' and char_length(name) <= 15;

-- c3
select * from Customer
where year(curdate()) - year(birth_date) between 18 and 50 and address like '%Đà Nẵng' or address like '%Quảng Trị';

-- c4
select cus.name, count(cus.id) as so_lan_dat from Contract c
join Customer cus on c.customer_id = cus.id
join CustomerType ct on cus.type_id = ct.id
where ct.type = 'Diamond'
group by cus.id, cus.name
order by so_lan_dat;

-- c5
select cus.id as customer_id, cus.name as customer_name, c.id as contract_id, s.name as service_name, c.start_date, c.end_date