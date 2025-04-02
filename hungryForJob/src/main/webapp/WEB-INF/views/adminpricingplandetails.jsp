<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="admin/css/select2.min.css" rel="stylesheet" />
<link href="admin/css/font-awesome.min.css" rel="stylesheet">
<link href="admin/css/datatables.bootstrap5.css" rel="stylesheet" />
<link href="admin/css/style.css" rel="stylesheet">

</head>

<body class="bg">
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@ include file="toaster.jsp"%>
	<header id="header" class="header fixed-top">
		<div
			class="container-fluid  d-flex align-items-center justify-content-between">
			<div class="">
				<div class="d-flex align-items-center">
					<i class="bi bi-list mobile-nav-toggle"></i> <a href="/"
						class="logo "> <img src="admin/img/logo.svg" alt="">
					</a>
					<nav id="navbar" class="navbar">
						<ul>
							<li><a href="dashboard.html">Dashboard </a></li>
							<li><a href="pricing-plan.html" class="active">Pricing
									Plan</a></li>
							<!-- <li class="dropdown"><a href="javascript:void(0)">Post a jobs <i class="bi bi-chevron-down"></i> </a>
                <ul>
                  <li> <a href="post-new-job.html">Post a Job </a></li>
                  <li> <a href="post-internship.html">Post an Internship </a></li>
                </ul>
              </li>-->

						</ul>
					</nav>
					<!-- navbar -->
				</div>
			</div>
			<div class=" d-flex">
				<div class="profileBtn">
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							id="dropdownMenuButton" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<div class="d-flex align-items-center">
								<div class="profile-img">
									<img src="admin/img/profile-img.jpg">
								</div>
								<div class="proTxt">
									<strong>John legend</strong>
									<p>Admin</p>
								</div>
								<i class="bi bi-chevron-down"></i>
							</div>
						</button>
						<div class="dropdown-menu dropdown-menu-end"
							aria-labelledby="dropdownMenuButton">

							<a class="dropdown-item myProfLink" href="company-profile.html">
								<i class="bi bi-person"></i> My Profile
							</a> <a class="dropdown-item myProfLink" href="change-password.html">
								<i class="bi bi-lock"></i> Change Password
							</a> <a class="dropdown-item logOutLink" href="#"> <i
								class="bi bi-box-arrow-right"></i> Logout
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<section class="section-inner advancedsearch-section">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="companyList">
							<div class="card">
								<div class="d-flex justify-content-between align-items-center ">
									<h4>Pricing Plan</h4>
									<button class="btn-blue mt-2 ml-3" data-bs-toggle="modal"
										data-bs-target="#addnewplan">+ New Plan</button>
								</div>
								<div class="line2"></div>
								<div class="col-12 pt-0 p-3">
									<div class="table-responsive1">
										<div id="no-more-tables">
											<table id="pricingPlan"
												class="table display nowrap  companytable  pricingPlantable "
												style="width: 100%;">
												<thead>
													<tr>
														<th>Plan Name</th>
														<th>Plan Price</th>
														<th>User access</th>
														<th>Job Postings</th>
														<th>No. of Searches</th>
														<th>CV Views</th>
														<th>Validity</th>
														<th>Priority</th>
														<th>Status</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${plandetails}" var="plandetails">
														<tr>
															<td data-title="Plan Name">${plandetails.planName}</td>
															<td data-title="Plan Price"><span>
																	${plandetails.planPrice} </span></td>
															<td data-title="User access">${plandetails.planUser}
															</td>
															<td data-title="Job Postings">
																${plandetails.planJobPost}</td>
															<td data-title="No. of Searches">
																${plandetails.planSearch}</td>
															<td data-title="CV Views">${plandetails.planCV}</td>
															<td data-title="Validity">${plandetails.planNumber}
																${plandetails.planDays}</td>
															<td data-title="Priority">
																<div class="activetable">
																	<select class="form-control form-select selet2Single planprier" id="priority_${plandetails.planId}" onchange="changeplanPriority('priority_${plandetails.planId}','${plandetails.planId}')">
																		 <c:forEach var="i" begin="0" end="${plansize}">
																			<option value="${i}"
																				${plandetails.planPriority == i ? 'selected':'' }>${i}</option>
																		</c:forEach> 
																	</select>
																</div>
															</td>
															<td data-title="Status">
																<div class="plancheckbox">
																	<input type="checkbox" id="status${plandetails.planId}"
																		${plandetails.planStatus == 1? 'checked':''} onchange="changeplanStatus('status${plandetails.planId}','${plandetails.planId}')">
																</div>
															</td>
															<td data-title="Action">
																<span class="edit" data-bs-toggle="modal"
																data-bs-target="#edit" onclick="getEditDetails('${plandetails.planId}','${plandetails.planName}','${plandetails.planPrice}','${plandetails.planUser}','${plandetails.planJobPost}','${plandetails.planSearch}','${plandetails.planCV}','${plandetails.planDays}','${plandetails.planNumber}','${plandetails.planStatus}')"><i
																	class="bi bi-pencil-square"></i></span>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
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
			<div class="copyright text-">
				<p>© Copyright. Hungry for job all right reserved</p>
			</div>
		</div>
	</footer>
	<!-- End Footer -->


	<div class="modal fade" id="addnewplan" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Add New
						Plan</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="planName" class="required">New Plan Name</label> <input
									type="text" name="planName" id="saveplanName"
									class="form-control" placeholder="Enter Plan Name"
									maxlength="40" onkeyup="checkname(this,'planName_error')">
								<span class="error" id="planName_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="planPrice" class="required">Plan Price </label> <input
									type="text" name="planPrice" id="saveplanPrice"
									class="form-control" placeholder="Enter Plan Price"
									onkeyup="checkOnlyNumbers(this,'planNumber_error')"
									maxlength="20"> <span class="error"
									id="planNumber_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Useraccess" class="required">User access </label> <input
									type="text" name="Useraccess" id="saveUseraccess"
									class="form-control" placeholder="Enter User access"
									onkeyup="checkOnlyNumbers(this,'planUser_error')"
									maxlength="20"> <span class="error" id="planUser_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Useraccess" class="required">Job Postings </label> <input
									type="text" name="JobPost" id="saveJobPost"
									class="form-control" placeholder="Enter Job Post"
									onkeyup="checkOnlyNumbers(this,'planJobPost_error')"
									maxlength="20"> <span class="error"
									id="planJobPost_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="noSearches" class="required">No. of Searches
								</label> <input type="text" name="noSearches" id="saveNoSearches"
									class="form-control" placeholder="Enter No. of Searches"
									onkeyup="checkOnlyNumbers(this,'planSearch_error')"
									maxlength="20"> <span class="error"
									id="planSearch_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="cVViews" class="required">CV Views </label> <input
									type="text" name="cVViews" id="saveCVViews"
									class="form-control" placeholder="Enter CV Views"
									onkeyup="checkOnlyNumbers(this,'planCV_error')" maxlength="20">
								<span class="error" id="planCV_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<label for="validity " class="required">Validity</label> <select
											class="form-select form-control" id="savevalidity">
											<option value="">Select</option>
											<option value="days">Days</option>
											<option value="month">Months</option>
											<option value="year">Years</option>
										</select> <span class="error" id="planValidity_error"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<label for="Validity " class="required">Days </label> <input
											type="text" name="Validity " id="savedays"
											class="form-control" placeholder="Enter Validity "
											onkeyup="checkOnlyNumbers(this,'planValidity_error')"
											maxlength="20"> <span class="error"
											id="planDays_error"></span>
									</div>
								</div>
							</div>

						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Status " class="required">Status </label>
								<div class="plancheckbox mt-3">
									<input type="checkbox" id="saveStatus">
								</div>
								<span class="error" id="planStatus_error"></span>
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn-blue" onclick="saveplandetails()">Submit</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="edit" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Edit New
						Plan</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="planName" class="required">New Plan Name</label> <input
									type="text" name="planName" id="editplanName" class="form-control"
									placeholder="Enter Plan Name">
								<span class="error" id="editplanName_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="planPrice" class="required">Plan Price </label> <input
									type="text" name="planPrice" id="editplanPrice"
									class="form-control" placeholder="Enter Plan Price"
									>
								<span class="error" id="editplanNumber_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Useraccess" class="required">User access </label> <input
									type="text" name="Useraccess" id="editUseraccess"
									class="form-control" placeholder="Enter User access" >
								<span class="error" id="editplanUser_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Useraccess" class="required">Job Postings </label> <input
									type="text" name="Useraccess" id="editjobpost"
									class="form-control" placeholder="Enter User access"
									>
								<span class="error" id="editplanJobPost_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="noSearches" class="required">No. of Searches
								</label> <input type="text" name="noSearches" id="editnoSearches"
									class="form-control" placeholder="Enter No. of Searches"
									>
								<span class="error" id="editplanSearch_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="cVViews" class="required">CV Views </label> <input
									type="text" name="cVViews" id="editcVViews" class="form-control"
									placeholder="Enter CV Views" >
								<span class="error" id="editplanCV_error"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<label for="validity " class="required">Validity</label> <select
											class="form-select form-control " id="editvalidity">
											<option value="">Select</option>
											<option value="days">Days</option>
											<option value="month">Months</option>
											<option value="year">Years</option>
										</select>
										<span class="error" id="editplanValidity_error"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<label for="Validity " class="required">Days </label> <input
											type="text" name="Validity" id="editdays"
											class="form-control" placeholder="Enter Validity ">
										<span class="error" id="editplanDays_error"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Status " class="required">Status </label>
								<div class="plancheckbox mt-3">
									<input type="checkbox" id="editstatus">
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn-blue" id="editdetails">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<script src="admin/js/jquery.min.js"></script>
	<script src="admin/js/popper.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/dataTables.js"></script>
	<script src="admin/js/dataTables.bootstrap5.js"></script>
	<script src="admin/js/select2.min.js"></script>
	<script src="admin/js/main.js"></script>
	<script src="js/commonvalidation.js"></script>
	<script>
		$(document).ready(function() {
			$(".selet2Multiple").select2({});
			$(".selet2Single").select2({
				minimumResultsForSearch : -1
			});
		});

		$(document).ready(function() {
			$('#pricingPlan').dataTable({
				"ordering" : false,
			});
			$(".loader").hide();
		});

		$(document).ready(function() {
			$('#actionfrom').change(function() {
				var modalId = $(this).val();
				if (modalId) {
					$('#' + modalId).modal('show');
					$(this).val("");
				}
			});
			var priorityArray = ${planpriority};
			document.querySelectorAll('.planprier').forEach(function(select) {
		        select.querySelectorAll('option').forEach(function(option) {
		            // Disable option if its value is in the priority array
		            if (priorityArray.includes(parseInt(option.value)) && option.value != '0' &&  option.selected === false) {
		               /*  option.disabled = true; */
		               option.remove();
		            }
		        });
		    });
		});

		function saveplandetails() {
			var isvalid = true
			var planStatus = $("#saveStatus").prop("checked");
			var days = $("#savedays").val();
			var validity = $("#savevalidity").val();
			var cvViews = $("#saveCVViews").val();
			var noOfSearch = $("#saveNoSearches").val();
			var jobPost = $("#saveJobPost").val();
			var userAccess = $("#saveUseraccess").val();
			var planPrice = $("#saveplanPrice").val();
			var planName = $("#saveplanName").val();
			var status = 0;
			if (planStatus) {
				status = 1;
			}
			if (checkvalidation(planName)) {
				isvalid = false;
				$("#planName_error").text("Please enter the field");
			}
			if (checkvalidation(planPrice)) {
				isvalid = false;
				$("#planNumber_error").text("Please enter the field");
			}
			if (checkvalidation(userAccess)) {
				isvalid = false;
				$("#planUser_error").text("Please enter the field");
			}
			if (checkvalidation(jobPost)) {
				isvalid = false;
				$("#planJobPost_error").text("Please enter the field");
			}
			if (checkvalidation(noOfSearch)) {
				isvalid = false;
				$("#planSearch_error").text("Please enter the field");
			}
			if (checkvalidation(validity)) {
				isvalid = false;
				$("#planValidity_error").text("Please enter the field");
			}
			if (checkvalidation(days)) {
				isvalid = false;
				$("#planDays_error").text("Please enter the field");
			}
			if (checkvalidation(cvViews)) {
				isvalid = false;
				$("#planCV_error").text("Please enter the field");
			}
			if (isvalid) {
				$(".loader").show();
				$.ajax({
					url : "registerplandetails",
					type : 'post',
					contentType : 'application/json',
					data : JSON.stringify({
						planName : planName,
						planPrice : planPrice,
						planUser : userAccess,
						planJobPost : jobPost,
						planSearch : noOfSearch,
						planCV : cvViews,
						planDays : days,
						planNumber : validity,
						planStatus : status
					}),
					success : function(response) {
						// Success callback
						if (response.errors.errorCode === "0000") {
							showToast("success", "Sucessfully");
							$("#addnewplan").modal("hide");
						} else {
							showToast("info", "please try again");
							$("#addnewplan").modal("hide");
						}
						setTimeout(function() {
							window.location.reload(true); // Reload with cache bypass
						}, 2000); // 2000ms = 2 seconds
						$('.loader').hide();
					},
					error : function(xhr, status, error) {
						// Error callback
						console.log("error ocurred" + error)
						showToast("error", "failed to update");
						$("#addnewplan").modal("hide");
						$('.loader').hide();
					}
				})
			}
		}
	
		function changeplanPriority(id,planId)
		{
			var isvalid=true;
			var planprior = $("#"+id).val();
			if(checkvalidation(id))
			{
				console.log("id is not present");
				isvalid=false;
			}
			if(checkvalidation(planId))
			{
				console.log("planId is not present");
				isvalid=false;
			}
			if (isvalid) {
				$(".loader").show();
				$.ajax({
					url : "updateplanpriority",
					type : 'post',
					contentType : 'application/json',
					data : JSON.stringify({
						planId : planId,
						planPriority : planprior,
						type:"planpriority"
					}),
					success : function(response) {
						// Success callback
						if(response)
						{
							if (response.errors.errorCode === "0000") {
								showToast("success", "Sucessfully");
								
							}else {
								showToast("info", "please try again")
							}
						}else {
							showToast("info", "please try again")
						}
						setTimeout(function() {
							window.location.reload(true); // Reload with cache bypass
						}, 2000); // 2000ms = 2 seconds
						$('.loader').hide();
					},
					error : function(xhr, status, error) {
						// Error callback
						console.log("error ocurred" + error)
						showToast("error", "failed to update");
						$('.loader').hide();
					}
				})
			}
		}
		function changeplanStatus(id,planId)
		{
			var isvalid=true;
			var status=0;
			var planstatus = $("#"+id).prop("checked");
			if(planstatus)
			{
				status=1;
			}
			if(checkvalidation(status))
			{
				console.log("status is not present");
				isvalid=false;
			}
			if(checkvalidation(planId))
			{
				console.log("planId is not present");
				isvalid=false;
			}
			if (isvalid) {
				$(".loader").show();
				$.ajax({
					url : "updateplanpriority",
					type : 'post',
					contentType : 'application/json',
					data : JSON.stringify({
						planId : planId,
						planStatus : status,
						type:"planstatus"
					}),
					success : function(response) {
						// Success callback
						if(response)
						{
							if (response.errors.errorCode === "0000") {
								showToast("success", "Sucessfully");
								
							}else {
								showToast("info", "please try again")
							}
						}else {
							showToast("info", "please try again")
						}
						setTimeout(function() {
							window.location.reload(true); // Reload with cache bypass
						}, 2000); // 2000ms = 2 seconds
						$('.loader').hide();
					},
					error : function(xhr, status, error) {
						// Error callback
						console.log("error ocurred" + error)
						showToast("error", "failed to update");
						$('.loader').hide();
					}
				})
			}
		}
		function getEditDetails(planId, planName, planPrice, planUser, planJobPost, planSearch, planCV, planDays, planNumber, planStatus)
		{
			var planName=planName;
			$("#editplanName").val(planName);
			var planPrice = planPrice;
			$("#editplanPrice").val(planPrice);
			var planUser = planUser;
			$("#editUseraccess").val(planUser);
			var planjobpost = planJobPost;
			$("#editjobpost").val(planjobpost);
			var jobsearch = planSearch
			$("#editnoSearches").val(jobsearch);
			var cvviews = planCV
			$("#editcVViews").val(cvviews);	
			var validity = planDays;
			$("#editvalidity").val(validity);
			var number = planNumber;
			$("#editdays").val(number);
			if(planStatus === "1")
			{
				$("#editstatus").prop("checked",true);
			}
			$("#editdetails").attr("onclick","updateplandetails("+planId+")")
		}
		
		function updateplandetails(id) {
			var isvalid = true
			var planStatus = $("#editstatus").prop("checked");
			var days = $("#editdays").val();
			var validity = $("#editvalidity").val();
			var cvViews = $("#editcVViews").val();
			var noOfSearch = $("#editnoSearches").val();	
			var jobPost = $("#editjobpost").val();
			var userAccess = $("#editUseraccess").val();
			var planPrice = $("#editplanPrice").val();
			var planName = $("#editplanName").val();
			var status = 0;
			if (planStatus) {
				status = 1;
			}
			if (checkvalidation(planName)) {
				isvalid = false;
				$("#editplanName_error").text("Please enter the field");
			}
			if (checkvalidation(planPrice)) {
				isvalid = false;
				$("#editplanNumber_error").text("Please enter the field");
			}
			if (checkvalidation(userAccess)) {
				isvalid = false;
				$("#editplanUser_error").text("Please enter the field");
			}
			if (checkvalidation(jobPost)) {
				isvalid = false;
				$("#editplanJobPost_error").text("Please enter the field");
			}
			if (checkvalidation(noOfSearch)) {
				isvalid = false;
				$("#editplanSearch_error").text("Please enter the field");
			}
			if (checkvalidation(validity)) {
				isvalid = false;
				$("#editplanValidity_error").text("Please enter the field");
			}
			if (checkvalidation(days)) {
				isvalid = false;
				$("#editplanDays_error").text("Please enter the field");
			}
			if (checkvalidation(cvViews)) {
				isvalid = false;
				$("#editplanCV_error").text("Please enter the field");
			}
			if (isvalid) {
				$(".loader").show();
				$.ajax({
					url : "updateadminplandetails",
					type : 'post',
					contentType : 'application/json',
					data : JSON.stringify({
						planId:id,
						planName : planName,
						planPrice : planPrice,
						planUser : userAccess,
						planJobPost : jobPost,
						planSearch : noOfSearch,
						planCV : cvViews,
						planDays : days,
						planNumber : validity,
						planStatus : status
					}),
					success : function(response) {
						// Success callback
						if (response.errors.errorCode === "0000") {
							showToast("success", "Sucessfully");
							$("#edit").modal("hide");
						} else {
							showToast("info", "please try again");
							$("#edit").modal("hide");
						}
						setTimeout(function() {
							window.location.reload(true); // Reload with cache bypass
						}, 2000); // 2000ms = 2 seconds
						$('.loader').hide();
					},
					error : function(xhr, status, error) {
						// Error callback
						console.log("error ocurred" + error)
						showToast("error", "failed to update");
						$("#edit").modal("hide");
						$('.loader').hide();
					}
				})
			}
		}
</script>
</body>

</html>