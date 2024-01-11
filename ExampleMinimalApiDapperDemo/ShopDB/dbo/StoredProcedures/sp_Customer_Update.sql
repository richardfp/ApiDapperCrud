CREATE PROCEDURE [dbo].[sp_Customer_Update]
	@Id int,
	@FisrtName nvarchar(50),
	@LastName nvarchar(50)
AS
BEGIN
	UPDATE dbo.Customer
	set FisrtName = @FisrtName,
	LastName = @LastName
	WHERE Id = @Id
END
