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
  <!-- <link href="css/toastr.css" rel="stylesheet"/> -->
</head>
<body>
 
  <%@include file="header.jsp"%>
  <main id="main">
    <section class="section-inner login-bg">
      <div class="container">
        <div class="row ">
          <div class="col-xl-7 col-lg-6 col-md-6 ">
            <div class="login-img">
              <img src="img/verify-email.svg">
            </div>
          </div>

          <div class="col-xl-4 col-lg-6 col-md-6  ">
            <div class="card-register">
<!--               <form autocomplete="off">
 -->                <div class="card-registerinner  ">
                  <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                      <h3>Candidate SignUp</h3>
                     <!--  <p>One Time Password(OTP) has been sent on <br> mahibhairi@gmail.com <a href="#"><img
                            src="img/edit.svg"> </a> </p> -->
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12" id="EmailIDDiv">
                      <div class="form-group">
                        <label for="emailInput" class="required">Email ID </label>
                        <input type="email" class="form-control" id="emailInput" name="emailInput" placeholder="Enter Email ID">
                         <span id="emailError" class="error-message" style="color:red; display:none;">Invalid email address!</span>
                        <span id="emailExistsError" class="info-message" style="color:blue; display:none;">Email already exists!</span>
                      </div>
                    </div>
	
                    <div class="col-lg-12 col-md-12 col-sm-12" id="captachaById">
                      <div class="form-group">
                        <div class="row">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-5">
                            <input type="text" id="UserCaptchaCode" name="captcha" class=" form-control"
                              placeholder='Enter Captcha' autocomplete="off" onkeyup="CheckCaptcha()" minlength="4"
                              required>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-7">
                            <div class='CaptchaWrap'>
                              <div id="CaptchaImageCode" class="CaptchaTxtField">
                                <canvas id="CapCode" class="capcode"></canvas>
                              </div>
                              <input type="button" class="ReloadBtn" onclick='CreateCaptcha();'>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div id="messageContainer"></div>
                    <div class="col-lg-12 col-md-12 col-sm-12 mt-2" style="display:none;" id="otpInputContainer">
                        <div class="form-group">
                            <div class="text-center">
                                <input type="text" id="otpInput" class="form-control" placeholder="Enter OTP" onkeyup="checkOnlyNumbers(this,'')" maxlength="4">
                                 <span class="countdown"></span> <span id="resendOtp" style="position:absolute; top:50%; right:10px; transform:translateY(-50%); cursor:pointer; color:blue;" onclick="checkValidation()">Resend OTP</span>
                                <button id="verifyOTPBtn" class="btns mt-5" onclick="verifyOtp()">Verify OTP</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 text-center" id="verifyemail">
                      <button class="btns" onclick="checkValidation()" id='verify_email_1'>Verify Email </button>
                    </div>

                    <div class="col-md-12 text-center mt-4">
                      Already have an account? <a class="text-primary" href="/login">Log In</a>
                    </div>
                  </div>
                </div>
              <!-- </form> -->
            </div>
          </div>
        </div>
      </div>
    </section>
     <%@include file="toaster.jsp"%>
  </main><!-- End #main -->
   <%@include file="footer.jsp"%>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <script src="js/verifyEmail.js"></script>
  <script src="js/commonvalidation.js"></script>
  <!-- <script src="js/toastr.min.js" type="text/javascript"></script> -->
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

      img.src = "/images/captcha-bg.png";
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
  
  document.getElementById("verify_email_1").addEventListener("click", () => {
	  	checkValidation();
	  	countdownfun();
	});
  
  function countdownfun()
  {
	  const timerDisplay = document.querySelector(".countdown");

	    if (!timerDisplay) {
	        console.error("Countdown element not found!");
	        return;
	    }

	    let timeLeft = 180; // 3 minutes in seconds

	    function formatTime(time) {
	    	console.log(time);
	    	//const minutes = String(Math.floor(time / 60)).padStart(2, '0');
	        //const seconds = String(time % 60).padStart(2, '0');
	        // return `${minutes}:${seconds}`;
	        
	        let minutes = Math.floor(time / 60);
  		let remainingSeconds = time % 60;
  		
  		let minStr = minutes < 10 ? "0" + minutes : minutes;
  	    let secStr = remainingSeconds < 10 ? "0" + remainingSeconds : remainingSeconds;
  	    
  	    return minStr + ":" + secStr;
	        
	        //return minutes +":"+ seconds;
	    }

	    timerDisplay.textContent = formatTime(timeLeft);

	    const timerInterval = setInterval(() => {
	        if (timeLeft > 0) {
	            timeLeft--;
	            timerDisplay.textContent = formatTime(timeLeft);
	        } else {
	            clearInterval(timerInterval);
	        }
	    }, 1000);
  }
  
  /* document.addEventListener("DOMContentLoaded", function () {
	    const timerDisplay = document.querySelector(".countdown");

	    if (!timerDisplay) {
	        console.error("Countdown element not found!");
	        return;
	    }

	    let timeLeft = 180; // 3 minutes in seconds

	    function formatTime(time) {
	    	console.log(time);
	    	//const minutes = String(Math.floor(time / 60)).padStart(2, '0');
	        //const seconds = String(time % 60).padStart(2, '0');
	        // return `${minutes}:${seconds}`;
	        
	        let minutes = Math.floor(time / 60);
    		let remainingSeconds = time % 60;
    		
    		let minStr = minutes < 10 ? "0" + minutes : minutes;
    	    let secStr = remainingSeconds < 10 ? "0" + remainingSeconds : remainingSeconds;
    	    
    	    return minStr + ":" + secStr;
	        
	        //return minutes +":"+ seconds;
	    }

	    timerDisplay.textContent = formatTime(timeLeft);

	    const timerInterval = setInterval(() => {
	        if (timeLeft > 0) {
	            timeLeft--;
	            timerDisplay.textContent = formatTime(timeLeft);
	        } else {
	            clearInterval(timerInterval);
	        }
	    }, 1000);
	}); */
    </script>
  
</body>

</html>