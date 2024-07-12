<%@page import="bean.adminbean"%>
<%@page import="bean.xacNhanCTbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	  <meta charset="utf-8">
	  <meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	  <title>My Galaxy Play | admin</title>
	  <meta content="" name="description">
	  <meta content="" name="keywords">
	
	  <!-- Favicons -->
	  <link href="https://assets.glxplay.io/web/images/logoglx.svg" rel="icon">
	 <link href="assets/img/logo1.png" rel="apple-touch-icon">
	
	  <!-- Google Fonts -->
	  <link href="https://fonts.gstatic.com" rel="preconnect">
	  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
	  <!-- Vendor CSS Files -->
	  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
	  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
	  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

	  <!-- Template Main CSS File -->
	  <link rel="stylesheet" href="css/responsive.css">
	  <link href="assets/css/style.css" rel="stylesheet">
		
	  <style type="text/css">
	  	.tablet-mobile {
	  		display: none;
	  	}
	  	
	  	
@media (max-width: 1023px) {
	.tablet-mobile {
		display: block;
	}
	
	.table-responsive {
		overflow-x: auto;
	}
}
	  </style>
	</head>
	
	<body>
	<%
		adminbean ad = (adminbean)session.getAttribute("ad");
	%>
	  <!-- ======= Header ======= -->
	  <header id="header" class="header fixed-top d-flex align-items-center">
	
	    <div class="d-flex align-items-center justify-content-between">
	      <a href="adminController" class="logo d-flex align-items-center">
	        <img src="assets/img/logo1.png" alt="">
	        <span class="d-none d-lg-block">My Galaxy Play</span>
	      </a>
	      <i class="bi bi-list toggle-sidebar-btn tablet-mobile"></i>
	    </div><!-- End Logo -->
	
	    <nav class="header-nav ms-auto">
	      <ul class="d-flex align-items-center">
	
	        <li class="nav-item d-block d-lg-none">
	          <a class="nav-link nav-icon search-bar-toggle " href="#">
	            <i class="bi bi-search"></i>
	          </a>
	        </li><!-- End Search Icon-->
	
	        <li class="nav-item dropdown pe-3">
	
	          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
	            <img src="https://img5.thuthuatphanmem.vn/uploads/2021/11/30/anh-meo-cute-chibi-ngau-nhat_095451444.jpg" alt="Profile" class="rounded-circle">
	          </a><!-- End Profile Iamge Icon -->
	
	          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
	            <%if(ad != null) { %>
	            <li class="dropdown-header">
	              <h6><%=ad.getUsername() %></h6>
	              <span>VIP1</span>
	            </li>
	            <li>
	              <hr class="dropdown-divider">
	            </li>
	            <li>
	              <a class="dropdown-item d-flex align-items-center" href="adminLogoutController">
	                <i class="bi bi-box-arrow-right"></i>
	                <span>Sign Out</span>
	              </a>
	            </li>
	            <%} else { %>
	            <li>
	              <a class="dropdown-item d-flex align-items-center" href="adminLoginController">
	                <i class="bi bi-box-arrow-left"></i>
	                <span>Login in</span>
	              </a>
	            </li>
	            <%} %>
	
	          </ul><!-- End Profile Dropdown Items -->
	        </li><!-- End Profile Nav -->
	
	      </ul>
	    </nav><!-- End Icons Navigation -->
	
	  </header><!-- End Header -->
	
	  <!-- ======= Sidebar ======= -->
	  <aside id="sidebar" class="sidebar">
	
	    <ul class="sidebar-nav" id="sidebar-nav">
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="adminController">
	          <i class="bi bi-grid"></i>
	          <span>Trang chủ</span>
	        </a>
	      </li><!-- End Dashboard Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-menu-button-wide"></i><span>Quản lý</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="adminPhimController">
	              <i class="bi bi-circle"></i><span>Phim</span>
	            </a>
	          </li>
	          <li>
	            <a href="adminLoaiController">
	              <i class="bi bi-circle"></i><span>Loại Phim</span>
	            </a>
	          </li>
	        </ul>
	      </li><!-- End Components Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-journal-text"></i><span>Xác nhận</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="forms-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="adminXacNhanHDController">
	              <i class="bi bi-circle"></i><span>Hóa đơn</span>
	            </a>
	          </li>
	          <li>
	            <a href="adminXacNhanCTController" class="active">
	              <i class="bi bi-circle"></i><span>Chi tiết hóa đơn</span>
	            </a>
	          </li>
	        </ul>
	      </li><!-- End Forms Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-bar-chart"></i><span>Thống kê</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="charts-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="adminDoanhThuController">
	              <i class="bi bi-circle"></i><span>Doanh thu</span>
	            </a>
	          </li>
	        </ul>
	      </li><!-- End Charts Nav -->
	    </ul>
	  </aside><!-- End Sidebar-->
	
	  <main id="main" class="main">
	
	    <div class="pagetitle">
	      <h1>XÁC NHẬN</h1>
<!-- 	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
	          <li class="breadcrumb-item">Charts</li>
	          <li class="breadcrumb-item active">ApexCharts</li>
	        </ol>
	      </nav> -->
	    </div><!-- End Page Title -->
	    <section class="section">
	      <div class="row">
	        <div class="col-lg-12">
	
	          <div class="card">
	            <div class="card-body table-responsive">
	              <h5 class="card-title">Chi tiết hóa đơn</h5>
	              <!-- Table with stripped rows -->
	              <% 
	              	  ArrayList<xacNhanCTbean> dshd = (ArrayList<xacNhanCTbean>)request.getAttribute("dshd"); 
	              	  if(dshd.size() > 0) {
	              %>
	              <table class="table table-bordered">
	                <thead>
	                  <tr>
	                    <th scope="col">#</th>
	                    <th scope="col">Mã CTHD</th>
	                    <th scope="col">Khách Hàng</th>
	                    <th scope="col">Tên phim</th>
	                    <th scope="col">Thuê(tháng)</th>
	                    <th scope="col">Thành tiền</th>
	                    <th scope="col">Ngày thuê</th>
	                    <th scope="col" colspan="2">Control</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <%	
	                	int n = dshd.size();
	                	for(int i = 0; i < n; i++) { 
	                		xacNhanCTbean a = dshd.get(i);
	                %>
	                  <tr>
	                    <th scope="row"><%=i %></th>
	                    <th scope="col"><%=a.getMachd() %></th>
	                    <th scope="col"><%=a.getTenkh() %></th>
	                    <th scope="col"><%=a.getTenphim() %></th>
	                    <th scope="col"><%=a.getThue() %></th>
	                    <th scope="col"><%=a.getThanhtien() %></th>
	                    <th scope="col"><%=a.getNgaymua() %></th>
	                    <th scope="col">
	                    	<a href="adminXacNhanCTController?mact=<%=a.getMachd() %>&tab=xn">Xác nhận</a>
	                    </th>
	                    <th scope="col">
	                    	<a href="adminXacNhanCTController?mact=<%=a.getMachd() %>&tab=xoa">Xóa</a>
	                    </th>
	                  </tr>
	                  <%} %>
	                </tbody>
	              </table>
	              <!-- End Table with stripped rows -->
				  <%} else { %>
				  	<h5>Chưa có chi tiết nào được lập~</h5>
				  <%} %>
	            </div>
	          </div>
        </div>
      </div>
	    </section>
	
	  </main><!-- End #main -->
	
	  <!-- ======= Footer ======= -->
	  <footer id="footer" class="footer">
	    <div class="copyright">
	      &copy; Copyright <strong><span>@Datt</span></strong>. All Rights Reserved
	    </div>
	    <div class="credits">
	      Designed by <a href="https://bootstrapmade.com/">@Datt</a>
	    </div>
	  </footer><!-- End Footer -->
	
	  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	
	 
	  <!-- Vendor JS Files -->
	  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	  <script src="assets/vendor/chart.js/chart.umd.js"></script>
	  <script src="assets/vendor/echarts/echarts.min.js"></script>
	  <script src="assets/vendor/quill/quill.min.js"></script>
	  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
	  <script src="assets/vendor/php-email-form/validate.js"></script>
	
	  <!-- Template Main JS File -->
	  <script src="assets/js/main.js"></script>
	
	</body>
</html>