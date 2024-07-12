<%@page import="bean.khachHangbean"%>
<%@page import="bean.phimbean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My galaxy play</title>
  	<meta content="width=device-width, initial-scale=1.0" name="viewport">
  	
  	 <!-- Favicons -->
	 <link href="https://assets.glxplay.io/web/images/logoglx.svg" rel="icon">
	 <link href="assets/img/logo1.png" rel="apple-touch-icon">
	  
  	<meta content="" name="description">
	<meta content="" name="keywords">
	  
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	
  	<link href="css/main.css" rel="stylesheet">
  	<link href="css/responsive.css" rel="stylesheet">
  	<style>
		.card-footer {
	position: absolute;
	left: 0px;
	bottom: 5px;
	width: 100%;
	transition-duration: 500ms;
	z-index: 6;
}
.content-start {
	justify-content: flex-start !important;
}
.txt-mes {
	display: block;
	margin-bottom: 50px;
	font-size: 18px;
	font-weight: 800;
}
.gap-20 {
	gap: 20px;
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
		
	<div class="main-container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		      <div class="item active">
		        <img src="https://assets.glxplay.io/web/images/ConNhotMotChong_1920x1080_S.max-1920x1080.jpg" alt="Los Angeles" style="width:100%;">
		        <div class="carousel-caption">
		          <h3>Con Nhóc Mót Chồng</h3>
		          <p>Một bộ phim của Vũ Ngọc Đàm!</p>
		        </div>
		      </div>
		
		      <div class="item">
		        <img src="https://assets.glxplay.io/web/images/TillTheEndOfTheMoon_1920x1080_S.max-1920x1080.jpg" alt="Chicago" style="width:100%;">
		        <div class="carousel-caption">
		          <h3>Trường Nguyệt Tẫn Minh</h3>
		          <p>Till the end of the moom!</p>
		        </div>
		      </div>
		    
		      <div class="item">
		        <img src="https://assets.glxplay.io/web/images/NoiLoan48H_1920x1080_S.max-1920x1080.jpg" alt="New York" style="width:100%;">
		        <div class="carousel-caption">
		          <h3>Nổi Loạn 48h</h3>
		          <p>We love the Big Apple!</p>
		        </div>
		      </div>
		  
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
  		</div>
  		<div class="container-products mt-20">
  			<div class="mt-20 d-flex content-start gap-20">
	  			<div class="dropdown">
				    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
				    	Thể Loại Phim
				    	<span class="caret"></span>
				    </button>
				    <ul class="dropdown-menu">
				     <% 
  						ArrayList<loaibean> dsloai = (ArrayList< loaibean>) request.getAttribute("dsloai");
  						for (loaibean i: dsloai) {
  					 %>
					      <li><a href="homeController?ml=<%=i.getMaloai() %>"><%=i.getTenloai() %></a></li>
				      <%} %>
				    </ul>
				</div>
				<a href="homeController?sort=new" class="btn btn-primary">Phim Mới Cập Nhật</a>
  			</div>
  			<div class="row mt-20">
  			<h4 class="txt-title">Danh Sách Phim</h4>
  				<% 
  					ArrayList<phimbean> ds = (ArrayList<phimbean>) request.getAttribute("ds");
  					if(ds.size() > 0) {
  					
  				%>
  				<%for (phimbean i : ds) {  %>
  				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
  						<div class="card-container">
  							<div class="card-content">
  								<div class="hover-overlay"></div>
  								<div class="hover-img-radio">
  									<img class="hover-img" src="<%=i.getImage() %>" alt="">
  								</div>
  								<div class="card-control">
  									<a href="gioController?mp=<%=i.getMaphim()%>&tp=<%=i.getTenphim()%>&gia=<%=i.getGia()%>&img=<%=i.getImage()%>" 
  									   data-toggle="tooltip" 
  									   data-placement="top" 
  									   title="Thuê ngay!"
  									>
  										<span class="glyphicon glyphicon-play-circle"></span>
  									</a>
  								</div>
  								<a href="detailController?mp=<%=i.getMaphim()%>">
	  								<div class="card-footer">
	  									<img alt="" src="https://assets.glxplay.io/static/web_paid1.png">
	  									<div class="caption">
	  										<div class="caption-name"><%=i.getTenphim() %></div>
	  												<p>Giá: <%=i.getGia() %> đồng </p>
	  											</div>
	  										</div>
  										</a>	
  								  </div>
  							</div>
						</div>
  					<%} %>
  					<%} else { %>
  						<div class="text-center">
  							<img src="https://static.thenounproject.com/png/1926775-200.png" alt="no film"/>
  							<p class="txt-mes">~Hiện không có phim~</p>
  						</div>
  					<%} %>
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
</body>
</html>