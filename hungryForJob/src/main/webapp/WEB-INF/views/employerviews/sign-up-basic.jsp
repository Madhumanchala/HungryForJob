<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Hungry for Job</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Favicons -->
  <link href="/employer/img/favicon.png" rel="icon">
  <link href="/employer/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="/employer/css/bootstrap.min.css" rel="stylesheet">
  <link href="/employer/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/employer/css/style.css" rel="stylesheet">
</head>

<body>
  <div class="loader"><img src="/employer/img/loader.gif"></div>
	<%@include file="header.jsp"%>
	<%@include file="toaster.jsp"%>
  <main id="main">
    <section class="section-inner sign-bg">
      <div class="container">
        <div class="row ">
          <div class="col-xl-8 col-lg-6 col-md-6  ">
            <div class="sign-left">
              <h4>INDIA'€™S #1 HIRING PLATFORM</h4>
              <h1>Find the right <span> candidate. Fast. </span> <img src="/employer/img/shape01.svg"> </h1>
              <div class="sign-bg-img">
                <img src="/employer/img/sign-bg.svg">
              </div>
            </div>
          </div>

          <div class="col-xl-4 col-lg-6 col-md-6  ">
            <div class="card-register">
              <div class="shape02"><img src="/employer/img/shape02.svg"> </div>
             
              	<!-- <form action="saveEmployer" 
						autocomplete="off" onSubmit="return validateEmployerDetailsForm()"  method="post" -->
						
						<form id="employerDetailsForm">
											
                <h3>Employer Sign Up</h3>

                <div class="step-wizard">
                  <div class="step current">
                    <div class="step-icon">1</div>
                    <div class="step-title">Basic details</div>
                  </div>
                  <div class="step ">
                    <div class="step-icon">2</div>
                    <div class="step-title">Company details</div>
                  </div>
                </div>

                <div class="card-registerinner floatinglabel ">
                  <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="text" class="form-control" id="fullName" name="fullName" onkeyup="checkFullname(this,'fullName-span')" placeholder=" " maxlength="50">
                        <label for="fullName" class="required">Full Name</label>
                       <span id="fullName-span" ></span>
                      </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="text" class="form-control" maxlength="10" id="mobileNo" name="mobileNo" onkeyup="checkMobileNumber(this,'mobileNo-span')" placeholder=" ">
                        <label for="mobileNo" class="required">Mobile No</label>
                        <span id="mobileNo-span" ></span>
                      </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group1 ">
                        <label for="company" >Your here to hire for </label>
                        <div class="formchecks">
                          <ul>
                            <li>
                              <input type="radio" class="btn-check"  name="hiringFor" value="company" id="company" onkeyup="removewaring()">
                              <label class="btn" for="company"><span>Company</span>
                              </label>
                             <!--  <span id="company-span"></span> -->
                            </li>
                            <li>
                              <input type="radio" class="btn-check"  value="consultant"  name="hiringFor" id="consultant" onkeyup="removewaring()">
                              <label class="btn" for="consultant"><span>Consultant </span>
                              </label>
                            <!--   <span id="consultant-span"></span> -->
                            </li>
                          </ul>
                          <span id="company-span"></span>
                        </div>
                        <!-- <span class="errors"> Please enter your Email ID</span>-->
                      </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="text" class="form-control" id="companyName" name="companyName" onkeyup="checkFullname(this)" placeholder=" ">
                        <label for="companyName" class="required">Company Name</label>
                        <span id="companyName-span"></span>
                      </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="email" class="form-control" id="companyEmailId" name="companyEmailId" 
                       onkeyup="checkMailId(this)"  placeholder=" ">
                        <label for="companyEmailId" class="required">Company Email Id</label>
                        <span id="companyEmailId-span"></span>
                      </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="password" class="form-control" id="Password" name="Password" onkeyup="checkPassword(this,'Password-span')" placeholder="" maxlength="40">
                        <label for="Password" class="required">Password</label>
                        <i class="toggle-password passwordeye bi-eye-slash-fill"></i>
                        <span id="Password-span" style="color:red"></span>
                      </div>
                    </div>
                    
                     <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" onkeyup="checkPassword(this,'confirmPassword-span')" placeholder=" " maxlength="40">
                        <label for="confirmPassword" class="required">Confirm Password</label>
                        <i class="toggle-password passwordeye bi-eye-slash-fill"></i>
                        <span id="confirmPassword-span" style="color:red"></span>
                      </div>
                    </div>
                    
                  <!--   <div class="col-lg-12 col-md-12 col-sm-12">
                         
                         
                             <div class="CaptchaWrap">
                                        <div id="CaptchaImageCode" class="CaptchaTxtField">
                                            <canvas id="CapCode" class="capcode"></canvas>
                                        </div>
                                       <button type="button" class="ReloadBtn" onclick='CreateCaptcha();' style="background: none; border: none;">
                                            <img src="employer/img/reload.png" alt="Reload Captcha" style="width: 36px; height: 26px;">
                                        </button>
                                    </div>
                                    <input type="text" id="UserCaptchaCode" class="form-control" tabindex="3" placeholder='Enter Captcha' onkeyup="funForHide(); removewaring()">
                                    <span id="WrongCaptchaError" class="error"></span>
                                    <span id="SuccessMessage2" class="success"></span>
                                    <span id="client3"></span>
                    </div> -->
                     <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <div class="row">
                          <div class="col-xxl-7 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <input type="text" id="UserCaptchaCode" class="form-control" tabindex="3" placeholder=' ' onkeyup="funForHide(); removewaring()">
                                   
                            <label for="Password" class="required">Captcha</label>
                             <span id="WrongCaptchaError" class="errors"></span>
                                    <span id="SuccessMessage2" class="success"></span>
                                   
                          </div>
                          <div class="col-xxl-5 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <div class='CaptchaWrap'>
                              <div id="CaptchaImageCode" class="CaptchaTxtField">
                                <canvas id="CapCode" class="capcode"></canvas>
                              </div>
                              <input type="button" class="reloadBtn" onclick='CreateCaptcha();'>
                            </div>
                          </div>
                           <span id="client3" class="errors"></span>
                        </div>
                      </div>
                    </div>

                    <div class="col-lg-12 text-center">
                    <!-- 
                    <button type="submit" class="btns" data-bs-toggle="modal" data-bs-target="#otpModal" >Submit</button> -->
                  <!--  <button type="submit" class="btns" data-bs-toggle="modal" data-bs-target="#otpModal"> Continue</button> -->
                     
                     
                     <button type="button" class="btns" 
							onclick="saveEmployerDetails()">Submit</button>
                    </div>
                    <div class="col-md-12 text-center mt-4">
                      Already Registered? <a class="text-primary" href="/employerlogin">Log In</a>
                    </div>
                  </div>
                </div>
                <div class="shape03"><img src="/employer/img/shape03.svg"> </div>
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
              <h4>Recruit the right talent faster with
                Hungryforjob Hiring Platform</h4>
              <ul>
                <li>2 Minutes to Post</li>
                <li>Unlimited Applies</li>
                <li>Attract Audience</li>
                <li>30 Day Visibility</li>
              </ul>

              <div class="products-color bgcolor1">
                <img src="/employer/img/product-img1.png">
              </div>
            </div>
          </div>
          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-products ">
              <h5>Hiring Solutions</h5>
              <h4>Recruit the right talent faster with
                Hungryforjob Hiring Platform</h4>
              <ul>
                <li>2 Minutes to Post</li>
                <li>Unlimited Applies</li>
                <li>Attract Audience</li>
                <li>30 Day Visibility</li>
              </ul>

              <div class="products-color bgcolor2">
                <img src="/employer/img/product-img1.png">
              </div>
            </div>
          </div>

          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-products ">
              <h5>Hiring Solutions</h5>
              <h4>Recruit the right talent faster with
                Hungryforjob Hiring Platform</h4>
              <ul>
                <li>2 Minutes to Post</li>
                <li>Unlimited Applies</li>
                <li>Attract Audience</li>
                <li>30 Day Visibility</li>
              </ul>

              <div class="products-color bgcolor3">
                <img src="/employer/img/product-img1.png">
              </div>
            </div>
          </div>
          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-products ">
              <h5>Hiring Solutions</h5>
              <h4>Recruit the right talent faster with
                Hungryforjob Hiring Platform</h4>
              <ul>
                <li>2 Minutes to Post</li>
                <li>Unlimited Applies</li>
                <li>Attract Audience</li>
                <li>30 Day Visibility</li>
              </ul>

              <div class="products-color bgcolor1">
                <img src="/employer/img/product-img1.png">
              </div>
            </div>
          </div>
          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-products ">
              <h5>Hiring Solutions</h5>
              <h4>Recruit the right talent faster with
                Hungryforjob Hiring Platform</h4>
              <ul>
                <li>2 Minutes to Post</li>
                <li>Unlimited Applies</li>
                <li>Attract Audience</li>
                <li>30 Day Visibility</li>
              </ul>

              <div class="products-color bgcolor2">
                <img src="/employer/img/product-img1.png">
              </div>
            </div>
          </div>

          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-products ">
              <h5>Hiring Solutions</h5>
              <h4>Recruit the right talent faster with
                Hungryforjob Hiring Platform</h4>
              <ul>
                <li>2 Minutes to Post</li>
                <li>Unlimited Applies</li>
                <li>Attract Audience</li>
                <li>30 Day Visibility</li>
              </ul>

              <div class="products-color bgcolor3">
                <img src="/employer/img/product-img1.png">
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
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                    aria-expanded="true" aria-controls="collapseOne">
                    How does it work ?
                  </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse
                    plugin adds
                    the appropriate classes that we use to style each element. These classes control the overall
                    appearance, as well
                    as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or
                    overriding our
                    default variables. It's also worth noting that just about any HTML can go within the
                    <code>.accordion-body</code>, though the transition does limit overflow.
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    How can I request for a demo session?
                  </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    <strong>This is the second item's accordion body.</strong> It is hidden by default, until the
                    collapse plugin
                    adds the appropriate classes that we use to style each element. These classes control the overall
                    appearance, as
                    well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or
                    overriding our
                    default variables. It's also worth noting that just about any HTML can go within the
                    <code>.accordion-body</code>, though the transition does limit overflow.
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    How can I make payment?
                  </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    <strong>This is the third item's accordion body.</strong> It is hidden by default, until the
                    collapse plugin
                    adds the appropriate classes that we use to style each element. These classes control the overall
                    appearance, as
                    well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or
                    overriding our
                    default variables. It's also worth noting that just about any HTML can go within the
                    <code>.accordion-body</code>, though the transition does limit overflow.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="container">
      <div class="copyright">
        <ul>
          <li><a href="#"> About Us </a> </li>
          <li><a href="#"> Contact Us</a> </li>
        </ul>
        <p>Copyright Â© 2024. Hungry for job all right reserved</p>
      </div>
    </div>
  </footer><!-- End Footer -->


  <div class="modal fade" id="otpModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="otpModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header1">

          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form autocomplete="off">
            <div class="card-registerinner otp-section ">
              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                  <h3 class="mb-3">Verify email ID</h3>
                  <p>We have sent an OTP to your email ID <br>  <strong id="otpEmail">example@example.com</strong>                  
                  </p>
                </div>
                
                <!-- Error Message Placeholder -->
              <div class="col-lg-12">
                <div id="otpErrorMsg" class="alert alert-danger" style="display:none;"></div>
              </div>
              
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="otp-container">
                    <input type="text" maxlength="1" class="otp-input" id="otp1">
                    <input type="text" maxlength="1" class="otp-input" id="otp2">
                    <input type="text" maxlength="1" class="otp-input" id="otp3">
                    <input type="text" maxlength="1" class="otp-input" id="otp4">	
                    <input type="text" maxlength="1" class="otp-input" id="otp5">
                    <input type="text" maxlength="1" class="otp-input" id="otp6">
                    
                  </div>
                  
                   <div class="otpExpires d-flex justify-content-end"><span id="resendOtp" style=" display:none;cursor:pointer; color:#437ad0; font-size:13px; margin-right:18px;" onclick="saveEmployerDetails()">Resend OTP</span></div>
                            
              <div class="d-flex align-items-center justify-content-center ">	
  			<div class="otpExpires"  id="otp-timer">
   			 <span class="second" style=" display:none;" >-</span>
 			 </div>
			</div>


                </div>
                <div class="col-lg-12 text-center">
      <!--   <button id="verifyOTPBtn" class="btns mt-4" onclick="verifyOtp()">Verify OTP</button> -->
        <button type="button" class="btns mt-4" id="verifyOTP" onclick="verifyOtp()" > Verify OTP </button>
                </div>

              </div>
            </div>
          </form>

        </div>

      </div>
    </div>
  </div>
  
  <!-- Notification Modal -->
<div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="notificationModalLabel">Notification</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="notificationMessage">
        <!-- Message will be inserted here dynamically -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>
  


  <script src="/employer/js/jquery.min.js"></script>
  <script src="/employer/js/bootstrap.min.js"></script>
  <script src="/employer/js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="/employer/js/signupbasic.js"></script>
  
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

      img.src = "/employer/img/captcha-bg.png";
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

    $(document).ready(function () {
      setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);
    });



  </script>

<script type="text/javascript">
		function validateEmployerDetailsForm() {
			var fullName = $("#fullName").val();
			var mobileNo = $("#mobileNo").val();
			var radios = document.getElementsByName('hiringFor');
			var companyName = $("#companyName").val();
			var companyEmailId = $("#companyEmailId").val();
			var Password = $("#Password").val();
			var confirmPassword = $("#confirmPassword").val();
			var company = $("#company").val();
			var consultant = $("#consultant").val();
			var designation = $("#designation").val();
			var departmentid = $("#departmentid").val();
		
			var isChecked = false;
			
			for (var i = 0; i < radios.length; i++) {
			    if (radios[i].checked) {
			        isChecked = true;
			        break;
			    }
			}
			
			 if (fullName == null || fullName == "") {
	                document.getElementById("fullName-span").innerHTML = "Please Enter full Name";
	                document.getElementById("fullName-span").style.color = "Red";
	                return false;
	            }else
	            {
	            	document.getElementById("fullName-span").innerHTML = "";
	            }
			
			 if (mobileNo == null || mobileNo == "") {
	                document.getElementById("mobileNo-span").innerHTML = "Please Enter mobile No";
	                document.getElementById("mobileNo-span").style.color = "Red";
	                return false;
	            }else
	            {
	            	document.getElementById("mobileNo-span").innerHTML = "";

	            }
			 if (!isChecked) {
	                document.getElementById("company-span").innerHTML = "Please Select company";
	                document.getElementById("company-span").style.color = "Red";
	                return false;
	           }else
	           {
	                document.getElementById("company-span").innerHTML = "";
	           }
			 if (companyName == null || companyName == "") {
	                document.getElementById("companyName-span").innerHTML = "Please Enter company Name";
	                document.getElementById("companyName-span").style.color = "Red";
	                return false;
	            }else
	            {
	                document.getElementById("companyName-span").innerHTML = "";

	            }
			 if (companyEmailId == null || companyEmailId == "") {
	                document.getElementById("companyEmailId-span").innerHTML = "Please Enter company EmailId";
	                document.getElementById("companyEmailId-span").style.color = "Red";
	                return false;
	            }else
	            {
	                document.getElementById("companyEmailId-span").innerHTML = "";
	            }
			 if (Password == null || Password == "") {
	                document.getElementById("Password-span").innerHTML = "Please Enter Password";
	                document.getElementById("Password-span").style.color = "Red";
	                return false;
	            }else
	            {
	                document.getElementById("Password-span").innerHTML = "";

	            }
			 if (confirmPassword == null || confirmPassword == "") {
			        document.getElementById("confirmPassword-span").innerHTML = "Please Enter confirm Password";
			        document.getElementById("confirmPassword-span").style.color = "Red";
			        return false;
			    }else
			    {
			        document.getElementById("confirmPassword-span").innerHTML = "";
			    }
			    if (Password !== confirmPassword) {
			        document.getElementById("confirmPassword-span").innerHTML = "Password and Confirm Password do not match";
			        document.getElementById("confirmPassword-span").style.color = "Red";
			        $('#confirmPassword').val(""); // Clear confirm password field
			        return false;
			    }else
			    {
			        document.getElementById("confirmPassword-span").innerHTML = "";

			    }

			    // Captcha validation
			    var enteredCaptcha = removeSpaces($('#UserCaptchaCode').val());
			    var createdCaptcha = removeSpaces(cd); // Assuming 'cd' is the generated captcha value

			    // First check if the captcha field is empty
			    if (enteredCaptcha === "") {
			        document.getElementById("client3").innerHTML = "Please Enter Captcha Code";
			        document.getElementById("client3").style.color = "Red";
			        document.getElementById("WrongCaptchaError").innerHTML = ""; // Clear any previous captcha errors
			        return false;
			    }

			    // Then check if the entered captcha is incorrect
			    if (enteredCaptcha !== createdCaptcha) {
			        document.getElementById("WrongCaptchaError").innerHTML = "Invalid Captcha! Please try again.";
			        document.getElementById("WrongCaptchaError").style.color = "Red";
			        document.getElementById("client3").innerHTML = ""; // Clear the empty captcha message
			        $('#UserCaptchaCode').val(""); // Clear captcha input
			        CreateCaptcha(); // Regenerate the captcha
			        return false;
			    }

			    return true;
		}
		
		$("#mobileNo").on("input", function() {
			var budget = $(this).val();
			if (!/^\d*$/.test(budget)) {
				$(this).val(budget.replace(/[^\d]/g, '')); // Remove non-numeric characters
			}
		});
		
		 function isSpclCharEmail(obj) {
	            var x = obj.value;
	            var atpos = x.indexOf("@");
	            var dotpos = x.lastIndexOf(".");
	            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
	                document.getElementById("companyEmailId-span").innerHTML = "Please Enter valid email ID";
	                document.getElementById("companyEmailId-span").style.color = "Red";
	                obj.focus();
	                return false;
	            }
	        }
		 
		   function removewaring() {
	            document.getElementById("fullName-span").innerHTML = "";
	            document.getElementById("mobileNo-span").innerHTML = "";
	            document.getElementById("companyName-span").innerHTML = "";
	            document.getElementById("companyEmailId-span").innerHTML = "";
	            document.getElementById("Password-span").innerHTML = "";
	            document.getElementById("confirmPassword-span").innerHTML = "";
	            document.getElementById("company-span").innerHTML = "";
	            document.getElementById("client3").innerHTML = "";
	        }
		   
		   
			   function saveEmployerDetails() {
				  
		            document.getElementById("resendOtp").style.display = "none";
		            startOTPTimer();
		            document.getElementById("otp-timer").style.display = "block";

				    var formData = $("#employerDetailsForm").serializeArray();
		
				    if (!validateEmployerDetailsForm()) {
				        return;
				    }
	
				    var loginFormObjectt = {};
				    $.each(formData, function(i, v) {
				        loginFormObjectt[v.name] = v.value;
				    });
				    console.log(loginFormObjectt);
				    $.ajax({
				        url: "saveEmployer",
				        type: "POST",
				        dataType: "json",
				        contentType: "application/json; charset=utf-8",
				        data: JSON.stringify(loginFormObjectt),
				        
				        success: function(result) {
				        	 if (result.errorCode === "0000") {
				                $('#otpModal').find('strong').text(loginFormObjectt.companyEmailId);
				        	    $('#otpModal').modal('show');
				        	   }
				        	 else if (result.errorCode === "1010") {
				        		 
				        		 showToast('info','Email already exists. Please use a different email.');
				        	 }
				        	 else {
				        		 showToast('error','Failed to send OTP. Please try again.');
				        	 }
				        },
				        error: function(error) {
				            console.log(error);
				           showToast('error','Due to Some Technical Error Unable to Procced Further..');
				        }
				    });
				}
			   
			   
		   function verifyOtp() {
			    // Collect the email and OTP from the inputs
			    var emailInput = document.getElementById("otpEmail").innerText;
			    var name =$('#fullName').val();
			    var companyname =$('#companyName').val();
			    var mobilen = $('#mobileNo').val();
			    var Password = $('#Password').val();
			    var confirmpass = $('#confirmPassword').val();
			    var hiringFor = document.getElementsByName('hiringFor');
			   
			    
			 // Loop through the radio buttons to find the one that is checked
			    var checkedValue = '';
			    for (var i = 0; i < hiringFor.length; i++) {
			      if (hiringFor[i].checked) {
			        checkedValue = hiringFor[i].value;
			        break;
			      }
			    }
			    
			    var errorMsg = document.getElementById("otpErrorMsg");
			    
			    var otp = '';
			    for (let i = 1; i <= 6; i++) {
			        otp += document.getElementById('otp' + i).value; // Concatenate the values of OTP inputs
			    }
			    if (otp.length < 6) {
			        errorMsg.innerHTML = 'Please enter a complete OTP.';
			        errorMsg.style.display = 'block'; // Show the error message
			        return;
			    } else {
			        errorMsg.style.display = 'none'; // Hide the error message if no error
			    }

			    $.ajax({
			        url: "/EmployerValidateOtp",
			        method: 'POST',
			        data: {
			        	companyEmailId: emailInput,
			        	fullName: name,
			        	companyName:companyname,
			        	mobileNo: mobilen,
			        	Password: Password,
			            otpInput: otp,
			            confirmPassword:confirmpass,
			            hiringFor:checkedValue
			        },
			        success: function(result) {
			            console.log("result: ", result);
			            if (result.errorCode === "0000") {
			                // Hide the error message and redirect on success
			                errorMsg.style.display = 'none';
			                window.location.href = "/companyDetails";
			            } else if (result.errorCode === "1010") {
			                errorMsg.innerHTML = 'OTP has expired. Please request a new one.';
			                errorMsg.style.display = 'block'; // Show OTP expired error
			            } else if (result.errorCode === "1111") {
			                errorMsg.innerHTML = 'Invalid Otp';
			                errorMsg.style.display = 'block'; // Show resend OTP error
			            } else {
			                errorMsg.innerHTML = 'Verification failed. Please check your inputs.';
			                errorMsg.style.display = 'block'; // Show general error
			            }
			        },
			        error: function(xhr, status, error) {
			            console.log("Error: ", xhr.responseText);
			            errorMsg.innerHTML = 'An error occurred: ' + error;
			            errorMsg.style.display = 'block'; // Show error message
			        }
			    });
			}
		   
		   function startOTPTimer() {
			    var otpTime = 120; // 120 seconds for 2 minutes
			    var timerDisplay = document.getElementById('otp-timer');
			    var interval = setInterval(function() {
			        otpTime--;

			        // Calculate minutes and seconds
			        var minutes = Math.floor(otpTime / 60);
			        var seconds = otpTime % 60;

			        // Display minutes and second	s
			        timerDisplay.innerHTML = "Your OTP Expires in " + minutes + " min " + (seconds < 10 ? "0" + seconds : seconds) + " sec";

			        if (otpTime == 0) {
			            clearInterval(interval);
			            // Update text when OTP expires
			            timerDisplay.innerHTML = "OTP expired";
			            document.getElementById("resendOtp").style.display = "block";
			            document.getElementById("otp-timer").style.display = "none";
			            // Optionally call a function when OTP expires
			            Expireotp(); 
			        }
			    }, 1000); // Update every second
			}


			 $('#otpModal').on('shown.bs.modal', function() {
			   startOTPTimer(); // Start the timer when the OTP modal is shown
	          //  document.getElementById("resendOtp").style.display = "none";

			 });
			 
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

</body>

</html>