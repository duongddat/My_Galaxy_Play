<%@page import="bean.gioHangbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	  <meta charset="utf-8">
	  <meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	  <title>My Galaxy Play | Login</title>
	  <meta content="" name="description">
	  <meta content="" name="keywords">
	
	  <link href="https://assets.glxplay.io/web/images/logoglx.svg" rel="icon">
	  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
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
	  	
	  <link rel="stylesheet" href="css/main.css">
	  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>
   <%
   	  int check = (int)session.getAttribute("gc");
   	  String mes = (String)request.getAttribute("mes");
   %>
  <main>
	    <div class="container">
	    	<%if(mes != null) { %>
		    	<div class="alert alert-danger alert-dismissible fade show toast-message" role="alert">
		             <%=mes %>
		             <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		        </div>
	    	<%} %>
	      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
	        <div class="container">
	          <div class="row justify-content-center">
	            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
	
	              <div class="d-flex justify-content-center py-4">
	                <a href="index.html" class="logo d-flex align-items-center w-auto">
	                  <img src="assets/img/logo1.png" alt="">
	                  <span class="d-none d-lg-block">My Galaxy Play</span>
	                </a>
	              </div><!-- End Logo -->
	
	              <div class="card mb-3">
	
	                <div class="card-body">
	
	                  <div class="pt-4 pb-2">
	                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
	                    <p class="text-center small">Enter your username & password to login</p>
	                  </div>
	
	                  <form action="dangNhapController" method="post" class="row g-3 needs-validation" novalidate>
	
	                    <div class="col-12">
	                      <label for="yourUsername" class="form-label">Username</label>
	                      <div class="input-group has-validation">
	                        <span class="input-group-text" id="inputGroupPrepend">@</span>
	                        <input type="text" name="txtun" class="form-control" id="yourUsername" required>
	                        <div class="invalid-feedback">Please enter your username.</div>
	                      </div>
	                    </div>
	
	                    <div class="col-12">
	                      <label for="yourPassword" class="form-label">Password</label>
	                      <input type="password" name="txtpw" class="form-control" id="yourPassword" required>
	                      <div class="invalid-feedback">Please enter your password!</div>
	                    </div>
	
	                    <div class="col-12">
	                      <%if(check < 3) { %>
				        	  <button class="btn btn-primary w-100" type="submit">Login</button>
				          <%} else {%>
				          	  <button class="btn btn-primary w-100 disabled" type="submit">Login</button>
				        	  <button type="button" class="btn btn-primary w-100 mt-2" data-bs-toggle="modal" data-bs-target="#verticalycentered">
                					Xác nhận danh tính
              			 	  </button>
				          <% } %>
	                    </div>
	                    <div class="col-12">
	                      <p class="small mb-0">Don't have account? <a href="dangKyController">Create an account</a></p>
	                      <p class="small mb-0">Admin manage? <a href="adminLoginController">Admin Page</a></p>
	                    </div>
	                  </form>
	
	                </div>
	              </div>
	
	              <div class="credits">
	                <!-- All the links in the footer should remain intact. -->
	                <!-- You can delete the links only if you purchased the pro version. -->
	                <!-- Licensing information: https://bootstrapmade.com/license/ -->
	                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
	                Designed by <a href="https://bootstrapmade.com/">@Datt</a>
	              </div>
	
	            </div>
	          </div>
	        </div>
	
	      </section>
	
	    </div>
  	 </main><!-- End #main -->
	  <div class="modal fade" id="verticalycentered" tabindex="-1">
	      <div class="modal-dialog modal-dialog-centered">
		       <div class="modal-content">
		            <div class="modal-header">
		                 <h5 class="modal-title">Xác nhận danh tính!!!</h5>
		                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		  	 		 <form action="gaptcha" method="post">
			             <div class="modal-body">
							  <div class="row mb-3">
				                  <label for="" class="col-sm-4 col-form-label">Mã Gaptcha:</label>
				                  <div class="col-sm-8">
				                     <img src="simpleCaptcha.jpg" class="img-captcha" /><br>
				                  </div>
				              </div>
							  <div class="row mb-3">
				                  <label for="" class="col-sm-4 col-form-label">Nhập Gaptcha:</label>
				                  <div class="col-sm-8">
				                    <input type="text" name="answer"  class="form-control" />
				                  </div>
				               </div>
			             </div>
			             <div class="modal-footer">
			                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
			                  <button type="submit" class="btn btn-primary">Xác nhận</button>
			             </div>
		  	  		</form>
		      </div>
	     </div>
      </div>
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