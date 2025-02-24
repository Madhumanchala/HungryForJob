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
													id="contactName" placeholder="Enter Company name " value="${renewalplandetails.name}"
													 disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="mobileNo" class="required">Mobile No</label> <input
													type="text" class="form-control" id="mobileNo" value="${renewalplandetails.mobileNo}"
													placeholder="Enter Mobile No " 
													disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="companyName" class="required">Company
													Name</label> <input type="text" class="form-control"
													id="companyName" placeholder="Enter Company Name " value="${renewalplandetails.companyName}"
													 disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="emailId" class="required">Email id</label> <input
													type="email" class="form-control" id="emailId" value="${renewalplandetails.emailId}"
													placeholder="Enter Email id " 
													disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="GSTINnumber">GST Number</label> <input
													type="text" class="form-control" id="GSTnumber" value="${renewalplandetails.gstno}"
															placeholder=" EnterGSTINNumber">
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
													type="text" class="form-control" id="uTRNo" value="${renewalplandetails.utrNo}" onkeyup="checkutr(this,'utrNo_error')" maxlength="22"
													placeholder="Enter UTR No"> <span class="errors"
													id="utrNo_error"></span>
											</div>
										</div>

										<div class="col-lg-6 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="uTRDate" class="required">UTR Date</label> <input
													type="text" class="form-control datepicker" id="uTRDate" value="${renewalplandetails.utrDate}"
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
									<button class="btns mt-4" onclick="updateplandetails(${renewalplandetails.id})" type="button">Submit</button>     <!-- data-bs-toggle="modal"   data-bs-target="#verifySubmit" -->
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
									<h5>${renewalplandetails.planName}</h5>
									<h4>
										<i class="fa fa-inr" aria-hidden="true"></i>
										${renewalplandetails.planPrice}
									</h4>
								</div>
								<!-- <div>
									<a href="/pricing-plan" class="btns"> Change Plan </a>
								</div> -->
							</div>
							<div class="plandetails">
								<ul class="row">
									<li class="col-xl-6 col-lg-6 col-md-6"><span>User
											access </span> ${renewalplandetails.planUser} </li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span>Job
											Postings </span> ${renewalplandetails.planJobPost} </li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span> No.
											of Searches</span> ${renewalplandetails.planSearch} </li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span> CV
											Views </span> ${renewalplandetails.planCV} </li>
									<li class="col-xl-6 col-lg-6 col-md-6"><span>
											Validity </span> ${renewalplandetails.planValidity} </li>
								</ul>
							</div>
						</div>
						<div class="card-register">
							<div class="planPlatinum ">
								<ul class="plan-discount">
									<li>${renewalplandetails.planName}<span><i class="fa fa-inr"
											aria-hidden="true"></i> ${renewalplandetails.planPrice} </span>
									</li>
									<%--  <li> Discount (-10%) <span>- <i class="fa fa-inr" aria-hidden="true"></i> ${discount} </span> </li> --%>
								</ul>
								<ul class="plan-sub">
									<%--    <li>Sub Total <span><i class="fa fa-inr" aria-hidden="true"></i>${subTotal}</span> </li> --%>
									<li>GST (18%) <span><i class="fa fa-inr"
											aria-hidden="true"></i> ${gstamount} </span>
									</li>
								</ul>
								<ul class="plan-total">
									<li><span> Total <small>(Inc tax)</small></span> <span><i
											class="fa fa-inr" aria-hidden="true"></i> ${totalamount}</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
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
			  <div ><a href="#" onclick="findroute('mysubscription')" class="btns mt-2 mb-5  text-center ">Back to Home</a> </div>
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
	<script src="js/commonvalidation.js"></script>
<script>
$(document).ready(function() {
	$('.loader').hide();
	 $('.datepicker').datepicker({
	        format: 'dd-mm-yyyy',
	        autoclose: true,
	        changeYear: true,  // Enables year selection
	        changeMonth: true, // Enables month selection
	      });
});
function updateplandetails(id)
{
	var gstno=$("#GSTnumber").val();
	var utrno=$("#uTRNo").val();
	var utrdate=$("#uTRDate").val();
	var isvalid=true;
	if(checkvalidation(gstno))
	{
		showToast("info","enter the gst no");
		isvalid=false
		return 
	}else
	{
		if(!validateGST(gstno))
		{
			showToast("info","enter the valid gst no");
			isvalid=false;
			return
		}
	}
	if(checkvalidation(utrno))
	{
		showToast("info","enter the utr no");
		isvalid=false
		return 
	}else
	{
		if(!validateUTR(utrno))
		{
			showToast("info","enter the valid utr no");
			isvalid=false
			return 
		}
	}
	if(checkvalidation(utrdate)){
		showToast("info","enter the date ");
		isvalid=false
		return 
	}
	
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"updateplandetails",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
				utrDate:utrdate,
				utrNo:utrno,
                gstno:gstno,
               	id:id
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Sucessfully updated");
					$("#verifySubmit").modal("show");
				}else
				{
					showToast("info","please try again");
					$("#verifySubmit").modal("hide");
				}
				$('.loader').hide();
            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
                $("#verifySubmit").modal("hide");
                $('.loader').hide();
            }
		})
	}
}
</script>
</body>
</html>