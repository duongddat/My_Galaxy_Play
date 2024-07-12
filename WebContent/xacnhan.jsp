<%@page import="bean.gioHangbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.khachHangbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My galaxy play | Confirm Buy</title>
  	<meta content="width=device-width, initial-scale=1.0" name="viewport">
  	
  	 <!-- Favicons -->
	 <link href="https://assets.glxplay.io/web/images/logoglx.svg" rel="icon">
	 <link href="assets/img/logo1.png" rel="apple-touch-icon">
	  
  	<meta content="" name="description">
	<meta content="" name="keywords">
	  
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	
  	<link href="css/main.css" rel="stylesheet">
  	<link href="css/lichsu.css" rel="stylesheet">
  	<link href="css/responsive.css" rel="stylesheet">
  	<style type="text/css">
  		.layout-container {
  			max-width: 1300px;
			min-height: 300px;
			margin:  30px auto 20px;
  		}
  		.flex-1{
  			flex: 1;
  		}
  		.txt-username {
  			display: block;
  			margin-left: 10px;
  			font-size: 20px;
  			font-weight: 700;
  		}
  		.wrapper {
  			border: 1px solid #c3c3c3;
  			border-radius: 5px;
  			padding: 10px 15px;
  			box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;
  		}
  		.txt-header {
  			font-size: 14px;
  			font-weight: 700;
  			border-bottom: 1px solid #ccc;
  			padding: 0 15px 20px;
  			
  		}
  		.content {
  			padding-left: 20px;
  			margin-bottom: 15px;
  		}
  		.content p {
  			padding-bottom: 10px;
  		}
  		.content span {
  			color: #8c8b8bcc;
  			font-style: italic;
  		}
  		
  		.pt-10 {
	padding-top: 10px;
}
	.w-100 {
		width: 100%;
	}
	.mb-20 {
		margin-bottom: 20px;
	}
	.txt-order {
		color: #3da1f6;
		font-size: 16px;
		font-weight: 600;
		margin-bottom: 15px;
	}
	.number {
		background-color: #3da1f6;
		color: #fff;
		font-size: 14px;
		padding: 2px 6px;
		border-radius: 50%;
		margin-right: 5px;
	}
	.img-momo {
		height: auto;
		width: 100%;
	}
	.item-order {
		margin-bottom: 8px;
		font-size: 14px;
	}
	
	.item-order span {
		color: red;
		font-weight: 600;
		font-size: 12px;
	}
	
	.total {
		background-color: #f6fafd;
		color: red;
		font-weight: 700;
		font-size: 18px;
		text-align: center;
		padding: 10px 15px;
		border-radius: 8px;
		margin: 15px 0;
	}
  	</style>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		int count = 0;
		if(request.getAttribute("count") != null) {
			count = (int)request.getAttribute("count");
		}
		
		khachHangbean kh = (khachHangbean)session.getAttribute("dn");
	%>
<nav class="navbar navbar-inverse navbar-fixed-top p-10">
	  	<div class="container-fluid">
		    <div class="navbar-header">
			    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>                        
			     </button>
			     <a class="navbar-brand" href="homeController">MyGalaxyPlay</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
			    <ul class="nav navbar-nav">
			      <li>
			      		<a href="gioController">
				      		Giỏ hàng
				      		<% if (count > 0) { %>
				      			<span class="badge"><%=count %></span>
				      		<%} %>
			      		</a>
			      </li>
			      <li><a href="thanhToanController">Thanh toán</a></li>
			      <li><a href="lichSuController">Lịch sử thuê</a></li>
			    </ul>
			    <form class="navbar-form navbar-left ml-lg-20" action="homeController" method="post">
			      <div class="form-group">
			        <input type="text" name="txttim" class="form-control form-search" placeholder="Tìm kiếm">
			      </div>
			      <button type="submit" class="btn btn-default">
			      	<span class="glyphicon glyphicon-search"></span>
			      </button>
			    </form>
			    <ul class="nav navbar-nav navbar-right">
			    	<li class="dropdown">
				        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
				        	<%if(kh != null) { %>
				        		Hi, <%=kh.getUsername() %>!
				        	<%} else {%>
				        		Hi, user!
				        	<% } %>
				        	<span class="caret"></span>
				        </a>
				        <ul class="dropdown-menu">
				          <%if(kh == null) { %>
					          <li>
					          	<a href="dangNhapController">
					      			<span class="glyphicon glyphicon-log-in"></span> 
					      			Đăng nhập
					      		</a>
					      	  </li>
					      	  <li><a href="dangKyController"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
					      <%} else {%> 
					      	   <li><a href="doiMKController">Đổi mật khẩu</a></li>
				          	   <li><a href="dangXuatController"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
				          <%} %>
				        </ul>
				     </li>
			    </ul>
		    </div>
		</div>
	</nav>
	<%
		if(request.getAttribute("mes") != null) {
		String mes = (String)request.getAttribute("mes");
	%>
		<div class="alert alert-success alert-dismissible toast-message">
	  		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	  		<strong>Success! </strong><%=mes %>
		</div>
	<%} %>
	<div class="main-container">
		<div class="layout-container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-12 mb-20">
					<div class="wrapper">
						<h5 class="txt-order"><span class="number">1</span>Thông tin khách hàng</h5>
						<form action="capNhatUserController">
						  <div class="form-group">
							<label for="ht">Họ và tên:</label>
							<input type="text" class="form-control" id="ht" value="<%=kh.getTenkh() %>" name="txtht">
						 </div>
						 <div class="form-group">
							<label for="address">Địa chỉ:</label>
							<input type="text" class="form-control" id="address" value="<%=kh.getDiachi() %>" name="txtdc">
						 </div>
						 <div class="form-group">
							<label for="sdt">Số điện thoại:</label>
							<input type="text" class="form-control" id="sdt" value="<%=kh.getSdt() %>" name="txtsdt">
						 </div>
						 <div class="form-group">
						 	<label for="email">Email:</label>
							<input type="email" class="form-control" id="email" value="<%=kh.getEmail() %>" name="txtemail">
						  </div>
						  
						  <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
						</form>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 mb-20">
					<div class="wrapper">
						<h5 class="txt-order"><span class="number">2</span>Phương thức thanh toán</h5>
						<div class="radio">
						  <label>
						    <input type="radio" name="optradio" data-toggle="collapse" data-target="#momo">Thanh toán qua <strong>qr momo</strong>
						  </label>
						</div>
						<div id="momo" class="collapse">
						  <img class="img-momo" src="https://homepage.momocdn.net/img/momo-upload-api-221003112148-638003929084418981.png"/>
						</div>
						<div class="radio">
						  <label><input type="radio" name="optradio" data-toggle="collapse" data-target="#pay">Thanh toán bằng <strong>chuyển khoản</strong></label>
						</div>
						<div id="pay" class="collapse">
						  <p>Tại Ngân Hàng TMCP Ngoại Thương (VCB) chi nhánh Sài Gòn</p>
						  <p>Chủ TK: <strong>Công Ty TNHH @Datt</strong></p>
						  <p>Số TK: <strong>033999006969</strong></p>
						</div>
					</div>
					<div class="wrapper mt-20">
						<h5 class="txt-order"><span class="number">3</span>Hướng dẫn thanh toán</h5>
						<div class="content">
							<p><b>Bước 1:</b> Quý khách <b>CẬP NHẬT</b> thông tin của quý khách (trước khi thanh toán).</p>
							<p><b>Bước 2:</b> Quý khách <b>KIỂM TRA</b> danh sách thuê phim.</p>
							<p><b>Bước 3:</b> Quý khách <b>LỰA CHỌN</b> phương thức thanh toán.</p>
							<p><b>Bước 4:</b> Quý khách <b>XÁC NHẬN</b> giao dịch đơn hàng.</p>
							<span>*Lưu ý: Sau khi xác nhận thanh toán phim thuê sẽ được thêm vào <b>KHO PHIM</b> của bạn (trong vòng 1 tiếng)!</span>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="wrapper">
						<h5 class="txt-order"><span class="number">4</span>Danh sách phim thuê</h5>
						<%						
							//Hiện thị gio trong session: gh
							if(session.getAttribute("gh") != null) {
								ArrayList<gioHangbean> ds = (ArrayList<gioHangbean>)request.getAttribute("ds");
								long tong = (long)request.getAttribute("tong");
						%>
						<% for(gioHangbean i : ds)  {%>
							<div class="d-flex content-start item-order">
								<div class="flex-1"><b><%=i.getTenphim() %></b> x<%=i.getThue() %>/tháng</div>
								<span><%=i.getThanhtien() %> đồng</span>
							</div>
						<%} %>
						<div class="total">Tổng: <%=tong %> đồng</div>
						<form action="xacNhanController" method="post">
							<button type="submit" class="btn btn-primary w-100">Xác nhận</button>
						</form>
						<%} else {%>
							<p align="center">Chưa thuê phim!</p>
						<%} %>
					</div>
				</div>
			</div>
		</div>	
	
		<div class="footer">
  			<div class="row">
  				<div class="col-md-12 d-flex flex-start-lg">
  					<img src="https://assets.glxplay.io/web/images/logoglx.svg" alt="logo" class="logo">
  				</div>
  				<div class="col-lg-3 col-md-6 col-sm-12">
  					<span class="txt-span">
       					My Galaxy Play là dịch vụ được cung cấp bởi Công ty Cổ Phần X.A.D, 
       					thành viên của Công ty Cổ Phần Giải Trí và Giáo Dục Apolo Galaxy (AIWC.,JSP)
  					</span>
  					<span class="txt-span">
       					Địa chỉ: 59 Xa Lộ Hà Nội, Phường Thảo Điền, Thành Phố Thủ Đức, Thành Phố Hồ Chí Minh, Việt Nam.
  					</span>
  					<span class="txt-span">
       					Mã số doanh nghiệp: 0106539659.
  					</span>
  					<span class="txt-span">
       					Ngày cấp mã số doanh nghiệp: 15/5/2014.
  					</span>
  					<span class="txt-span">
       					Nơi cấp: Sở kế hoạch và đầu tư thành phố Hà Nội.
  					</span>
  				</div>
  				<div class="col-lg-3 col-md-6 col-sm-12">
  					<h4 class="footer-title">GIỚI THIỆU</h4>
  					<span class="txt-span txt-color">
       					Quy chế sử dụng Dịch vụ
  					</span>
  					<span class="txt-span txt-color">
       					Chính sách bảo mật
  					</span>
  					<span class="txt-span txt-color">
       					Khuyến mãi
  					</span>
  				</div>
  				<div class="col-lg-3 col-md-6 col-sm-12">
  					<h4 class="footer-title">HỖ TRỢ</h4>
  					<span class="txt-span txt-color">
       					1800 9090 (24/7)
  					</span>
  					<span class="txt-span txt-color">
       					play@galaxy.com.vn
  					</span>
  					<span class="txt-span txt-color">
       					https://mygalaxyplay.vn/help
  					</span>
  				</div>
  				<div class="col-lg-3 col-md-6 col-sm-12">
  					<h4 class="footer-title">TẢI ỨNG DỤNG</h4>
  					<div class="footer__app">
  						<img src="https://assets.glxplay.io/web/responsive/w200/android-app-download-button.png" alt="chplay">
  						<img src="https://assets.glxplay.io/web/responsive/w200/ios-app-download-button.png" alt="appstore">
  					</div>
  					<h4 class="footer-title">KẾT NỐI VỚI CHÚNG TÔI</h4>
  					<div class="footer__social">
  						<img src="https://assets.glxplay.io/web/images/icon-facebook-default.svg" alt="facebook">
  						<img src="https://assets.glxplay.io/web/images/icon-instagram-default.svg" alt="instgram">
  						<img src="https://assets.glxplay.io/web/images/icon-youtube-default.svg" alt="youtube">
  						<img src="https://assets.glxplay.io/static/files/tiktok_1686546460145.png" alt="tiktok">
  						<img src="https://assets.glxplay.io/static/files/zalo-default_1686552099993.png" alt="zalo">
  					</div>
  				</div>
  			</div>
  		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("input[name='optradio']").on('click', function() {
				  $(".collapse:not(:has(input:checked[name='optradio']))").collapse('hide');
			});
		});
	</script>
</body>
</html>