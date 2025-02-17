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
              <form autocomplete="off" method="post" action="/forgotPassChangePassword" onsubmit="return validationForm()">
                <div class="card-registerinner otp-section">
                  <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                      <h3>Reset Password</h3>
					  <p>Strong passwords include numbers, letters, and punctuation marks.</p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="newPassword" class="required">New Password </label>
                        <input type="password" class="form-control" id="newPassword" name="password" placeholder="Enter New Password">
						 <i class="toggle-password bi bi-eye-fill"></i>
                         <span class="errors" id="newPasswordError"></span>
                      </div>
                    </div>
					 <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="confirmPassword" class="required">Confirm Password  </label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Enter Confirm Password">
						 <i class="toggle-password bi bi-eye-fill"></i>
                        <span class="errors" id="confirmPasswordError"></span>
                      </div>
                    </div>	 
					<input type="hidden" name="username" id="username" value="${username}"/>
                    <div class="col-lg-12 text-center">
                      <button type="submit" class="btns">Confirm </button>
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
	<%@include file="footer.jsp"%>
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

      img.src = "https://hungryforjob.com/assets/images/captcha-bg.png";
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
  </script>
    <script>
  $(".toggle-password").click(function() {
    $(this).toggleClass("bi-eye-slash-fill");
    input = $(this).parent().find("input");
    if (input.attr("type") == "password") {
        input.attr("type", "text");
    } else {
        input.attr("type", "password");
    }
});
  function validationForm()
  {
	  var newPassword=$('#newPassword').val();
	  var confirmPassword=$('#confirmPassword').val();
	  const passwordStrengthRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

	    if (!newPassword.match(passwordStrengthRegex)) {
	    	$('#newPasswordError').text('Password must be at least 8 characters long, contain an uppercase letter, a lowercase letter, a number, and a special character.');
	    	$('#newPasswordError').show();
	    	return false;
	    }

	    if (newPassword !== confirmPassword) {
	    	$('#confirmPasswordError').text('Passwords do not match.');
	    	$('#confirmPasswordError').show();
	    	return false;
	    }
  }
  $('#comfirmPassword').on('keyup', function() {
	  $('#confirmPasswordError').hide();
  });
  $('#newPassword').on('keyup', function() {
	  $('#newPasswordError').hide();
  });
  </script>
  
</body>

</html>