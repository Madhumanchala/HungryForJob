<!doctype html>
<html lang="en">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Hungry for Job</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		if ($("p.text-danger").is(":visible")) {
			$("p.text-danger").css('text-align', 'center');
		}
	});
</script>
</head>
<body class="login">
	<%@include file="header.jsp"%>
	<main id="main">

    <section class="section-inner login-bg">
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center">

         <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
            <div class="card-register">
              <form:form autocomplete="off" method="post" action="/forgotPassVerifyEmail">
                <div class="card-registerinner otp-section">
                  <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                      <h3>Forgot Password</h3>
					  <p>Don`t worry! Enter your email address.</p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="emailInput" class="required">Email ID </label>
                        <input type="email" class="form-control" id="emailInput" name="emailInput" placeholder="Enter Email ID">
                       	<!-- <span class="error_email"> Please enter your Email ID</span> -->
                      </div>
                    </div>
                    

                    <div class="col-lg-12 text-center">
                      <button type="submit" class="btns"> Get OTP </button>
                    </div>
                    
                    <div class="col-md-12 text-center mt-3">
                      <a class="text-primary" href="login">Back to Login</a>
                    </div>


                  </div>

                </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
	<%@include file="footer.jsp"%>
<script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <script>
		$(document).ready(function() {
			var errorMsg = '${errorMsg}';
			console.log('errorMsg:' + errorMsg)
			if (errorMsg != null && errorMsg != '') {
				toastr.error(errorMsg)
			}
		});
	</script>
</body>
</html>