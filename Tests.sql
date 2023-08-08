---------------------------------------------------------------------------------------------------------------------------------
												--Test for The_Most_Sold_Medicine--
---------------------------------------------------------------------------------------------------------------------------------

select * from Availability
select * from Med_Description
exec dbo.The_Most_Sold_Medicine

---------------------------------------------------------------------------------------------------------------------------------
													--Test for Get_Receipt_Info--
---------------------------------------------------------------------------------------------------------------------------------

select * from Receipt_Doctors
select * from Receipt
select * from Doctors
select * from Dates
exec dbo.Get_Receipt_Info

---------------------------------------------------------------------------------------------------------------------------------
												--Test for Days_Until_Birthday--
---------------------------------------------------------------------------------------------------------------------------------

select ID_Clients, Full_name, Birth_date, getdate() Right_now, dbo.Days_Until_Birthday(ID_Clients) Days_Until_Birthday from Clients

---------------------------------------------------------------------------------------------------------------------------------
											--Test for Count_the_Amount_of_a_Medicine--
---------------------------------------------------------------------------------------------------------------------------------

insert into Receipt(Name_rec, Amount) values('Alina',649)
select ID_Receipt, Name_rec, Amount, dbo.Count_the_Amount_of_a_Medicine_in_a_Receipt(ID_Receipt) Amount_Formated from Receipt