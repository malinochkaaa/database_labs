use Drugstore

---------------------------------------------------------------------------------------------------------------------------------
												--Calculate Age triggers--
---------------------------------------------------------------------------------------------------------------------------------
create trigger Insert_CalculateAge 
on Clients
after insert
as 
declare @ID int, @birth_date date
begin
	set @ID = (select ID_Clients from inserted)
	set @birth_date=(select Birth_date from inserted)
	if (@birth_date>=getdate())
		raiserror('Дата рождения не может совпадать или быть больше нынешней!',1,1)
	else
		update Clients set Age=datediff(year,@birth_date,getdate()) where ID_Clients=@ID
end 
go

create trigger Update_CalculateAge
on Clients
after update
as 
declare @ID int, @birth_date date, @previuos_birth_date date
begin
	set @ID = (select ID_Clients from inserted)
	set @previuos_birth_date=(select Birth_date from deleted)
	set @birth_date=(select Birth_date from inserted)
	if (@birth_date>=getdate())
		raiserror('Дата рождения не может совпадать или быть больше нынешней!',1,1)
	else
	begin
	if (@previuos_birth_date != @birth_date)
		update Clients set Age=datediff(year,@birth_date,getdate()) where ID_Clients=@ID
	end
end 
go
---------------------------------------------------------------------------------------------------------------------------------
												--Amount of products sold triggers--
---------------------------------------------------------------------------------------------------------------------------------

create trigger Insert_Update_Amount_Sold
on Availability
after insert, update
as 
declare @ID int, @bought int, @left int
begin
	set @ID=(select ID_Avail from inserted)
	set @bought=(select Amount_bought from inserted)
	set @left=(select Amount_left from inserted)
	update Availability set Amount_sold=(@bought-@left) where ID_Avail=@ID  
end
go
 ---------------------------------------------------------------------------------------------------------------------------------
												--Fired Doctors triggers--
---------------------------------------------------------------------------------------------------------------------------------
create trigger Delete_Doctor
on Doctors
instead of delete
as 
declare @ID int
begin
	set @ID=(select ID_Doc from deleted)
	delete from Receipt_Doctors where ID_Doc=@ID
	delete from Doctors where ID_Doc=@ID
end
go
 ---------------------------------------------------------------------------------------------------------------------------------
												--Creating a Full name triggers--
---------------------------------------------------------------------------------------------------------------------------------
create trigger Insert_Update_FullName
on Clients
after insert, update
as
declare @ID int, @full varchar(40), @name varchar(1), @surname varchar(35), @second_name varchar(1)
begin
	set @ID = (select ID_Clients from inserted)
	set @name=(select Name_Cl from inserted)
	set @surname=(select Surname from inserted)
	set @second_name=(select Second_Name from inserted)
	set @full=concat(@surname, ' ', @name, '.',@second_name, '.')
	update Clients set Full_name=@full where ID_Clients=@ID
end
