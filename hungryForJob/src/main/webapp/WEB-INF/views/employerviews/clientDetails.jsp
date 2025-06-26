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
						<div class="clientList">
							<div class="card">
								<div class="d-flex justify-content-between align-items-center ">
									<h4>Clients</h4>
									<button class="btn-blue mt-2 ml-3" data-bs-toggle="modal"
										data-bs-target="#addnewclient">+ Add New Client</button>
								</div>
								<div class="line2"></div>
								<div class="col-12 pt-0 p-3">
									<div class="table-responsive1">
										<div id="no-more-tables">
											<table id="clientDetails"
												class="table display nowrap  interviewersTable"
												style="width: 100%;">
												<thead>
													<tr>
														<th>Id</th>
														<th>Client Name</th>
														<th>Status</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${clientDetails}" var="client">
														<tr>
															<td data-title="interviewerId">${client.id}</td>
															<td data-title="interviewerName">${client.name}</td>
															<td data-title="status">
																<div class="plancheckbox">
																	<input type="checkbox" id="status${client.id}"
																		${client.status == 1? 'checked':''}
																		onchange="onChangeStatus('${client.id}','${client.name}','${client.status}')">
																</div>
															</td>
															<td data-title="Action"><span class="edit"
																data-bs-toggle="modal" data-bs-target="#editclient"
																onclick="getEditDetails('${client.id}','${client.name}','${client.status}')"><i
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
	<div class="modal fade" id="addnewclient" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add New Client</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="clientName" class="form-label required">Client
									Name</label> <input type="text" name="clientName" id="clientName"
									class="form-control" placeholder="Enter Client Name">
								<div class="text-danger" id="clientNameError"></div>
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

	<div class="modal fade" id="editclient" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Client</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="editClientName" class="form-label required">Client
									Name</label> <input type="text" name="editClientName"
									id="editClientName" class="form-control"
									placeholder="Enter Client Name">
								<div class="text-danger" id="editClientNameError"></div>
							</div>

							<div class="form-group">

								<div class="form-group">
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

			document.getElementById("clientNameError").innerText = "";

			// Get input values
			const name = document.getElementById("clientName").value.trim();

			if (name === "") {
				document.getElementById("clientNameError").innerText = "Client Name is required.";
				return false;
			}

			const formData = {
				name : $("#clientName").val(),
				flag : 'insert'
			};

			$.ajax({
				url : "addClient", // Change this to your actual controller/URL
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
						showToast("info", "Client already exists.");
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
		function getEditDetails(Id, Name, status) {

			$("#editClientName").val(Name);

			if (status === "1") {
				$("#editstatus").prop("checked", true);
			} else {
				$("#editstatus").prop("checked", false);
			}
			$("#editdetails").attr("onclick", "updateplandetails(" + Id + ")")
		}
		function updateplandetails(Id) {

			document.getElementById("editClientNameError").innerText = "";

			// Get input values
			const name = document.getElementById("editClientName").value.trim();

			if (name === "") {
				document.getElementById("editClientNameError").innerText = "Client Name is required.";
				return false;
			}
			var StatusCheck = $("#editstatus").prop("checked");

			if (StatusCheck) {
				status = 1;
			} else {
				status = 0;
			}

			const formData = {
				name : $("#editClientName").val(),
				status : status,
				id : Id,
				flag : 'update'
			};

			$.ajax({
				url : "addClient",
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
						showToast("info", "Client already exists.");
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

		function onChangeStatus(Id, Name, status) {

			var StatusCheck = $("#status" + Id).prop("checked");

			if (StatusCheck) {
				status = 1;
			} else {
				status = 0;
			}

			const formData = {
				name : Name,
				status : status,
				id : Id,
				flag : 'update'
			};

			$.ajax({
				url : "addClient",
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
						showToast("info", "Client already exists.");
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

</body>

</html>