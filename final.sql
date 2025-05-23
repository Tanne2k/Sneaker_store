USE [Webbando]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Age] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[PostDate] [datetime2](7) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ImgUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[IdDiscount] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Percentage] [float] NOT NULL,
	[Expdate] [datetime2](7) NOT NULL,
	[Remain] [int] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[IdDiscount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Firstname] [nvarchar](max) NOT NULL,
	[Lastname] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[ShippingAddress] [nvarchar](max) NOT NULL,
	[Numberphone] [nvarchar](10) NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[IdProduct] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[ListImg] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[SizeId] [int] NULL,
	[ColorId] [int] NULL,
	[MoTaDai] [nvarchar](max) NULL,
	[BinhLuan] [nvarchar](500) NULL,
	[DiemDanhGia] [int] NULL,
	[SoLuongTon] [int] NULL,
	[SideImage1] [nvarchar](max) NULL,
	[SideImage2] [nvarchar](max) NULL,
	[SideImage3] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/18/2024 1:49:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240322184616_Initial', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240328065718_AddIdentity', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240328071938_ExtendIdentityUser', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240328072255_ExtendIdentityUser1', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240404062039_initialOrder', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240404065521_abc', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406231248_shopgiay', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240411182159_ThemViewModel', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240417171253_dis', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240417171442_dis', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240423114745_enable-user', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240423120124_delete-enable-user', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240425093743_init-isEnabled', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240503055045_slider', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240503062859_slider', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517052847_new', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240518085513_new', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240518100222_new1', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240518161000_new', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240531071333_new', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240601091532_newww', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240601203101_promotion', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240601204959_promotions', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240603174751_new', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240610155028_new', N'8.0.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'16487d54-0361-4a24-9c92-508742c989fa', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'205e8686-13b9-46bc-a3f6-30b012806d87', N'Vistor', N'VISTOR', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'84d813c9-a137-47c7-bd8c-90b1df4dff7b', N'Customer', N'CUSTOMER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd068de79-ef86-4ee8-876b-fec5d26d2118', N'Employee', N'EMPLOYEE', N'b653bbfc-e514-45fc-8512-6dd048b5516b')
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'101627037730446625129', N'Google', N'ab249d06-2f92-45f8-8330-a09c7ac52ae0')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'112693309858835819541', N'Google', N'ba338da6-f406-471f-9ba9-ebfc1e4f678d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0033a9e7-d7ba-4de4-b9c9-88b88830e503', N'84d813c9-a137-47c7-bd8c-90b1df4dff7b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3ee70239-fe2a-4e30-9e15-cf1cc707a6cb', N'16487d54-0361-4a24-9c92-508742c989fa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ab249d06-2f92-45f8-8330-a09c7ac52ae0', N'84d813c9-a137-47c7-bd8c-90b1df4dff7b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6f03c83-0f0f-4feb-ba30-59e7770ff88e', N'16487d54-0361-4a24-9c92-508742c989fa')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0033a9e7-d7ba-4de4-b9c9-88b88830e503', N'customer', NULL, NULL, N'customer@gmail.com', N'CUSTOMER@GMAIL.COM', N'customer@gmail.com', N'CUSTOMER@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAED0Z/wS7iBdlHN6B+nF/LZUDGH0qYpnZKMIqvv4rmI7a7FO08n9nVJ3ENEaTXZu6dQ==', N'CDJ6IVDZG3PD5725KCB6D6F4ECXXFRDK', N'f4646074-c9d7-4e12-acad-d3be7543c8cf', N'123456789', 0, 0, CAST(N'2024-06-17T18:43:41.1544809+00:00' AS DateTimeOffset), 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3ee70239-fe2a-4e30-9e15-cf1cc707a6cb', N'bubu', NULL, NULL, N'bubu@gmail.com', N'BUBU@GMAIL.COM', N'bubu@gmail.com', N'BUBU@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEKcfrjejqUY2vMWkiFKGPu4leoY9Cgz5QI5jPIv3RO0UQz7yg0g8HTynpU6Q+WK3YQ==', N'LVXZDHEQJT4E7UYOLB6BNDBO7D24W3JZ', N'7574efa9-2220-4edb-aa35-b94e57cabb42', NULL, 0, 0, CAST(N'2024-05-23T11:38:18.4844116+00:00' AS DateTimeOffset), 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ab249d06-2f92-45f8-8330-a09c7ac52ae0', N'Đỗ Đăng Nhật Tân', NULL, NULL, N'nhattan.9a7@gmail.com', N'NHATTAN.9A7@GMAIL.COM', N'nhattan.9a7@gmail.com', N'NHATTAN.9A7@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJxmAMhmEiGgEA9VBIBDCE2GYQY3/r2INkFocA2UqneNY6V6X4csQBwS/Cj1B0QF6Q==', N'OG5IUKXB7TFBNOWD6AQQBRUXD55L6CTO', N'ff1b5146-6fc6-4679-9509-5f48d87141ec', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ba338da6-f406-471f-9ba9-ebfc1e4f678d', NULL, NULL, NULL, N'hthin217@gmail.com', N'HTHIN217@GMAIL.COM', N'hthin217@gmail.com', N'HTHIN217@GMAIL.COM', 1, NULL, N'HBSZCKVKLY4ENLJ3OK66LVUIDNMC653Y', N'3bb2630f-fe4f-4004-8e95-75da00b42af8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e6f03c83-0f0f-4feb-ba30-59e7770ff88e', N'admin', NULL, NULL, N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEOREckfJey2FQvj/r6WGNznTlTtOfHI1Xbpw9ja+fHfzcFAj1qN+QKas3NTr0WxlNw==', N'56D6V5BP7GE3JZCZB37MBRQUVB7H6RQ3', N'b57654c8-f46c-4224-9477-143d8e89c4b2', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'0033a9e7-d7ba-4de4-b9c9-88b88830e503', N'[AspNetUserStore]', N'AuthenticatorKey', N'2PY552T67K2PDMZ2SWL2OYR5I4WB6T6C')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1003, N'Nike', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1004, N'Adidas', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1005, N'Converse', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1006, N'Puma', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1007, N'Veja', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1008, N'Jordan', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1009, N'Reebok', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1010, N'SparX', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1011, N'Thượng Đình', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1012, N'LeVi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1013, N'New Balance', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ImgUrl]) VALUES (1014, N'Asics', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Đỏ')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Cam ')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Vàng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Xanh')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Lục')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Trắng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Đen')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (8, N'Hồng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (9, N'Tím')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([IdDiscount], [Code], [Percentage], [Expdate], [Remain]) VALUES (1, N'HongCoGiam', 20, CAST(N'2222-07-10T00:00:00.0000000' AS DateTime2), 955)
INSERT [dbo].[Discounts] ([IdDiscount], [Code], [Percentage], [Expdate], [Remain]) VALUES (2, N'hutech', 20, CAST(N'2024-06-08T15:29:00.0000000' AS DateTime2), 9)
INSERT [dbo].[Discounts] ([IdDiscount], [Code], [Percentage], [Expdate], [Remain]) VALUES (4, N'bubu', 30, CAST(N'2024-06-22T18:26:00.0000000' AS DateTime2), 104)
INSERT [dbo].[Discounts] ([IdDiscount], [Code], [Percentage], [Expdate], [Remain]) VALUES (5, N'kaka', 30, CAST(N'2024-07-06T22:22:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Discounts] ([IdDiscount], [Code], [Percentage], [Expdate], [Remain]) VALUES (6, N'hihi', 30, CAST(N'2024-07-13T00:54:00.0000000' AS DateTime2), 97)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 1, 1022, 1, CAST(775000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (6, 5, 1005, 1, CAST(3239000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (7, 6, 1005, 1, CAST(3239000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (8, 7, 1005, 1, CAST(3239000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Firstname], [Lastname], [OrderDate], [TotalPrice], [ShippingAddress], [Numberphone], [Notes]) VALUES (1, N'0033a9e7-d7ba-4de4-b9c9-88b88830e503', N'123', N'123', CAST(N'2024-06-16T07:33:26.1877912' AS DateTime2), CAST(775000.00 AS Decimal(18, 2)), N'123', N'1231231231', N'123')
INSERT [dbo].[Orders] ([Id], [UserId], [Firstname], [Lastname], [OrderDate], [TotalPrice], [ShippingAddress], [Numberphone], [Notes]) VALUES (5, N'ba338da6-f406-471f-9ba9-ebfc1e4f678d', N'thinh', N'cod', CAST(N'2024-06-18T01:23:41.7751251' AS DateTime2), CAST(3239000.00 AS Decimal(18, 2)), N'ád', N'1231231231', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Firstname], [Lastname], [OrderDate], [TotalPrice], [ShippingAddress], [Numberphone], [Notes]) VALUES (6, N'ba338da6-f406-471f-9ba9-ebfc1e4f678d', N'thinh', N'cod1', CAST(N'2024-06-18T01:25:06.9809114' AS DateTime2), CAST(3239000.00 AS Decimal(18, 2)), N'ád', N'1231231231', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Firstname], [Lastname], [OrderDate], [TotalPrice], [ShippingAddress], [Numberphone], [Notes]) VALUES (7, N'ba338da6-f406-471f-9ba9-ebfc1e4f678d', N'thinh', N'momo', CAST(N'2024-06-18T01:27:12.2994157' AS DateTime2), CAST(3239000.00 AS Decimal(18, 2)), N'123', N'1231231231', NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [Url], [IdProduct], [ProductId]) VALUES (9, N'/template/img/nike-air-force-1.jpg', 1, NULL)
INSERT [dbo].[ProductImages] ([Id], [Url], [IdProduct], [ProductId]) VALUES (10, N'/images/nike-air-force-1.jpg', 1, NULL)
INSERT [dbo].[ProductImages] ([Id], [Url], [IdProduct], [ProductId]) VALUES (11, N'/images/nike-air-force-1.jpg', 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1005, N'Nike Air Force 1 ', CAST(3239000.00 AS Decimal(18, 2)), N'Nice shoes', N'/images/nike-air-force-1.jpg', 1, 1003, 1, 1, N'<p><img alt="" src="https://bizweb.dktcdn.net/100/419/301/files/giay-converse-hoa-tiet.jpg?v=1615480024365" style="float:left; height:133px; width:200px" />Gi&agrave;y Nike Air Jordan 4 Retro &lsquo;Bred Reimagined&rsquo; FV5029-006 l&agrave; một phi&ecirc;n bản đặc biệt của d&ograve;ng sản phẩm Air Jordan, được thiết kế để t&ocirc;n vinh v&agrave; t&aacute;i hiện lại phi&ecirc;n bản kinh điển &ldquo;Bred&rdquo; (Black and Red) của d&ograve;ng Air Jordan 4. Dưới đ&acirc;y l&agrave; m&ocirc; tả chi tiết về sản phẩm n&agrave;y: Thiết kế: Gi&agrave;y c&oacute; thiết kế cơ bản của Air Jordan 4 với phần upper chia th&agrave;nh c&aacute;c mảnh v&agrave; một đế trung lập. M&agrave;u sắc ch&iacute;nh của gi&agrave;y l&agrave; đen (Black) kết hợp với đỏ (Red), đặc trưng của phi&ecirc;n bản &ldquo;Bred&rdquo;. Chất liệu: Upper (phần tr&ecirc;n): Sử dụng chất liệu da v&agrave; vải cao cấp, đảm bảo độ bền v&agrave; thoải m&aacute;i. Đế: Sử dụng c&ocirc;ng nghệ đế Air-Sole của Nike, mang lại sự &ecirc;m &aacute;i v&agrave; đ&agrave;n hồi khi sử dụng. Gi&agrave;y Nike Air Jordan 4 Retro &lsquo;Bred Reimagined&rsquo; FV5029-006 l&agrave; một phi&ecirc;n bản đặc biệt của d&ograve;ng sản phẩm Air Jordan, được thiết kế để t&ocirc;n vinh v&agrave; t&aacute;i hiện lại phi&ecirc;n bản kinh điển &ldquo;Bred&rdquo; (Black and Red) của d&ograve;ng Air Jordan 4. Dưới đ&acirc;y l&agrave; m&ocirc; tả chi tiết về sản phẩm n&agrave;y: Thiết kế: Gi&agrave;y c&oacute; thiết kế cơ bản của Air Jordan 4 với phần upper chia th&agrave;nh c&aacute;c mảnh v&agrave; một đế trung lập. M&agrave;u sắc ch&iacute;nh của gi&agrave;y l&agrave; đen (Black) kết hợp với đỏ (Red), đặc trưng của phi&ecirc;n bản &ldquo;Bred&rdquo;. Chất liệu: Upper (phần tr&ecirc;n): Sử dụng chất liệu da v&agrave; vải cao cấp, đảm bảo độ bền v&agrave; thoải m&aacute;i. Đế: Sử dụng c&ocirc;ng nghệ đế Air-Sole của Nike, mang lại sự &ecirc;m &aacute;i v&agrave; đ&agrave;n hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/2_NB.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1006, N'Nike Air Force 1 Mid By You', CAST(4109000.00 AS Decimal(18, 2)), N'Men''s Custom Shoes', N'/images/nike-air-force-1-mid.jpg', NULL, 1003, 2, 2, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1007, N'Nike Air Max 97 By You', CAST(5589000.00 AS Decimal(18, 2)), N'Custom Women''s Shoes', N'/images/nike-air-max-97.jpg', NULL, 1003, 3, 3, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1008, N'Nike Air Max Pulse', CAST(3527199.00 AS Decimal(18, 2)), N'Men''s Shoes', N'/images/nike-air-max-pulse.jpg', NULL, 1003, 4, 4, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1009, N'Nike Court Vision Low', CAST(2069000.00 AS Decimal(18, 2)), N'Men''s Shoes', N'/images/nike-count-vision.jpg', NULL, 1003, 5, 5, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1010, N'Nike Dunk High By You', CAST(4539000.00 AS Decimal(18, 2)), N'Custom Men''s Shoes', N'/images/nike-dunk-high.jpg', NULL, 1003, 6, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1011, N'Nike Dunk Low SE', CAST(2591199.00 AS Decimal(18, 2)), N'Women''s Shoes', N'/images/nike-dunk-low-se.jpg', NULL, 1003, 7, 7, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1012, N'Nike Go FlyEase', CAST(3829000.00 AS Decimal(18, 2)), N'Easy On/Off Shoes', N'/images/nike-go-flyease.jpg', NULL, 1003, 8, 8, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1013, N'Nike Revolution 7 EasyOn', CAST(1789000.00 AS Decimal(18, 2)), N'Men''s Road Running Shoes', N'/images/nike-revolution-7.jpg', NULL, 1003, 9, 9, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1014, N'GIÀY CAMPUS 00S', CAST(2600000.00 AS Decimal(18, 2)), N'Nam • Originals', N'/images/adidas-campus.jpg', NULL, 1004, 10, 1, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1015, N'GIÀY CHẠY BỘ ADIDAS 4DFWD 2', CAST(5500000.00 AS Decimal(18, 2)), N'Nam • Chạy', N'/images/adidas-chay-bo.jpg', NULL, 1004, 11, 2, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1016, N'GIÀY GAZELLE', CAST(2500000.00 AS Decimal(18, 2)), N'Originals', N'/images/adidas-gazelle.jpg', NULL, 1004, 1, 3, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1017, N'GIÀY GRAND COURT CLOUDFOAM LIFESTYLE COURT COMFORT', CAST(2000000.00 AS Decimal(18, 2)), N'Nữ • Sportswear', N'/images/adidas-grand-court.jpg', NULL, 1004, 2, 4, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1018, N'GIÀY MULE SUPERSTAR', CAST(1700000.00 AS Decimal(18, 2)), N'Nam • Originals', N'/images/adidas-mule.jpg', NULL, 1004, 3, 5, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1019, N'GIÀY SAMBA OG', CAST(2700000.00 AS Decimal(18, 2)), N'Originals', N'/images/adidas-samba.jpg', NULL, 1004, 4, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1020, N'GIÀY SUPERSTAR', CAST(2600000.00 AS Decimal(18, 2)), N'Originals', N'/images/adidas-superstar.jpg', NULL, 1004, 5, 7, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1021, N'Converse Run Star Legacy CX Hi Navy', CAST(3037000.00 AS Decimal(18, 2)), N'FUTURE LEGACY', N'/images/a-a.jpg', NULL, 1005, 6, 8, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1022, N'Giày Converse Chuck Taylor All Star Classic Hi Top', CAST(775000.00 AS Decimal(18, 2)), N'UNISEX', N'/images/a-chuck.jpg', NULL, 1005, 7, 9, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1023, N'Giày Converse Chuck Taylor All Star Classic Low Top', CAST(725000.00 AS Decimal(18, 2)), N'UNISEX', N'/images/a-chuck2.jpg', NULL, 1005, 8, 1, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1024, N'Giày Converse Run Star Hike Twisted Foundational', CAST(2250000.00 AS Decimal(18, 2)), N'UNISEX', N'/images/a-run.jpg', NULL, 1005, 9, 2, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1025, N'Giày Converse Run Star Motion Canvas Platform Seasonal Color', CAST(2340000.00 AS Decimal(18, 2)), N'UNISEX', N'/images/a-run-2.jpg', NULL, 1005, 10, 3, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1026, N'Giày Converse Run Star Hike Twisted Classic Foundational Canvas', CAST(1980000.00 AS Decimal(18, 2)), N'UNISEX', N'/images/a-run3.jpg', NULL, 1005, 11, 4, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1027, N'Chuck 70', CAST(1900000.00 AS Decimal(18, 2)), N'The timeless silhouette you know and love', N'/images/a-aa.jpg', NULL, 1005, 1, 5, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1029, N'Adidas 1001', CAST(90000.00 AS Decimal(18, 2)), N'Adidas-giày đẹp ', N'/images/adidas1001.png', NULL, 1004, 2, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1030, N'GT-2000 12 TR', CAST(3426545.00 AS Decimal(18, 2)), N'Women''s Trail Running Shoes', N'/images/1_ascis.jpg', NULL, 1014, 1, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1031, N'GEL-NIMBUS 26', CAST(4506545.00 AS Decimal(18, 2)), N'Men''s Running Shoes', N'/images/2_ascis.jpg', NULL, 1014, 5, 7, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1032, N'JAPAN S', CAST(1855636.00 AS Decimal(18, 2)), N'Men''s Sportstyle Shoes And Sneakers', N'/images/3_ascis.jpg', NULL, 1014, 6, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1033, N'Jumpman MVP', CAST(4849000.00 AS Decimal(18, 2)), N'Men''s Shoes', N'/images/1_jor.jpg', NULL, 1008, 6, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1034, N'Air Jordan I High G', CAST(5279000.00 AS Decimal(18, 2)), N'Men''s Golf Shoes', N'/images/2_jor.jpg', NULL, 1008, 7, 4, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1035, N'Air Jordan 1 Mid', CAST(3669000.00 AS Decimal(18, 2)), N'Women''s Shoes', N'/images/3_jor.jpg', NULL, 1008, 3, 4, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1036, N' LEVI''S® MEN''S ARCHIE SNEAKERS', CAST(2100000.00 AS Decimal(18, 2)), N'MEN''S SNEAKERS', N'/images/1_levi.jpg', NULL, 1012, 5, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1037, N'LEVI''S® MEN''S LS2 MID SNEAKERS', CAST(1900000.00 AS Decimal(18, 2)), N'MEN''S SNEAKERS', N'/images/2_levi.jpg', NULL, 1012, 5, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1038, N'LEVI''S® MEN''S STRYDER RED TAB SNEAKERS', CAST(3400000.00 AS Decimal(18, 2)), N'MEN''S SNEAKERS', N'/images/3_levi.jpg', NULL, 1012, 6, 4, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1039, N'9060', CAST(3811000.00 AS Decimal(18, 2)), N'Unisex', N'/images/1_NB.jpg', NULL, 1013, 7, 7, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1040, N'Fresh Foam X 880v14', CAST(3557000.00 AS Decimal(18, 2)), N'Men''s', N'/images/2_NB.jpg', NULL, 1013, 5, 4, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1041, N'T500', CAST(2794000.00 AS Decimal(18, 2)), N'Unisex', N'/images/3_NB.jpg', NULL, 1013, 6, 6, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1042, N'Suede Gum Sneakers', CAST(1905000.00 AS Decimal(18, 2)), N'Puma Black-Gum', N'/images/puma-1.png', NULL, 1006, 6, 7, N'<p>Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng. Giày Nike Air Jordan 4 Retro ‘Bred Reimagined’ FV5029-006 là một phiên bản đặc biệt của dòng sản phẩm Air Jordan, được thiết kế để tôn vinh và tái hiện lại phiên bản kinh điển “Bred” (Black and Red) của dòng Air Jordan 4. Dưới đây là mô tả chi tiết về sản phẩm này: Thiết kế: Giày có thiết kế cơ bản của Air Jordan 4 với phần upper chia thành các mảnh và một đế trung lập. Màu sắc chính của giày là đen (Black) kết hợp với đỏ (Red), đặc trưng của phiên bản “Bred”. Chất liệu: Upper (phần trên): Sử dụng chất liệu da và vải cao cấp, đảm bảo độ bền và thoải mái. Đế: Sử dụng công nghệ đế Air-Sole của Nike, mang lại sự êm ái và đàn hồi khi sử dụng.</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1043, N'LOVE MARATHON Suede Sneakers', CAST(1905000.00 AS Decimal(18, 2)), N'Court Yellow-Court Yellow', N'/images/puma-2.png', NULL, 1006, 8, 3, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1044, N'Giày Tập Luyện Nam Reebok Flexagon Force 4', CAST(1204500.00 AS Decimal(18, 2)), N'SẢN PHẨM NAM, GIÀY', N'/images/1_ree.jpg', NULL, 1009, 5, 7, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1045, N'GIÀY TẬP LUYỆN NAM NANOFLEX TR 2.0', CAST(1314500.00 AS Decimal(18, 2)), N'ĐÔI GIÀY TRAINING ĐA NĂNG DÀNH CHO TẬP GYM VÀ HƠN THẾ NỮA', N'/images/2_ree.jpg', NULL, 1009, 7, 7, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1046, N'NANOFLEX TR 2.0', CAST(1300500.00 AS Decimal(18, 2)), N'GIÀY TẬP ĐA NĂNG VỚI MẶT GIÀY THOÁNG KHÍ VÀ ĐẾ GIÀY LINH HOẠT', N'/images/3_ree.jpg', NULL, 1009, 5, 1, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1047, N'Running shoes for women SL 259', CAST(2299000.00 AS Decimal(18, 2)), N'Women''s', N'/images/1_Sparx.jpg', NULL, 1010, 3, 1, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1048, N'SM 849', CAST(1000000.00 AS Decimal(18, 2)), N'Casual shoes for men', N'/images/2_sparx.jpg', NULL, 1010, 7, 4, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1049, N'SM 812', CAST(1499000.00 AS Decimal(18, 2)), N'Running shoes for men', N'/images/3_sparx.jpg', NULL, 1010, 8, 7, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1050, N'GIẦY VẢI THƯỢNG ĐÌNH KK14-2', CAST(100000.00 AS Decimal(18, 2)), N'Giầy BHLĐ', N'/images/1_td.jpg', NULL, 1011, 5, 6, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1051, N'GIẦY THỂ THAO THỜI TRANG NAM - 0218', CAST(420000.00 AS Decimal(18, 2)), N'Giày thể thao thời trang', N'/images/2_td.jpg', NULL, 1011, 5, 7, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1052, N'VOLLEY LEATHER WHITE NAUTICO BARK', CAST(4065000.00 AS Decimal(18, 2)), N'Giày bóng chuyền', N'/images/1_ve.jpg', NULL, 1007, 5, 6, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1053, N'CONDOR 3 ENGINEERED-MESH BLACK CALCAIRE', CAST(5082000.00 AS Decimal(18, 2)), N'Giày thể thao', N'/images/2_ve.jpg', NULL, 1007, 5, 7, N'<p>Hãy thể hiện niềm tự hào của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để tôn vinh và tôn vinh cộng đồng LGBTQ+, những sản phẩm này</p>
', NULL, NULL, NULL, N'/images/nike-count-vision.jpg', N'/images/adidas-superstar.jpg', N'/images/1_ascis.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Description], [ImageUrl], [ListImg], [CategoryId], [SizeId], [ColorId], [MoTaDai], [BinhLuan], [DiemDanhGia], [SoLuongTon], [SideImage1], [SideImage2], [SideImage3]) VALUES (1058, N'Puma 3333', CAST(100000.00 AS Decimal(18, 2)), N'puma nice', N'/images/puma-3.png', NULL, 1006, 1, 5, N'<p>H&atilde;y thể hiện niềm tự h&agrave;o của bạn với bộ sưu tập Love Marathon từ PUMA. Được tạo ra để t&ocirc;n vinh v&agrave; t&ocirc;n vinh cộng đồng LGBTQ+, những sản phẩm n&agrave;y</p>
', NULL, NULL, NULL, N'/images/1_Sparx.jpg', N'/images/2_ascis.jpg', N'/images/1_jor.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (1, N'36')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (2, N'37')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (3, N'38')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (4, N'39')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (5, N'40')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (6, N'41')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (7, N'42')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (8, N'43')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (9, N'44')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (10, N'45')
INSERT [dbo].[Sizes] ([Id], [Name]) VALUES (11, N'46')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Colors_ColorId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sizes_SizeId]
GO
