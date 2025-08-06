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
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/nice-select.css" rel="stylesheet">
<link href="employer/css/richtext.min.css" rel="stylesheet" />
<link href="employer/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet">
<link href="admin/css/style.css" rel="stylesheet">
<script src="employer/js/createusers.js"></script>
</head>
<body>
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%
	String role = session.getAttribute("rolestatus").toString();
	if (role.equals("employeradmin")) {
	%>
	<%@include file="employerheader1.jsp"%>
	<%
	} else {
	%>
	<%@include file="employerheader1.jsp"%>
	<%
	}
	%>
	<%@include file="toaster.jsp"%>
	<main id="main">
		<section class="section-inner advancedsearch-section">
			<div class="container">
				<div class="row">
					<%@include file="employerdashboard.jsp"%>
					<div class="col-xl-9 col-lg-8 col-md-8">
						<%-- <div class="billing-profile mb-4">
							<div
								class="card-listinner d-flex justify-content-between align-items-center">
								<div class="profileImg">
									<img src="employer/img/profile-img.jpg" alt="">
								</div>
								<div>
									<h4>${admindetails.userName}</h4>
									<p class="mb-0">
										<a href="#" class="__cf_email__">${admindetails.emailId}</a>
										| ${admindetails.mobileNo}
									</p>
								</div>
								<div class="adminBtn">
									<span>Admin</span>
								</div>
							</div>
						</div> --%>
						<%-- <p>${userdetails}</p> --%>
						<div class="billing-history">
							<div class="card">
								<div
									class="d-flex justify-content-between align-items-center p-4 pb-1 mb-3">
									<h4>Interview Panel</h4>

									<button class="btn add-userBtn" data-bs-toggle="modal"
										data-bs-target="#addnewnterviewer">
										<i class="bi bi-plus"></i> Add Interviewer
									</button>
								</div>
								<div class="col-12">
									<div class="">
										<table class="user-table">
											<thead>
												<tr class="UserDetails">
													<th>Id</th>
													<th>Name</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Status</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${interviewDetails}"
													var="interviewDetails">
													<tr class="UserDetailsList">
														<td data-title="interviewerId">${interviewDetails.id}</td>
														<td class="NameUser">
															<div class="profileImg">
																<img src="employer/img/profile-img.jpg" alt="">
																<p>${interviewDetails.name}</p>
															</div>
														</td>
														<td>${interviewDetails.emailId}</a></td>
														<td>${interviewDetails.mobileNumber}</td>
														<%-- <td>${userdetails.roleName}</td> --%>
														<%-- <td data-title="Status">
															<div class="plancheckbox">
																<input type="checkbox"
																	id="empStatus${interviewDetails.id}"
																	${interviewDetails.status == 1? 'checked':''}
																	onchange="changeStatus('empStatus${interviewDetails.id}','${interviewDetails.id}')">
															</div>
														</td>
														<td class="actions"><span class="pencil"> <i
																class="bi bi-pencil-square" data-bs-toggle="modal"
																data-bs-target="#edituserdetails"
																onclick="appendusers('${interviewDetails.name}', '${interviewDetails.emailId}', '${interviewDetails.mobileNumber}', '${interviewDetails.id}')"></i>
														</span> <span>
															<i class="bi bi-x-circle" onclick="deleteusers('${userdetails.id}')"></i>
														</span></td> --%>

														<td data-title="status">
															<div class="plancheckbox">
																<input type="checkbox" id="status${interviewDetails.id}"
																	${interviewDetails.status == 1? 'checked':''}
																	onchange="onChangeStatus('${interviewDetails.id}','${interviewDetails.name}','${interviewDetails.emailId}','${interviewDetails.mobileNumber}','${interviewDetails.status}')">
															</div>
														</td>
														<td data-title="Action"><span class="edit"
															data-bs-toggle="modal" data-bs-target="#editInterviewer"
															onclick="getEditDetails('${interviewDetails.id}','${interviewDetails.name}','${interviewDetails.emailId}','${interviewDetails.mobileNumber}','${interviewDetails.status}')"><i
																class="bi bi-pencil-square"></i></span></td>

													</tr>
												</c:forEach>
												<!-- <tr class="UserDetailsList">
													<td class="NameUser">
														<div class="profileImg">
															<img src="employer/img/profile-img.jpg" alt="">
															<p>Abraham Lincoln</p>
														</div>
													</td>
													<td>mahendra.puli@comunus.in</td>
													<td>8965123485</td>
													<td>Recruiter</td>
													<td class="actions"><span class="pencil"><i
															class="bi bi-pencil-square"></i></span> <span><i
															class="bi bi-x-circle"></i></span></td>
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <button type="button"  id="submit" onclick="createusers()"> create user</button> -->
				</div>
			</div>
		</section>

	</main>
	<%@include file="footer.jsp"%>

	<div class="modal fade" id="addnewnterviewer" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add New
						Interviewer</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="InterviewerName" class="form-label required">Full
									Name</label> <input type="text" name="InterviewerName"
									id="InterviewerName" class="form-control"
									placeholder="Enter Full Name">
								<div class="text-danger" id="nameError"></div>
							</div>
							<div class="form-group">
								<label for="InterviewerEmail" class="form-label required">Email</label>
								<input type="text" name="InterviewerEmail" id="InterviewerEmail"
									onchange="return validateEmail(this)" class="form-control"
									placeholder="Enter Email">
								<div class="text-danger" id="emailError"></div>
							</div>
							<div class="form-group">
								<label for="InterviewerMobile" class="form-label required">Mobile</label>
								<!-- <input type="text" name="InterviewerMobile" maxlength="10"
									id="InterviewerMobile" class="form-control" placeholder=""> -->
								<input type="text" name="InterviewerMobile" maxlength="10"
									id="InterviewerMobile" class="form-control"
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

	<div class="modal fade" id="edituserdetails" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-8 ps-8 py-8">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="editfirstname" class="form-label required">Full
									Name</label> <input type="text" name="editfirstname" id="editfirstname"
									maxlength="20" class="form-control" placeholder="First Name"
									onkeyup="checkname(this,'editfirstname_error')"> <span
									class="errors" id="editfirstname_error"></span>
							</div>
						</div>
						<!-- <div class="col-md-6">
							<div class="form-group">
								<label for="editlastname" class="form-label required">Last
									Name</label> <input type="text" name="editlastname" id="editlastname" maxlength="20"
									class="form-control" placeholder="Last Name" onkeyup="checkname(this,'editlastname_error')">
									<span class="errors" id="editlastname_error"></span>
							</div>
						</div> -->
						<div class="col-md-6">
							<div class="form-group">
								<label for="editemailId" type="email" class="required">Email
									Id</label> <input type="text" class="form-control" id="editemailId"
									placeholder="Enter Email Id"
									onkeyup="checkemail(this,'editemail_error')" maxlength="30">
								<span class="errors" id="editemail_error"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="editcontactno" class="required">Contact No</label> <input
									type="text" class="form-control" id="editcontactno"
									maxlength="10" placeholder="Enter Password"
									onkeyup="checkNumber(this,'editcontactno_error')"> <span
									class="errors" id="editcontactno_error"></span>
							</div>
						</div>
						<!-- <div class="col-md-12">
							<div class="form-group">
								<label for="role " class="required">Role </label> <select
									class="form-select form-control selet2Single" id="role" style="width:100%">
									<option value="" disabled selected>Select</option>
									<option value="Admin">Admin</option>
									<option value="Recruiter">Recruiter</option>
								</select>
							</div>
						</div> -->
					</div>

				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btns" id="updatebutton">Submit</button>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="editInterviewer" tabindex="-1"
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
								<label for="editInterviewerName" class="form-label required">Full
									Name</label> <input type="text" name="editInterviewerName"
									id="editInterviewerName" class="form-control"
									placeholder="Enter Full Name">
								<div class="text-danger" id="editnameError"></div>
							</div>
							<div class="form-group">
								<label for="editInterviewerEmail" class="form-label required">Email</label>
								<input type="text" name="editInterviewerEmail"
									id="editInterviewerEmail" onchange="return validateEmail(this)"
									class="form-control" placeholder="Enter Email">
								<div class="text-danger" id="editemailError"></div>
							</div>
							<div class="form-group">
								<label for="editInterviewerMobile" class="form-label required">Mobile</label>
								<!-- <input type="text" name="InterviewerMobile" maxlength="10"
									id="InterviewerMobile" class="form-control" placeholder=""> -->
								<input type="text" name="editInterviewerMobile" maxlength="10"
									id="editInterviewerMobile" class="form-control"
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
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/nice-select.min.js"></script>
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="js/commonvalidation.js"></script>

</body>
<script>
	$(document).ready(function() {
		$("#role").select2({
			dropdownParent : $("#gstin-add")
		});
		$('.loader').hide();
	});
</script>
<script type="text/javascript">
	function onChangeStatus(Id, Name, Email, Mobile, status) {

		var StatusCheck = $("#status" + Id).prop("checked");
		if (StatusCheck) {
			status = 1;
		} else {
			status = 0;
		}

		const formData = {
			name : Name,
			emailId : Email,
			mobileNumber : Mobile,
			status : status,
			id : Id,
			flag : 'update'
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

	function getEditDetails(Id, Name, Email, Mobile, status) {

		$("#editInterviewerName").val(Name);
		$("#editInterviewerEmail").val(Email);
		$("#editInterviewerMobile").val(Mobile);
		if (status === "1") {
			$("#editstatus").prop("checked", true);
		} else {
			$("#editstatus").prop("checked", false);
		}
		$("#editdetails").attr("onclick", "updateplandetails(" + Id + ")")
	}

	function updateplandetails(Id) {

		document.getElementById("editnameError").innerText = "";
		document.getElementById("editemailError").innerText = "";
		document.getElementById("editmobileError").innerText = "";

		// Get input values
		const name = document.getElementById("editInterviewerName").value
				.trim();
		const email = document.getElementById("editInterviewerEmail").value
				.trim();
		const mobile = document.getElementById("editInterviewerMobile").value
				.trim();

		if (name === "") {
			document.getElementById("editnameError").innerText = "Full name is required.";
			return false;
		} else {
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
		} else {
			document.getElementById("editmobileError").innerText = "";
		}
		var StatusCheck = $("#editstatus").prop("checked");
		var status = 0;
		if (StatusCheck) {
			status = 1;
		}

		const formData = {
			name : $("#editInterviewerName").val(),
			emailId : $("#editInterviewerEmail").val(),
			mobileNumber : $("#editInterviewerMobile").val(),
			status : status,
			id : Id,
			flag : 'update'
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

	function submitForm() {

		document.getElementById("nameError").innerText = "";
		document.getElementById("emailError").innerText = "";
		document.getElementById("mobileError").innerText = "";

		// Get input values
		const name = document.getElementById("InterviewerName").value.trim();
		const email = document.getElementById("InterviewerEmail").value.trim();
		const mobile = document.getElementById("InterviewerMobile").value
				.trim();

		if (name === "") {
			document.getElementById("nameError").innerText = "Full name is required.";
			return false;
		} else {
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
		} else {
			document.getElementById("mobileError").innerText = "";
		}

		const formData = {
			name : $("#InterviewerName").val(),
			emailId : $("#InterviewerEmail").val(),
			mobileNumber : $("#InterviewerMobile").val(),
			flag : 'insert'
		};

		$.ajax({
			url : "addNewInterviewer", // Change this to your actual controller/URL
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
</html>