USE [Bookshop]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 29/12/2017 5:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](120) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ISBN] [varchar](22) NOT NULL,
	[Author] [varchar](64) NOT NULL,
	[Stock] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29/12/2017 5:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29/12/2017 5:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 29/12/2017 5:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 29/12/2017 5:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (1, N'The Trials of Apollo Book Two The Dark Prophecy', 1, N'9781484746424', N'Rick Riordan', 10, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (3, N'A Court of Wings and Ruin', 1, N'9781619634480', N'Sarah J. Maas', 10, CAST(20.01 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (4, N'Lord of Shadows (The Dark Artifices)', 1, N'9781442468405', N'Cassandra Clare', 8, CAST(24.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (5, N'The Day the Crayons Quit', 1, N'9780399255373', N'Drew Daywalt and Oliver Jeffers', 10, CAST(17.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (6, N'If Animals Kissed Good Night', 1, N'9780374300210', N'Ann Whitford Paul and David Walker', 8, CAST(7.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (7, N'The Book with No Pictures', 1, N'9780803741713', N'B. J. Novak', 7, CAST(17.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (8, N'The Hate U Give', 1, N'9780062498533', N'Angie Thomas', 10, CAST(17.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (9, N'Ada Twist, Scientist', 1, N'9781419721373', N'Andrea Beaty and David Roberts', 10, CAST(17.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (10, N'The Trials of Apollo, Book 1: The Hidden Oracle', 1, N'9781484732748', N'Rick Riordan', 7, CAST(19.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (11, N'The Girl Who Drank the Moon', 1, N'9781616205676', N'Kelly Barnhill', 10, CAST(16.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (12, N'We''re All Wonders', 1, N'9781524766498', N'R. J. Palacio', 10, CAST(18.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (13, N'The Intelligent Investor', 2, N'9780060555665', N'Benjamin Graham and Jason Zweig', 10, CAST(22.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (14, N'Set for Life', 2, N'9780997584714', N'Scott Trench', 10, CAST(29.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (15, N'The Millionaire Next Door', 2, N'9781589795471', N'Thomas J. Stanley and William D. Danko', 10, CAST(16.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (16, N'Adaptive Markets', 2, N'9780691135144', N'Andrew W. Lo', 10, CAST(37.50 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (17, N'Profit First', 2, N'9780735214149', N'Mike Michalowicz', 10, CAST(27.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (18, N'Fanatical Prospecting', 2, N'9781119144755', N'Jeb Blount and Mike Weinberg', 9, CAST(27.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (19, N'How to Day Trade for a Living', 2, N'9781535585958', N'Andrew Aziz', 9, CAST(19.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (20, N'The End of Theory', 2, N'9780691169019', N'Richard Bookstaber', 10, CAST(29.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (21, N'Venture Deals', 2, N'9781119259756', N'Brad Feld and Jason Mendelson', 10, CAST(49.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (22, N'Black Edge', 2, N'9780812995800', N'Sheelah Kolhatkar', 10, CAST(28.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (23, N'Business Adventures: Twelve Classic Tales from the World of Wall Street', 2, N'9781497644892', N'John Brooks', 10, CAST(18.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (24, N'The Truth About Your Future', 2, N'9781501163807', N'Ric Edelman', 10, CAST(26.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (25, N'When Breath Becomes Air', 3, N'9780812988406', N'Paul Kalanithi', 10, CAST(25.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (26, N'Born a Crime: Stories from a South African Childhood', 3, N'9780399588174', N'Trevor Noah', 10, CAST(28.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (27, N'The Stranger in the Woods: The Extraordinary Story of the Last True Hermit', 3, N'9781101875681', N'Michael Finkel', 10, CAST(25.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (28, N'The Moth Presents All These Wonders: True Stories About Facing the Unknown', 3, N'9781101904404', N'Catherine Burns and Neil Gaiman', 10, CAST(25.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (29, N'The Most Beautiful: My Life with Prince', 3, N'9780316468978', N'Mayte Garcia', 10, CAST(27.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (30, N'The Rules Do Not Apply: A Memoir', 3, N'9780812996937', N'Ariel Levy', 10, CAST(27.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (31, N'Letterman: The Last Giant of Late Night', 3, N'9780062377210', N'Jason Zinoman', 10, CAST(28.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (32, N'Richard Nixon: The Life', 3, N'9780385537353', N'John A. Farrell', 10, CAST(35.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (33, N'Talking as Fast as I Can: From Gilmore Girls to Gilmore Girls (and Everything in Between)', 3, N'9780425285176', N'Lauren Graham', 10, CAST(28.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (34, N'Born to Run', 3, N'9780307279187', N'Bruce Springsteen', 10, CAST(32.50 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (35, N'The Black Hand: The Epic War Between a Brilliant Detective and the Deadliest Secret Society in American History', 3, N'9780544633384', N'Stephan Talty', 10, CAST(28.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (36, N'The Road to Jonestown: Jim Jones and Peoples Temple', 3, N'9781476763828', N'Jeff Guinn', 10, CAST(28.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (37, N'The Art of Overwatch', 4, N'9781506703671', N'Blizzard', 10, CAST(49.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (38, N'Overwatch: Anthology Volume', 4, N'9781506705408', N'BLIZZARD ENTERTAINMENT and Matt Burns', 10, CAST(19.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (39, N'Cracking the Coding Interview', 4, N'9780984782857', N'Gayle Laakmann McDowell', 10, CAST(26.79 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (40, N'Deep Learning', 4, N'9780262035613', N'Ian Goodfellow and Yoshua Bengio', 10, CAST(80.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (41, N'Hands-On Machine Learning with Scikit-Learn and TensorFlow', 4, N'9781491962299', N'AurÃƒÂ©lien GÃƒÂ©ron', 10, CAST(49.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (42, N'The Art of Persona 5', 4, N'9780744017311', N'Prima Games', 10, CAST(39.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (43, N'Everybody Lies:', 4, N'9780062390851', N'Seth Stephens-Davidowitz', 10, CAST(27.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (44, N'CompTIA A+ Certification All-in-One Exam Guide', 4, N'9781259589515', N'Mike Meyers', 10, CAST(60.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (45, N'Python Crash Course', 4, N'9781593276034', N'Eric Matthes', 10, CAST(39.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (46, N'The Legend of Zelda', 4, N'9781506703350', N'Nintendo', 10, CAST(39.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Book] ([BookID], [Title], [CategoryID], [ISBN], [Author], [Stock], [Price], [Discount]) VALUES (47, N'The Legend of Zelda: Breadth of the Wild', 4, N'9781911015222', N'Piggyback', 10, CAST(39.99 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (1, N'children')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (2, N'finance')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (3, N'non-fiction')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (4, N'technical')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserName], [OrderDate], [Status]) VALUES (1, N'yxong', CAST(N'2017-12-27 14:04:11.890' AS DateTime), N'PENDING')
INSERT [dbo].[Order] ([OrderID], [UserName], [OrderDate], [Status]) VALUES (3, N'me', CAST(N'2017-12-28 00:45:55.707' AS DateTime), N'CHECKOUT')
INSERT [dbo].[Order] ([OrderID], [UserName], [OrderDate], [Status]) VALUES (4, N'me', CAST(N'2017-12-28 00:58:35.060' AS DateTime), N'CHECKOUT')
INSERT [dbo].[Order] ([OrderID], [UserName], [OrderDate], [Status]) VALUES (7, N'me', CAST(N'2017-12-28 02:51:32.337' AS DateTime), N'CHECKOUT')
INSERT [dbo].[Order] ([OrderID], [UserName], [OrderDate], [Status]) VALUES (8, N'me', CAST(N'2017-12-28 02:53:18.190' AS DateTime), N'CHECKOUT')
INSERT [dbo].[Order] ([OrderID], [UserName], [OrderDate], [Status]) VALUES (10, N'me', CAST(N'2017-12-28 13:42:42.050' AS DateTime), N'PENDING')
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (1, 1, 18)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (1, 3, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (3, 3, 5)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (3, 6, 4)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (4, 3, 6)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (4, 4, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (4, 5, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (4, 7, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (7, 10, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (7, 18, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (7, 19, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (8, 6, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [BookID], [Quantity]) VALUES (10, 3, 2)
INSERT [dbo].[User] ([UserName], [Password], [Role]) VALUES (N'cc', N'password', N'Customer')
INSERT [dbo].[User] ([UserName], [Password], [Role]) VALUES (N'haha', N'password', N'Customer')
INSERT [dbo].[User] ([UserName], [Password], [Role]) VALUES (N'me', N'password', N'Customer')
INSERT [dbo].[User] ([UserName], [Password], [Role]) VALUES (N'yxong', N'password', N'Admin')
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Book]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order]
GO
