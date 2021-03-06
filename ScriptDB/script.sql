USE [master]
GO
/****** Object:  Database [DbRoulette]    Script Date: 23/11/2020 10:42:44 ******/
CREATE DATABASE [DbRoulette]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbRoulette', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\DbRoulette.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbRoulette_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\DbRoulette_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DbRoulette] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbRoulette].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbRoulette] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbRoulette] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbRoulette] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbRoulette] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbRoulette] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbRoulette] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbRoulette] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbRoulette] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbRoulette] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbRoulette] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbRoulette] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbRoulette] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbRoulette] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbRoulette] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbRoulette] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbRoulette] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbRoulette] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbRoulette] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbRoulette] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbRoulette] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbRoulette] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbRoulette] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbRoulette] SET RECOVERY FULL 
GO
ALTER DATABASE [DbRoulette] SET  MULTI_USER 
GO
ALTER DATABASE [DbRoulette] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbRoulette] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbRoulette] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbRoulette] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbRoulette] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbRoulette] SET QUERY_STORE = OFF
GO
USE [DbRoulette]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DbRoulette]
GO
/****** Object:  Table [dbo].[Bet]    Script Date: 23/11/2020 10:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bet](
	[IdBet] [int] IDENTITY(1,1) NOT NULL,
	[IdRoulette] [int] NOT NULL,
	[IdPlayer] [int] NOT NULL,
	[TypeBet] [int] NOT NULL,
	[ValueBet] [varchar](5) NULL,
	[AmountBet] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credit]    Script Date: 23/11/2020 10:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credit](
	[IdCredit] [int] IDENTITY(1,1) NOT NULL,
	[IdPlayer] [int] NOT NULL,
	[AmountCredit] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCredit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 23/11/2020 10:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[IdPlayer] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Status] [bit] NOT NULL,
	[Password] [varchar](120) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPlayer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roulette]    Script Date: 23/11/2020 10:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roulette](
	[IdRoulette] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ChangeDate] [datetime] NULL,
	[Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRoulette] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bet]  WITH CHECK ADD FOREIGN KEY([IdPlayer])
REFERENCES [dbo].[Player] ([IdPlayer])
GO
ALTER TABLE [dbo].[Bet]  WITH CHECK ADD FOREIGN KEY([IdRoulette])
REFERENCES [dbo].[Roulette] ([IdRoulette])
GO
ALTER TABLE [dbo].[Credit]  WITH CHECK ADD FOREIGN KEY([IdPlayer])
REFERENCES [dbo].[Player] ([IdPlayer])
GO
/****** Object:  StoredProcedure [dbo].[PR_CLOSED_BET]    Script Date: 23/11/2020 10:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CLOSED_BET]
	@IdRoulette int,
	@Message varchar(100) out
AS    
BEGIN     
BEGIN TRY
	if((select count(*) from [dbo].[Roulette] WHERE IdRoulette = @IdRoulette and Status = 1) > 0)
	BEGIN
		DECLARE @WinNumber varchar(5) = FLOOR(RAND()*(36-0)+0)
		DECLARE @WinColor varchar(5)

		UPDATE [dbo].[Roulette]
		SET Status = 0
		WHERE IdRoulette = @IdRoulette

		IF(@WinNumber%2 = 0)
		BEGIN
			SET @WinColor = 'rojo'
		END
		ELSE
		BEGIN
			SET @WinColor = 'negro'
		END

		select *,(AmountBet * 5) as Win from [dbo].[Bet]
		where IdRoulette = 1 and TypeBet=1  and ValueBet = @WinNumber
		union all
		select *,(AmountBet * 1.8) as Win from [dbo].[Bet]
		where IdRoulette = 1 and TypeBet=2  and ValueBet = @WinColor
		union all
		select *,0 as Win from [dbo].[Bet]
		where IdRoulette = 1 and TypeBet=1  and ValueBet != @WinNumber
		union all
		select *,0 as Win from [dbo].[Bet]
		where IdRoulette = 1 and TypeBet=2  and ValueBet != @WinColor

		SET @Message = 'Gano el numero:'+@WinNumber+',color: '+@WinColor
	END   
	ELSE
	BEGIN
		select *,CAST(0 as float) as Win from [dbo].[Bet]
		SET @Message = 'La ruleta ya se encuentra cerrada.'
	END
END TRY    
BEGIN CATCH      
	SELECT
		ERROR_NUMBER() AS NumeroError,
		ERROR_SEVERITY() AS SeveridadError,
		ERROR_STATE() AS EstadoError,
		ERROR_PROCEDURE() AS ErrorProcedimiento,
		ERROR_LINE() AS LineaError,
		ERROR_MESSAGE() AS MensajeError        
END catch        
END
GO
/****** Object:  StoredProcedure [dbo].[PR_INSERT_BET]    Script Date: 23/11/2020 10:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_INSERT_BET]
	@IdRoulette int,
    @IdPlayer int,
    @TypeBet int,
    @ValueBet varchar(5),
    @AmountBet float,
	@Message varchar(100) out
AS    
BEGIN     
BEGIN TRY
 if((select count(*) from [dbo].[Roulette] WHERE IdRoulette = @IdRoulette and Status = 1) > 0)
 BEGIN   
	IF (@TypeBet = 1)
	BEGIN
	 set @Message = 'Guardo la apuesta.'
	 EXECUTE [dbo].[PR_INSERT_BET_NUMBER] 
	 @IdRoulette
	,@IdPlayer
	,@TypeBet
	,@ValueBet
	,@AmountBet
	,@Message OUTPUT

	END
	IF (@TypeBet = 2)
	BEGIN
	 set @Message = 'Guardo la apuesta.'
	 EXECUTE [dbo].[PR_INSERT_BET_COLOUR] 
	 @IdRoulette
	,@IdPlayer
	,@TypeBet
	,@ValueBet
	,@AmountBet
	,@Message OUTPUT

	END
	IF (@TypeBet != 2 and @TypeBet != 1)
	BEGIN
	 set @Message = 'Ingrese un tipo de apuesta valido 1=> numero, 2=> color.'
	END
 END   
 ELSE
 BEGIN
   SET @Message = 'La ruleta ya se encuentra cerrada.'
 END
END TRY    
BEGIN CATCH      
	SELECT
		ERROR_NUMBER() AS NumeroError,
		ERROR_SEVERITY() AS SeveridadError,
		ERROR_STATE() AS EstadoError,
		ERROR_PROCEDURE() AS ErrorProcedimiento,
		ERROR_LINE() AS LineaError,
		ERROR_MESSAGE() AS MensajeError        
END catch        
END
GO
/****** Object:  StoredProcedure [dbo].[PR_INSERT_BET_COLOUR]    Script Date: 23/11/2020 10:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_INSERT_BET_COLOUR]
	@IdRoulette int,
    @IdPlayer int,
    @TypeBet int,
    @ValueBet varchar(5),
    @AmountBet float,
	@Message varchar(100) out
AS    
BEGIN 

BEGIN TRY
	DECLARE @ColourRed varchar(5) = 'rojo';
	DECLARE @ColourBlack varchar(5) = 'negro';
	DECLARE @AmountBetMax float =  10000;
	DECLARE @AmountBetMin float =  1;

	IF(@ValueBet = @ColourRed or @ValueBet = @ColourBlack)
	BEGIN
		IF(@AmountBet >= @AmountBetMin and @AmountBet <= @AmountBetMax)
		BEGIN
			INSERT INTO [dbo].[Bet]
			  ([IdRoulette]
			  ,[IdPlayer]
			  ,[TypeBet]
			  ,[ValueBet]
			  ,[AmountBet])
			VALUES
			  (@IdRoulette,
			   @IdPlayer,
			   @TypeBet,
			   @ValueBet,
			   @AmountBet)
		END
		ELSE
		BEGIN
			set @Message = 'Ingrese una apuesta entre 1$ y 10.000$'
		END
	END
	ELSE
	BEGIN
		set @Message = 'Ingrese un color valido (rojo,negro)'
	END
END TRY    
BEGIN CATCH      
	SELECT
		ERROR_NUMBER() AS NumeroError,
		ERROR_SEVERITY() AS SeveridadError,
		ERROR_STATE() AS EstadoError,
		ERROR_PROCEDURE() AS ErrorProcedimiento,
		ERROR_LINE() AS LineaError,
		ERROR_MESSAGE() AS MensajeError        
END catch        
END
GO
/****** Object:  StoredProcedure [dbo].[PR_INSERT_BET_NUMBER]    Script Date: 23/11/2020 10:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_INSERT_BET_NUMBER]
	@IdRoulette int,
    @IdPlayer int,
    @TypeBet int,
    @ValueBet varchar(5),
    @AmountBet float,
	@Message varchar(100) out
AS    
BEGIN 

BEGIN TRY
	DECLARE @NumberBetMax int = 36;
	DECLARE @NumberBetMin int = 0;
	DECLARE @AmountBetMax float =  10000;
	DECLARE @AmountBetMin float =  1;
	DECLARE @NumberBet int = -1;
	BEGIN TRY
		SET @NumberBet = CAST(@ValueBet AS INT);
	END TRY    
	BEGIN CATCH
		set @Message = 'Ingrese una numero entre 0 y 36'
	END CATCH
	IF(@NumberBet >= @NumberBetMin and @NumberBet <= @NumberBetMax)
	BEGIN
		IF(@AmountBet >= @AmountBetMin and @AmountBet <= @AmountBetMax)
		BEGIN
			INSERT INTO [dbo].[Bet]
           ([IdRoulette]
           ,[IdPlayer]
           ,[TypeBet]
           ,[ValueBet]
           ,[AmountBet])
			VALUES
           (@IdRoulette,
			@IdPlayer,
			@TypeBet,
			@ValueBet,
			@AmountBet)
		END
		ELSE
		BEGIN
			set @Message = 'Ingrese una apuesta entre 1$ y 10.000$'
		END
	END
	ELSE
	BEGIN
		set @Message = 'Ingrese una numero entre 0 y 36'
	END
END TRY    
BEGIN CATCH      
	SELECT
		ERROR_NUMBER() AS NumeroError,
		ERROR_SEVERITY() AS SeveridadError,
		ERROR_STATE() AS EstadoError,
		ERROR_PROCEDURE() AS ErrorProcedimiento,
		ERROR_LINE() AS LineaError,
		ERROR_MESSAGE() AS MensajeError        
END catch        
END
GO
USE [master]
GO
ALTER DATABASE [DbRoulette] SET  READ_WRITE 
GO
