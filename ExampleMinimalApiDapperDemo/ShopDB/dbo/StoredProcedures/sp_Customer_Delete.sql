CREATE PROCEDURE [dbo].[sp_Customer_Delete]
	@Id int
AS
BEGIN
	DELETE FROM  dbo.Customer
	WHERE Id = @Id
END
