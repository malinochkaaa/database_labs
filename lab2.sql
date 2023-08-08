create database Drugstore
use Drugstore

create table Type_Medicine(ID_Medicine int primary key, Hardness_influence varchar(15) not null, Duration int not null, Amount int not null, Drug_influence varchar(15) not null)
create table Dates(ID_D int not null primary key, Appointment date not null, Beginning date not null, Ending date not null)
create table Stamp(ID_Stamp int primary key, LPU_Stamp varchar(10) not null, Doc_Stamp varchar(10) not null, Doc_Signature varchar(10) not null)
create table Availability(ID_Avail int primary key, Update_date date not null, Amount_bought int not null, Amount_left int not null, Amount_sold int)
create table Clients(ID_Clients int primary key, Number_of_Clients int, Age int, Name_Cl varchar(15) not null, Surname varchar(20) not null, Second_Name varchar(20) not null, Birth_date date not null, Phone_Number bigint not null, Full_name varchar(40))
create table Manufactures(ID_Man int primary key, Directions varchar(50) not null, Country varchar(15) not null, Town varchar(15) not null, Name_Man varchar(20) not null, Adress varchar(50) not null, Phone_Num bigint not null)
create table Med_Description(ID_Desc int primary key, ID_Avail int references Availability(ID_Avail), ID_Medicine int references Type_Medicine(ID_Medicine), ID_Man int references Manufactures(ID_Man), Name_Med varchar(20) not null)
create table Doctors(ID_Doc int primary key, Workplace varchar(20) not null, Name_Doc varchar(15) not null, Surname varchar(20) not null, Second_Name varchar(20) not null, Phone_Num bigint not null)
create table Receipt(ID_Receipt int primary key, Amount int not null, Name_rec varchar(20) not null, ID_Clients int references Clients(ID_Clients), ID_Desc int references Med_Description(ID_Desc), ID_Stamp int references Stamp(ID_Stamp), ID_D int references Dates(ID_D))
create table Receipt_Doctors(ID_Receipt int references Receipt(ID_Receipt), ID_Doc int references Doctors(ID_Doc))

insert into Type_Medicine(ID_Medicine,Hardness_influence , Duration, Amount, Drug_influence) values (1,'light',30,1,'no')
insert into Type_Medicine(ID_Medicine,Hardness_influence , Duration, Amount, Drug_influence) values (2,'hard',30,1,'no')
insert into Type_Medicine(ID_Medicine,Hardness_influence , Duration, Amount, Drug_influence) values (3,'weak',90,3,'middle')
insert into Type_Medicine(ID_Medicine,Hardness_influence , Duration, Amount, Drug_influence) values (4,'hard',90,3,'light')
insert into Type_Medicine(ID_Medicine,Hardness_influence , Duration, Amount, Drug_influence) values (5,'middle',90,3,'light')

insert into Dates(ID_D, Appointment, Beginning, Ending) values (1, '2007-10-20', '2007-10-22', '2007-11-20')
insert into Dates(ID_D, Appointment, Beginning, Ending) values (2, '2015-05-03', '2015-05-05', '2015-06-20')
insert into Dates(ID_D, Appointment, Beginning, Ending) values (3, '2017-07-13', '2017-07-14', '2017-10-12')
insert into Dates(ID_D, Appointment, Beginning, Ending) values (4, '2008-11-01', '2008-11-05', '2009-11-01')
insert into Dates(ID_D, Appointment, Beginning, Ending) values (5, '2010-04-25', '2010-04-25', '2010-08-25')

insert into Stamp(ID_Stamp, LPU_Stamp, Doc_Stamp, Doc_Signature) values (1,'checked', 'placed', 'placed')
insert into Stamp(ID_Stamp, LPU_Stamp, Doc_Stamp, Doc_Signature) values (2,'unchecked', 'placed', 'placed')
insert into Stamp(ID_Stamp, LPU_Stamp, Doc_Stamp, Doc_Signature) values (3,'checked', 'nonplaced', 'placed')
insert into Stamp(ID_Stamp, LPU_Stamp, Doc_Stamp, Doc_Signature) values (4,'checked', 'nonplaced', 'nonplaced')
insert into Stamp(ID_Stamp, LPU_Stamp, Doc_Stamp, Doc_Signature) values (5,'unchecked', 'placed', 'nonplaced')

insert into Availability(ID_Avail, Update_date, Amount_bought, Amount_left) values(1, '2020-03-20', 100, 54)
insert into Availability(ID_Avail, Update_date, Amount_bought, Amount_left) values(2, '2019-08-17', 1324, 112)
insert into Availability(ID_Avail, Update_date, Amount_bought, Amount_left) values(3, '2020-11-17', 486, 98)
insert into Availability(ID_Avail, Update_date, Amount_bought, Amount_left) values(4, '2020-06-08', 291, 78)
insert into Availability(ID_Avail, Update_date, Amount_bought, Amount_left) values(5, '2019-11-30', 99, 6)

insert into Clients(ID_Clients, Name_Cl, Surname, Second_Name, Birth_date, Phone_Number) values (1, 'Ivan', 'Dologopolov', 'Rustemovich', '1996-03-01', 89880330128)
insert into Clients(ID_Clients, Name_Cl, Surname, Second_Name, Birth_date, Phone_Number) values (2, 'Alina', 'Akimova', 'Alexandrovna', '2001-11-02', 89868948124)
insert into Clients(ID_Clients, Name_Cl, Surname, Second_Name, Birth_date, Phone_Number) values (3, 'Elena', 'Anohina', 'Andreeva', '1982-07-27', 891785472134)
insert into Clients(ID_Clients, Name_Cl, Surname, Second_Name, Birth_date, Phone_Number) values (4, 'Pavel', 'Corner', 'Viktorovich', '2001-03-11', 89880330628)
insert into Clients(ID_Clients, Name_Cl, Surname, Second_Name, Birth_date, Phone_Number) values (5, 'Vadim', 'Iverner', 'Nikolaevich', '1998-06-19', 89179440321)

insert into Manufactures(ID_Man, Directions, Country, Town, Name_Man, Adress, Phone_Num) values (1, 'drink', 'Russia', 'Volgograd','Troxevazin', 'ul.Mira', 89179440321)
insert into Manufactures(ID_Man, Directions, Country, Town, Name_Man, Adress, Phone_Num) values (2, 'dissolve', 'Russia', 'Chelyabinsk','Strepsils', 'ul.Alexandrova', 89880330242)
insert into Manufactures(ID_Man, Directions, Country, Town, Name_Man, Adress, Phone_Num) values (3, 'drink', 'Russia', 'Krasnodar','Smekta', 'ul.Pushkina', 8179832817)
insert into Manufactures(ID_Man, Directions, Country, Town, Name_Man, Adress, Phone_Num) values (4, 'insert', 'Russia', 'Anapa','Grammidin', 'ul.Normanino', 89110310237)
insert into Manufactures(ID_Man, Directions, Country, Town, Name_Man, Adress, Phone_Num) values (5, 'dissolve', 'Russia', 'Krym','Anaferon', 'ul.Anokhino', 899889532856)

insert into Med_Description(ID_Desc, ID_Avail, ID_Medicine, ID_Man, Name_Med) values (1,1,1,1,'Penin')
insert into Med_Description(ID_Desc, ID_Avail, ID_Medicine, ID_Man, Name_Med) values (2,2,2,2,'Trihin')
insert into Med_Description(ID_Desc, ID_Avail, ID_Medicine, ID_Man, Name_Med) values (3,3,3,3,'Defomin')
insert into Med_Description(ID_Desc, ID_Avail, ID_Medicine, ID_Man, Name_Med) values (4,4,4,4,'Spalmozgon')
insert into Med_Description(ID_Desc, ID_Avail, ID_Medicine, ID_Man, Name_Med) values (5,5,5,5,'Hederson')

insert into Doctors(ID_Doc, Workplace, Name_Doc, Surname, Second_Name, Phone_Num) values (1, 'Gorzdrav', 'Alena', 'Anohina', 'Andreevna', 89880110634)
insert into Doctors(ID_Doc, Workplace, Name_Doc, Surname, Second_Name, Phone_Num) values (2, 'Miraptek', 'Milana', 'Kuzkina', 'Viktorovna', 89178657435)
insert into Doctors(ID_Doc, Workplace, Name_Doc, Surname, Second_Name, Phone_Num) values (3, 'Vita', 'Egor', 'Ivanov', 'Pavlovich', 89880330475)
insert into Doctors(ID_Doc, Workplace, Name_Doc, Surname, Second_Name, Phone_Num) values (4, 'Zdorovie', 'Anton', 'Antonov', 'Antonovich', 89176459234)
insert into Doctors(ID_Doc, Workplace, Name_Doc, Surname, Second_Name, Phone_Num) values (5, 'Zdorovyemir', 'Nikita', 'Akimov', 'Alexandrovich', 89880440386)

insert into Receipt(ID_Receipt, Amount, Name_rec,  ID_Clients, ID_Desc, ID_Stamp, ID_D) values (1, 43,1,1,1,1,1)
insert into Receipt(ID_Receipt, Amount, Name_rec,  ID_Clients, ID_Desc, ID_Stamp, ID_D) values (2, 66,2,2,2,2,2)
insert into Receipt(ID_Receipt, Amount, Name_rec,  ID_Clients, ID_Desc, ID_Stamp, ID_D) values (3, 78,3,3,3,3,3)
insert into Receipt(ID_Receipt, Amount, Name_rec,  ID_Clients, ID_Desc, ID_Stamp, ID_D) values (4, 75,4,4,4,4,4)
insert into Receipt(ID_Receipt, Amount, Name_rec,  ID_Clients, ID_Desc, ID_Stamp, ID_D) values (5, 92,5,5,5,5,5)

insert into Receipt_Doctors(ID_Receipt, ID_Doc) values (1,1)
insert into Receipt_Doctors(ID_Receipt, ID_Doc) values (2,2)
insert into Receipt_Doctors(ID_Receipt, ID_Doc) values (3,3)
insert into Receipt_Doctors(ID_Receipt, ID_Doc) values (4,4)
insert into Receipt_Doctors(ID_Receipt, ID_Doc) values (5,5)

select * from Type_Medicine
select * from Dates
select * from Stamp
select * from Availability
select * from Clients
select * from Manufactures
select * from Med_Description
select * from Doctors
select * from Receipt
select * from Receipt_Doctors

