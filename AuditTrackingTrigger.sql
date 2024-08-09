/*•	Implementation of a trigger that automatically updates a historical tracking table 
whenever a shipment record is modified or deleted.*/  
select * from Shipments
CREATE TABLE Audit_table_On_shipment 
(
    shipmentID  int,
    UserName  varchar(50),
    ModifiedDate  date,
    Quantity_Old  int,
    Quantity_New  int
);
-- the trigger 
create trigger t1
on Shipments 
instead of update 
as 
	if update(Quantity)
	begin 
	declare @new_Quantity int , @old_Quantity int , @shipmentID int
	select @old_Quantity = Quantity from deleted 
	select @new_Quantity = Quantity from inserted  
	select @shipmentID = shipmentID from deleted 
	insert into Audit_table_On_shipment
	values(@shipmentID ,SUSER_NAME(), GETDATE(),  @old_Quantity, @new_Quantity);
	end 

