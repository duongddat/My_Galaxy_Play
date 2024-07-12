<%@page import="bean.lichSuMuabean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.khachHangbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My galaxy play | History</title>
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
  			padding: 10px 0;
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
  		.pt-10 {
	padding-top: 10px;
}

.success {
	color: #47ff47;
}
.danger {
	color: #ffc396;
}
.red {
	color: red;
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
		
		long tong = 0;
		if(request.getAttribute("tong") != null) {
			tong = (long)request.getAttribute("tong");
		}
		
		khachHangbean kh = (khachHangbean)session.getAttribute("dn");
		ArrayList<lichSuMuabean> ds = (ArrayList<lichSuMuabean>) request.getAttribute("ds");
	%>
	
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Hướng dẫn thanh toán</h4>
	      </div>
	      <div class="modal-body">
	        <p><strong>Bước 1:</strong> Quý khách tiến hành thanh toán thông qua các phương thức giao dịch (*) </p>
	        <p><strong>Bước 2:</strong> Sau khi thanh toán, phim được thuê sẽ tự động thêm vài kho phim.</p>
	        <p><strong>Bước 3:</strong> Chúc quy khách có trải nghiệm tốt!!!</p>
	        <p>Hotline: 012345999</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>
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
		<div class="layout-container">
			<div class="d-flex content-start">
				<h4 class="txt-username flex-1">Xin chào, <%=kh.getTenkh() %></h4>
				<a href="" class="btn btn-info" data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-question-sign"></span> Hướng dẫn thanh toán</a>
			</div>
			<div class="wrapper mt-20">
				<h5 class="txt-header">Thông tin cá nhân</h5>
				<div class="row mt-20">
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content">
							<h5 class="txt"><strong>Nhóm khách hàng :</strong> <b class="success">VIP</b></h5>
							<h5 class="txt"><strong>Mã khách hàng : </strong>KH<%=kh.getMakh() %></h5>
							<h5 class="txt"><strong>Số nợ hiện tại:</strong> <b class="red"><%=tong %> đồng</b></h5>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content">
							<h5 class="txt"><strong>Số điện thoại :</strong> <%=kh.getSdt() %></h5>
							<h5 class="txt"><strong>Email :</strong> <%=kh.getEmail() %></h5>
							<h5 class="txt"><strong>Địa chỉ :</strong> <%=kh.getDiachi() %></h5>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="content">
							<h5 class="txt"><strong>Mô tả :</strong> Khách hàng thân thiết</h5>
							<h5 class="txt"><strong>Chiết khẩu :</strong> --</h5>
						</div>
					</div>
				</div>
			</div>
			
			<div class="wrapper mt-20 table-responsive">
				<div class="d-flex content-start txt-header gap-20 pt-10">
					<a href="lichSuController" class="btn btn-info">Lịch sử mua hàng</a>
					<a href="lichSuController?damua=1" class="btn btn-success">Đã thanh toán</a>
					<a href="lichSuController?damua=0" class="btn btn-warning">Chưa thanh toán</a>
				</div>
				<table class="table">
				    <thead>
				      <tr>
				        <th>Tên phim</th>
				        <th>Giá</th>
				        <th>Thời lượng thuê</th>
				        <th>Thành tiền</th>
				        <th>Ngày thuê</th>
				        <th>Trạng thái</th>
				      </tr>
				    </thead>
				    <tbody>
				      <%if(ds.size() > 0) { %>
				      	  <%for(lichSuMuabean i : ds) { %>
						      <tr>
						        <td><%=i.getTenphim() %></td>
						        <td><%=i.getGia() %></td>
						        <td><%=i.getThue() %>/Tháng</td>
						        <td><%=i.getThanhtien() %></td>
						        <td><%=i.getNgaymua() %></td>
						        <td>
						        	<%if(i.getDamua() == true) { %>
						        		<span class="success">Hoàn thành</span>
						        	<%} else { %>
						        		<span class="danger">Đang giao dịch</span>
						        	<%} %>
						        </td>
						      </tr>
					      <%} %>
				      <%} else { %>
				      	<tr><td colspan="6" align="center">Chưa có giao dịch nào!!!</td></tr>
				      <%} %>
				    </tbody>
				</table>
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