<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Hungry for Job</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<link href="employer/img/favicon.png" rel="icon">
<link href="employer/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="employer/css/bootstrap.min.css" rel="stylesheet">
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="employer/css/style.css" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="admin/css/select2.min.css" rel="stylesheet" />
<link href="admin/css/font-awesome.min.css" rel="stylesheet">
<link href="admin/css/datatables.bootstrap5.css" rel="stylesheet" />
<link href="admin/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="employerHeader.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main">
		<section class="section-inner advancedsearch-section">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="inteviewersList">
							<div class="card">
								<div class="d-flex justify-content-between align-items-center ">
									<h4>Managers</h4>
									<button class="btn-blue mt-2 ml-3" data-bs-toggle="modal"
										data-bs-target="#addnewmanager">+ Add New
										Manager</button>
								</div>
								<div class="line2"></div>
								<div class="col-12 pt-0 p-3">
									<div class="table-responsive1">
										<div id="no-more-tables">
											<table id="nterviewers"
												class="table display nowrap  interviewersTable"
												style="width: 100%;">
												<thead>
													<tr>
														<th>Id</th>
														<th>Name</th>
														<th>Email</th>
														<th>Phone</th>
														<th>Status</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${managerDetails}"
														var="managerDetails">
														<tr>
															<td data-title="interviewerId">${managerDetails.id}</td>
															<td data-title="interviewerName">${managerDetails.name}</td>
															<td data-title="interviewerEmail"><span>
																	${managerDetails.emailId} </span></td>
															<td data-title="interviewerMobile">${managerDetails.mobileNumber}
															</td>

															<td data-title="status">
																<div class="plancheckbox">
																	<%-- <input type="checkbox"
																		id="status${managerDetails.id}"
																		${managerDetails.status == 1? 'checked':''}
																		onchange="onChangeStatus('${managerDetails.id}','${managerDetails.name}','${managerDetails.emailId}','${managerDetails.mobileNumber}','${managerDetails.status}')"> --%>
																		
																		<input type="checkbox" id="empStatus${managerDetails.id}"
																${managerDetails.status == 1? 'checked':''} onchange="changeStatus('empStatus${managerDetails.id}','${managerDetails.id}')">
																</div>
															</td>
															<td data-title="Action"><span class="edit"
																data-bs-toggle="modal" data-bs-target="#editManager"
																onclick="getEditDetails('${managerDetails.id}','${managerDetails.name}','${managerDetails.emailId}','${managerDetails.mobileNumber}','${managerDetails.status}')"><i
																	class="bi bi-pencil-square"></i></span></td>
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
			<div class="copyright">
				<ul>
					<li><a href="#"> About Us </a></li>
					<li><a href="#"> Contact Us</a></li>
				</ul>
				<p>Copyright © 2024. Hungry for job all right reserved</p>
			</div>
		</div>
	</footer>
	<!-- End Footer -->
	
	<!-- addCommentModal   -->
	<div class="modal fade" id="addnewmanager" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add New
						Manager</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="ManagerName" class="form-label required">Full
									Name</label> <input type="text" name="ManagerName"
									id="ManagerName" class="form-control"
									placeholder="Enter Full Name">
								<div class="text-danger" id="nameError"></div>
							</div>
							<div class="form-group">
								<label for="ManagerEmail" class="form-label required">Email</label>
								<input type="text" name="ManagerEmail" id="ManagerEmail"
									onchange="return validateEmail(this)" class="form-control"
									placeholder="Enter Email">
								<div class="text-danger" id="emailError"></div>
							</div>
							<div class="form-group">
								<label for="ManagerMobile" class="form-label required">Mobile</label>
								<!-- <input type="text" name="InterviewerMobile" maxlength="10"
									id="InterviewerMobile" class="form-control" placeholder=""> -->
								<input type="text" name="ManagerMobile" maxlength="10"
									id="ManagerMobile" class="form-control"
									placeholder="Enter Mobile Number" inputmode="numeric"
									pattern="[0-9]*"
									oninput="this.value = this.value.replace(/[^0-9]/g, '')">
								<div class="text-danger" id="mobileError"></div>

							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="submitForm()">Submit</button>
				</div>

			</div>
		</div>
	</div>

	<!--  Edit Interview Details -->

	<div class="modal fade" id="editManager" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit
						Interviewer</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="editManagerName" class="form-label required">Full
									Name</label> <input type="text" name="editManagerName"
									id="editManagerName" class="form-control"
									placeholder="Enter Full Name">
								<div class="text-danger" id="editnameError"></div>
							</div>
							<div class="form-group">
								<label for="editManagerEmail" class="form-label required">Email</label>
								<input type="text" name="editManagerEmail"
									id="editManagerEmail" onchange="return validateEmail(this)"
									class="form-control" placeholder="Enter Email">
								<div class="text-danger" id="editemailError"></div>
							</div>
							<div class="form-group">
								<label for="editManagerMobile" class="form-label required">Mobile</label>
								<!-- <input type="text" name="InterviewerMobile" maxlength="10"
									id="InterviewerMobile" class="form-control" placeholder=""> -->
								<input type="text" name="editManagerMobile" maxlength="10"
									id="editManagerMobile" class="form-control"
									placeholder="Enter Mobile Number" inputmode="numeric"
									pattern="[0-9]*"
									oninput="this.value = this.value.replace(/[^0-9]/g, '')">
								<div class="text-danger" id="editmobileError"></div>

								<div class="form-group" style="margin-top: 20px;">
									<div class="plancheckbox">
										<input type="checkbox" id="editstatus">
									</div>
								</div>

							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" id="editdetails">Submit</button>
				</div>

			</div>
		</div>
	</div>
	
	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/popper.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="/js/commonvalidation.js"></script>
	<script>
		$(document).ready(function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 1000);
		});
		function managejobpost() {
			findroute('managejobpost');
		}
	</script>
	<script>
	
		function submitForm() {
			
			document.getElementById("nameError").innerText = "";
			document.getElementById("emailError").innerText = "";
			document.getElementById("mobileError").innerText = "";

			// Get input values
			const name = document.getElementById("ManagerName").value.trim();
			const email = document.getElementById("ManagerEmail").value.trim();
			const mobile = document.getElementById("ManagerMobile").value.trim();

			if (name === "") {
				document.getElementById("nameError").innerText = "Full name is required.";
				return false;
			}else{
				document.getElementById("nameError").innerText = "";
			}
			if (email === "") {
				document.getElementById("emailError").innerText = "Email is required.";
				return false;
			} else if (!/@comunus\.in$/i.test(email)) {
				document.getElementById("emailError").innerText = "Please use your @comunus.in email address.";
				return false;
			}
			if (mobile === "") {
				document.getElementById("mobileError").innerText = "Mobile number is required.";
				return false;
			} else if (mobile.length !== 10) {
				document.getElementById("mobileError").innerText = "Mobile number must be 10 digits.";
				return false;
			}else{
				document.getElementById("mobileError").innerText = "";
			}
			
			const formData = {
				name : $("#ManagerName").val(),
				emailId : $("#ManagerEmail").val(),
				mobileNumber : $("#ManagerMobile").val(),
				flag: 'insert'
			};

			$.ajax({
				url : "addNewManager", // Change this to your actual controller/URL
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(formData),
				success : function(response) {
					if (response.errors.errorCode === "0000") {
						showToast("success", "Sucessfully Saved");
						setTimeout(function() {
							$(".loader").hide();
							$(".loader").css("display", "block");
							location.reload();
						}, 1000);
					} else if (response.errors.errorCode === "1001") {
						showToast("info", "Email already exists.");
						setTimeout(function() {
							$(".loader").hide();
							$(".loader").css("display", "block");
							location.reload();
						}, 1000);
					} else {
						showToast("error", "Please Try again later!!");
						setTimeout(function() {
							$(".loader").hide();
							$(".loader").css("display", "block");
							location.reload();
						}, 1000);

					}

				},
				error : function(xhr) {
					showToast("error", "Please Try again later!!");
					setTimeout(function() {
						$(".loader").hide();
						$(".loader").css("display", "block");
						location.reload();
					}, 1000);
				}
			});
		}
	</script>
	<script type="text/javascript">
	function validateEmail(obj) {
		var x = obj.value;

		var atpos = x.search(/@comunus.in/i);
		var dotpos = x.lastIndexOf(".");
		if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
		
			//$("#sucessModelMessage1").html("Please use Your @comunus.in email address");
			//$("#sucessModel1").modal('show');
	
			$("#emailError").text("Please use Your @comunus.in email address");
			
			return false;
		}else{
			$("#emailError").text("");
		}
	}
	</script>
	<script>
	function getEditDetails(Id,Name,Email,Mobile,status)
	{
		
		$("#editManagerName").val(Name);
		$("#editManagerEmail").val(Email);
		$("#editManagerMobile").val(Mobile);
		if(status === "1")
		{
			$("#editstatus").prop("checked",true);
		}else{
			$("#editstatus").prop("checked",false);
		}
		$("#editdetails").attr("onclick","updatemangerdetails("+Id+")") 
	}
	function updatemangerdetails(Id) {
		
		document.getElementById("editnameError").innerText = "";
		document.getElementById("editemailError").innerText = "";
		document.getElementById("editmobileError").innerText = "";

		// Get input values
		const name = document.getElementById("editManagerName").value.trim();
		const email = document.getElementById("editManagerEmail").value.trim();
		const mobile = document.getElementById("editManagerMobile").value.trim();

		if (name === "") {
			document.getElementById("editnameError").innerText = "Full name is required.";
			return false;
		}else{
			document.getElementById("editnameError").innerText = "";
		}
		if (email === "") {
			document.getElementById("editemailError").innerText = "Email is required.";
			return false;
		} else if (!/@comunus\.in$/i.test(email)) {
			document.getElementById("editemailError").innerText = "Please use your @comunus.in email address.";
			return false;
		}
		if (mobile === "") {
			document.getElementById("editmobileError").innerText = "Mobile number is required.";
			return false;
		} else if (mobile.length !== 10) {
			document.getElementById("editmobileError").innerText = "Mobile number must be 10 digits.";
			return false;
		}else{
			document.getElementById("editmobileError").innerText = "";
		}
		var StatusCheck = $("#editstatus").prop("checked");
		var status = 0;
		if(StatusCheck){
			status =1;
		}
		
		const formData = {
			name : $("#editManagerName").val(),
			emailId : $("#editManagerEmail").val(),
			mobileNumber : $("#editManagerMobile").val(),
			status : status,
			id:Id,
			flag: 'update'
		};

		$.ajax({
			url : "addNewManager",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(formData),
			success : function(response) {
				if (response.errors.errorCode === "0000") {
					showToast("success", "Updated Saved");
					setTimeout(function() {
						$(".loader").hide();
						$(".loader").css("display", "block");
						location.reload();
					}, 1000);
				} else if (response.errors.errorCode === "1001") {
					showToast("info", "Email already exists.");
					setTimeout(function() {
						$(".loader").hide();
						$(".loader").css("display", "block");
						location.reload();
					}, 1000);
				} else {
					showToast("error", "Please Try again later!!");
					setTimeout(function() {
						$(".loader").hide();
						$(".loader").css("display", "block");
						location.reload();
					}, 1000);

				}

			},
			error : function(xhr) {
				showToast("error", "Please Try again later!!");
				setTimeout(function() {
					$(".loader").hide();
					$(".loader").css("display", "block");
					location.reload();
				}, 1000);
			}
		});
	}
	
	function onChangeStatus(Id,Name,Email,Mobile,status)
	{
		
		var StatusCheck = $("#status" + Id).prop("checked");
		if(StatusCheck){
			status =1;
		}else{
			status = 0;
		}
		
		const formData = {
				name : Name,
				emailId : Email,
				mobileNumber : Mobile,
				status : status,
				id:Id,
				flag: 'update'
			};

			$.ajax({
				url : "addNewInterviewer",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(formData),
				success : function(response) {
					if (response.errors.errorCode === "0000") {
						showToast("success", "Updated Saved");
						setTimeout(function() {
							$(".loader").hide();
							$(".loader").css("display", "block");
							location.reload();
						}, 1000);
					} else if (response.errors.errorCode === "1001") {
						showToast("info", "Email already exists.");
						setTimeout(function() {
							$(".loader").hide();
							$(".loader").css("display", "block");
							location.reload();
						}, 1000);
					} else {
						showToast("error", "Please Try again later!!");
						setTimeout(function() {
							$(".loader").hide();
							$(".loader").css("display", "block");
							location.reload();
						}, 1000);

					}

				},
				error : function(xhr) {
					showToast("error", "Please Try again later!!");
					setTimeout(function() {
						$(".loader").hide();
						$(".loader").css("display", "block");
						location.reload();
					}, 1000);
				}
			});
			
	}
	
	</script>
	<script type="text/javascript">
	
	function changeStatus(id, empId) {
		
		var empStatus = $("#"+id).prop("checked");
		var status = 0;
		if (empStatus) {
			status = 1;
		}
		
		$.ajax({
			url:"createuser",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
				id:empId,
				status:status,
				type:"managerStatus"
	        }),
	        success: function(response) {
	            // Success callback
	            if(response.errors.errorCode === "0000")
	            {
					showToast("success","updated  successfully");
					setTimeout(function() {
						window.location.reload(true); // Reload with cache bypass
					}, 2000); // 2000ms = 2 seconds
				}else if(response.errors.errorCode === "1010")
				{
					showToast("info","Email is Already Existed");
				}
				else
				{
					showToast("info","please try again");
				}
				$('.loader').hide();
	        },
	        error: function(xhr, status, error) {
	            // Error callback
	            console.log("error ocurred"+error)
	            showToast("error","failed to update");
	            $('.loader').hide();
	        }
		})
	}
	
	</script>
	
</body>
</html>