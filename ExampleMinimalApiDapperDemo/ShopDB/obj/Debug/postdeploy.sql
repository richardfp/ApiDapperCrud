if not exists (select 1 From dbo.Customer)
BEGIN
	Insert into DBO.Customer(FisrtName, LastName)
	VALUES ('Daniel','Jesus'), ('Renato','Groofe'), ('Thiago','Adriano'),('Ray','Carneiro')
END
GO
