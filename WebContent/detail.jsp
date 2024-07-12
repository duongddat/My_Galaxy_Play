<%@page import="bean.khachHangbean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.phimbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>My galaxy play | Detail</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Favicons -->
	<link href="https://assets.glxplay.io/web/images/logoglx.svg" rel="icon">
	<link href="assets/img/logo1.png" rel="apple-touch-icon">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	
  	<link href="css/main.css" rel="stylesheet">
  	<link href="css/detailFilm.css" rel="stylesheet">
  	<link href="css/responsive.css" rel="stylesheet">
  	<style>
  		.title-preview {
  			color: #fff;
  		}
  	</style>
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
		phimbean p = (phimbean) request.getAttribute("p");
		ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
	%>
	<div class="main-container">
		<div class="banner">
			<video autoplay="autoplay" muted="muted" loop="loop" class="bg-video" >
				<source src="<%=p.getVideo() %>" type="video/mp4">
			</video>
			<div class="content layout-pc hidden">
				<div class="row content-detail">
					<div class="col-md-6 col-sm-12  display-padding">
						<div class="content-detail-movie">
							<div class="title-film">
								<h4><%=p.getTenphim() %></h4>
							</div>
							<div class="description">
								<div class="flex align-center list-item">
									<div class="tag">2023</div>
									<div class="tag itembtn">ST+</div>
									<div class="video-quantity">HD</div>
									<div class="tag package-film">Cao cấp</div>
								</div>
								<div class="film-content">
                       				 <%=p.getMota() %>
								</div>
								<div class="film-detail list-item">
									<div class="film-detail-title">
										<span class="title">Diễn viên:</span>
										<span class="content-name"><%=p.getDienvien() %></span>
									</div>
									<div class="film-detail-title">
										<span class="title">Đạo diễn:</span>
										<span class="content-name"><%=p.getTacgia() %></span>
									</div>
									<div class="film-detail-title">
										<span class="title">Thể loại:</span>
										<span class="content-name">
											<% 
												for(loaibean l: dsloai) { 
											%>
												<% if(l.getMaloai().equals(p.getMaloai())) { %>
													<%=l.getTenloai() %>
												<%} %>
											<%} %>
										</span>
									</div>
								</div>
								<div class="action-buy">
									<a class="btn btn-action" href="gioController?mp=<%=p.getMaphim()%>&tp=<%=p.getTenphim()%>&gia=<%=p.getGia()%>&img=<%=p.getImage()%>">
										<span class="glyphicon glyphicon-play"></span> 
										Thuê phim: <%=p.getGia() %>đ/Tháng
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="overlay-bottom"></div>
		</div>
		<div class="content-tabletMobile hidden">
			<div class="content-detail">
				<div class="display-padding">
					<div class="content-detail-movie">
						<div class="title-film">
							<h4><%=p.getTenphim() %></h4>
						</div>
						<div class="description">
							<div class="flex align-center list-item">
								<div class="tag">2023</div>
								<div class="tag itembtn">ST+</div>
								<div class="video-quantity">HD</div>
								<div class="tag package-film">Cao cấp</div>
							</div>
							<div class="film-content">
	                       		 <%=p.getMota() %>
							</div>
							<div class="film-detail list-item">
								<div class="film-detail-title">
									<span class="title">Diễn viên:</span>
									<span class="content-name"><%=p.getDienvien() %></span>
								</div>
								<div class="film-detail-title">
									<span class="title">Đạo diễn:</span>
									<span class="content-name"><%=p.getTacgia() %></span>
								</div>
								<div class="film-detail-title">
									<span class="title">Thể loại:</span>
									<span class="content-name">
									<% 
										for(loaibean l: dsloai) { 
									%>
										<% if(l.getMaloai().equals(p.getMaloai())) { %>
											<%=l.getTenloai() %>
										<%} %>
									<%} %>
									</span>
								</div>
							</div>
							<div class="action-buy">
								<a class="btn btn-action" href="">
										<span class="glyphicon glyphicon-play"></span> 
										Thuê phim <%=p.getGia() %>/Tháng
									</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="artcile-body footer">
			<h4 class="title">Phim Liên Quan</h4>
			<div class="row">
				<% 
					ArrayList<phimbean> ds = (ArrayList<phimbean>)request.getAttribute("ds");
					if(ds.size() > 0) {
					for (phimbean i: ds) { %>
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
						<div class="film-preview">
							<a href="detailController?mp=<%=i.getMaphim()%>">
								<img src="<%=i.getImage() %>" alt="">
								<div class="overlay-bottom">
									<h4 class="title-preview"><%=i.getTenphim()%></h4>
								</div>
							</a>	
						</div>
					</div>
				<%} %>
				<%} else { %>
					<p class="title-preview">Không có phim nào liên quan~</p>
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