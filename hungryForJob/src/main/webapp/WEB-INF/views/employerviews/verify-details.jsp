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
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/employer/css/select2.min.css" rel="stylesheet" />
<link href="/employer/css/style.css" rel="stylesheet">
<link href="css/bootstrap-datepicker.min.css" rel="stylesheet" />
</head>

<body class="bg">
	<div class="loader">
		<img src="/employer/img/loader.gif">
	</div>
	<!-- ======= Header ======= -->
	<%@include file="toaster.jsp"%>
	<header id="header" class="header fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">
			<a href="/" class="logo d-flex align-items-center"> <img
				src="/employer/img/logo.svg" alt="">
			</a>
		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<section class="section-inner verify-section">
			<div class="container">
				<div class="row ">
					<div class="col-xl-7 col-lg-6 col-md-6">
						<div class="card-register">
							<form autocomplete="off">
								<h3>Verify Details</h3>
								<div class="card-registerinner verifyDetails">
									<div class="row">
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="contactName" class="required">Contact
													name</label> <input type="text" class="form-control"
													id="contactName" placeholder="Enter Company name "
													value="${fullName}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="mobileNo" class="required">Mobile No</label> <input
													type="text" class="form-control" id="mobileNo"
													placeholder="Enter Mobile No " value="${mobileNo}"
													disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="companyName" class="required">Company
													Name</label> <input type="text" class="form-control"
													id="companyName" placeholder="Enter Company Name "
													value="${companyName}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="emailId" class="required">Email id</label> <input
													type="email" class="form-control" id="emailId"
													placeholder="Enter Email id " value="${companyEmailId}"
													disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="GSTINnumber">GSTIN Number</label> <input
													type="text" class="form-control" id="GSTINnumber"
													onkeyup="validateGSTIN()" placeholder=" EnterGSTINNumber">
													<span class="errors" id="gst_error" style="color:red"></span>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="account-detils">
												<div class="row">
													<div class="col-lg-6 col-md-6 col-sm-6">
														<p>
															Account No: -<span> 42639765973 </span>
														</p>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-6">
														<p>
															IFSC Code -<span> SBIN0061707 </span>
														</p>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-6">
														<p>
															A/C Hold: - <span>Comunus Technologies Pvt Ltd</span>
														</p>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-6">
														<p>
															Branch Name: - <span> Wagle Circle </span>
														</p>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-6">
														<p class="last">
															Bank Name: - <span> State Bank of India</span>
														</p>
													</div>
												</div>
											</div>
										</div>

										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="uTRNo" class="required">UTR No</label> <input
													type="text" class="form-control" id="uTRNo"
													placeholder="Enter UTR No" onblur="validateUTRNo()"> <span class="errors"
													id="utrNo_error"></span>
											</div>
										</div>

										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="uTRDate" class="required">UTR Date</label> <input
													type="text" class="form-control datepicker" id="uTRDate"
													placeholder="Enter UTR Date"> <span class="errors"
													id="utrDate"></span>
											</div>
										</div>

										<div class="col-md-12 mt-2">
											<div class="form-check ms-2">
												<input class="form-check-input" type="checkbox" value=""
													id="flexCheckDefault"> <label
													class="form-check-label" for="flexCheckDefault"> I
													agree to the Terms & Conditions </label>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
									<button class="btns mt-4" onclick="saveplanDetails()" type="button">Submit</button>     <!-- data-bs-toggle="modal"   data-bs-target="#verifySubmit" -->
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-xl-5 col-lg-6 col-md-6  ">
						<div class="card-register platinumPlan ">
							<div
								class="plan-head d-flex justify-content-between align-items-center">
								<div class="planTxt ">
									<h5>${selectedPlan.name}</h5>
									<h4>
										<i class="fa fa-inr" aria-hidden="true"></i>
										${selectedPlan.price}
									</h4>
								</div>
								<div>
									<a href="/pricing-plan" class="btns"> Change Plan </a>
								</div>
							</div>
							<div class="plandetails">
								<ul class="row">
									<li class="col-xl-6 col-lg-6 col-md-6"><span>User
											access </span> ${selectedPlan.userAccess}</li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span>Job
											Postings </span> ${selectedPlan.jobPostings}</li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span> No.
											of Searches</span> ${selectedPlan.searches}</li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span> CV
											Views </span> ${selectedPlan.cvViews}</li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span>
											Validity </span> ${selectedPlan.validity}</li>
								</ul>
							</div>
						</div>
						<div class="card-register">
							<div class="planPlatinum ">
								<ul class="plan-discount">
									<li>${selectedPlan.name}<span><i class="fa fa-inr"
											aria-hidden="true"></i> ${selectedPlan.price} </span>
									</li>
									<%--  <li> Discount (-10%) <span>- <i class="fa fa-inr" aria-hidden="true"></i> ${discount} </span> </li> --%>
								</ul>
								<ul class="plan-sub">
									<%--    <li>Sub Total <span><i class="fa fa-inr" aria-hidden="true"></i>${subTotal}</span> </li> --%>
									<li>GST (18%) <span><i class="fa fa-inr"
											aria-hidden="true"></i> ${gst} </span>
									</li>
								</ul>
								<ul class="plan-total">
									<li><span> Total <small>(Inc tax)</small></span> <span><i
											class="fa fa-inr" aria-hidden="true"></i> ${total}</span></li>
								</ul>
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
	<!--Company Profile edit modal   -->
  <div class="modal fade" id="verifySubmit" tabindex="-1"  data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
       <!-- <div class="modal-header1">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>  -->
        <div class="modal-body pe-4 ps-4 py-4">
          <div class="verifyTxt">
            <img src="employer/img/successfully.svg">
			<h5>Success </h5>
            <p>Our account team will verify this transfer within two working days. account will activities & you will
              receive the confirmation email from our side.</p>
			  <div ><a href="/" class="btns mt-2 mb-5  text-center ">Back to Home</a> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	<!-- End Footer -->

	<script src="/employer/js/jquery.min.js"></script>
	<script src="/employer/js/bootstrap.min.js"></script>
	<script src="/employer/js/select2.min.js"></script>
	<script src="/employer/js/main.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/verify-details.js"></script>
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
    $('.datepicker').datepicker({
        format: 'dd-mm-yyyy',
        autoclose: true,
        changeYear: true,  // Enables year selection
        changeMonth: true, // Enables month selection
      });
    let companyId1 = "<%=session.getAttribute("companyId")%>";
  </script>

	<script>
function validateGSTIN() {
    var gstin = document.getElementById('GSTINnumber').value;
    console.log(gstin);
    // Regular expression to validate GSTIN
    var gstinPattern = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/;

    // Test if the entered GSTIN matches the pattern
    if(gstin.length >=15)
    {
    	if (!gstin.match(gstinPattern)) {
        	$('#gst_error').text("Invalid GSTIN number. Please enter a valid GSTIN.")
            document.getElementById('GSTINnumber').value = '';
        }else
        {
        	$('#gst_error').text("");
        }
    }else
    {
    	$('#gst_error').text("Invalid GSTIN number. Please enter a valid GSTIN.")
    }
    
}
</script>
<script>
 function validateUTRNo() {
    var utrNo = document.getElementById('uTRNo').value;
    console.log(utrNo)
    var errorElement = document.getElementById('utrNo_error');
    
    // Regular expression to validate UTR No (4 letters followed by 12 digits)
    var utrPattern = /^[A-Z0-9]{11}(?!.*[.:_-]{2})[A-Z0-9.:_-]{0,30}[A-Z0-9]$/;

    // Test if the entered UTR No matches the pattern
    if (!utrNo.match(utrPattern)) {
        //alert('Invalid UTR number. Please enter a valid UTR.');
        $('#utrNo_error').text('Invalid UTR number. Please enter a valid UTR.');
        $('#utrNo_error').show();
        document.getElementById('uTRNo').value = '';
    } else {
        errorElement.textContent = '';  // Clear the error message if UTR is valid
    }
} 
</script>
</body>

</html>