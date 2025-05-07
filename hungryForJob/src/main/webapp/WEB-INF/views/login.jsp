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
<link href="employer/css/bootstrap.min.css" rel="stylesheet">
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="employer/css/style.css" rel="stylesheet">
</head>

<body>
	<%@include file="header.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main">

		<section class="section-inner login-bg">
			<div class="container">
				<div class="row ">
					<div class="col-xl-8 col-lg-6 col-md-6 ">
						<div class="login-img">
							<img src="img/login-img.svg">
						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-md-6  ">
						<div class="card-register">
							<form:form autocomplete="off" action="/login" onsubmit="return validationform()">
								<div class="card-registerinner  ">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 text-center">
											<h3>Login</h3>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="emailInput" class="required">Email ID </label> <input
													type="email" class="form-control" id="emailInput"
													placeholder="Enter Email ID" name="username" onkeyup="hideErrorByClass('email_error')"
													maxlength="30">
												<span class="email_error errors"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="password" class="required">Password </label> <input
													type="password" class="form-control" id="password"
													placeholder="Enter Password" name="password" onkeyup="hideErrorByClass('password_error')"
													maxlength="30"> <i
													class="toggle-password passwordeye bi-eye-slash-fill"></i>
												<span class="password_error errors"></span>
											</div>
										</div>
										<input type="hidden" name="roletype" value="candidate"/>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<div class="row">
													<div class="col-lg-6 col-md-6 col-sm-6 col-5">
														<input type="text" id="UserCaptchaCode" name="captcha"
															class=" form-control" placeholder='Enter Captcha'
															autocomplete="off" onkeyup="CheckCaptcha()" maxlength="4"
															>
														<span class="captcha_error errors"></span>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-6 col-7">
														<div class='CaptchaWrap'>
															<div id="CaptchaImageCode" class="CaptchaTxtField">
																<canvas id="CapCode" class="capcode"></canvas>
															</div>
															<input type="button" class="ReloadBtn"
																onclick='CreateCaptcha();'>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="col-lg-12 text-center">
											<button type="submit" class="btns">Login</button>
										</div>
										<div class="col-md-12 text-center mt-2">
											<a class="text-primary forgot" href="#"
												onclick="forgetpassword()">Forgot Password ?</a>
										</div>
										<div class="col-md-12 text-center mt-2">
											Don't have an account? <a class="text-primary"
												href="verifyEmail">Click Here</a>
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
	<script src="js/menu.js"></script>
	<script src="js/commonvalidation.js"></script>
	<script>

		var cd;
		$(function() {
			CreateCaptcha();
		});

		// Create Captcha
		function CreateCaptcha() {
			//$('#InvalidCapthcaError').hide();
			var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
					'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
					'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g',
					'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
					't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4',
					'5', '6', '7', '8', '9');

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
			$('#CaptchaImageCode')
					.empty()
					.append(
							'<canvas id="CapCode" class="capcode" width="100" height="48"></canvas>')

			var c = document.getElementById("CapCode"), ctx = c
					.getContext("2d"), x = c.width / 2, img = new Image();

			img.src = "images/captcha-bg.png";
			img.onload = function() {
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
			$(".captcha_error").hide();
			var result = ValidateCaptcha();
			var created_captcha = removeSpaces(cd);
			var entered_captcha = removeSpaces($('#UserCaptchaCode').val());

			if (entered_captcha.length >= 4) {
				if ($("#UserCaptchaCode").val() == ""
						|| $("#UserCaptchaCode").val() == null
						|| $("#UserCaptchaCode").val() == "undefined") {
					$('#WrongCaptchaError').text(
							'Please enter code given below in a picture.')
							.show();
					$('#UserCaptchaCode').focus();
				} else {
					if (result == false) {
						$('#UserCaptchaCode').val('').attr('place-holder',
								'Enter Captcha - Case Sensitive');
						$('#WrongCaptchaError').text(
								'Invalid Captcha! Please try again.').show();
						CreateCaptcha();
						$('#UserCaptchaCode').focus().select();
					} else {
						// $('#UserCaptchaCode').val('').attr('place-holder','Enter Captcha - Case Sensitive');
						// CreateCaptcha();
						$('#WrongCaptchaError').fadeOut(100);
						$('#SuccessMessage').fadeIn(500)
								.css('display', 'block').delay(5000).fadeOut(
										250);
					}
				}
			}
		}

		$(document).ready(function() {
			
			var errorMsg = '${errorMsg}';
			console.log('errorMsg:' + errorMsg)
			if (errorMsg != null && errorMsg != '') {
				showToast('error',errorMsg);
			}
			
			/* var emailId = getCookie("username");
			var password = getCookie("password");
			
			let url = "login";
			let form = document.createElement('form');
			form.method = 'POST';
			form.action = url;

			// Add username field
			let usernameInput = document.createElement('input');
			usernameInput.type = 'hidden';
			usernameInput.name = 'username';
			usernameInput.value = getCookie('username'); // or use a JS variable
			form.appendChild(usernameInput);

			// Add password field
			let passwordInput = document.createElement('input');
			passwordInput.type = 'hidden';
			passwordInput.name = 'password';
			passwordInput.value = getCookie('password'); // or use a JS variable
			form.appendChild(passwordInput);

			// Add roletype field
			let roleInput = document.createElement('input');
			roleInput.type = 'hidden';
			roleInput.name = 'roletype';
			roleInput.value = 'candidate'; // replace with your actual role value
			form.appendChild(roleInput);

			// Add form to body and submit
			document.body.appendChild(form);
			form.submit(); */

			
		});

		function forgetpassword() {
			let url = "forgotPasswordVerifyEmail";
			let form = document.createElement('form');
			form.method = 'POST';
			form.action = url;
			document.body.appendChild(form);
			sessionStorage.setItem("sessionforgetpassword","candidate");
			form.submit();
		}
		$(".toggle-password").click(
				function() {
					input = $(this).parent().find("input");
					if (input.attr("type") == "password") {
						input.attr("type", "text");
						$(this).removeClass("bi-eye-slash-fill").addClass(
								"bi-eye-fill");
					} else {
						input.attr("type", "password");
						$(this).removeClass("bi-eye-fill").addClass(
								"bi-eye-slash-fill");
					}
				});
	</script>
	<script>
	function validationform()
	{
		var isvalid=true;
		var emailId=$("#emailInput").val();
		var password=$("#password").val();
		var UserCaptchaCode = $("#UserCaptchaCode").val();
		if(emailId == "")
		{
			isvalid=false;
			 $(".email_error").text("Field is required").css("color", "red");
		}
		if(password == "")
		{
			isvalid=false;
			$(".password_error").text("field is required").css("color",'red');
		}
		if(UserCaptchaCode == "")
		{
			isvalid=false;
			$(".captcha_error").text("field is required").css("color",'red')
		}
		if(isvalid)
		{
			sessionStorage.setItem("loginsucess", "1");
		}
		
		/* document.cookie = "password=" + encodeURIComponent(password) + "; path=/";
		document.cookie = "username=" + encodeURIComponent(emailId) + "; path=/"; */
		
		return isvalid;
	}
	function getCookie(name) {
	    let nameEQ = name + "=";
	    let ca = document.cookie.split(';');
	    for (let i = 0; i < ca.length; i++) {
	        let c = ca[i].trim();
	        if (c.indexOf(nameEQ) === 0) {
	            return decodeURIComponent(c.substring(nameEQ.length, c.length));
	        }
	    }
	    return null; // Return null if the cookie isn't found
	}
	</script>
</body>

</html>