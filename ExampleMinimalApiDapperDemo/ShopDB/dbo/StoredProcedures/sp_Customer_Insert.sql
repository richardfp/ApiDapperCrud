CREATE PROCEDURE [dbo].[sp_Customer_Insert]
	@FistName nvarchar(50),
	@LastName nvarchar(50)
AS
BEGIN
	INSERT INTO dbo.Customer(FisrtName, LastName)
	Values (@FistName, @LastName)
END
