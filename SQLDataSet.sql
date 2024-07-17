create table sales_rep (
slsrep_number number(5) constraint pk_sales_rep primary key,
srlast		varchar2(8),
srfirst		varchar2(7),
street		varchar2(13),
city		varchar2(7),
state		varchar2(2),
zip_code	number(5),
total_commission	number(7,2),
commission_rate		number(3,2));

insert into sales_rep values(3, 'Jones', 'Mary', '123 Main', 'Grant', 'MI', 42919, 2150, .05);
insert into sales_rep values(4, 'Morton', 'Tom', '300 College', 'Flint', 'MI', 49227, 2075, .06);
insert into sales_rep values(6, 'Smith', 'William', '102 Raymond', 'Ada', 'MI', 49441, 4912.5, .07);
insert into sales_rep values(12, 'Diaz', 'Miguel', '419 Harper', 'Lansing', 'MI', 49224, 2150, .05);


create table customer
	(c_number number(3) not null,
	clast varchar2(8),
	cfirst varchar2(7),
	street varchar2(13),
	city varchar2(7),
	state varchar2(2),
	zip_code number(5),
	balance number(7,2),
	credit_limit number(4),
	slsrep_number number(3),
constraint customer_pk primary key (c_number),
constraint fk1_customer foreign key (slsrep_number) references sales_rep(slsrep_number));

insert into customer values 
(124, 'Adams', 'Sally', '418 Oak', 'Lansing', 'MI', 49224, 818.75, 1000, 3);

insert into customer values 
(256, 'Samuels', 'Ann', '215 Pete', 'Grant', 'MI', 49219, 21.5, 1500, 6);

insert into customer values 
(311, 'Charles', 'Don', '48 College', 'Ira', 'MI', 49034, 825.75, 1000, 12);

insert into customer values 
(315, 'Daniels', 'Tom', '914 Cherry', 'Kent', 'MI', 48391, 770.75, 750, 6);

insert into customer values 
(405, 'Williams', 'Al', '519 Watson', 'Grant', 'MI', 49219, 402.75, 1500, 12);

insert into customer values 
(412, 'Adams', 'Sally', '16 Elm', 'Lansing', 'MI', 49224, 1817.75, 2000, 3);

insert into customer (c_number, clast, cfirst, street, city, state, zip_code, balance, credit_limit) values 
(522, 'Nelson', 'Mary', '108 Pine', 'Ada', 'MI', 49441, 98.75, 1500);

insert into customer values 
(567, 'Dinh', 'Tran', '808 Ridge', 'Harper', 'MI', 48421, 402.40, 750, 6);

insert into customer values 
(587, 'Galvez', 'Mara', '512 Pine', 'Ada', 'MI', 49441, 114.60, 1000, 6);

insert into customer values 
(622, 'Martin', 'Dan', '419 Chip', 'Grant', 'MI', 49219, 1045.75, 1000, 3);


create table part (
part_number varchar2(5) constraint pk_part primary key,
part_description varchar2(12),
units_on_hand number,
item_class char(2),
warehouse_number number,
unit_price number(7,2));

insert into part values ('AX12', 'Iron', 104, 'HW', 3, 24.95);

insert into part values ('AZ52', 'Dartboard', 20, 'SG', 2, 12.95);

insert into part values ('BA74', 'Basketball', 40, 'SG', 1, 29.95);

insert into part values ('BH22', 'Cornpopper', 95, 'HW', 3, 24.95);

insert into part values ('BT04', 'Gas Grill', 11, 'AP', 2, 149.99);


insert into part values ('BZ66', 'Washer', 52, 'AP', 3, 399.99);

insert into part values ('CA14', 'Griddle', 78, 'HW', 3, 39.99);

insert into part values ('CB03', 'Bike', 44, 'SG', 1, 299.99);

insert into part values ('CX11', 'Blender', 112, 'HW', 3, 22.95);

insert into part values ('CZ81', 'Treadmill', 68, 'SG', 2, 349.95);


create table orders (
order_number number(5) constraint pk_orders primary key,
order_date date,
c_number number(3) constraint fk1_orders references customer(c_number));

insert into orders values (12489, TO_DATE('02-08-2013','dd-mm-yyyy'), 124);

insert into orders values (12491, TO_DATE('02-08-2013','dd-mm-yyyy'), 311);

insert into orders values (12494, TO_DATE('04-08-2013','dd-mm-yyyy'), 315);

insert into orders values (12495, TO_DATE('04-08-2013','dd-mm-yyyy'), 256);

insert into orders values (12498, TO_DATE('05-08-2013','dd-mm-yyyy'), 522);

insert into orders values (12500, TO_DATE('05-08-2013','dd-mm-yyyy'), 124);

insert into orders values (12504, TO_DATE('05-08-2013','dd-mm-yyyy'), 522);


create table order_line (
order_number number(5), 
part_number varchar2(5),
number_ordered number,
quoted_price number(6,2),
constraint pk_order_line primary key (order_number, part_number),
constraint fk1_order_line foreign key (order_number) references orders(order_number),
constraint fk2_order_line foreign key (part_number) references part(part_number));

insert into order_line values (12489, 'AX12', 11, 21.95);
insert into order_line values (12491, 'BT04', 1, 149.99);
insert into order_line values (12491, 'BZ66', 1, 399.99);
insert into order_line values (12494, 'CB03', 4, 279.99);
insert into order_line values (12495, 'CX11', 2, 22.95);
insert into order_line values (12498, 'AZ52', 2, 12.95);
insert into order_line values (12498, 'BA74', 4, 24.95);
insert into order_line values (12500, 'BT04', 3, 149.99);
insert into order_line values (12504, 'CZ81', 2, 325.99);