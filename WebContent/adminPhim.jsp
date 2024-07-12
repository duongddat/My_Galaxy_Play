<%@page import="bean.adminbean"%>
<%@page import="bean.phimbean"%>
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
	  <link rel="stylesheet" href="css/responsive.css">
	  <link href="assets/css/style.css" rel="stylesheet">
		
	  <style type="text/css">
	  	.tablet-mobile {
	  		display: none;
	  	}
	  	
	  	/*Toast message*/
.toast-message {
	position: absolute;
	top: 10%;
	right: 2%;
	z-index: 10;
	box-shadow: 0 5px 8px rgba(0, 0, 0, 0.08);
	background-color: #fff;
	border-bottom: 5px solid;
	animation: fadeIn ease 0.6s, hideIn linear 1s 3s forwards;
}

@keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateX(calc(100% + 32px));
    }
    to {
      opacity: 1;
      transform: translateX(0);
    }
}

 @keyframes hideIn {
    to {
      opacity: 0;
    }
 }

.show-item {
	height: 70px;
	width: 70px;
	border-radius: 10px;
	object-fit: cover;
} 
.show-edit {
	width: 150px;
	height: 150px;
	display: block;
} 
.alignmiddle {
	vertical-align: middle;
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
	    	String mp = (String)request.getAttribute("mp");
	    	String tp = (String)request.getAttribute("tp");
	    	String g = (String)request.getAttribute("g");
	    	String ml = (String)request.getAttribute("ml");
			String tg = (String)request.getAttribute("tg");
			String dv = (String)request.getAttribute("dv");
			String img = (String)request.getAttribute("img");
			String video =(String)request.getAttribute("video");
			String mt = (String)request.getAttribute("mt");
	    	
	    	String mes = (String)request.getAttribute("mes");
	    	String alert = (String)request.getAttribute("alert");
            if(mes != null) { 
        %>
		    <div class="alert <%=alert %> alert-dismissible fade show toast-message" role="alert">
		         <%=mes %>
		        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		    </div>
	   <%} %>
	  
	  <!-- ======= Header ======= -->
	  <header id="header" class="header fixed-top d-flex align-items-center">
	
	    <div class="d-flex align-items-center justify-content-between">
	      <a href="index.html" class="logo d-flex align-items-center">
	        <img src="assets/img/logo1.png" alt="">
	        <span class="d-none d-lg-block">My Galaxy Play</span>
	      </a>
	      <i class="bi bi-list toggle-sidebar-btn tablet-mobile"></i>
	    </div><!-- End Logo -->
	
	    <div class="search-bar">
	      <form class="search-form d-flex align-items-center" method="POST" action="adminPhimController">
	        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
	        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
	      </form>
	    </div><!-- End Search Bar -->
	
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
	        <a class="nav-link" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-menu-button-wide"></i><span>Quản lý</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="components-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="" class="active">
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
	      <h1>QUẢN LÝ</h1>
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
	              <h5 class="card-title">Phim</h5>
	              <!-- Table with stripped rows -->
	              <form class="row g-3" method="post" action="adminActionPhimController" enctype= "multipart/form-data">
	                <div class="col-md-12">
	                  <label for="inputmp" class="form-label">Mã Phim</label>
	                  <input type="text" class="form-control" id="inputmp" name="maphim" value="<%= (mp == null) ? ' ': mp %>">
	                </div>
	                <div class="col-12">
	                  <label for="inputtenp" class="form-label">Tên Phim</label>
	                  <input type="text" class="form-control" id="inputtenp" name="tenphim" value="<%= (tp == null) ? ' ': tp %>">
	                </div>
	                <div class="col-md-6">
	                  <label for="inputgia" class="form-label">Giá</label>
	                  <input type="text" class="form-control" id="inputgia" name="gia"  value="<%= (g == null) ? ' ': g %>">
	                </div>
	                <div class="col-md-6">
	                  <label for="inputState" class="form-label">Thể loại</label>
	                  <select id="inputState" class="form-select" name="loai">
	                  <%
	                  	ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
	                    for(loaibean l: dsloai) {	
	                  %>
	                    <option value="<%=l.getMaloai() %>"
	                     <%if(ml != null) { %>
	                     	<%= ml.equals(l.getMaloai()) ? "selected" : ' ' %>
	                     <%} %>
	                     ><%=l.getTenloai() %></option>
	                  <%} %>
	                  </select>
	                </div>
	                <div class="col-md-6">
	                  <label for="inputtg" class="form-label">Tác giả</label>
	                  <input type="text" class="form-control" id="inputtg" name="tacgia"  value="<%= (tg == null) ? ' ': tg %>">
	                </div>
	                <div class="col-md-6">
	                  <label for="inputdv" class="form-label">Diễn viên</label>
	                  <input type="text" class="form-control" id="inputdv" name="dienvien"  value="<%= (dv == null) ? ' ': dv %>">
	                </div>
	                 <div class="col-md-6">
	                  <label for="inputimg" class="form-label">Image</label>
	                  <input type="file" class="form-control" id="inputimg" name="img">
	                </div>
	                 <div class="col-md-6">
	                  <label for="inputvideo" class="form-label">Video</label>
	                  <input type="file" class="form-control" id="inputvideo" name="video">
	                </div>
	                <%if(img != null && video != null) { %>
		                <div class="col-md-6">
		                  <label for="inputvideo" class="form-label">Image Current</label>
		                  <img alt="" src="<%=img %>" class="show-item show-edit">
		                </div>
		                <div class="col-md-6">
		                  <label for="inputvideo" class="form-label">Video Current</label>
		                  <video src="<%=video %>" class="show-item show-edit" controls="controls"></video>
		                </div>
	                <%} %>
	                 <div class="col-md-12">
                       <label for="floatingTextarea">Mô tả</label>
	                   <textarea class="form-control" id="floatingTextarea" name="mota" style="height: 200px;"><%= (mt == null) ? ' ': mt %></textarea>
	                </div>
	                <div class="text-center">
	                  <button name="them" value="Add" type="submit" class="btn btn-primary">Thêm</button>
	                  <button name="sua" value="Update" type="submit" class="btn btn-secondary">Sửa</button>
	                  <a href="adminPhimController" class="btn btn-danger">Reset</a>
	                </div>
	              </form>
	              <!-- End Multi Columns Form -->
	            </div>
	          </div>
        </div>
        <div class="col-lg-12">
			 
	          <div class="card">
	            <div class="card-body table-responsive">
	              <h5 class="card-title">Danh sách phim</h5>
	              <% 
	              	ArrayList<phimbean> ds = (ArrayList<phimbean>)request.getAttribute("ds");
	              	if(ds.size() > 0) {
	              %>
	              <!-- Table with stripped rows -->
	              <table class="table table-bordered alignmiddle">
	                <thead>
	                  <tr>
	                    <th scope="col">Mã phim</th>
	                    <th scope="col">Tên phim</th>
	                    <th scope="col">Giá</th>
	                    <th scope="col">Thể loại</th>
	                    <th scope="col">Tác giả</th>
	                    <th scope="col">Diễn viên</th>
	                    <th scope="col">Image</th>
	                    <th scope="col">Video</th>
	                    <th scope="col" colspan="2">Control</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <% 
	                	for(phimbean a : ds) {
	                %>
	                  <tr>
	                  	<th scope="col"><%=a.getMaphim() %></th>
	                  	<th scope="col"><%=a.getTenphim() %></th>
	                  	<th scope="col"><%=a.getGia() %></th>
	                  	<th scope="col">
	                  		<%for(loaibean l: dsloai) { %>
		                  		<%if(l.getMaloai().equals(a.getMaloai())) {%>
		                  			<%=l.getTenloai() %>
		                  		<%} %>
	                  		<%} %>
	                  	</th>
	                  	<th scope="col"><%=a.getTacgia() %></th>
	                  	<th scope="col"><%=a.getDienvien() %></th>
	                  	<th scope="col">
	                  		<img alt="" src="<%=a.getImage() %>" class="show-item">
	                  	</th>
	                  	<th scope="col">
	                  		<video src="<%=a.getVideo() %>" class="show-item" autoplay="autoplay" loop="loop" muted="muted"></video>
	                  	</th>
	                    <th scope="col">
	                    	<a href="adminPhimController?mp=<%=a.getMaphim() %>&tab=chon">Chọn</a>
	                    </th>
	                    <th scope="col">
	                    	<a href="adminPhimController?mp=<%=a.getMaphim() %>&tab=xoa">Xóa</a>
	                    </th>
	                  </tr>
	                  <%} %>
	                </tbody>
	              </table>
	              <!-- End Table with stripped rows -->
	              <%} else { %>
	              	<p class="text-center">Không có phim nào~</p>
	              <%}%>
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