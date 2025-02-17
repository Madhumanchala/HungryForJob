<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

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
  <link href="/employer/css/select2.min.css" rel="stylesheet" />
  <link href="/employer/css/style.css" rel="stylesheet">
</head>

<body>
  <div class="loader"><img src="/employer/img/loader.gif"></div>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="/employer/img/logo.svg" alt="">
      </a>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="getstarted" href="/login">Candidate Login</a></li>
          <li><a class="getstarted" href="/employerlogin">Employer Login</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->


  <main id="main">

    <section class="section-inner sign-bg">
      <div class="container">
        <div class="row ">
          <div class="col-xl-8 col-lg-6 col-md-6  ">
            <div class="sign-left">
              <h4>INDIA’S #1 HIRING PLATFORM</h4>
              <h1>Find the right <span> candidate. Fast. </span> <img src="/employer/img/shape01.svg"> </h1>
              <div class="sign-bg-img">
                <img src="/employer/img/sign-bg.svg">
              </div>
            </div>
          </div>

          <div class="col-xl-4 col-lg-6 col-md-6  ">
            <div class="card-register">
              <div class="shape02"><img src="/employer/img/shape02.svg"> </div>
              <form autocomplete="off" action="SaveCompanydetails"   onSubmit="return validateEmployerDetailsForm()" method="post"  >
              
                <h3>Employer Sign Up</h3>

  <div class="step-wizard">
                  <div class="step active">
                    <div class="step-icon">1</div>
                    <div class="step-title">Basic details</div>
                  </div>
                  <div class="step current">
                    <div class="step-icon">2</div>
                    <div class="step-title">Company details</div>
                  </div>
                </div>

                <div class="card-registerinner  ">
                  <div class="row">
                  
                   <div class="col-lg-12 col-md-12 col-sm-12">
  <div class="form-group selet2group">
    <select class="form-control selet2Single" id="Industry" name="industry" onkeyup="removeWarnings()">
       <option disabled selected>Select</option>
       <c:forEach items="${industryList}" var="item">
        <option value="${item.industryName}">${item.industryName}</option>
      </c:forEach> 
    </select> 
    <label for="industry" class="required">Industry</label>
    <span id="Industry-span"></span>
  </div>
</div>
                   
                    
<!--                       <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group selet2group">
                        <select class="form-control selet2Single " id="numberEmployees" name="numberofemployees">
                          <option value="" disabled selected>Select</option>
                          <option value="1">option 1</option>
                          <option value="2">option 2</option>
                        </select>
                        <label for="numberEmployees" class="required">Number of employees</label>
                      </div>
                    </div>
 -->                    
                    <div class="col-lg-12 col-md-12 col-sm-12">
                     <div class="form-group">
                        <input type="text" class="form-control" id="numberofemployees" name="numberofemployees" onkeyup="removeWarnings()" placeholder=" ">
                        <label for="numberofemployees" class="required">Number of employees</label>
                        <span id="numberofemployees-span"></span>
                      </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="text" class="form-control" id="designation" onkeyup="checkFullname(this,'designation-span')" name="designation" placeholder=" " maxlength="30">
                        <label for="designation" class="required">Your Designation</label>
                        <span id="designation-span"></span>
                      </div>
                    </div>
                   <!--  <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group selet2group">
                        <select class="form-control selet2Single " name="country" id="country">
                          <option value="" disabled selected>Select</option>
                          <option value="India">option 1</option>
                          <option value="USA">option 2</option>
                        </select>
                        <label for="country" class="required">Country</label>
                      </div>
                    </div> -->
                   
                   
                  <!--   <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="text" class="form-control" id="pinCode" name="pincode" placeholder=" ">
                        <label for="pinCode" class="required">Pin Code</label>
                      </div>
                    </div> -->
                    
                    	<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="form-group"><input type="text" name="pincode" onkeyup="removeWarnings()" id="pincode"
											class="form-control" placeholder="" maxlength="6">
											
										<label for="pincode" class="form-label required">PinCode </label> 
										<span class="pincode_error errorfield" id="pincode_error"></span>
										<span id="pincode_error"></span>
									</div>
								</div>
								
                  <!--    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group selet2group">
                        <select class="form-control selet2Single " name="state" id="state">
                          <option value="" disabled selected>Select</option>
                          <option value="Maharashtra">option 1</option>
                          <option value="goa">option 2</option>
                        </select>
                        <label for="state" class="required">State</label>
                      </div>
                    </div> -->
                    
                    <div class="col-lg-12 col-md-12 col-sm-12"
									id="statelocationModal">
									<div class="form-group">
									<input type="text" name="state" id="stateLocation" onkeyup="removeWarnings()"
											class="form-control" placeholder="">
										<label for="stateLocation" class="form-label required">State</label>
										 <span
											class="errorfield" id="state_location_error"
											style="color: red"></span>
									</div>
								</div>
								
								
<!--                      <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <input type="text" class="form-control" id="city" name="city" placeholder=" ">
                        <label for="city" class="required">City</label>
                      </div>
                    </div> -->
                    
                    <div class="col-lg-12 col-md-12 col-sm-12"
						id="currentlocationModal">
						<div class="form-group">
						
						<label for="currentLocation" class="form-label "> City</label>
						</div>
						</div>
						
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <textarea class="form-control" id="companyAddress" name="companyaddress" onkeyup="removeWarnings()" placeholder=""> </textarea>
                        <label for="companyAddress" class="required">Company address</label>
                        <span id="companyAddress-span"></span>
                      </div>
                    </div>
                    
<!-- 
   <div class="col-lg-12 col-md-12 col-sm-12"> 
  <div class="form-group selet2group">
    <select class="form-control selet2Single" id="firstDropdown" name="numberofemployees" multiple>
      <option value="java">Java</option>
      <option value="python">Python</option>
    </select>
    <label for="firstDropdown" class="required">Select Language/Technologies</label>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    $('#firstDropdown').on('change', function() {
      var selectedValues = $(this).val();

      // Hide the "Python" option if "Java" is selected, and vice versa
      if (selectedValues.includes('java')) {
        $(this).find('option[value="python"]').hide(); // Hide Python option
        if (!$(this).find('option[value="spring boot"]').length) {
          $(this).append('<option value="spring boot">Spring Boot</option>');
          $(this).append('<option value="spring mvc">Spring MVC</option>');
        }
      }

      if (selectedValues.includes('python')) {
        $(this).find('option[value="java"]').hide(); // Hide Java option
        if (!$(this).find('option[value=".net"]').length) {
          $(this).append('<option value=".net">.NET</option>');
          $(this).append('<option value="framework">Framework</option>');
        }
      }
    });
  });
</script>  --> 

                    <div class="col-lg-12 text-center">
                    <button  type="submit" class="btns">Continue</button>
                      <!-- <button class="btns"> Continue </button> -->
                    </div>
                    <div class="col-md-12 text-center mt-4">
                      Already Registered? <a class="text-primary" href="login.html">Log In</a>
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

        <div class="row ">


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
        <p>Copyright © 2024. Hungry for job all right reserved</p>
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
                  <p>We have sent an OTP to your email ID <br> <strong> rajuyadav@gmail.com</strong> <a href="#"
                      data-bs-dismiss="modal">
                      <svg width="9" height="11" viewBox="0 0 9 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                          d="M1.06615 8.86841C1.17145 8.86841 1.19251 8.85788 1.28727 8.83683L3.18257 8.45777C3.38263 8.40512 3.58269 8.31035 3.74063 8.15241L8.33146 3.56158C9.03693 2.85611 9.03693 1.64522 8.33146 0.939752L7.94187 0.529104C7.2364 -0.176368 6.01499 -0.176368 5.30951 0.529104L0.718683 5.13047C0.571271 5.27788 0.465977 5.48847 0.413329 5.68853L0.013211 7.60488C-0.0394362 7.96288 0.065858 8.31035 0.318564 8.56306C0.518624 8.76312 0.813448 8.86841 1.06615 8.86841ZM1.42415 5.88858L6.01499 1.28722C6.32034 0.981869 6.8784 0.981869 7.17322 1.28722L7.57334 1.68734C7.93134 2.04534 7.93134 2.55075 7.57334 2.89823L2.99304 7.49959L1.0451 7.826L1.42415 5.88858ZM8.28934 9.52124H0.518624C0.21327 9.52124 0.013211 9.7213 0.013211 10.0267C0.013211 10.332 0.265917 10.5321 0.518624 10.5321H8.24723C8.55258 10.5321 8.80529 10.332 8.80529 10.0267C8.79476 9.7213 8.54205 9.52124 8.28934 9.52124Z"
                          fill="#444444" />
                      </svg>
                    </a>
                  </p>
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
                  <div class="d-flex align-items-center justify-content-center ">
                    <div class="otpExpires">Your OTP expires in <span class="second">23 sec</span></div>
                  </div>

                </div>
                <div class="col-lg-12 text-center">
                  <button type="submit" class="btns"> Verify OTP </button>
                </div>

              </div>
            </div>
          </form>

        </div>

      </div>
    </div>
  </div>



  <script src="/employer/js/jquery.min.js"></script>
  <script src="/employer/js/bootstrap.min.js"></script>
  <script src="/employer/js/select2.min.js"></script>
  <script src="/employer/js/main.js"></script>
  <script>
    $(document).ready(function () {
      $(".selet2Multiple").select2({
      });
      $(".selet2Single").select2({
      });
    });

    $(document).ready(function () {
      setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);
    });

  </script>
  
  <script type="text/javascript">
  $(document).ready(function() {
	    $('#select2Single').select2();
	    $('#current_location').attr('disabled', 'disabled');
	});
	$('#pincode').on('keyup', function() {
		$('.pincode_error').hide(); 
		var selectedId = $(this).val(); 
		 if (selectedId.length === 6) {
			 $('#state_location_error').hide();
			 fetchCities(selectedId);
			 $('#current_location').removeAttr('disabled');
		 }else
		{
			 $('.pincode_error').text('Please enter a valid 6-digit pincode.').css("color","red").show();
		}
		 
	});

	function fetchCities(id)
	{
		$.ajax({
		    url: "getPoastalCode",
		    method: "POST",
		    data: {
		        "pincode": id
		    },
		    success: function (response) {
		        console.log(response);
		        if (response[0] !== null) {
		            if (response[0].PostOffice !=null) {
		            	isValidPincode=true
		                var postOffices = response[0].PostOffice;
		                if (postOffices.length == 1) {
		                    $('#current_location').remove();
		                    $('#currentlocationModal').find('span').remove();
		                    $('#current_location').select2('destroy');
		                    $('#current_location1').remove();
		                    $('#current_location_error').remove();
		                    $('#stateLocation').prop("disabled", true);
		                    $("#stateLocation").val(postOffices[0].State);
		                    $('#currentlocationModal').show();

		                    // Create the input box dynamically
		                    var $input = $('<input>', {
		                        id: 'current_location',
		                        type: 'text',
		                        name:'city',
		                        class: 'form-control',
		                        placeholder: 'Enter other city',
		                        disabled: true,
		                        value: postOffices[0].Name
		                    });
		                    $('#currentlocationModal .form-group').append($input);
		                    
		                    // Add the error span after the input
		                    var $errorSpan = $('<span>', {
		                        class: 'errorfield',
		                        id: 'current_location_error'
		                    });
		                    
		                    $('#currentlocationModal .form-group').append($errorSpan);
		                    $('#current_location').next(".select2-container").hide();
		                    $('#statelocationModal').show();
		                } else {
		                    $('#current_location').remove();
		                    $('#currentlocationModal').find('span').remove();
		                    $('#current_location_error').remove();
		                    $('#statelocationModal').show();
		                    $('#stateLocation').val(postOffices[0].State);
		                    $('#stateLocation').prop("disabled", true);

		                    // Create the select element dynamically
		                    var $select = $('<select>', {
		                        id: 'current_location',
		                        class: 'form-control selet2Single',
		                        css: { width: '100%' }
		                    });

		                    // Add a placeholder option
		                    $select.append('<option value="" disabled selected>Select a city</option>');

		                    // Dynamically populate the dropdown
		                    $.each(postOffices, function (index, postOffice) {
		                        $select.append($('<option>', {
		                            value: postOffice.Name,
		                            text: postOffice.Name
		                        }));
		                    });
							
		                    $('#currentlocationModal .form-group').append($select);

		                    // Initialize Select2 on the newly created select element
		                    $select.select2({
		                        placeholder: "Select a city", // Placeholder text
		                        allowClear: false // Allow clearing the selection
		                    });
							
		                    // Add the error span after the input
		                    var $errorSpan = $('<span>', {
		                        class: 'errorfield',
		                        id: 'current_location_error'
		                    });
		                    
		                    $('#currentlocationModal .form-group').append($errorSpan);
		                   
		                    
		                    // Optionally display the modal containing the dropdown
		                    $('#currentlocationModal').show();
		                }
		            }else
		            {
		            	$('.pincode_error').text('It is invalid pincode').css("color","red").show();
		            	isValidPincode=false
		            }
		        }else
		        {
		        	
		        	$('#statelocationModal').hide();
		        	$('#currentlocationModal').hide();
		        	$('#current_location').remove();
		        	isValidPincode=false
		        }	
		        	
		    },
		    error: function (response) {
		        console.log("error", response);
		    }
		});

	}
	$(document).ready(function() {
	    $('#currentlocationModal').hide();
	    $('#statelocationModal').hide();
	});
  
	function validateEmployerDetailsForm() {
		 $('#current_location').removeAttr('disabled');
		 $('#stateLocation').removeAttr('disabled');
	    var industry = $("#Industry").val();
	    var numberOfEmployees = $("#numberofemployees").val();
	    var designation = $("#designation").val();
	    var pincode = $("#pincode").val();
	    var state = $("#stateLocation").val();
	    var city = $("#current_location").val();
	    var companyAddress = $("#companyAddress").val();

	    // Validation for Industry
	    if (industry == null || industry == "Select") {
	        document.getElementById("Industry-span").innerHTML = "Please select an Industry";
	        document.getElementById("Industry-span").style.color = "Red";
	        $('#current_location').attr('disabled', 'disabled');
			 $('#stateLocation').attr('disabled', 'disabled');
	        return false;
	    }

	    // Validation for Number of Employees
	    if (numberOfEmployees == null || numberOfEmployees == "") {
	        document.getElementById("numberofemployees-span").innerHTML = "Please enter number of employees";
	        document.getElementById("numberofemployees-span").style.color = "Red";
	        $('#current_location').attr('disabled', 'disabled');
			 $('#stateLocation').attr('disabled', 'disabled');
	        return false;
	    }

	    // Validation for Designation
	    if (designation == null || designation == "") {
	        document.getElementById("designation-span").innerHTML = "Please enter your designation";
	        document.getElementById("designation-span").style.color = "Red";
	        $('#current_location').attr('disabled', 'disabled');
			 $('#stateLocation').attr('disabled', 'disabled');
	        return false;
	    }

	    // Validation for Pincode
	    if (pincode == null || pincode == "") {
	        document.getElementById("pincode_error").innerHTML = "Please enter a valid Pincode";
	        document.getElementById("pincode_error").style.color = "Red";
	        $('#current_location').attr('disabled', 'disabled');
			 $('#stateLocation').attr('disabled', 'disabled');
	        return false;
	    }

	    // Validation for State
	    if (state == null || state == "") {
	        document.getElementById("state_location_error").innerHTML = "Please enter a valid State";
	        document.getElementById("state_location_error").style.color = "Red";
	        $('#current_location').attr('disabled', 'disabled');
			 $('#stateLocation').attr('disabled', 'disabled');
	        return false;
	    }

	    // Validation for Company Address
	    if (companyAddress == null || companyAddress == "") {
	        document.getElementById("companyAddress-span").innerHTML = "Please enter the company address";
	        document.getElementById("companyAddress-span").style.color = "Red";
	        $('#current_location').attr('disabled', 'disabled');
			 $('#stateLocation').attr('disabled', 'disabled');
	        return false;
	    }
	    
	    return true;
	}

	// Function to allow only numbers for pincode field
	$("#pincode").on("input", function() {
	    var pincode = $(this).val();
	    if (!/^\d*$/.test(pincode)) {
	        $(this).val(pincode.replace(/[^\d]/g, '')); // Remove non-numeric characters
	    }
	});

	// Function to clear validation warnings
	function removeWarnings() {
	    document.getElementById("Industry-span").innerHTML = "";
	    document.getElementById("numberofemployees-span").innerHTML = "";
	    document.getElementById("designation-span").innerHTML = "";
	    document.getElementById("pincode_error").innerHTML = "";
	    document.getElementById("state_location_error").innerHTML = "";
	    document.getElementById("companyAddress-span").innerHTML = "";
	}
	
	function checkFullname(element,id) {
	    var name = element.value;
	    element.value = name.replace(/[^A-Za-z\s]/g, '');
	    $('#'+id).text(" ");
	}
  
  </script>
  
</body>

</html>