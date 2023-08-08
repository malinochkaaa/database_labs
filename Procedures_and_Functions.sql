use Drugstore
---------------------------------------------------------------------------------------------------------------------------------
										               PROCEDURE
										--Find the Amount of Most Sold Medicine--
---------------------------------------------------------------------------------------------------------------------------------
go

create procedure dbo.The_Most_Sold_Medicine
as 
begin
	select Name_Med as Name, Amount_bought, Amount_sold, (select MAX(Amount_sold) from Availability) Max_sold
		from Availability a
	join Med_Description b
	on b.ID_Avail=a.ID_Avail
end;

---------------------------------------------------------------------------------------------------------------------------------
														PROCEDURE
											--Getting Info from Receipt--
---------------------------------------------------------------------------------------------------------------------------------
go 

create procedure dbo.Get_Receipt_Info
as
begin
	select Workplace, Name_Doc, Surname, Second_Name, Amount, Appointment from(
		select Workplace, Name_Doc, Surname, Second_Name, Amount, ID_D from(
			select Workplace, Name_Doc, Surname, Second_Name, ID_Receipt from(
				select ID_Receipt, ID_Doc from Receipt_Doctors a) b
				join Doctors doc on doc.ID_Doc=b.ID_Doc) c
			join Receipt rec on rec.ID_Receipt=c.ID_Receipt) d
		join Dates dt on dt.ID_D=d.ID_D
end;

---------------------------------------------------------------------------------------------------------------------------------
														FUNCTON
											--Count Days until Birthday--
---------------------------------------------------------------------------------------------------------------------------------
go

create function dbo.Days_Until_Birthday(@ID_C int)
returns int
as 
begin
	return 365-abs(datepart(dayofyear, (select Birth_date from Clients where ID_Clients=@ID_C))-datepart(dayofyear,getdate()))
end

---------------------------------------------------------------------------------------------------------------------------------
														FUNCTON
									--Count the Amount of a Medicine in a Receipt--
---------------------------------------------------------------------------------------------------------------------------------
go

create function dbo.Count_the_Amount_of_a_Medicine(@ID_R int)
returns varchar(10)
as 
begin
	declare @number int
	set @number=(select Amount from Receipt where ID_Receipt=@ID_R)
	if(@number=NULL) return NULL
	else
	begin
		if((@number/1000000)>0)
		begin
			set @number=@number/1000000
			return concat(cast(@number as varchar(10)),'kk')
		end
		else if((@number/1000)>0 and(@number/1000)<0)
		begin
			set @number=@number/1000
			return concat(cast(@number as varchar(10)), 'k')
		end
		else if((@number/100)<1000)
		return cast(@number as varchar(10))
	end	
	return NULL
end

go