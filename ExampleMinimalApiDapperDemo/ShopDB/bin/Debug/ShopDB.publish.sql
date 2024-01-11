/*
Script de implantação para master

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "master"
:setvar DefaultFilePrefix "master"
:setvar DefaultDataPath "/var/opt/mssql/data/"
:setvar DefaultLogPath "/var/opt/mssql/data/"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Criando Tabela [dbo].[Customer]...';


GO
CREATE TABLE [dbo].[Customer] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [FisrtName] NVARCHAR (50) NULL,
    [LastName]  NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Criando Procedimento [dbo].[sp_Customer_Delete]...';


GO
CREATE PROCEDURE [dbo].[sp_Customer_Delete]
	@Id int
AS
BEGIN
	DELETE FROM  dbo.Customer
	WHERE Id = @Id
END
GO
PRINT N'Criando Procedimento [dbo].[sp_Customer_Get]...';


GO
CREATE PROCEDURE [dbo].[sp_Customer_Get]
	@Id int
AS
BEGIN
	SELECT *
	FROM dbo.Customer
	where Id = @Id;
END
GO
PRINT N'Criando Procedimento [dbo].[sp_Customer_GetAll]...';


GO
CREATE PROCEDURE [dbo].[sp_Customer_GetAll]

AS
BEGIN
	SELECT *
	FROM dbo.Customer
END
GO
PRINT N'Criando Procedimento [dbo].[sp_Customer_Insert]...';


GO
CREATE PROCEDURE [dbo].[sp_Customer_Insert]
	@FistName nvarchar(50),
	@LastName nvarchar(50)
AS
BEGIN
	INSERT INTO dbo.Customer(FisrtName, LastName)
	Values (@FistName, @LastName)
END
GO
PRINT N'Criando Procedimento [dbo].[sp_Customer_Update]...';


GO
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
GO
if not exists (select 1 From dbo.Customer)
BEGIN
	Insert into DBO.Customer(FisrtName, LastName)
	VALUES ('Daniel','Jesus'), ('Renato','Groofe'), ('Thiago','Adriano'),('Ray','Carneiro')
END
GO

GO
PRINT N'Atualização concluída.';


GO
