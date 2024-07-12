<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	  <meta charset="utf-8">
	  <meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	  <title>My Galaxy Play | Register</title>
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
	  <link rel="stylesheet" href="css/main.css">
	  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
  <%
   	  String mes = (String)request.getAttribute("err");
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
                    <h5 class="card-title text-center pb-0 fs-4">Tạo tài khoản</h5>
                    <p class="text-center small">Nhập thông tin của bạn để tạo tài khoản</p>
                  </div>

                  <form class="row g-3 needs-validation" action="dangKyController" method="post">
                    <div class="col-12">
                      <label for="yourName" class="form-label">Họ và tên</label>
                      <input type="text" name="txtht" class="form-control" id="yourName" required>
                      <div class="invalid-feedback">Nhập họ và tên của bạn!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourAdress" class="form-label">Địa chỉ</label>
                      <input type="text" name="txtdc" class="form-control" id="yourAdress" required>
                      <div class="invalid-feedback">Nhập địa chỉ của bạn!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourPhone" class="form-label">Số điện thoại</label>
                      <input type="text" name="txtsdt" class="form-control" id="yourPhone" required>
                      <div class="invalid-feedback">Nhập số điện thoại của bạn!</div>
                    </div>

                    <div class="col-12">
                      <label for="yourEmail" class="form-label">Email</label>
                      <input type="email" name="txtemail" class="form-control" id="yourEmail" required>
                      <div class="invalid-feedback">Nhập địa chỉ emial của bạn!</div>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" name="txtun" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">Nhập username của bạn.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="txtpw" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Nhập password của bạn!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourPassword2" class="form-label">Confirm Password</label>
                      <input type="password" name="txtpw2" class="form-control" id="yourPassword2" required>
                      <div class="invalid-feedback">Nhập password của bạn!</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label" for="acceptTerms">Tôi đồng ý và chấp nhận các <a href="#">điều khoản và điều kiện</a></label>
                        <div class="invalid-feedback">Bạn phải đồng ý trước khi tạo tài khoản</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Tạo tài khoản</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Bạn đã có tài khoản? <a href="dangNhapController">Log in</a></p>
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