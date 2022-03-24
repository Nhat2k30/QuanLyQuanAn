Create Database QuanLyQuanNhau
go

use  QuanLyQuanNhau
go

--Food
--Table
--FoodCategory
--Account
--Bill
--BillInfo

--Table của Bàn Ăn
create table TableFood
(
   id int identity primary key,
   name nvarchar(100) not null default N'Chưa đặt tên',
   status nvarchar(100) not null default N'Trống' --Trống || Có người
)
go

--Table của Tài Khoản
create table Account
(
   username nvarchar(100) primary key,
   displayname nvarchar(100) not null default N'ok',
   password nvarchar(1000) not null default 0,
   type int not null default 0     
)
go

--Table của Loại Món Ăn
create table FoodCategory 
(
   id int identity primary key,
   name nvarchar(100) not null default N'Chưa đặt tên',
)
go

--Table của Món Ăn
create table Food
(
   id int identity primary key,
   name nvarchar(100) not null default N'Chưa đặt tên',
   idCategory int not null,
   price float not null default 0

   foreign key (idCategory) references dbo.FoodCategory (id)
)
go

--Table của Hóa Đơn
create table Bill
(
   id int identity primary key,
   DateCheckIn date not null default getdate(),
   DateCheckOut date,
   idTable int not null,
   status int not null default 0      --1: đã thanh toán & 0: chưa thanh toán

   foreign key (idTable) references dbo.TableFood(id)
)
go

--Table của Chi Tiết Hóa Đơn
create table BillInfo
(
   id int identity primary key,
   idBill int not null,
   idFood int not null,
   count int  not null default 0

   foreign key (idBill) references dbo.Bill(id),
   foreign key (idFood) references dbo.Food(id) 
)
go

insert into dbo.Account
             (username,
			  displayname,
			  password,
			  type
			 )
values       (
               N'H',
			   N'Boss',
			   N'1',
			   1
             )
insert into dbo.Account
             (username,
			  displayname,
			  password,
			  type
			 )
values       (
               N'staff',
			   N'staff',
			   N'1',
			   0
             )
go

--select * from dbo.Account

create proc USP_GetAccountByUserName
@username nvarchar(100)
as
begin
     select * from dbo.Account where username = @username
end
go

exec dbo.USP_GetAccountByUserName @username = N'H' --nvarchar(100)

select * from dbo.Account where username = N'H' and password = N'1'

--Them ban
declare @i int = 0
while @i <= 10
begin
     insert dbo.TableFood (name) values (N'Bàn ' + CAST(@i as nvarchar(100)))
	 set @i = @i + 1
end

go

select * from dbo.TableFood

create proc USP_GetTableList
as select * from dbo.TableFood
go

exec dbo.USP_GetTableList
go


--them category
insert dbo.FoodCategory(name)
values (N'Hải sản')
insert dbo.FoodCategory(name)
values (N'Nước')


--them mon an
insert dbo.Food(name, idCategory, price)
values (N'Bạch tuộc xào cay', 1, 100000)
insert dbo.Food(name, idCategory, price)
values (N'Cua rang me', 1, 110000)
insert dbo.Food(name, idCategory, price)
values (N'Ngêu nướng mỡ hành', 1, 90000)
insert dbo.Food(name, idCategory, price)
values (N'Mực sốt tỏi ớt', 1, 100000)
insert dbo.Food(name, idCategory, price)
values (N'Mực hấp hành gừng', 1, 120000)
insert dbo.Food(name, idCategory, price)
values (N'Lẩu thái hải sản', 1, 400000)
insert dbo.Food(name, idCategory, price)
values (N'Súp cua', 1, 50000)
insert dbo.Food(name, idCategory, price)
values (N'Tôm hấp thái', 1, 80000)
insert dbo.Food(name, idCategory, price)
values (N'Sò huyết xào tỏi', 1, 150000)
insert dbo.Food(name, idCategory, price)
values (N'Tôm nướng muối ớt', 1, 50000)
insert dbo.Food(name, idCategory, price)
values (N'Ốc hương hấp gừng sả ớt', 1, 200000)
insert dbo.Food(name, idCategory, price)
values (N'Tôm hùm Bình Ba', 1, 250000)
insert dbo.Food(name, idCategory, price)
values (N'Ghẹ hấp bia', 1, 140000)
insert dbo.Food(name, idCategory, price)
values (N'Mực nhảy', 1, 240000)
insert dbo.Food(name, idCategory, price)
values (N'Cá ngừ đại dương', 1, 300000)
insert dbo.Food(name, idCategory, price)
values (N'Bào ngư sốt dầu hào', 1, 100000)
insert dbo.Food(name, idCategory, price)
values (N'Mực một nắng', 1, 170000)
insert dbo.Food(name, idCategory, price)
values (N'Sò lông nướng mỡ hành', 1, 130000)
insert dbo.Food(name, idCategory, price)
values (N'Sò huyết hấp sả', 1, 150000)
insert dbo.Food(name, idCategory, price)
values (N'Bia 333', 2, 10000)
insert dbo.Food(name, idCategory, price)
values (N'Bia Tiger', 2, 15000)
insert dbo.Food(name, idCategory, price)
values (N'Bia Heineken', 2, 20000)
insert dbo.Food(name, idCategory, price)
values (N'Coca Cola', 2, 15000)
insert dbo.Food(name, idCategory, price)
values (N'Pepsi', 2, 15000)
insert dbo.Food(name, idCategory, price)
values (N'7UP', 2, 10000)
insert dbo.Food(name, idCategory, price)
values (N'Xá xị', 2, 10000)
insert dbo.Food(name, idCategory, price)
values (N'Nước suối Aquafina', 2, 8000)
insert dbo.Food(name, idCategory, price)
values (N'Trà đá', 2, 5000)

 set dateformat dmy

--Them Bill
INSERT	dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          NULL , -- DateCheckOut - date
          3 , -- idTable - int
          0  -- status - int
        )
INSERT	dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          NULL , -- DateCheckOut - date
          4, -- idTable - int
          0  -- status - int
        )
INSERT	dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          GETDATE() , -- DateCheckOut - date
          5 , -- idTable - int
          1  -- status - int
        )

-- thêm bill info
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 1, -- idBill - int
          1, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 1, -- idBill - int
          6, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 2, -- idBill - int
          5, -- idFood - int
          2  -- count - int
          )         
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 3, -- idBill - int
          1, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 3, -- idBill - int
          3, -- idFood - int
          4  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 3, -- idBill - int
          5, -- idFood - int
          1  -- count - int
          )

          
GO

delete BillInfo

delete Bill

create PROC USP_InsertBill
@idtable int
AS
BEGIN
    INSERT dbo.Bill
	VALUES ( GETDATE() ,
	         NULL ,
	         @idtable ,
	         0,
			 0
	        )
END
GO

alter proc USP_InsertBillInfo
@idbill int, @idfood int, @count int
as
begin
declare @existsBillinfo int
declare @foodcount int  = 1
select @existsBillinfo = id, @foodcount = count from BillInfo where id = @idbill and idFood = @idfood
if(@existsBillinfo > 0)
begin
declare @newcount int = @foodcount + @count
if(@newcount > 0)
update BillInfo set count = @foodcount + @count where idFood = @idfood
else delete BillInfo where idBill = @idbill and idFood = @idfood
end
else
begin

insert BillInfo
values
(
@idbill ,
@idfood ,
@count
)
end

end
go

create trigger UpdateBillInfo
on BillInfo for insert, update
as
begin
	declare @idBill int
	select @idBill = idBill from inserted

	declare @idTable int
	select @idTable = idTable from Bill where id = @idBill and status = 0

	declare @count int
	select @count = COUNT(*) from BillInfo where idBill = @idBill

	if(@count > 0)
	begin
	update TableFood set status = N'Có người' where id = @idTable
	end
	else
	begin
	update TableFood set status = N'Trống' where id = @idTable
	end
end
go



create trigger UpdateBill
on Bill for update
as
begin
	declare @idBill int
	select @idBill = id from inserted

	declare @idTable int
	select @idTable = idTable from Bill where id = @idBill

	declare @count int = 0
	select @count = COUNT(*) from Bill where idTable = @idTable and status = 0

	if(@count = 0)
		update TableFood set status = N'Trống' where id = @idTable
end
go

CREATE PROCEDURE USP_SwitchTable
@id1 int, @id2 int
AS
BEGIN
	DECLARE @idBill1 int
	DECLARE @idBill2 int

	SELECT @idBill1 = id FROM dbo.Bill WHERE dbo.Bill.idTable = @id1 AND STATUS = 0
	SELECT @idBill2 = id FROM dbo.Bill WHERE dbo.Bill.idTable = @id2 AND STATUS = 0

	UPDATE dbo.Bill SET dbo.Bill.idTable = @id2 WHERE id = @idBill1
	UPDATE dbo.Bill SET dbo.Bill.idTable = @id1 WHERE id = @idBill2
END
GO

create proc USP_GetListBill
@checkin date, @checkout date
as
begin
	select TableFood.name, DateCheckIn, DateCheckOut 
	from Bill, TableFood 
	where DateCheckIn >= @checkin and DateCheckOut <= @checkout and Bill.status = 1 
	and TableFood.id = Bill.idTable
end
go

create proc USP_GetListBillAndPage
@checkin date, @checkout date, @page int
as
begin
	declare @pageRows int = 10
	declare @selectRows int = @pageRows * @page
	declare @exceptRows int = (@page - 1) * @pageRows

	;with BillShow as (select TableFood.name, DateCheckIn, DateCheckOut 
	from Bill, TableFood 
	where DateCheckIn >= @checkin and DateCheckOut <= @checkout and Bill.status = 1 
	and TableFood.id = Bill.idTable)

	select top (@selectRows) * from BillShow
	except
	select top (@exceptRows) * from BillShow
end
go

delete from Bill

alter table Bill
add totalprice int

update Bill set totalprice = 0

select * from Bill
