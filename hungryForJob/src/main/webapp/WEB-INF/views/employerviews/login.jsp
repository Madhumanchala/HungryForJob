<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link href="employer/css/style.css" rel="stylesheet">
<link href="plugins/general/toastr/build/toastr.css" rel="stylesheet"
	type="text/css" />
</head>

<body>
	<%@include file="header.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main">

		<section class="section-inner sign-bg">
			<div class="container">
				<div class="row ">
					<div class="col-xl-8 col-lg-6 col-md-6  ">
						<div class="sign-left">
							<h4>INDIAâ€™S #1 HIRING PLATFORM</h4>
							<h1>
								Find the right <span> candidate. Fast. </span> <img
									src="employer/img/shape01.svg">
							</h1>
							<div class="sign-bg-img">
								<img src="employer/img/sign-bg.svg">
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-6 col-md-6  ">
						<div class="card-register  company-login ">
							<div class="shape02">
								<img src="employer/img/shape02.svg">
							</div>
							<form autocomplete="off">
								<h3>Employer Login</h3>

								<div class="card-registerinner  ">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="emailId" type="email" class="required">Email
													Id</label> <input type="text" class="form-control" id="emailId"
													placeholder="Enter Email Id" onkeyup="hidevalue('email_error')">
												  <span class="errors" id="email_error"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<div class="d-flex justify-content-between">
													<label for="Password" class="required">Password</label> <a
														href="#"  onclick="forgetpassword()"> Forgot Password
													</a>
												</div>
												<input type="password" class="form-control" id="Password"
													placeholder="Enter Password" onkeyup="hidevalue('password_error')"> <i
													class="toggle-password bi bi-eye-slash-fill" ></i>
												<span class="errors" id="password_error"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<div class="row">
													<div
														class="col-xxl-7 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
														<input type="text" id="UserCaptchaCode" name="captcha" class=" form-control"
														placeholder='Enter Captcha' autocomplete="off" onkeyup="CheckCaptcha()" minlength="4" required>
														<span class="errors" id="WrongCaptchaError"></span>

													</div>
													<div
														class="col-xxl-5 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
														<div class='CaptchaWrap employerlogin'>
															<div id="CaptchaImageCode" class="CaptchaTxtField">
																<canvas id="CapCode" class="capcode"></canvas>
															</div>
															<input type="button" class="reloadBtn"
																onclick='CreateCaptcha();'>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 text-center">
											<button type="button" class="btns btn1" id="loginBtn"
												onclick="EmployerLogin2()">Login</button>
										</div>
										<div class="col-md-12 text-center mt-4">
											<p>
												Don'€™t have an account? <a class="text-primary"
													href="employerSignUp">Create account</a>
											</p>
										</div>
									</div>
								</div>
								<div class="shape03">
									<img src="employer/img/shape03.svg">
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="product-section">
			<div class="container">
				<div class="pro-title">
					<h4>Products & Services</h4>
					<h3>Structured hiring at every step!</h3>
				</div>
				<div class="row">
					<div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
						<div class="card-products ">
							<h5>Hiring Solutions</h5>
							<h4>Recruit the right talent faster with Hungryforjob Hiring
								Platform</h4>
							<ul>
								<li>2 Minutes to Post</li>
								<li>Unlimited Applies</li>
								<li>Attract Audience</li>
								<li>30 Day Visibility</li>
							</ul>

							<div class="products-color bgcolor1">
								<img src="employer/img/product-img1.png">
							</div>
						</div>
					</div>
					<div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
						<div class="card-products ">
							<h5>Hiring Solutions</h5>
							<h4>Recruit the right talent faster with Hungryforjob Hiring
								Platform</h4>
							<ul>
								<li>2 Minutes to Post</li>
								<li>Unlimited Applies</li>
								<li>Attract Audience</li>
								<li>30 Day Visibility</li>
							</ul>

							<div class="products-color bgcolor2">
								<img src="employer/img/product-img1.png">
							</div>
						</div>
					</div>

					<div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
						<div class="card-products ">
							<h5>Hiring Solutions</h5>
							<h4>Recruit the right talent faster with Hungryforjob Hiring
								Platform</h4>
							<ul>
								<li>2 Minutes to Post</li>
								<li>Unlimited Applies</li>
								<li>Attract Audience</li>
								<li>30 Day Visibility</li>
							</ul>
							<div class="products-color bgcolor3">
								<img src="employer/img/product-img1.png">
							</div>
						</div>
					</div>
					<div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
						<div class="card-products ">
							<h5>Hiring Solutions</h5>
							<h4>Recruit the right talent faster with Hungryforjob Hiring
								Platform</h4>
							<ul>
								<li>2 Minutes to Post</li>
								<li>Unlimited Applies</li>
								<li>Attract Audience</li>
								<li>30 Day Visibility</li>
							</ul>

							<div class="products-color bgcolor1">
								<img src="employer/img/product-img1.png">
							</div>
						</div>
					</div>
					<div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
						<div class="card-products ">
							<h5>Hiring Solutions</h5>
							<h4>Recruit the right talent faster with Hungryforjob Hiring
								Platform</h4>
							<ul>
								<li>2 Minutes to Post</li>
								<li>Unlimited Applies</li>
								<li>Attract Audience</li>
								<li>30 Day Visibility</li>
							</ul>

							<div class="products-color bgcolor2">
								<img src="employer/img/product-img1.png">
							</div>
						</div>
					</div>

					<div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
						<div class="card-products ">
							<h5>Hiring Solutions</h5>
							<h4>Recruit the right talent faster with Hungryforjob Hiring
								Platform</h4>
							<ul>
								<li>2 Minutes to Post</li>
								<li>Unlimited Applies</li>
								<li>Attract Audience</li>
								<li>30 Day Visibility</li>
							</ul>

							<div class="products-color bgcolor3">
								<img src="employer/img/product-img1.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<section class="faq-section">
			<div class="container">
				<div class="faqsection">
					<h3>Frequently Asked Questions</h3>
				</div>
				<div class="row ">
					<div class="col-lg-12">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">How
										does it work ?</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">Lorem Ipsum is simply dummy
										text of the printing and typesetting industry. Lorem Ipsum has
										been the industry's standard dummy text ever since the 1500s,
										when an unknown printer took a galley of type and scrambled it
										to make a type specimen book.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										How can I request for a demo session?</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">Lorem Ipsum is simply dummy
										text of the printing and typesetting industry. Lorem Ipsum has
										been the industry's standard dummy text ever since the 1500s,
										when an unknown printer took a galley of type and scrambled it
										to make a type specimen book.</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										How can I make payment?</button>
								</h2>
								<div id="collapseThree" class="accordion-collapse collapse"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">Lorem Ipsum is simply dummy
										text of the printing and typesetting industry. Lorem Ipsum has
										been the industry's standard dummy text ever since the 1500s,
										when an unknown printer took a galley of type and scrambled it
										to make a type specimen book.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="copyright">
				<ul>
					<li><a href="#"> About Us </a></li>
					<li><a href="#"> Contact Us</a></li>
				</ul>
				<p>Copyright Â© 2024. Hungry for job all right reserved</p>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<!-- forgotpasswordModal   -->
	<!-- <div class="modal fade" id="forgotpasswordModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Forgot
						password</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="folderName" class="required">Forgot password</label>
								<input type="text" name="folderName" id="folderName"
									class="form-control" placeholder="Enter Forgot password">
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<div class=" text-center">
						<button type="button" class="btn-blue">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-- forgotpasswordModal   -->
	<!-- <div class="modal fade" id="forgotpasswordModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Forgot
						password</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<p>We've sent an email to 'mahibhairi@gmail.com' for
								resetting your password. Click on the link provided in the email
								to reset your password.If you don't see the mail, check other
								folders such as junk, spam.</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div> -->


	<div class="toast1 progress-info">
		<div class="toast1-content ">
			<i class="bi bi-check-circle-fill"></i>
			<!-- <i class="bi bi-info-circle-fill"></i>
      <i class="bi bi-exclamation-circle-fill"></i>
      <i class="bi bi-x-circle-fill"></i>-->
			<div class="message">
				<span class="text text-1">Success</span> <span class="text text-2">Your
					changes has been saved</span>
			</div>
		</div>
		<i class="bi bi-x close"></i>
		<div class="progress active"></div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<script>
    var cd;
    $(function () {
      CreateCaptcha();
    });

    // Create Captcha
    function CreateCaptcha() {
      //$('#InvalidCapthcaError').hide();
      var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

      var i;
      for (i = 0; i < 4; i++) {
        var a = alpha[Math.floor(Math.random() * alpha.length)];
        var b = alpha[Math.floor(Math.random() * alpha.length)];
        var c = alpha[Math.floor(Math.random() * alpha.length)];
        var d = alpha[Math.floor(Math.random() * alpha.length)];
        /* var e = alpha[Math.floor(Math.random() * alpha.length)];
        var f = alpha[Math.floor(Math.random() * alpha.length)];*/
      }
      cd = a + ' ' + b + ' ' + c + ' ' + d;
      $('#CaptchaImageCode').empty().append('<canvas id="CapCode" class="capcode" width="100" height="48"></canvas>')

      var c = document.getElementById("CapCode"),
        ctx = c.getContext("2d"),
        x = c.width / 2,
        img = new Image();

      img.src = "employer/img/captcha-bg.png";
      img.onload = function () {
        var pattern = ctx.createPattern(img, "repeat");
        ctx.fillStyle = pattern;
        ctx.fillRect(0, 0, c.width, c.height);
        ctx.font = "22px Roboto Slab";
        ctx.fillStyle = '#1d2946';
        ctx.textAlign = 'center';
        /* ctx.setTransform (1, -0.12, 0, 1, 0, 15);*/
        ctx.fillText(cd, x, 28);
      };

    }

    // Validate Captcha
    function ValidateCaptcha() {
      var string1 = removeSpaces(cd);
      var string2 = removeSpaces($('#UserCaptchaCode').val());
      // console.log(string2);
      if (string1 == string2) {
        return true;
      } else {
        return false;
      }
    }

    // Remove Spaces
    function removeSpaces(string) {
      return string.split(' ').join('');
    }

    // Check Captcha
    function CheckCaptcha() {
      var result = ValidateCaptcha();
      $('#WrongCaptchaError').hide();
      var created_captcha = removeSpaces(cd);
      var entered_captcha = removeSpaces($('#UserCaptchaCode').val());

      if (entered_captcha.length >= 4) {
        if ($("#UserCaptchaCode").val() == "" || $("#UserCaptchaCode").val() == null || $("#UserCaptchaCode").val() == "undefined") {
          $('#WrongCaptchaError').text('Please enter code given below in a picture.').show();
          $('#UserCaptchaCode').focus();
        } else {
          if (result == false) {
            $('#UserCaptchaCode').val('').attr('place-holder', 'Enter Captcha - Case Sensitive');
            $('#WrongCaptchaError').text('Invalid Captcha! Please try again.').show();
            CreateCaptcha();
            $('#UserCaptchaCode').focus().select();
          } else {
            // $('#UserCaptchaCode').val('').attr('place-holder','Enter Captcha - Case Sensitive');
            // CreateCaptcha();
            $('#WrongCaptchaError').fadeOut(100);
            $('#SuccessMessage').fadeIn(500).css('display', 'block').delay(5000).fadeOut(250);
          }
        }
      }
    }

    //OTP Modal
    $(document).ready(function () {
      $('.otp-input').on('input', function () {
        if ($(this).val().length === 1) {
          $(this).next('.otp-input').focus();
        }
      });
      sessionStorage.removeItem("companydashroute");
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
    });


    $(".toggle-password").click(function () {
      $(this).toggleClass("bi-eye-fill");
      input = $(this).parent().find("input");
      if (input.attr("type") == "password") {
        input.attr("type", "text");
      } else {
        input.attr("type", "password");
      }
    });
    
    $(document).ready(function() {
		var errorMsg = '${errorMsg}';
		console.log('errorMsg:' + errorMsg)
		if (errorMsg != null && errorMsg != '') {
			showToast('error',errorMsg);
		}
		 sessionStorage.clear(); 
	});
  </script>
	<script>
    
    
    function EmployerLogin() {
		
    	var email = document.getElementById('emailId').value;
        var password = document.getElementById('Password').value;
        var isvalid=true;
        

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (email === '') {
            $('#email_error').text("please enter the field")
            $('#email_error').show();
            isvalid=false; // Exit the function if email is empty
        } else if (!emailPattern.test(email)) {
            $('#email_error').text("please enter the valid email address")
            $('#email_error').show();
            isvalid=false;
        }

        // Password Validation
        if (password === '') {
        	 $('#password_error').text("please enter the field")
             $('#password_error').show();
        	 isvalid=false;
        }
        var result = ValidateCaptcha();
        if(!result)
        {
        	$('#WrongCaptchaError').text("please enter correct captcha")
            $('#WrongCaptchaError').show();
        	isvalid=false;
        }

        if(isvalid)
        {
        	var loginData = {
                    email: email,
                    password: password
                };
        	
        	  $.ajax({
                  url: '/employer/loginCheck', 
                  type: 'POST',
                  contentType: 'application/json',
                  data: JSON.stringify(loginData),
                  success: function(response) {
                      // Handle the response
                      console.log("Login successful:", response);
                      // Redirect to another page if login is successful
                      if (response === 'Login Success') {
                        //  window.location.href = '/searchCandidates';  // Modify the URL as per your requirement
                      	// Create a form dynamically and submit it as a POST request
                  var form = $('<form>', {
                      'action': '/searchCandidates',
                      'method': 'POST'
                  });

                  form.appendTo('body').submit(); 
                      } 
                      else if(response === 'pricingplan')
                      	{
                      	 var form = $('<form>', {
                               'action': '/pricing-plan',
                               'method': 'POST'
                           });

                           // Optionally, add hidden inputs to the form (if needed)
                           // form.append($('<input>', {type: 'hidden', name: 'key', value: 'value'}));

                           form.appendTo('body').submit(); 
      }
                      else  {
                          showToast("info","Login failed. Please check your credentials. or Contact Admin For support");
                          window.location.href = '/employerlogin';
                      }
                  },
                  error: function(xhr, status, error) {
                      console.log("Error:", error);
                      showToast("error","Error occured");
                  }
              });
        }
      
	}
    
function EmployerLogin2() {
		
    	var email = document.getElementById('emailId').value;
        var password = document.getElementById('Password').value;
        var isvalid=true;
        

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (email === '') {
            $('#email_error').text("please enter the field")
            $('#email_error').show();
            isvalid=false; // Exit the function if email is empty
        } else if (!emailPattern.test(email)) {
            $('#email_error').text("please enter the valid email address")
            $('#email_error').show();
            isvalid=false;
        }

        // Password Validation
        if (password === '') {
        	 $('#password_error').text("please enter the field")
             $('#password_error').show();
        	 isvalid=false;
        }
        var result = ValidateCaptcha();
        if(!result)
        {
        	$('#WrongCaptchaError').text("please enter correct captcha")
            $('#WrongCaptchaError').show();
        	isvalid=false;
        }

        if(isvalid)
        {	
        	var form = document.createElement('form');
            
            form.method = 'POST';
            form.action = '/login'; // Replace with the actual server endpoint URL

            // Optionally, create a hidden input to pass jobPostingId as a form parameter
            var input1 = document.createElement('input');
            input1.type = 'hidden';
            input1.name = 'username';
            input1.value = email;
            form.appendChild(input1);
            
            var input2 = document.createElement('input');
            input2.type = 'hidden';
            input2.name = 'password';
            input2.value = password;
            form.appendChild(input2);
            
            var input3 = document.createElement('input');
            input3.type = 'hidden';
            input3.name = 'roletype';
            input3.value = "employer";
            form.appendChild(input3);

            // Append the form to the document body
            document.body.appendChild(form);

            // Submit the form
            form.submit();

        }
      
	}

    function hidevalue(id)
    {
    	$('#'+id).hide();
    }
    function forgetpassword() {
		let url = "forgotPasswordVerifyEmail";
		let form = document.createElement('form');
		form.method = 'POST';
		form.action = url;
		document.body.appendChild(form);
		sessionStorage.setItem("sessionforgetpassword","employer");
		form.submit();
	}
  </script>

</body>

</html>