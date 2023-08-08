---------------------------------------------------------------------------------------------------------------------------------
														--Logins--
---------------------------------------------------------------------------------------------------------------------------------

create login Alina with password = '2001'
go
create login Dad with password = '1980' 
go
create login Aunt with password= '9010'
go
create login Uncle with password = '1991'
go
create login GrandDad with password = '1234'
go
create login GrandMom with password = '5678'
go

---------------------------------------------------------------------------------------------------------------------------------
														--Users--
---------------------------------------------------------------------------------------------------------------------------------

create user alina for login Alina
go
create user dad for login Dad
go
create user aunt for login Aunt 
go
create user uncle for login Uncle
go
create user granddad for login GrandDad
go 
create user granmom for login GrandMom
go

---------------------------------------------------------------------------------------------------------------------------------
														--Roles--
---------------------------------------------------------------------------------------------------------------------------------
create role AdminUser
go
create role ReadWriteUser
go
create role ViewOnlyUser
go


alter role AdminUser add member alina
go
alter role AdminUser add member dad
go
alter role ReadWriteUser add member aunt
go
alter role ReadWriteUser add member uncle
go
alter role ViewOnlyUser add member granddad
go
alter role ViewOnlyUser add member grandmom
go

---------------------------------------------------------------------------------------------------------------------------------
														--Rights--
---------------------------------------------------------------------------------------------------------------------------------
--AdminUser--
grant select, insert, update, delete on [Drugstore].[dbo].[Manufactures] to AdminBD
grant select, insert, update, delete on [Drugstore].[dbo].[Stamp] to AdminBD
grant select, insert, update, delete on [Drugstore].[dbo].[Type_Medicine] to AdminBD
grant execute on [Drugstore].[dbo].[Client] to AdminBD
grant execute on [Drugstore].[dbo].[Availability] to AdminBD
grant execute on [Drugstore].[dbo].[Dates] to AdminBD
grant execute on [Drugstore].[dbo].[Doctors] to AdminBD
grant execute on [Drugstore].[dbo].[Med_Description] to AdminBD
grant execute on [Drugstore].[dbo].[Receipt] to AdminBD
grant execute on [Drugstore].[dbo].[Receipt_Doctors] to AdminBD


--ReadWriteUser--
grant select, update on [Drugstore].[dbo].[Client] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Availability] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Dates] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Doctors] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Manufactures] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Med_Description] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Receipt] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Receipt_Doctors] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Stamp] to ReadWriteUser
grant select, update on [Drugstore].[dbo].[Type_Medicine] to ReadWriteUser

--ViewOnlyUser--
grant select on [Drugstore].[dbo].[Doctors] to ReadWriteUser
grant select on [Drugstore].[dbo].[Receipt] to ReadWriteUser
grant select on [Drugstore].[dbo].[Receipt_Doctors] to ReadWriteUser
