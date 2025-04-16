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
<!-- <link href="employer/css/font-awesome.min.css" rel="stylesheet"> -->
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/nice-select.css" rel="stylesheet">
<link href="employer/css/richtext.min.css" rel="stylesheet" />
<!-- <link rel="stylesheet" href="employer/css/dataTables.bootstrap5.css" /> -->
<link href="employer/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
</head>

<body>
<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="employerheader1.jsp"%> 
	<%@include file="toaster.jsp" %>
	<main id="main">
		<section class="section-inner advancedsearch-section ">
			<div class="container">
				<div class="row ">
					<%@include file="employerdashboard.jsp"%>
					<div class="col-xl-9 col-lg-8 col-md-8">

						<div class="billing-profile mb-4">
							<div
								class="card-listinner d-flex justify-content-between align-items-center">
								<div>
									<h4>Billing Profile</h4>
									<p class="mb-0">Add your registered GST number and company
										details that would appear on your future invoices.</p>
								</div>
								<div>
									<button class="add-gst-button" data-bs-toggle="modal"
										data-bs-target="#gstin-add">Add GSTIN number</button>
								</div>
							</div>
						</div>
						<div class="billing-history">
							<div class="card">
								<div
									class="d-flex justify-content-between align-items-center p-4 pb-1">
									<h4>Billing History</h4>
									<div class="form-group1">
										<div class="formchecks">
											<ul>
												<li><input type="radio" class="btn-check"
													name="billing-history" id="All" onclick="statusplan('All')"> <label
													class="btn" for="All"><span>All</span> </label></li>
												<li><input type="radio" class="btn-check"
													name="billing-history" id="Success" onclick="statusplan('Success')"> <label
													class="btn" for="Success"><span>Success </span> </label></li>
												<li><input type="radio" class="btn-check"
													name="billing-history" id="Pending" onclick="statusplan('Pending')"> <label
													class="btn" for="Pending"><span>Pending </span> </label></li>
												<li><input type="radio" class="btn-check"
													name="billing-history" id="Failed" onclick="statusplan('Failed')"> <label
													class="btn" for="Failed"><span>Failed </span> </label></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="line2"></div>
								<div class="col-12 p-3">
									<div class="table-responsive1">
										<div id="no-more-tables p-1">
											<table id="billing-list" class="table billing-list"
												style="width: 100%;">
												<thead>
													<tr>
														<th>Date</th>
														<th>Plan Details</th>
														<th>Expires on</th>
														<th>Amount</th>
														<th>Status</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${plandetails}" var="plandetails">
														<tr>
															<td data-title="Client Name">${plandetails.date}<br>
																<small>${plandetails.time}</small>
															</td>
															<td data-title="User Name">
																${plandetails.plandetails}</td>
															<td data-title="Email ID">${plandetails.expireOn}</td>
															<td data-title="Mobile Number">&#8377;
																${plandetails.amount}</td>
															<td data-title="Status"><span
																class="status ${plandetails.status}">
																	${plandetails.status} </span></td>
															<c:choose>
																<c:when test="${plandetails.action eq 'Renewal'}">
																	<td data-title="Action"><a href="#" onclick="plandetails(${plandetails.planId},'verifyDetails')">${plandetails.action}</a></td>
																</c:when>
																<c:when test="${plandetails.status eq 'failure'}">
																	<td data-title="Action"><a href="#" onclick="plandetails(${plandetails.id},'renewalplan')">${plandetails.action}
																			</a></td>
																</c:when>
																<c:otherwise>
																	<td data-title="Action"><a>${plandetails.action}</a></td>
																</c:otherwise>
															</c:choose>
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
	<!--GSTIN Add  Modal   -->
	<div class="modal fade" id="gstin-add" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add GSTIN
						Number</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="Industry" class="form-label required">GSTIN
									Number</label> <input type="text" name="gstnumber" id="gstnumber"
									class="form-control" placeholder="Enter GST" onkeyup="checkgst(this,'gstnumber_error')" maxlength="15">
									<span class="error" id="gstnumber_error"></span>
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="addgstnumber()">Submit</button>
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
	<!-- <script src="employer/js/dataTables.js"></script> -->
	<!-- <script src="employer/js/dataTables.bootstrap5.js"></script> -->
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="js/commonvalidation.js"></script>
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="employer/js/subscription.js"></script>
	<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

	<script>
		$(document).ready(function() {
			var value="${statustype}";
			if(value === "Success")
			{
				$("#Success").prop("checked",true);
			}
			else if(value === "Pending")
			{
				$("#Pending").prop("checked",true);
			}else if(value === "Failed")
			{
				$("#Failed").prop("checked",true);
			}else 
			{
				$("#All").prop("checked",true);
			}
			$('#billing-list').dataTable({});
			$('.loader').hide();
		});
	</script>
</body>

</html>