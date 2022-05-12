create database Product_Details
use Product_Details
create table Category
(ID int primary key identity, 
Name varchar(50),
Descr varchar(50))

Create table Product
(ID int primary key identity,
Name varchar (50),
Quantity int,
Price Decimal,
Description varchar(50),
CategoryId int foreign key references Category(ID)
)


Alter proc Sp_Category
@action varchar(23),
@id int=0,
@name varchar(50)=null,
@Descr varchar(50)=null
AS 
BEGIN
if(@action='Create')
begin
insert into Category(name,Descr ) values (@name, @Descr)
select 1 as result
end

else if(@action='Delete')
begin
delete from Category Where id=@id
select 1 as result
end

else if(@action='Update')
begin
update category set name=@name, Descr = @Descr where id=@id
select 1 as result
end

else if(@action='Select')
begin
select * from category 
end
END

EXEC Sp_Category 'Create',0,'Electronics','Laptop'
EXEC Sp_Category 'Update',1,'Electronics','Laptop'




create proc Sp_Product
@action varchar(10),
@id int=0,
@name varchar(50)=null,
@price int=null,
@quantity int=null,
@Description varchar(50),
@CategoryId int =0
AS 
BEGIN

if(@action='create')
begin
 
insert into product(name,price,quantity,Description,CategoryId)
values(@name,@price,@quantity,@Description,@CategoryId)
select 1 as result
end


else if (@action='delete')
begin
delete from product where id=@id
select 1 as  result
end

else if(@action='select')
begin
select * from product 
end

else if(@action='update')
begin
update product set name=@name,price=@price,quantity=@quantity,Description=@Description,CategoryId=@CategoryId where id=@id
select 1 as result
end
END

Exec Sp_Product'Create',0,'Apple',80000,50,'Laptop',1