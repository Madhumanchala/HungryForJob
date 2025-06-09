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
	/* $(function() {
		if ($("p.text-danger").is(":visible")) {
			$("p.text-danger").css('text-align', 'center');
		}
	}); */
</script>
</head>
<body class="login">
	<%@include file="header.jsp"%>
	<%@include file="toaster.jsp" %>
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<main id="main">

    <section class="section-inner login-bg">
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center">

         <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
            <div class="card-register">
              <%-- <form:form autocomplete="off" method="post" action="/forgotPassVerifyEmail" onsubmit="return validateForm()"> --%>
                <div class="card-registerinner otp-section">
                  <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                      <h3>Forgot Password</h3>
					  <p>Don`t worry! Enter your email address.</p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="emailInput" class="required">Email ID </label>
                        <input type="email" class="form-control" id="emailInput" name="emailInput" placeholder="Enter Email ID" maxlength="30">
                       	<span class="error_email" id="error_email" style="color: red"></span> 
                       	
                       	<input type="hidden" name="sessionForgetRole" id="sessionValue"/>
                      </div>
                    </div>
                    

                    <div class="col-lg-12 text-center">
                      <button type="button" class="btns" onclick="validateForm()"> Get OTP </button>
                    </div>
                    
                    <div class="col-md-12 text-center mt-3">
                      <a class="text-primary" id="backtologin">Back to Login</a>
                    </div>
			

                  </div>

                </div>
             <%--  </form:form> --%>
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
  <script src="js/commonvalidation.js"></script>
  <script>
		$(document).ready(function() {
			var errorMsg = '${errorMsg}';
			console.log('errorMsg:' + errorMsg)
			if (errorMsg != null && errorMsg != '') {
				showToast("error",errorMsg);
			}
			let sessionData = sessionStorage.getItem("sessionforgetpassword");
			$("#sessionValue").val(sessionData);
			if(sessionData === "candidate")
			{
				$("#backtologin").attr("href","/login");
			}else
			{
				$("#backtologin").attr("href","/employerlogin");
			}
			$(".loader").hide();
		});
		
		function validateForm()
		{
			let value=$("#sessionValue").val();
			let emailInput=$("#emailInput").val();
			let isvalid=true;
			if(checkvalidation(value))
			{
				isvalid=false;
				return 
				
			}
			if(checkvalidation(emailInput))
			{
				isvalid=false;
				showToast("info","please enter the email");
				return 
			}else
			{
				if(!validateEmail(emailInput))
				{
					isvalid=false;
					showToast("info","please enter valid  email");
					return 
				}
			}
			if(isvalid)
			{
				$(".loader").show();
				$.ajax({
					url:"forgotPassVerifyEmail",
					type:'post',
					contentType: 'application/json',
					data: JSON.stringify({
						"emailInput": emailInput,
						"sessionForgetRole": value,
		            }),
		            success: function(response) {
		                // Success callback
		                console.log(response);
		                sessionStorage.setItem("forgetemail", emailInput);
		                if(response.errorCode === "0000")
		                {
							showToast("success","otp is sent to your emailId");
							setTimeout(function() {
								findnewroute('forgetpasswordotp',emailInput);
						}, 2000); // 2000ms = 2 seconds
						$('.loader').hide();
						}else if(response.errorCode === "1010")
						{
							showToast("info","email is not existed");
							
						}else if(response.errorCode === "1100")
						{
							showToast("info","please try again");
						}else if(response.errorCode === "0101")
						{
							showToast("info","please contact admin ");
						}
		                else
						{
							showToast("info","please try again");
						}
		                $('.loader').hide();
						
		            },
		            error: function(xhr, status, error) {
		                // Error callback
		                console.log("error ocurred"+error)
		                showToast("error","failed to update");
		                $('.loader').hide();
		            }
				})
			}
		}
		
		function findnewroute(value,email) {
			let form = document.createElement('form');
			form.method = 'POST'; 
			form.action = value;

			// Create email input
			let emailInput = document.createElement('input');
			emailInput.type = 'email';
			emailInput.name = 'email'; // name used on server side to retrieve the value
			emailInput.value = email; // get value from existing email field

			// Add email input to form
			form.appendChild(emailInput);
			
			sessionStorage.setItem("resendotpsend", "1");

			document.body.appendChild(form);
			form.submit(); 
		}
	</script>
</body>
</html>