<%@page import="bean.adminbean"%>
<%@page import="bean.bieuDobean"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.xacNhanHDbean"%>
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
	  <link href="assets/css/style.css" rel="stylesheet">
		
	</head>
	
	<body>	  
	  <%
	  	int countP = (int)request.getAttribute("countP");
		int countL = (int)request.getAttribute("countL");
		long countKH = (long)request.getAttribute("countKH");
		long daban = (long)request.getAttribute("daban");
		long thunhap = (long)request.getAttribute("thunhap");
		adminbean ad = (adminbean)session.getAttribute("ad");
	  %>
	  <!-- ======= Header ======= -->
	  <header id="header" class="header fixed-top d-flex align-items-center">
	
	    <div class="d-flex align-items-center justify-content-between">
	      <a href="index.html" class="logo d-flex align-items-center">
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
	        <a class="nav-link" href="adminController">
	          <i class="bi bi-grid"></i>
	          <span>Trang chủ</span>
	        </a>
	      </li><!-- End Dashboard Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-menu-button-wide"></i><span>Quản lý</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
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
	        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-journal-text"></i><span>Xác nhận</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="adminXacNhanHDController">
	              <i class="bi bi-circle"></i><span>Hóa đơn</span>
	            </a>
	          </li>
	          <li>
	            <a href="adminXacNhanCTController">
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
	      <h1>TRANG CHỦ</h1>
	    </div><!-- End Page Title -->
	
	    <section class="section dashboard">
	      <div class="row">
	
	        <!-- Left side columns -->
	        <div class="col-lg-8">
	          <div class="row">
	
	            <!-- Sales Card -->
	            <div class="col-xxl-4 col-md-6">
	              <div class="card info-card sales-card">
	                <div class="card-body">
	                  <h5 class="card-title">Đã bán<span> | ngày</span></h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
	                      <i class="bi bi-cart"></i>
	                    </div>
	                    <div class="ps-3">
	                      <h6><%=daban %></h6>
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div><!-- End Sales Card -->
	
	            <!-- Revenue Card -->
	            <div class="col-xxl-4 col-md-6">
	              <div class="card info-card revenue-card">
					<div class="filter">
	                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
	                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">	
	                    <li><a class="dropdown-item" href="adminDoanhThuController">Chi tiết</a></li>
	                  </ul>
	                </div>
	
	                <div class="card-body">
	                  <h5 class="card-title">Doanh thu<span> | ngày</span></h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
	                      <i class="bi bi-currency-dollar"></i>
	                    </div>
	                    <div class="ps-3">
	                      <h6><%=thunhap %> đồng</h6>
	                    </div>
	                  </div>
	                </div>
	
	              </div>
	            </div><!-- End Revenue Card -->
	
	            <!-- Customers Card -->
	            <div class="col-xxl-4 col-md-6">
	
	              <div class="card info-card customers-card">
	
	                <div class="card-body">
	                  <h5 class="card-title">Khác hàng</h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
	                      <i class="bi bi-people"></i>
	                    </div>
	                    <div class="ps-3">
	                      <h6><%=countKH %></h6>
	                    </div>
	                  </div>
	
	                </div>
	              </div>
	
	            </div><!-- End Customers Card -->
	            
	            <!-- Customers Card -->
	            <div class="col-xxl-4 col-md-6">
	
	              <div class="card info-card revenue-card">
					<div class="filter">
		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                    <li><a class="dropdown-item" href="adminPhimController">Xem chi tiết</a></li>
		                  </ul>
		                </div>	
	                <div class="card-body">
	                  <h5 class="card-title">Danh mục phim</h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
	                      <i class="bx bx-video"></i>
	                    </div>
	                    <div class="ps-3">
	                      <h6><%=countP %></h6>
	                    </div>
	                  </div>
	
	                </div>
	              </div>
	
	            </div><!-- End Customers Card -->
	            
	            <!-- Customers Card -->
	            <div class="col-xxl-4 col-md-6">
	
	              <div class="card info-card sales-card">
		              	<div class="filter">
		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                    <li><a class="dropdown-item" href="adminLoaiController">Xem chi tiết</a></li>
		                  </ul>
		                </div>	
		                <div class="card-body">
	                  <h5 class="card-title">Danh mục loại</h5>
	
	                  <div class="d-flex align-items-center">
	                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
	                      <i class="bx bx-server"></i>
	                    </div>
	                    <div class="ps-3">
	                      <h6><%=countL %></h6>
	                    </div>
	                  </div>
	
	                </div>
	              </div>
	
	            </div><!-- End Customers Card -->
	
	          </div>
	        </div><!-- End Left side columns -->
	
	        <!-- Right side columns -->
	        <div class="col-lg-4">
	 
	          <!-- Website Traffic -->
	          <div class="card">
	            <div class="card-body pb-0">
	              <h5 class="card-title">Biều đồ tỷ lệ phim</h5>
	
	              <div id="trafficChart" style="min-height: 400px;" class="echart"></div>
	
	              <script>
	                document.addEventListener("DOMContentLoaded", () => {
	                  echarts.init(document.querySelector("#trafficChart")).setOption({
	                    tooltip: {
	                      trigger: 'item'
	                    },
	                    legend: {
	                      top: '5%',
	                      left: 'center'
	                    },
	                    series: [{
	                      name: 'Loại phim',
	                      type: 'pie',
	                      radius: ['40%', '70%'],
	                      avoidLabelOverlap: false,
	                      label: {
	                        show: false,
	                        position: 'center'
	                      },
	                      emphasis: {
	                        label: {
	                          show: true,
	                          fontSize: '18',
	                          fontWeight: 'bold'
	                        }
	                      },
	                      labelLine: {
	                        show: false
	                      },
	                      data: [
	                    	<%
	                    		ArrayList<bieuDobean> bieudo = (ArrayList<bieuDobean>)request.getAttribute("bieudo");
	                    		for(bieuDobean i: bieudo) {
	                    	%> 
		                    	{
		                          value: <%=i.getSoluong()%>,
		                          name: '<%=i.getTenloai()%>'
		                        },
	                        <%}%>
	                      ]
	                    }]
	                  });
	                });
	              </script>
	
	            </div>
	          </div><!-- End Website Traffic -->
	        </div><!-- End Right side columns -->
	
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