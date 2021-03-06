USE [master]
GO
/****** Object:  Database [BanHoa]    Script Date: 4/21/2018 12:22:58 AM ******/
CREATE DATABASE [BanHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanHoa', FILENAME = N'E:\SQLSever\MSSQL12.HAOSV\MSSQL\DATA\BanHoa.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BanHoa_log', FILENAME = N'E:\SQLSever\MSSQL12.HAOSV\MSSQL\DATA\BanHoa_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BanHoa] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanHoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanHoa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanHoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanHoa] SET  MULTI_USER 
GO
ALTER DATABASE [BanHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanHoa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BanHoa] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BanHoa]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/21/2018 12:22:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [varchar](50) NOT NULL,
	[Pass] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Phone] [varchar](50) NULL,
	[Permision] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/21/2018 12:22:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Cate_id] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/21/2018 12:22:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[Detail] [ntext] NULL,
	[Descrip] [ntext] NULL,
	[Review] [nvarchar](250) NULL,
	[Img] [varchar](120) NULL,
	[Cate_id] [int] NULL,
 CONSTRAINT [PK__Product__3214EC0731B6592F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([UserName], [Pass], [Name], [Age], [Phone], [Permision]) VALUES (N'admin', N'123', N'Admin', 20, N'012345678', 0)
INSERT [dbo].[Account] ([UserName], [Pass], [Name], [Age], [Phone], [Permision]) VALUES (N'guest1', N'123', N'Khách 1', 20, N'012365498', 1)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Cate_id], [CateName]) VALUES (1, N'Hoa nội địa')
INSERT [dbo].[Category] ([Cate_id], [CateName]) VALUES (2, N'Hoa Hunggari')
INSERT [dbo].[Category] ([Cate_id], [CateName]) VALUES (3, N'Hoa Hà Lan')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Detail], [Descrip], [Review], [Img], [Cate_id]) VALUES (1, N'Hoa hồng xanh', 200, N'Hoa hồng trắng được nhuộm xanh', N'Hoa hồng xanh dương là màu của trời và biển. Nó đi liền với cảm giác sâu thẳm, vững vàng và yên bình. Nó còn là màu của sự trung thành, tin tưởng, thông thái, tự tin, thông minh', N'5 sao', N'bluerose.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Detail], [Descrip], [Review], [Img], [Cate_id]) VALUES (6, N'Hoa cẩm chướng', 2000, N'Hoa cẩm chướng còn gọi là cây thạch trúc, có tên khoa học: Diranthus chinenseis. Cây hoa cẩm chướng thường biểu trưng cho tình bạn. Cây cẩm chướng là cây thân thảo lâu năm, lá mọc đối xứng, hoa mọc trên đỉnh. ', N'một loài hoa đẹp có hương thơm ngọt ngào và mang nhiều ý nghĩa đặc biệt. Hoa tượng trưng cho tình bè bạn, tình yêu trong sáng sâu đậm và thanh cao. Hoa có màu sắc sặc sỡ, thích hợp trồng làm cây sân vườn hoặc cây nội thất trang trí, trồng cắt cành cắm lọ.', N'4 sao', N'camchuong.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Detail], [Descrip], [Review], [Img], [Cate_id]) VALUES (7, N'Hoa cẩm tú cầu', 50000, N'Rất hiếm, số lượng có hạn', N'hoa cẩm tú cầu là một trong những loại hoa mang vẻ đẹp quyến rũ, duyên dáng và nữ tính nhất. Chỉ bằng cái tên “cẩm tú cầu” cũng đã toát lên hết những cái nét duyên của người phụ nữ', N'2sao', N'camtucau.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Detail], [Descrip], [Review], [Img], [Cate_id]) VALUES (8, N'Hoa hồng', 10000, N'Hoa hồng đỏ truyền thống', N'Biểu tượng của tình yêu, món quà phổ biến dành cho phái đẹp', N'3sao', N'rose.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Detail], [Descrip], [Review], [Img], [Cate_id]) VALUES (9, N'Hoa sen', 30000, N'Hoa sen hay còn gọi là liên hoa, là loại hoa thủy sinh sống lâu năm. Hoa sen được chọn làm quốc hoa, là biểu tượng sức sống mãnh liệt của dân tộc Việt Nam. Hãy cùng mrhoa.com tìm hiểu về loại hoa đặc biệt này nhé.', N'Có thể nói rằng, hoa sen có những phẩm chất thanh cao hiếm loài hoa nào sánh được. Hiện nay, hoa sen có nhiều màu sắc khác nhau như hoa sen trắng, sen hồng, sen xanh…

Khi nhắc đến ý nghĩa hoa sen, nhiều người sẽ nghĩ ngay đến sự thanh cao, thuần khiết và nghị lực khiên cường. Nhưng với mỗi loại sen sẽ có những ý nghĩa đặc trưng riêng.

Nếu hoa sen xanh biểu thị cho sức mạnh ý chí, nghị lực kiên cường và niềm tin thì những bông hoa sen trắng là là tượng trưng cho sự trong sáng tuyệt đối, sự thuần khiết của linh hồn.', N'5 sao', N'hoasen.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Detail], [Descrip], [Review], [Img], [Cate_id]) VALUES (10, N'Hoa hướng dương', 50000, N'Những đóa hoa hướng dương hệt như ánh mặt trời rực rỡ - chính vậy mà hướng dương được xem là loài hoa tượng trưng cho sự đam mê mãnh liệt.Một loài hoa tươi sáng và vui vẻ, mạnh mẽ nhưng cũng đầy dịu dàng và đam mê -Hướng Dương chính là một món quà bày tỏ sự quan tâm ấm áp nhất.', N'Những đóa hoa hướng dương hệt như ánh mặt trời rực rỡ - chính vậy mà hướng dương được xem là loài hoa tượng trưng cho sự đam mê mãnh liệt.Một loài hoa tươi sáng và vui vẻ, mạnh mẽ nhưng cũng đầy dịu dàng và đam mê -Hướng Dương chính là một món quà bày tỏ sự quan tâm ấm áp nhất.', N'5 sao', N'huongduong.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Detail], [Descrip], [Review], [Img], [Cate_id]) VALUES (11, N'Hoa tuy lip', 80000, N'Hoa tulip có nguồn gốc từ Phương Đông, rất đuợc người Thổ Nhĩ Kỳ yêu mến, và nó cũng đuợc đánh giá cao bởi người Ba Tư', N'Loài hoa có dáng hình xinh xắn như chiếc chuông trở ngược, vững vàng trên cuống hoa rắn chắc kết hợp thành 1 thế đứng thật uy nghi nhưng không kém phần duyên dáng dịu dàng nhờ cánh lá xanh mướt thon dài ôm theo cọng hoa hướng trục thẳng. Mềm nhưng không mềm, cứng nhưng không rắn đó là đặc điểm nổi bật nhất của tulip. Bên ngoài yếu đuối nhưng bên trong thì mạnh mẽ, quyết đoán luôn tràn đầy nhựa sống....', N'4 sao', N'tuylip.jpg', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Cate_id__145C0A3F] FOREIGN KEY([Cate_id])
REFERENCES [dbo].[Category] ([Cate_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Cate_id__145C0A3F]
GO
USE [master]
GO
ALTER DATABASE [BanHoa] SET  READ_WRITE 
GO
