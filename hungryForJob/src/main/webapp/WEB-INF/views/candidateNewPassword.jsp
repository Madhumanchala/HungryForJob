<!DOCTYPE html>
<html lang="en">
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
</head>

<body>
 <%@include file="header.jsp"%>
 <%@include file="toaster.jsp" %>
 <div class="loader">
		<img src="employer/img/loader.gif">
	</div>
  <main id="main"> 
    <section class="section-inner login-bg">
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
         <!-- <div class="col-xl-7 col-lg-6 col-md-6 ">
            <div class="login-img">
              <img src="img/login-img.svg">
            </div>
          </div>-->

         <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
            <div class="card-register">
           <!--    <form autocomplete="off" method="post" action="/forgotPassChangePassword" onsubmit="return validationForm()"> -->
                <div class="card-registerinner otp-section">
                  <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                      <h3>Reset Password</h3>
					  <p>Strong passwords include numbers, letters, and punctuation marks.</p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="newPassword" class="required">New Password </label>
                        <input type="password" class="form-control" id="newPassword" name="password" placeholder="Enter New Password" onkeyup="checkPassword(this,'newPasswordError')">
						 <i class="toggle-password bi-eye-slash-fill" data-target="#newPassword"></i>
                         <span class="errors" id="newPasswordError"></span>
                      </div>
                    </div>
					 <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="confirmPassword" class="required">Confirm Password  </label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Enter Confirm Password" onkeyup="checkPassword(this,'confirmPasswordError')">
						 <i class="toggle-password bi-eye-slash-fill" data-target="#confirmPassword"></i>
                        <span class="errors" id="confirmPasswordError"></span>
                      </div>
                    </div>	 
                    <div class="col-lg-12 text-center">
                      <button type="button" class="btns" onclick="changenewpassword()">Confirm </button>
                    </div> 
                  </div>
                </div>
             <!--  </form> -->
            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
	<%@include file="footer.jsp"%>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <script src="js/commonvalidation.js"></script>
    <script>
    $(document).ready(function() {
    	$(".loader").hide();
    });
  
  function changenewpassword()
  {
	  var emailId=sessionStorage.getItem("forgetemail");
	  var sessionvalue=sessionStorage.getItem("sessionforgetpassword");
	  
	  let isvalid=true;
	  let password=$("#newPassword").val();
	  let confirmpassword=$("#confirmPassword").val();
	  
	  if(!validatePassword(password))
		{
		  isvalid=false;
		  showToast("info","please enter the password accroding to password policy")
		  return
		}
	  
	  if(!validatePassword(confirmpassword))
		{
		  isvalid=false;
		  showToast("info","please enter the password accroding to password policy")
		  return
		}
	  
	  if(confirmpassword !== password)
		{
		  isvalid=false;
		  showToast("info","pasword is not same check it ")
		  return
	 	}
	 if(checkvalidation(emailId))
		 {
		 	console.log("anything session is missing");
		 	 isvalid=false;
		 	return
		 }
	 if(checkvalidation(sessionvalue))
	 {
	 	console.log("anything session is missing");
	 	 isvalid=false;
	 	return
	 }
	  if(isvalid)
		{
			$(".loader").show();
			$.ajax({
				url:"forgotPassChangePassword",
				type:'post',
				contentType: 'application/json',
				data: JSON.stringify({
					"password": password,
					"username": emailId,
					"sessionForgetRole":sessionvalue,
					"confirmPassword":password
	            }),
	            success: function(response) {
	                // Success callback
	                if(response.errorCode === "0000")
	                {
	                	showToast("success","sucessfully updated");
		                setTimeout(function() {
		                	if(sessionvalue === "employer")
		                	{
		                		window.location.href="/employerlogin";
		                	}else
		                	{
		                		window.location.href="/login";
		                	}
		                		
						}, 2000); 
						$('.loader').hide();
					
					}else if(response.errorCode === "1111")
					{
						showToast("warning","failure");
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
  </script>
  
</body>

</html>