CREATE PROCEDURE [dbo].[sp_Customer_Get]
	@Id int
AS
BEGIN
	SELECT *
	FROM dbo.Customer
	where Id = @Id;
END
