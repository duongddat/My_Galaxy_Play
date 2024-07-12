<%@page import="bean.khachHangbean"%>
<%@page import="bean.gioHangbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>My Galaxy Play | Cart</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Favicons -->
	<link href="https://assets.glxplay.io/web/images/logoglx.svg" rel="icon">
	<link href="assets/img/logo1.png" rel="apple-touch-icon">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	
  	<link rel="stylesheet" href="css/main.css">
  	<link rel="stylesheet" href="css/cart.css">
  	<link rel="stylesheet" href="css/responsive.css">
  	<style>
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
		if(request.getAttribute("mes") != null) {
		String mes = (String)request.getAttribute("mes");
	%>
		<div class="alert alert-success alert-dismissible toast-message">
	  		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	  		<strong>Success! </strong><%=mes %>
		</div>
	<%} %>
	<div class="main-container">
		<div class="cart-container" >
			<div class="cart-title">GIỎ HÀNG CỦA BẠN</div>
			<%						
				//Hiện thị gio trong session: gh
				if(session.getAttribute("gh") != null) {
					ArrayList<gioHangbean> ds = (ArrayList<gioHangbean>)request.getAttribute("ds");
					long tong = (long)request.getAttribute("tong");
			%>
					<form  method="post" action="xoaCheckController" class="table-responsive">
						<table class="table table-hover">
							<thead>
								 <tr>
								     <th>#</th>
								     <th>Ảnh</th>
								     <th>Tên phim</th>
								     <th>Giá</th>
								     <th colspan="2">Điều chỉnh</th>
								     
								 </tr>
							</thead>
						    <tbody>
						<% for(int i = 0; i < ds.size(); i++) { %>
							<tr>
								<td colspan="1" class="hidden"><form class="hidden"></form></td>	  
								<td><input type="checkbox"  name="check<%=i%>" value="<%=ds.get(i).getMaphim()%>"></td>
							    <td>
							    	<a href="detailController?mp=<%=ds.get(i).getMaphim()%>">
									    <div class="cart-item-img">
											<img alt="" src="<%=ds.get(i).getImage() %>">
										</div>
							    	</a>
								</td>
								<td>
								    <a href="detailController?mp=<%=ds.get(i).getMaphim()%>">
								    	<b><%=ds.get(i).getTenphim() %></b>
								    </a>
								</td>
								<td><b><%=ds.get(i).getGia() %> VNĐ</b></td>
								<td>
								    <form method='post' action="suaGHController?mp=<%=ds.get(i).getMaphim()%>">
										<div class="form-group custom-form">
											<input type='text' name='txtsua' value="<%=ds.get(i).getThue()%>">
											<input type='submit' class="btn btn-info" name='tt' value='Sua'>
										</div>
									</form>
								</td>
								<td><a href="xoaGHController?mp=<%=ds.get(i).getMaphim()%>">Xoá</a></td>
						    </tr>
						<%}%>
						 	</tbody>
						</table>
						<div class="cart-total" align="right">
							<h3>Tổng cộng: <b class="color-red"><%=tong %> VNĐ</b></h3>
						</div>
						<div align="center">
							<a href="thanhToanController" class="btn btn-default">Xác nhận mua hàng</a>
							<input type="submit" class="btn btn-warning" name="cb" value="Xóa check">
							<a href="xoahetgioController" class="btn btn-danger">Xóa Tất Cả</a>
						</div>
				</form>
				<%} else { %>
					<div class="notefy">
						Chưa có sẳn phẩm nào!!!
					</div>
				<%} %>
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