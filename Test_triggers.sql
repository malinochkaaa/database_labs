---------------------------------------------------------------------------------------------------------------------------------
					--TEST Calculate Age triggers and TEST Creating a Full name triggers--
---------------------------------------------------------------------------------------------------------------------------------
insert into Clients(ID_Clients, Name_Cl, Surname, Second_Name, Birth_date, Phone_Number) values (6, 'Ivan', 'Dolgopolov', 'Rustemovich', '1996-03-01', 89880330128)
select* from Clients
update Clients set Birth_date = '1990-03-01', Surname = 'Sovetov' where ID_Clients = 6
select* from Clients

---------------------------------------------------------------------------------------------------------------------------------
									--TEST Amount of products sold triggers--
---------------------------------------------------------------------------------------------------------------------------------
select* from Availability
insert into Availability(ID_Avail, Update_date, Amount_bought, Amount_left) values(6, '2019-08-17', 1324, 112)
select* from Availability
update Availability set Amount_bought = 1000, Amount_left = 112 where ID_Avail = 6
select* from Availability

---------------------------------------------------------------------------------------------------------------------------------
										--TEST Fired Doctors triggers--
---------------------------------------------------------------------------------------------------------------------------------
select* from Doctors
select* from Receipt_Doctors
delete from Doctors where ID_Doc = 5
select* from Doctors
select* from Receipt_Doctors