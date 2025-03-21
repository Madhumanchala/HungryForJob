<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <%@include file="toaster.jsp"%>
  <div class="loader">
		<img src="employer/img/loader.gif">
	</div>
  <main id="main">
    <section class="section-inner login-bg">
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center  ">
          <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8  ">
            <div class="card-register ">
              <form autocomplete="off">
                <div class="card-registerinner otp-section ">
                  <div class="row"> 
                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                      <h3>OTP Verification</h3> 
					 <p>We have sent an OTP to your email ID <br>
                  </p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group ">
                       <div class="otp-container">
                    <input type="text" maxlength="1" class="otp-input" id="otp1">
                    <input type="text" maxlength="1" class="otp-input" id="otp2">
                    <input type="text" maxlength="1" class="otp-input" id="otp3">
                    <input type="text" maxlength="1" class="otp-input" id="otp4">
                   <!--  <input type="text" maxlength="1" class="otp-input" id="otp5">
                    <input type="text" maxlength="1" class="otp-input" id="otp6"> -->
                  </div>
						 <!-- <div class="d-flex align-items-center justify-content-center ">
                    <div class="otpExpires">Your OTP expires in <span class="second">23 sec</span></div>
                  </div> -->
                  	<span class="error_otp"></span>
                      </div>
                    </div> 
                    <div class="col-lg-12 text-center">
                      <button type="button" class="btns" onclick="otpSubmit()"> Submit </button>
                    </div> 
                    
                  </div> 
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
 <%@include file="footer.jsp"%>

  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <script src="js/commonvalidation.js"></script>
  <script>
	   //OTP Modal
    $(document).ready(function () {
      $('.otp-input').on('input', function () {
        if ($(this).val().length === 1) {
          $(this).next('.otp-input').focus();
        }
      });

      $('.otp-input').on('keydown', function (e) {
        if (e.key === 'Backspace' && $(this).val() === '') {
          $(this).prev('.otp-input').focus();
        }
      });

      $('.otp-input').on('keypress', function (e) {
        const char = String.fromCharCode(e.which);
        if (!/^[0-9]$/.test(char)) {
          e.preventDefault();
        }
      });
      
      $(".loader").hide();
    });

	   function otpSubmit()
	   {
		   var otp1=$('#otp1').val();
		   var otp2=$('#otp2').val();
		   var otp3=$('#otp3').val();
		   var otp4=$('#otp4').val();
		   var sessionvalue=sessionStorage.getItem("sessionforgetpassword");
		   var emailId=sessionStorage.getItem("forgetemail");
		   let isvalid=true;
		   
		   if (!otp1 || !otp2 || !otp3 || !otp4) {
			   showToast("info","please enter otp")
			   isvalid=false
		        return;
		    }
		   if(!sessionvalue)
			{
			   console.log("session value is not present")
			    isvalid=false
			   return;
			}
		   if(!emailId)
			{
			   console.log("session value is not present")
			    isvalid=false
			   return;
			}
		   var otp=otp1+otp2+otp3+otp4;
		   
		   if(isvalid)
			{
				$(".loader").show();
				$.ajax({
					url:"forgotPassVerifyOtp",
					type:'post',
					contentType: 'application/json',
					data: JSON.stringify({
						"otpInput": otp,
						"emailInput": emailId,
						"sessionForgetRole":sessionvalue
		            }),
		            success: function(response) {
		                // Success callback
		                if(response.errorCode === "0000")
		                {
		                	$('.loader').hide();
		                	findroute('forgetnewpasswordchange');
						
						}else if(response.errorCode === "1010")
						{
							showToast("info","ot is expired");
							
						}else if(response.errorCode === "1111")
						{
							showToast("info","failure");
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
	   $('.otp-input').on('keyup', function() {
		   $('.error_otp').hide();
	    });
  </script>
</body>
</html>