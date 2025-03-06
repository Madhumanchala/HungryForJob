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
						<div class="billing-profile mb-4">
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
						</div>
						<div class="billing-history">
							<div class="card">
								<div
									class="d-flex justify-content-between align-items-center p-4 pb-1 mb-3">
									<h4>Manage Users</h4>
									
									<c:if test="${size < admindetails.userAccess}">
									<button class="btn add-userBtn" data-bs-toggle="modal"
										data-bs-target="#gstin-add">
										<i class="bi bi-plus"></i> Add User
									</button>
									</c:if>
								</div>
								<div class="col-12">
									<div class="">
										<table class="user-table">
											<thead>
												<tr class="UserDetails">
													<th>Name</th>
													<th>Email Id</th>
													<th>Contact No</th>
													<!-- <th>Role</th> -->
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${userdetails}" var="userdetails">
											<tr class="UserDetailsList">
													<td class="NameUser">
														<div class="profileImg">
															<img src="employer/img/profile-img.jpg" alt="">
															<p>${userdetails.userName}</p>
														</div>
													</td>
													<td>${userdetails.emailId}</a></td>
													<td>${userdetails.mobileNo}</td>
													<%-- <td>${userdetails.roleName}</td> --%>
													<td class="actions">
														<span class="pencil" >
															<i class="bi bi-pencil-square" data-bs-toggle="modal" data-bs-target="#edituserdetails"  onclick="appendusers('${userdetails.userName}', '${userdetails.emailId}', '${userdetails.mobileNo}', '${userdetails.id}')"></i>
														</span> 
														<span>
															<i class="bi bi-x-circle" onclick="deleteusers('${userdetails.id}')"></i>
														</span>
													</td>
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

	<div class="modal fade" id="gstin-add" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="firstname" class="form-label required">Full 
									Name</label> <input type="text" name="firstname" id="firstname" maxlength="40"
									class="form-control" placeholder="First Name" onkeyup="checkname(this,'firstname_error')">
									<span class="errors" id="firstname_error"></span>
							</div>
						</div>
						<!-- <div class="col-md-6">
							<div class="form-group">
								<label for="lastname" class="form-label required">Last
									Name</label> <input type="text" name="lastname" id="lastname" maxlength="20"
									class="form-control" placeholder="Last Name" onkeyup="checkname(this,'lastname_error')">
									<span class="errors" id="lastname_error"></span>
							</div>
						</div> -->
						<div class="col-md-6">
							<div class="form-group">
								<label for="emailId" type="email" class="required">Email
									Id</label> <input type="text" class="form-control" id="emailId"
									placeholder="Enter Email Id" onkeyup="checkemail(this,'email_error')" maxlength="30">
									<span class="errors" id="email_error"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="contactno" class="required">Contact No</label> <input
									type="text" class="form-control" id="contactno" maxlength="10"
									placeholder="Enter Password" onkeyup="checkNumber(this,'contactno_error')">
									<span class="errors" id="contactno_error"></span>
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
					<button type="button" class="btns" onclick="createusers()">Submit</button>
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
									Name</label> <input type="text" name="editfirstname" id="editfirstname" maxlength="20"
									class="form-control" placeholder="First Name" onkeyup="checkname(this,'editfirstname_error')">
									<span class="errors" id="editfirstname_error"></span>
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
									placeholder="Enter Email Id" onkeyup="checkemail(this,'editemail_error')" maxlength="30">
									<span class="errors" id="editemail_error"></span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="editcontactno" class="required">Contact No</label> <input
									type="text" class="form-control" id="editcontactno" maxlength="10"
									placeholder="Enter Password" onkeyup="checkNumber(this,'editcontactno_error')">
									<span class="errors" id="editcontactno_error"></span>
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
					<button type="button" class="btns"  id="updatebutton">Submit</button>
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
	<script src="employer/js/createusers.js"></script>
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
</html>