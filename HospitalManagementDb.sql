USE [master]
GO
/****** Object:  Database [HospitalManagementDb]    Script Date: 26-03-2020 3.56.54 AM ******/
CREATE DATABASE [HospitalManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HospitalManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HospitalManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HospitalManagementDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalManagementDb] SET QUERY_STORE = OFF
GO
USE [HospitalManagementDb]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[DoctorPhoneNumber] [char](11) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vDoctorDepartments]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDoctorDepartments]
AS
SELECT dbo.Doctors.DoctorId, dbo.Doctors.DoctorName, dbo.Doctors.DoctorPhoneNumber, dbo.Departments.DepartmentName
FROM     dbo.Departments INNER JOIN
                  dbo.Doctors ON dbo.Departments.DepartmentId = dbo.Doctors.DepartmentId
GO
/****** Object:  Table [dbo].[HealthCareAssistants]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCareAssistants](
	[HealthCareAssistantId] [int] IDENTITY(1,1) NOT NULL,
	[HealthCareAssistantName] [varchar](50) NOT NULL,
	[HealthCareAssistantPhoneNumber] [char](11) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_HealthCareAssistants] PRIMARY KEY CLUSTERED 
(
	[HealthCareAssistantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vHealthCareAssistants]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vHealthCareAssistants]
AS
SELECT dbo.HealthCareAssistants.HealthCareAssistantId, dbo.HealthCareAssistants.HealthCareAssistantName, dbo.HealthCareAssistants.HealthCareAssistantPhoneNumber, dbo.Departments.DepartmentName
FROM     dbo.Departments INNER JOIN
                  dbo.HealthCareAssistants ON dbo.Departments.DepartmentId = dbo.HealthCareAssistants.DepartmentId
GO
/****** Object:  Table [dbo].[StaffAssignToPatients]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAssignToPatients](
	[PatientsDoctorId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[HealthCareAssistantId] [int] NOT NULL,
 CONSTRAINT [PK_PatientDoctors] PRIMARY KEY CLUSTERED 
(
	[PatientsDoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[PhoneNumber] [char](11) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Disease] [varchar](50) NOT NULL,
	[AdmitDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vStaffAssignToPatients]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vStaffAssignToPatients]
AS
SELECT dbo.StaffAssignToPatients.PatientsDoctorId, dbo.StaffAssignToPatients.PatientId, dbo.Patients.PatientName, dbo.Patients.PhoneNumber, dbo.Doctors.DoctorId, dbo.Doctors.DoctorName, dbo.Doctors.DoctorPhoneNumber, 
                  dbo.HealthCareAssistants.HealthCareAssistantName, dbo.HealthCareAssistants.HealthCareAssistantPhoneNumber, dbo.Departments.DepartmentName
FROM     dbo.Doctors INNER JOIN
                  dbo.StaffAssignToPatients ON dbo.Doctors.DoctorId = dbo.StaffAssignToPatients.DoctorId INNER JOIN
                  dbo.HealthCareAssistants ON dbo.StaffAssignToPatients.HealthCareAssistantId = dbo.HealthCareAssistants.HealthCareAssistantId INNER JOIN
                  dbo.Patients ON dbo.StaffAssignToPatients.PatientId = dbo.Patients.PatientId INNER JOIN
                  dbo.Departments ON dbo.Doctors.DepartmentId = dbo.Departments.DepartmentId AND dbo.HealthCareAssistants.DepartmentId = dbo.Departments.DepartmentId
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drugs](
	[DrugId] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [varchar](50) NOT NULL,
	[DrugDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[DrugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientDrugDetails]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDrugDetails](
	[PatientDrugDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DrugDescription] [varchar](50) NOT NULL,
	[DrugId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
 CONSTRAINT [PK_PatientDrugDetails] PRIMARY KEY CLUSTERED 
(
	[PatientDrugDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vPatientDrugDetails]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPatientDrugDetails]
AS
SELECT dbo.PatientDrugDetails.PatientId, dbo.Patients.PatientName, dbo.Drugs.DrugName, dbo.PatientDrugDetails.DrugDescription
FROM     dbo.Drugs INNER JOIN
                  dbo.PatientDrugDetails ON dbo.Drugs.DrugId = dbo.PatientDrugDetails.DrugId INNER JOIN
                  dbo.Patients ON dbo.PatientDrugDetails.PatientId = dbo.Patients.PatientId
GO
/****** Object:  View [dbo].[vHealthCareAssistant]    Script Date: 26-03-2020 3.56.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vHealthCareAssistant]
AS
SELECT dbo.HealthCareAssistants.HealthCareAssistantId, dbo.HealthCareAssistants.HealthCareAssistantName, dbo.HealthCareAssistants.HealthCareAssistantPhoneNumber, dbo.Departments.DepartmentName
FROM     dbo.Departments INNER JOIN
                  dbo.HealthCareAssistants ON dbo.Departments.DepartmentId = dbo.HealthCareAssistants.DepartmentId
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Departments]
GO
ALTER TABLE [dbo].[HealthCareAssistants]  WITH CHECK ADD  CONSTRAINT [FK_HealthCareAssistants_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[HealthCareAssistants] CHECK CONSTRAINT [FK_HealthCareAssistants_Departments]
GO
ALTER TABLE [dbo].[PatientDrugDetails]  WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDetails_Drugs] FOREIGN KEY([DrugId])
REFERENCES [dbo].[Drugs] ([DrugId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PatientDrugDetails] CHECK CONSTRAINT [FK_PatientDrugDetails_Drugs]
GO
ALTER TABLE [dbo].[PatientDrugDetails]  WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDetails_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PatientDrugDetails] CHECK CONSTRAINT [FK_PatientDrugDetails_Patients]
GO
ALTER TABLE [dbo].[StaffAssignToPatients]  WITH CHECK ADD  CONSTRAINT [FK_PatientDoctors_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StaffAssignToPatients] CHECK CONSTRAINT [FK_PatientDoctors_Doctors]
GO
ALTER TABLE [dbo].[StaffAssignToPatients]  WITH CHECK ADD  CONSTRAINT [FK_PatientDoctors_HealthCareAssistants] FOREIGN KEY([HealthCareAssistantId])
REFERENCES [dbo].[HealthCareAssistants] ([HealthCareAssistantId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StaffAssignToPatients] CHECK CONSTRAINT [FK_PatientDoctors_HealthCareAssistants]
GO
ALTER TABLE [dbo].[StaffAssignToPatients]  WITH CHECK ADD  CONSTRAINT [FK_PatientDoctors_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StaffAssignToPatients] CHECK CONSTRAINT [FK_PatientDoctors_Patients]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "Departments"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Doctors"
            Begin Extent = 
               Top = 7
               Left = 311
               Bottom = 170
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2316
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vDoctorDepartments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vDoctorDepartments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "Departments"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HealthCareAssistants"
            Begin Extent = 
               Top = 7
               Left = 311
               Bottom = 170
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2508
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vHealthCareAssistant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vHealthCareAssistant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "Departments"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HealthCareAssistants"
            Begin Extent = 
               Top = 7
               Left = 311
               Bottom = 170
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2508
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vHealthCareAssistants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vHealthCareAssistants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "Drugs"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PatientDrugDetails"
            Begin Extent = 
               Top = 7
               Left = 300
               Bottom = 170
               Right = 527
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 7
               Left = 575
               Bottom = 170
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPatientDrugDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPatientDrugDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[28] 2[20] 3) )"
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
         Begin Table = "Doctors"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StaffAssignToPatients"
            Begin Extent = 
               Top = 157
               Left = 444
               Bottom = 320
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HealthCareAssistants"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 557
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 7
               Left = 605
               Bottom = 170
               Right = 799
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Departments"
            Begin Extent = 
               Top = 7
               Left = 847
               Bottom = 126
               Right = 1062
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStaffAssignToPatients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStaffAssignToPatients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStaffAssignToPatients'
GO
USE [master]
GO
ALTER DATABASE [HospitalManagementDb] SET  READ_WRITE 
GO
