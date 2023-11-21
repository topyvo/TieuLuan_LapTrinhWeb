Create Table	KhachHang
(
	MaKH	Int	Identity(1,1),
	HoTen	Nvarchar(50)	Not Null,
	TaiKhoan	Varchar(50)	Unique,
	MatKhau	Varchar(50)	Not Null,
	Email	Varchar(100)	Unique,
	DiachiKH	Nvarchar(200),
	DienThoaiKH	Varchar(50),
	NgaySinh	DateTime,
	Constraint	Pk_KhachHang	Primary Key(MaKH)
)
Go
--Drop table ChuDe
--Go
Create Table	ChuDe
(
	MaCD	Int	Identity(1,1),
	TenChuDe	Nvarchar(50)	Not Null,
	Constraint Pk_ChuDe Primary Key(MaCD)
)
Go
--Drop table NhaXuatBan/NhaSanXuat
--Go
Create Table	NhaSanXuat
(
	MaNSX	Int Identity(1,1),
	TenNSX	Nvarchar(50)	Not Null,
	DiaChi	Nvarchar(200),
	DienThoai	Varchar(50),
	Constraint	Pk_NhaSanXuat Primary Key(MaNSX),
)
Go
--Drop table Sach/DT
--Go
Create Table	DT
(
	MaDT	Int	Identity(1,1),
	TenDT	Nvarchar(100)	Not Null,
	GiaBan	Decimal(18,0)	Check(GiaBan>=0),
	MoTa	Nvarchar(Max),
	AnhBia	Varchar(50),
	NgayCapNhat	DateTime,
	SoLuongTon	Int,
	MaCD	Int,
	MaNSX	Int,
	Constraint	Pk_DT	Primary Key(MaDT),
	Constraint	Fk_ChuDe	Foreign	Key(MaCD) References	ChuDe(MaCD),
	Constraint	Fk_NhaSanXuat	Foreign Key(MaNSX) References	NhaSanXuat(MaNSX)
)
Go
--Drop table TacGia
--Go
Create Table	TacGia
(
	MaTG	Int Identity(1,1),
	TenTG	Nvarchar(50)	Not Null,
	DiaChi	Nvarchar(100),
	TieuSu	Nvarchar(Max),
	DienThoai Varchar(50),
	Constraint	Pk_TacGia Primary Key(MaTG)
)
Go
--Drop table VietSach/Iphone
--Go
Create Table	Iphone
(
	MaTG	Int Identity(1,1),
	MaDT	Int,
	VaiTro	Nvarchar(50),
	ViTri	Nvarchar(50),
	Constraint	Fk_TacGia	Foreign	Key(MaTG)	References	TacGia(MaTG)
)
Go
--Drop table DonDatHang
--Go
Create Table	DonDatHang
(
	SoDH	Int Identity(1,1),
	MaKH	Int,
	NgayDH	DateTime,
	NgayGiao	DateTime,
	DaThanhToan	Bit,
	TinhTrangGiaoHang	Bit,
	Constraint	Pk_DonDatHang	Primary Key(SoDH),
	Constraint	Fk_KhachHang	Foreign	Key(MaKH)	References	KhachHang(MaKH)
)
Go
--Drop table ChiTietDatHang
--Go
Create Table	ChiTietDatHang
(
	SoDH	Int,
	MaDT	Int,
	SoLuong	Int	Check(SoLuong>0),
	DonGia Decimal(18,0)	Check(DonGia>=0),
	Constraint	Pk_ChiTietDatHang	Primary Key(SoDH,MaDT),
	Constraint	Fk_DonHang	Foreign	Key(SoDH)	References	DonDatHang(SoDH),
	Constraint	Fk_Sach	Foreign Key(MaDT)	References	DT(MaDT)
)
Go
--Thêm dữ liệu:
---Chủ đề
	Insert into ChuDe Values (N' Iphone')
	Insert into ChuDe Values (N' Ipad')
	Insert into ChuDe values (N' MacBook')
	Insert into ChuDe values (N' Airpods')
	Insert into ChuDe values (N' Apple Watch')
	Insert into ChuDe values (N' Phụ kiện')
select *from ChuDe
---Nhà xuất bản/NSX
	Insert into NhaSanXuat values (N' Apple Inc.',N' 161 B Lý Chính Thắng - Phường 7 - Quận 3 - Thành phố Hồ Chí Minh','84839316289')
select *from NhaSanXuat
---Sách/DT
	Insert into DT values (N' MacBook Pro 14',52000000,N' MacBook Pro 2021 14 inch lần đầu tiên xuất hiện, mang đến cho người dùng một siêu phẩm dành cho công việc chuyên nghiệp trong một kích thước nhỏ gọn. Đặc biệt, bộ vi xử lý Apple M1 Pro với sức mạnh không tưởng cho phép bạn làm việc ở hiệu suất cao chưa từng thấy.','macpro14.jpg','03/04/2016',5,3,1)
	Insert into DT values (N' MacBook 13 Pro',31000000,N' Thừa kế người tiền nhiệm, Macbook Pro 2020 M1 vẫn sở hữu thiết kế nhôm nguyên khối, viền vuông sang trọng, đường nét sắc sảo. Sản phẩm được trang bị màn hình Retina sắc nét, bàn phím Magic Keyboard hành trình phím tốt, hạn chế tối đa tình trạng kẹt phím.','mac13pro.jpg','03/04/2016',5,3,1)
	Insert into DT values (N' MacBook 12',15000000,N' Chiếc Macbook 12” MRQN2 mang trong mình một vẻ đẹp hấp dẫn được thiết kế bằng chất liệu hợp kim nguyên khối.Kích thước cực kì nhỏ gọn, mỏng nhẹ chỉ với 0.9 KG cân nặng và 13.1mm độ dày. Nếu so với chiếc Macbook Air mà mọi người vẫn hay chọn vì có thiết kế nhỏ gọn thì chếc Macbook 12” MRQN2 lại mỏng hơn đến 24%. Đây được xem là đỉnh cao của một chiếc laptop văn phòng.','mac12.jpg','03/04/2016',5,3,1)
	Insert into DT values (N' MacBook 11',12000000,N' Apple Macbook Air MD711 được thiết kế bằng chất liệu nhôm nguyên khối với thân hình siêu mỏng, siêu nhẹ. Thiết bị chỉ nặng 1.08kg, mỏng chỉ 17mm và nằm trong TOP 10 Ultrabook mỏng nhất thế giới. Nhờ đó dù làm việc hay di chuyển bạn đều có thể thoải mái mang theo và sử dụng một cách dễ dàng. Sản phẩm được vuốt mỏng thân máy về phía trước tạo nên sự thanh thoát và mỏng đến lạ thường.','mac11.jfif','03/04/2016',5,3,1)
	Insert into DT values (N' Glass',80000,N' Dùng để bảo vệ và trang trí cho AP, dành cho tất cả các dòng AP','glassip.jpg','03/04/2016',5,6,1)
	Insert into DT values (N' Case Apple Watch',50000,N' Dùng để bảo vệ và trang trí cho AP, dành cho tất cả các dòng AP','caseap.jpg','03/04/2016',5,6,1)
	Insert into DT values (N' Case phone loại 3',80000,N' Dùng để bảo vệ và trang trí cho Iphone, dành cho tất cả các dòng Iphone','caseip3.jfif','03/04/2016',5,6,1)
	Insert into DT values (N' Case phone',80000,N' Dùng để bảo vệ và trang trí cho Iphone, dành cho tất cả các dòng Iphone','caseip.jpg','03/04/2016',5,6,1)
	Insert into DT values (N' Case phone Loại 2',100000,N' Dùng để bảo vệ và trang trí cho Iphone, dành cho tất cả các dòng Iphone','caseip2.jpg','03/04/2016',5,6,1)
	Insert into DT values (N' Pencil 2',3200000,N' Bút cảm ứng Apple Pencil 2  với kiểu dáng như một chiếc bút thông thường nhưng lại nổi bật với màu trắng sang trọng. Thân bút thon dài, trọng lượng chỉ khoảng 20.7 g mang lại cho người dùng cảm giác thoải mái khi sử dụng, cầm rất vừa tay.','penci2.jpg','03/04/2016',5,6,1)
	Insert into DT values (N' Pecil 1 MK0C2',2800000,N' Bút cảm ứng Apple Pencil 1 MK0C2 với kiểu dáng như một chiếc bút thông thường nhưng lại nổi bật với màu trắng sang trọng. Thân bút thon dài, trọng lượng chỉ khoảng 20.7 g mang lại cho người dùng cảm giác thoải mái khi sử dụng, cầm rất vừa tay.','pencil1.jpg','03/04/2016',5,6,1)
	Insert into DT values (N' Iphone 13 Pro',35000000,N' iPhone 13 Pro sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.','ip13vang.jpg','03/04/2016',5,1,1)
	Insert into DT values (N' Iphone 13 Black',30000000,N' iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.','ip13.jpg','03/04/2016',5,1,1)
	Insert into DT values (N' Iphone 13 Gold',30000000,N' iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.','ip13vang.jpg','03/04/2016',5,1,1)
	Insert into DT values (N' Iphone 13 White',30000000,N' iPhone 13 sở hữu hệ thống camera kép xuất sắc nhất từ trước đến nay, bộ vi xử lý Apple A15 nhanh nhất thế giới smartphone cùng thời lượng pin cực khủng, sẵn sàng đồng hành cùng bạn suốt cả ngày.','ip13trang.jpg','03/04/2016',5,1,1)
	Insert into DT values (N' Iphone 12 ProMax Gold',28000000,N' iPhone 12 và iPhone 12 Mini là bộ đôi điện thoại thông minh thuộc dòng iPhone được Apple ra mắt vào ngày 13 tháng 10 năm 2020, cùng với bộ đôi iPhone 12 Pro và iPhone 12 Pro Max. Đây là phiên bản kế nhiệm chiếc iPhone 11 với nhiều sự nâng cấp. iPhone 12 được trang bị Apple A14 Bionic tốc độ xử lý nhanh hơn, màn hình chất lượng cao hơn. Giá bán khởi điểm của iPhone 12 Mini và iPhone 12 là 699 USD và 799 USD. Apple cho khách hàng có thể đặt trước iPhone 12 từ ngày 16 tháng 10 năm 2020 và iPhone 12 Mini từ ngày 6 tháng 11 năm 2020.','ip12promaxvang.jpg','03/04/2016',5,1,1)
	Insert into DT values (N' Iphone 12 ProMax White',29000000,N' iPhone 12 và iPhone 12 Mini là bộ đôi điện thoại thông minh thuộc dòng iPhone được Apple ra mắt vào ngày 13 tháng 10 năm 2020, cùng với bộ đôi iPhone 12 Pro và iPhone 12 Pro Max. Đây là phiên bản kế nhiệm chiếc iPhone 11 với nhiều sự nâng cấp. iPhone 12 được trang bị Apple A14 Bionic tốc độ xử lý nhanh hơn, màn hình chất lượng cao hơn. Giá bán khởi điểm của iPhone 12 Mini và iPhone 12 là 699 USD và 799 USD. Apple cho khách hàng có thể đặt trước iPhone 12 từ ngày 16 tháng 10 năm 2020 và iPhone 12 Mini từ ngày 6 tháng 11 năm 2020.','ip12promaxtrang.jpg','03/04/2016',5,1,1)
	Insert into DT values (N' Iphone 12 ProMax Black',30000000,N' iPhone 12 và iPhone 12 Mini là bộ đôi điện thoại thông minh thuộc dòng iPhone được Apple ra mắt vào ngày 13 tháng 10 năm 2020, cùng với bộ đôi iPhone 12 Pro và iPhone 12 Pro Max. Đây là phiên bản kế nhiệm chiếc iPhone 11 với nhiều sự nâng cấp. iPhone 12 được trang bị Apple A14 Bionic tốc độ xử lý nhanh hơn, màn hình chất lượng cao hơn. Giá bán khởi điểm của iPhone 12 Mini và iPhone 12 là 699 USD và 799 USD. Apple cho khách hàng có thể đặt trước iPhone 12 từ ngày 16 tháng 10 năm 2020 và iPhone 12 Mini từ ngày 6 tháng 11 năm 2020.','ip12promaxden.jpg','03/04/2016',5,1,1)
	Insert into DT values (N' Iphone 12 Black',27000000,N' iPhone 12 và iPhone 12 Mini là bộ đôi điện thoại thông minh thuộc dòng iPhone được Apple ra mắt vào ngày 13 tháng 10 năm 2020, cùng với bộ đôi iPhone 12 Pro và iPhone 12 Pro Max. Đây là phiên bản kế nhiệm chiếc iPhone 11 với nhiều sự nâng cấp. iPhone 12 được trang bị Apple A14 Bionic tốc độ xử lý nhanh hơn, màn hình chất lượng cao hơn. Giá bán khởi điểm của iPhone 12 Mini và iPhone 12 là 699 USD và 799 USD. Apple cho khách hàng có thể đặt trước iPhone 12 từ ngày 16 tháng 10 năm 2020 và iPhone 12 Mini từ ngày 6 tháng 11 năm 2020.','ip12den.png','02/04/2016',30,1,1)
	Insert into DT values (N' Iphone 12 Green',26000000,N' iPhone 12 và iPhone 12 Mini là bộ đôi điện thoại thông minh thuộc dòng iPhone được Apple ra mắt vào ngày 13 tháng 10 năm 2020, cùng với bộ đôi iPhone 12 Pro và iPhone 12 Pro Max. Đây là phiên bản kế nhiệm chiếc iPhone 11 với nhiều sự nâng cấp. iPhone 12 được trang bị Apple A14 Bionic tốc độ xử lý nhanh hơn, màn hình chất lượng cao hơn. Giá bán khởi điểm của iPhone 12 Mini và iPhone 12 là 699 USD và 799 USD. Apple cho khách hàng có thể đặt trước iPhone 12 từ ngày 16 tháng 10 năm 2020 và iPhone 12 Mini từ ngày 6 tháng 11 năm 2020.','ip12xanh.png','02/04/2016',30,1,1)
	Insert into DT values (N' Iphone 12 Violet',23000000,N' iPhone 12 và iPhone 12 Mini là bộ đôi điện thoại thông minh thuộc dòng iPhone được Apple ra mắt vào ngày 13 tháng 10 năm 2020, cùng với bộ đôi iPhone 12 Pro và iPhone 12 Pro Max. Đây là phiên bản kế nhiệm chiếc iPhone 11 với nhiều sự nâng cấp. iPhone 12 được trang bị Apple A14 Bionic tốc độ xử lý nhanh hơn, màn hình chất lượng cao hơn. Giá bán khởi điểm của iPhone 12 Mini và iPhone 12 là 699 USD và 799 USD. Apple cho khách hàng có thể đặt trước iPhone 12 từ ngày 16 tháng 10 năm 2020 và iPhone 12 Mini từ ngày 6 tháng 11 năm 2020.','ip12tim.jpg','02/04/2016',30,1,1)
	Insert into DT values (N' Iphone 11 ProMax Black',20000000,N' iPhone 11 Pro Max là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11promaxden.jpg','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone 11 ProMax Gold',25000000,N' iPhone 11 Pro Max là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11promaxvang.jpg','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone 11 ProMax White',23000000,N' iPhone 11 Pro Max là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11promaxtrang.jpg','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone 11 White',18000000,N' iPhone 11 là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11trang.png','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone 11 Red',18000000,N' iPhone 11 là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11do.jpg','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone 11 Gold',18000000,N' iPhone 11 là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11vang.jpeg','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone 11 Green',18000000,N' iPhone 11 là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11xanh.jpg','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone XR Black',10000000,N' iPhone XR là một điện thoại thông minh được Apple Inc. thiết kế, phát triển và đưa ra thị trường vào ngày 3 tháng 11 năm 2017. Nó được Giám đốc điều hành Tim Cook công bố vào ngày 12 tháng 9 năm 2017, cùng với iPhone 8 và iPhone 8 Plus tại Nhà hát Steve Jobs của Apple Park.[5][6][7][8] Sản phẩm được đặt tên là iPhone XR để kỷ niệm 10 năm iPhone, với chữ X là chữ số La Mã cho số 10.','ipxrden.jpg','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone XR Xanh',10000000,N' iPhone XR là một điện thoại thông minh được Apple Inc. thiết kế, phát triển và đưa ra thị trường vào ngày 3 tháng 11 năm 2017. Nó được Giám đốc điều hành Tim Cook công bố vào ngày 12 tháng 9 năm 2017, cùng với iPhone 8 và iPhone 8 Plus tại Nhà hát Steve Jobs của Apple Park.[5][6][7][8] Sản phẩm được đặt tên là iPhone XR để kỷ niệm 10 năm iPhone, với chữ X là chữ số La Mã cho số 10.','ipxrxanh.jpg','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone XR Gold',10000000,N' iPhone XR là một điện thoại thông minh được Apple Inc. thiết kế, phát triển và đưa ra thị trường vào ngày 3 tháng 11 năm 2017. Nó được Giám đốc điều hành Tim Cook công bố vào ngày 12 tháng 9 năm 2017, cùng với iPhone 8 và iPhone 8 Plus tại Nhà hát Steve Jobs của Apple Park.[5][6][7][8] Sản phẩm được đặt tên là iPhone XR để kỷ niệm 10 năm iPhone, với chữ X là chữ số La Mã cho số 10.','ipxrvang.jfif','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone XR Black',10000000,N' iPhone X là một điện thoại thông minh được Apple Inc. thiết kế, phát triển và đưa ra thị trường vào ngày 3 tháng 11 năm 2017. Nó được Giám đốc điều hành Tim Cook công bố vào ngày 12 tháng 9 năm 2017, cùng với iPhone 8 và iPhone 8 Plus tại Nhà hát Steve Jobs của Apple Park.[5][6][7][8] Sản phẩm được đặt tên là iPhone X để kỷ niệm 10 năm iPhone, với chữ X là chữ số La Mã cho số 10.','ipxden.jpg','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone XR Gold',10000000,N' iPhone X là một điện thoại thông minh được Apple Inc. thiết kế, phát triển và đưa ra thị trường vào ngày 3 tháng 11 năm 2017. Nó được Giám đốc điều hành Tim Cook công bố vào ngày 12 tháng 9 năm 2017, cùng với iPhone 8 và iPhone 8 Plus tại Nhà hát Steve Jobs của Apple Park.[5][6][7][8] Sản phẩm được đặt tên là iPhone X để kỷ niệm 10 năm iPhone, với chữ X là chữ số La Mã cho số 10.','ipxvang.jpg','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone XR White',10000000,N' iPhone X là một điện thoại thông minh được Apple Inc. thiết kế, phát triển và đưa ra thị trường vào ngày 3 tháng 11 năm 2017. Nó được Giám đốc điều hành Tim Cook công bố vào ngày 12 tháng 9 năm 2017, cùng với iPhone 8 và iPhone 8 Plus tại Nhà hát Steve Jobs của Apple Park.[5][6][7][8] Sản phẩm được đặt tên là iPhone X để kỷ niệm 10 năm iPhone, với chữ X là chữ số La Mã cho số 10.','ipxtrang.jfif','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone 6 Plus Gold',8000000,N' Điện thoại iPhone 6 kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip6plusvang.png','01/04/2016',6,1,1)
	Insert into DT values (N' Iphone 6 Pink',10000000,N' Điện thoại iPhone 6 kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip6128g.jpg','01/04/2016',8,1,1)
	Insert into DT values (N' Iphone 6 Gold',10000000,N' Điện thoại iPhone 6 kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip632g.jpg','01/04/2016',8,1,1)
	Insert into DT values (N' Iphone 5 Black',10000000,N' Sau bao tháng ngày mong chờ, cả thế giới Công nghệ đã được đón nhận sự ra đời của siêu phẩm điện thoại thông minh iPhone 5 SE, một trong những chiếc điện thoại được mong mỏi nhất năm 2012. Với những cải tiến mạnh mẽ cả về mặt thiết kế lẫn phần cứng, nên ngay từ khi lên kệ, iPhone 5 S liên tục cháy hàng. iPhone 5 S hứa hẹn sẽ tiếp tục khẳng định vị trí dẫn đầu trên thị trường Smartphone hiện nay.','ip564g.png','23/05/2013',15,1,1)
	Insert into DT values (N' Iphone 5 Gold',10000000,N' Sau bao tháng ngày mong chờ, cả thế giới Công nghệ đã được đón nhận sự ra đời của siêu phẩm điện thoại thông minh iPhone 5 S , một trong những chiếc điện thoại được mong mỏi nhất năm 2012. Với những cải tiến mạnh mẽ cả về mặt thiết kế lẫn phần cứng, nên ngay từ khi lên kệ, iPhone 5 S liên tục cháy hàng. iPhone 5 S hứa hẹn sẽ tiếp tục khẳng định vị trí dẫn đầu trên thị trường Smartphone hiện nay.','ip5s.jfif','23/05/2013',15,1,1)
	Insert into DT values (N' Iphone 8 Plus Black',12000000,N' Điện thoại iPhone 8 Plus kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip8plusden.jpg','28/09/2017',10,1,1)
	Insert into DT values (N' Iphone 8 Plus Gold',12000000,N' Điện thoại iPhone 8 Plus kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip8plusvang.jpg','28/09/2017',10,1,1)
	Insert into DT values (N' Iphone 8 Plus Sliver',12000000,N' Điện thoại iPhone 8 Plus kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip8plustrang.jpg','28/09/2017',10,1,1)
	Insert into DT values (N' Magsafe Charger',1600000,N' MagSafe, giao thức sạc tuyệt vời mà Apple từng trang bị sau đó loại bỏ trên Macbook, giờ đây đã quay trở lại lần đầu tiên với dòng iPhone 12 mới và tất nhiên, sự lợi hại của nó kinh khủng hơn rất nhiều. Về cơ bản, mặt lưng của iPhone sẽ là hàng loạt các trang bị điện tử để phục vụ cho tính năng sạc không dây, cùng với đó là nam châm đế hít với đế sạc. Việc sạc iPhone giờ đây đơn giản như cách mà bạn sạc Apple Watch. Được biết, công suất sạc của hệ thống mới này là 15W. Tất nhiên, để có thể sử dụng tính năng sạc qua MagSafe, người dùng phải bỏ thêm tiền để mua phụ kiện.','sackhgday.jpeg','10/05/2016',30,6,1)
	Insert into DT values (N' Airtag',700000,N' Sau gần hai năm chờ đợi, cuối cùng Apple cũng đã chính thức giới thiệu AirTag trong sự kiện Spring Loaded. AirTag là một công cụ theo dõi đồ vật và có thể gắn vào nhiều thứ, chẳng hạn như túi, ví, chìa khóa,...','airtag11.jpg','15/04/2016',40,6,1)
	Insert into DT values (N' Jack chuyển đổi',80000,N' Dùng để chuyển đổi dữ liệu','jackchuyendoi.jpg','15/04/2016',40,6,1)
	Insert into DT values (N' Tai nghe',1600000,N' ','tainghe.jpg','01/04/2016',50,6,1)
	Insert into DT values (N' Apple Watch series 4',5950000,N' Apple Watch Series 4 40mm LTE bản nhôm có màn hình lớn hơn so với những phiên bản trước đó đến 30% mà kích thước không hề thay đổi. Đó là nhờ sự nỗ lực cố gắng thu hẹp viền màn hình của Apple. ','ap4.jpg','01/04/2016',10,5,1)
	Insert into DT values (N' Apple Watch series 5',7700000,N' Apple Watch Series 5 là sản phẩm đồng hồ thông minh được Apple cho ra mắt năm 2019. Tuy đã xuất hiện trên thị trường một thời gian nhưng chiếc đồng hồ này chưa hề có dấu hiệu hạ nhiệt. Nó vẫn thuộc top những chiếc đồng hồ thông minh cao cấp được người dùng yêu thích nhất. Sự ra đời của Apple Watch Series 5 đồng nghĩa với việc Apple khai tử người tiền nhiệm Apple Watch Series 4, khiến cho chiếc đồng hồ này càng được săn đón nhiều hơn nữa. Apple Watch Series 5 thích hợp cho cả nam và nữ với thiết kế trẻ trung, hiện đại và toát lên vẻ cao cấp. Nếu bạn đang tìm kiếm một chiếc đồng hồ thông minh đa tính năng thì cho đến thời điểm hiện tại, Apple Watch Series 5 vẫn là lựa chọn khá hợp lý.','ap5.jpg','05/04/2017',18,5,1)
	Insert into DT values (N' Apple Watch series 3',3500000,N' Apple Watch Series 3 là siêu phẩm đầu tiên apple tạo ra với công nghệ mạng di động thông minh tiên tiến, công nghệ này kết hợp với GPS và Cellular trang bị mạng phát di động LTE và UMTS có khả năng chuyển đổi mạng liên tục. Ngoài ra công nghệ này còn cho phép các cuộc gọi di động trực tiếp ngay trên màn hình, còn có Esim loại sim tích hợp bằng một phần trăm kích thước của sim thông thường 16GB.','ap3.jpg','01/04/2016',80,5,1)
	Insert into DT values (N' Dây sạc',80000,N' Sản phẩm chính hãng Apple được làm từ vật liệu cao cấp cùng các tiêu chuẩn kỹ thuật nghiêm ngặt, giúp cho việc sạc pin nhanh chóng khi kết hợp với củ sạc nhanh, đồng thời đảm bảo an toàn cho pin và thiết bị.','daysac.jpg','01/04/2016',80,6,1)
	Insert into DT values (N' Cốc',100000,N' Sản phẩm chính hãng Apple được làm từ vật liệu cao cấp cùng các tiêu chuẩn kỹ thuật nghiêm ngặt, giúp cho việc sạc pin nhanh chóng khi kết hợp với dây sạc nhanh, đồng thời đảm bảo an toàn cho pin và thiết bị.','coc.jpg','01/04/2016',100,6,1)
	Insert into DT values (N' Iphone 8 Plus Red',12000000,N' Điện thoại iPhone 8 Plus kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip8plus.png','28/09/2017',10,1,1)
	Insert into DT values (N' Iphone 8',10000000,N' Điện thoại iPhone 8 kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip8.jpg','01/02/2017',9,1,1)
	Insert into DT values (N' Iphone 7 Plus',11000000,N' Điện thoại iPhone 7 Plus kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip7plus.jpg','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone 7',7000000,N' Điện thoại iPhone 7 kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip7.jpg','01/04/2016',2,1,1)
	Insert into DT values (N' Iphone 6 Plus Pink',8000000,N' Điện thoại iPhone 6 kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip6plus.jpg','01/04/2016',6,1,1)
	Insert into DT values (N' Iphone 6',10000000,N' Điện thoại iPhone 6 kết hợp giữa những đường nét đã làm nên chuẩn mực, thương hiệu với sự thời thượng và hiện đại của mặt lưng phủ kính cường lực thay vì nguyên khối kim loại. Điểm thiết kế này mang lại độ bóng bẩy, đẹp mắt hơn cho sản phẩm.','ip6.jpg','01/04/2016',8,1,1)
	Insert into DT values (N' Iphone 5 SE',10000000,N' Sau bao tháng ngày mong chờ, cả thế giới Công nghệ đã được đón nhận sự ra đời của siêu phẩm điện thoại thông minh iPhone 5 SE , một trong những chiếc điện thoại được mong mỏi nhất năm 2012. Với những cải tiến mạnh mẽ cả về mặt thiết kế lẫn phần cứng, nên ngay từ khi lên kệ, iPhone 5 SE liên tục cháy hàng. iPhone 5 SE hứa hẹn sẽ tiếp tục khẳng định vị trí dẫn đầu trên thị trường Smartphone hiện nay.','ip5se.jpg','23/05/2013',15,1,1)
	Insert into DT values (N' Iphone 5 White',6000000,N' Sau bao tháng ngày mong chờ, cả thế giới Công nghệ đã được đón nhận sự ra đời của siêu phẩm điện thoại thông minh iPhone 5, một trong những chiếc điện thoại được mong mỏi nhất năm 2012. Với những cải tiến mạnh mẽ cả về mặt thiết kế lẫn phần cứng, nên ngay từ khi lên kệ, iPhone 5 liên tục cháy hàng. iPhone 5 hứa hẹn sẽ tiếp tục khẳng định vị trí dẫn đầu trên thị trường Smartphone hiện nay.','ip5.png','25/06/2012',15,1,1)
	Insert into DT values (N' Iphone XR White',10000000,N' iPhone XR là một điện thoại thông minh được Apple Inc. thiết kế, phát triển và đưa ra thị trường vào ngày 3 tháng 11 năm 2017. Nó được Giám đốc điều hành Tim Cook công bố vào ngày 12 tháng 9 năm 2017, cùng với iPhone 8 và iPhone 8 Plus tại Nhà hát Steve Jobs của Apple Park.[5][6][7][8] Sản phẩm được đặt tên là iPhone X để kỷ niệm 10 năm iPhone, với chữ X là chữ số La Mã cho số 10.','ipxr.jpg','01/04/2016',15,1,1)
	Insert into DT values (N' Iphone 11 Black',15000000,N' iPhone 11 là chiếc điện thoại thuộc dòng iPhone được ra mắt vào ngày 10 tháng 9 năm 2019 cùng với iPhone 11 Pro và iPhone 11 Pro Max bởi CEO Tim Cook. Đây là phiên bản kế nhiệm của iPhone XR, với giá bán khởi điểm là 699 USD, rẻ hơn 50 USD so với iPhone XR. iPhone 11 được trang bị vi xử lý Apple A13 Bionic cùng với máy ảnh kép với tính năng chụp góc siêu rộng.[4] Tuy nhiên iPhone 11 chỉ được trang bị sẵn sạc phổ thông 5W trong hộp giống với các thế hệ iPhone tiền nhiệm. Trong khi iPhone 11 Pro và 11 Pro Max được trang bị sạc nhanh 18W, mặc dù 3 phiên bản này đều sỡ hữu công nghệ sạc nhanh.[5].','ip11.jpg','01/04/2016',17,1,1)
	Insert into DT values (N' Iphone 12 Gold',20000000,N' iPhone 12 và iPhone 12 Mini là bộ đôi điện thoại thông minh thuộc dòng iPhone được Apple ra mắt vào ngày 13 tháng 10 năm 2020, cùng với bộ đôi iPhone 12 Pro và iPhone 12 Pro Max. Đây là phiên bản kế nhiệm chiếc iPhone 11 với nhiều sự nâng cấp. iPhone 12 được trang bị Apple A14 Bionic tốc độ xử lý nhanh hơn, màn hình chất lượng cao hơn. Giá bán khởi điểm của iPhone 12 Mini và iPhone 12 là 699 USD và 799 USD. Apple cho khách hàng có thể đặt trước iPhone 12 từ ngày 16 tháng 10 năm 2020 và iPhone 12 Mini từ ngày 6 tháng 11 năm 2020.','ip12new.png','02/04/2016',30,1,1)
	Insert into DT values (N' Iphone SE',11000000,N' iPhone SE là một mẫu smartphone do Apple Inc. thiết kế và sản xuất như một phần của chuỗi thiết bị iPhone. Nó đã được công bố vào ngày 21 tháng 3 năm 2016 tại trụ sở ở Cupertino của Apple và được đưa ra thị trường vào ngày 31 tháng 3 năm 2016. iPhone SE được coi là sản phẩm thay thế cho iPhone 5S như một sản phẩm với chi phí thấp hơn trong các dòng sản phẩm iPhone; chứa bộ vi xử lý, camera và các tính năng khác được cập nhật từ iPhone 6S cao cấp với màn hình 4-inch nhỏ hơn và kiểu dáng gần giống với iPhone 5S.','ipse.jpg','04/04/2016',9,1,1)
	Insert into DT values (N' iPad mini 6',19000000,N' iPad mini 6 WiFi Cellular 64GB đánh dấu sự trở lại mạnh mẽ của Apple trên dòng sản phẩm iPad mini, thiết bị mới được người dùng yêu thích bởi thiết kế trẻ trung, hiệu suất đỉnh cao với con chip A15 Bionic và hỗ trợ bút cảm ứng Apple Pencil 2 tiện lợi.','ipadmini6new.png','04/04/2016',9,2,1)
	Insert into DT values (N' iPad Air 4 ',17000000,N'Apple đã trình làng máy tính bảng iPad Air 4 Wifi 64 GB (2020). Đây là thiết bị đầu tiên của hãng được trang bị chip A14 Bionic - chip di động mạnh nhất của Apple (năm 2020). Và có màn lột xác nhờ thiết kế được thừa hưởng từ iPad Pro với viền màn hình mỏng bo cong quanh máy. ','ipadair4.jpg','04/04/2016',9,2,1)
	Insert into DT values (N' iPad 9 ',14000000,N'iPad 9 WiFi 256GB thu hút sự chú ý của mọi người với thiết kế đơn giản, hiệu suất vượt trội, camera ghi hình chất lượng, bộ nhớ trong và dung lượng pin ấn tượng, thiết bị sẽ là một chiếc máy tính bảng cực đáng chọn mua để trải nghiệm. ','ipad9.jpg','04/04/2016',9,2,1)
	Insert into DT values (N' Airpod Pro ',5400000,N' AirPods Pro với thiết kế gọn gàng, đẹp và tinh tế, tai nghe được thiết kế theo dạng In-ear thay vì Earbuds như AirPods 2, cho phép chống ồn tốt hơn, khó rớt khi đeo và đặc biệt là êm tai hơn.','airpro.png','04/04/2016',9,4,1)
	Insert into DT values (N' Airpod 2 ',3600000,N' Tai nghe Bluetooth AirPods 2 Apple MV7N2 Trắng vẫn giữ cho mình thiết kế hiện đại, cao cấp, hợp thời trang','air2.png','04/04/2016',9,4,1)
	Insert into DT values (N' Apple Watch Series 7 ',23000000,N'Apple Watch S7 LTE 45 mm sở hữu khung viền thép không gỉ cứng cáp, sang trọng cùng thiết kế bo cong mềm mại ở phần góc và mặt kính Sapphire có kích thước 1.77 inch (diện tích màn hình tăng 20% so với phiên bản cũ), bảo vệ tốt mặt kính trước những va đập. Phần viền đồng hồ được được làm mỏng nhẹ chỉ 1.7 mm, tạo cảm giác tràn viền nhiều hơn (phần viền mỏng hơn 60% so với Apple Watch S6). ','app5.jpg','04/04/2016',9,5,1)
	Insert into DT values (N' Apple Watch S6 ',12000000,N'Apple Watch S6 LTE 44mm viền nhôm dây cao su xanh dương mang nét thanh lịch, các chi tiết được gia công chắc chắn, tinh xảo. Màn hình OLED 1.78 inch với thiết kế tràn viền giúp hình ảnh hiển thị rõ nét, chân thực. Nhờ có mặt kính Ion-X strengthened glass cứng cáp, chống trầy xước và chống va đập hiệu quả, đồng hồ an toàn trước những va chạm thường ngày. Dây đeo silicone êm nhẹ, độ đàn hồi cao, cho người dùng cảm giác dễ chịu suốt ngày dài. ','app4.jpg','04/04/2016',9,5,1)
	Insert into DT values (N' MacBook Air M1 ',19000000,N'Laptop Apple MacBook Air M1 2020 thuộc dòng laptop cao cấp sang trọng có cấu hình mạnh mẽ, chinh phục được các tính năng văn phòng lẫn đồ hoạ mà bạn mong muốn, thời lượng pin dài, thiết kế mỏng nhẹ sẽ đáp ứng tốt các nhu cầu làm việc của bạn. ','macm1.png','04/04/2016',9,3,1)
	Insert into DT values (N' MacBook Pro M1 ',46000000,N' Laptop Apple Macbook Pro M1 2020 (Z11C000CJ) với chip M1 dành riêng cho MacBook đưa hiệu năng của MacBook Pro 2020 lên một tầm cao mới. Màn hình Retina siêu nét, thời lượng pin ấn tượng và hàng loạt các tính năng hiện đại giúp bạn có được trải nghiệm làm việc chuyên nghiệp nhất.','macpro1.jpg','04/04/2016',9,3,1)
select *from DT
---Tác giả
	Insert into TacGia values (N' 	Steve Jobs, Steve Wozniak, Ronald Wayne','','','')
select *from TacGia
---Viết sách
	Insert into Iphone values (1,'','')
	Insert into Iphone values (2,'','')
	Insert into Iphone values (3,'','')
	Insert into Iphone values (4,'','')
	Insert into Iphone values (5,'','')
select *from Iphone
--Dữ liệu cập nhật: Tài khoản quản trị
Create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
)
Insert into Admin values('admin','123456','Trần Đăng Diệp')
Insert into Admin values('user','654321','Mr Diệp')
select *from Admin