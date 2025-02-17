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
    });

	   function otpSubmit()
	   {
		   var otp1=$('#otp1').val();
		   var otp2=$('#otp2').val();
		   var otp3=$('#otp3').val();
		   var otp4=$('#otp4').val();
		   
		   if (!otp1 || !otp2 || !otp3 || !otp4) {
		        $('.error_otp').text("Enter the otp").css('color','red');
		        $('.error_otp').show();
		        return;
		    }
		   var otp=otp1+otp2+otp3+otp4;
		   
		   var url = "/forgotPassVerifyOtp";
			
			var form = document.createElement('form');
			form.method = 'POST'; 
			form.action = url;
			
			var idInput = document.createElement('input');
			idInput.type = 'hidden';
			idInput.name = 'otpInput';
			idInput.value = otp;
			form.appendChild(idInput);
			
			var idInput1 = document.createElement('input');
			idInput1.type = 'hidden';
			idInput1.name = 'emailInput';
			idInput1.value = "${emailInput}";
			form.appendChild(idInput1);
			
			document.body.appendChild(form);
			form.submit();
	   }
	   $('.otp-input').on('keyup', function() {
		   $('.error_otp').hide();
	    });
  </script>
</body>
</html>