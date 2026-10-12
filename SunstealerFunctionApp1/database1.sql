USE [master]
GO
/****** Object:  Database [database1]    Script Date: 10/11/2026 7:41:22 PM ******/
CREATE DATABASE [database1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'database1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\database1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'database1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\database1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [database1] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [database1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [database1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [database1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [database1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [database1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [database1] SET ARITHABORT OFF 
GO
ALTER DATABASE [database1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [database1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [database1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [database1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [database1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [database1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [database1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [database1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [database1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [database1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [database1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [database1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [database1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [database1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [database1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [database1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [database1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [database1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [database1] SET  MULTI_USER 
GO
ALTER DATABASE [database1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [database1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [database1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [database1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [database1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [database1] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [database1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [database1] SET QUERY_STORE = ON
GO
ALTER DATABASE [database1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [database1]
GO
/****** Object:  ColumnMasterKey [CMK]    Script Date: 10/11/2026 7:41:22 PM ******/
CREATE COLUMN MASTER KEY [CMK]
WITH
(
	KEY_STORE_PROVIDER_NAME = N'AZURE_KEY_VAULT',
	KEY_PATH = N'https://sunstealerkv.vault.azure.net/keys/AlwaysEncrypted/6bafe0e515a74bbea21977c2c8e7d0e9'
)
GO
/****** Object:  ColumnEncryptionKey [CEK]    Script Date: 10/11/2026 7:41:22 PM ******/
CREATE COLUMN ENCRYPTION KEY [CEK]
WITH VALUES
(
	COLUMN_MASTER_KEY = [CMK],
	ALGORITHM = 'RSA_OAEP',
	ENCRYPTED_VALUE = 0x01B4000001680074007400700073003A002F002F00730075006E0073007400650061006C00650072006B0076002E007600610075006C0074002E0061007A007500720065002E006E00650074002F006B006500790073002F0061006C00770061007900730065006E0063007200790070007400650064002F00360062006100660065003000650035003100350061003700340062006200650061003200310039003700370063003200630038006500370064003000650039004723148EB5C03C5CEE49787F0C538CF50A0F29B26109D48645CE67E3628AB843D99FBA75E5DC88F15F5608D02D9BE4383EDB229B881176E795A2F99DF7ABA7FE07C0CBF4651E111C91EC1A38B635682450582DD5EE844E61E25F1D44293EEBE49CD911F699359170721EDF0EE2A2F6D521E47F59C1F8041E4200570DC0F98BF1A3EACF040FB76DF080A5147A4F8D752B04F4DD81398C586E01961E94931FB26185927FEAC3A473221F4868D8F17368D3AF951B9D0C2E80FAEAA0F51266B0C92FCC82BEC899970355A5CB1182A9AF98F70C453EFEB514A884CF2EA50B983F4BA7EACD873DF6EA055E9E9F86A0A6505448FB5762D9E43666315F9801EEA50B20F125A739152237B6E386272ECFE2D4EA410A3C7424FB6CC65A1DE26C82A39BCCAB5E3E89E178FFE683BB1A7BE45E9E0CBACB3DDE5CBF794F20D9AE869CE069BFF2CFEE0C9004A025D9C155390A1C3DDAFD22B4EAC0B2E0B3A02CD76EBAD5335688654FB429436AE539A1B213ABB134768555C5190ECD340367CC09D13C33B852A5860E78DB173E526B099EC91971AAB38CB0F7ABFDF329FE0DB5F11732724A309A0D2603F9413A202948597EB172D4ABD4ABCBAC8EF4851DF617D8DA49245D6455A4686299C37876665729FC0F436E200A5B6F799435891FCF178F9177CA857B383A0A55CC63582B49C711C7EFD350DFE533BE19A4E0104C84441622FB7BD5D961
)
GO
/****** Object:  Table [dbo].[table2]    Script Date: 10/11/2026 7:41:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table2](
	[UUID] [int] IDENTITY(1,1) NOT NULL,
	[Date2] [datetime] NOT NULL,
	[Text2] [varchar](255) NOT NULL,
	[UUID_table1] [int] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_table2] PRIMARY KEY CLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table3]    Script Date: 10/11/2026 7:41:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table3](
	[UUID] [int] IDENTITY(1,1) NOT NULL,
	[Date3] [datetime] NOT NULL,
	[Text3] [varchar](255) NOT NULL,
	[UUID_table1] [int] NOT NULL,
	[RowVerstion] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[table1]    Script Date: 10/11/2026 7:41:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table1](
	[UUID] [int] IDENTITY(1,1) NOT NULL,
	[Date1] [datetime] NOT NULL,
	[Encrypted1] [varchar](200) NOT NULL,
	[Number1] [int] NOT NULL,
	[Text1] [varchar](255) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_table1] PRIMARY KEY CLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_view1]    Script Date: 10/11/2026 7:41:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_view1]
AS
SELECT        t1.Date1, t1.Encrypted1, t1.Number1, t1.Text1, t1.RowVersion AS table1_RowVersion, t2.Text2, t2.RowVersion AS table2_RowVersion, t2.Date2, dbo.table3.Date3, dbo.table3.Text3
FROM            dbo.table1 AS t1 INNER JOIN
                         dbo.table3 ON t1.UUID = dbo.table3.UUID_table1 LEFT OUTER JOIN
                         dbo.table2 AS t2 ON t1.UUID = t2.UUID_table1
GO
ALTER TABLE [dbo].[table2]  WITH CHECK ADD  CONSTRAINT [FK_table2_table1] FOREIGN KEY([UUID_table1])
REFERENCES [dbo].[table1] ([UUID])
GO
ALTER TABLE [dbo].[table2] CHECK CONSTRAINT [FK_table2_table1]
GO
ALTER TABLE [dbo].[table3]  WITH CHECK ADD  CONSTRAINT [FK_table_3_table1] FOREIGN KEY([UUID_table1])
REFERENCES [dbo].[table1] ([UUID])
GO
ALTER TABLE [dbo].[table3] CHECK CONSTRAINT [FK_table_3_table1]
GO
/****** Object:  StoredProcedure [dbo].[sp_getrow]    Script Date: 10/11/2026 7:41:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getrow]
@encrypted1 VARCHAR (200)='', @number1 INT=0, @text1 VARCHAR (255)=''
AS
BEGIN
    SET NOCOUNT ON;
    SELECT *
    FROM   table1
    WHERE  encrypted1 = @encrypted1
           AND number1 = @number1
           AND text1 = @text1;
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[37] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 3
               Left = 481
               Bottom = 133
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "table3"
            Begin Extent = 
               Top = 106
               Left = 674
               Bottom = 236
               Right = 844
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_view1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_view1'
GO
USE [master]
GO
ALTER DATABASE [database1] SET  READ_WRITE 
GO


drop table #Temp1;*/
