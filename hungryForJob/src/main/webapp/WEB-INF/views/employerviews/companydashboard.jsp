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
String role=session.getAttribute("rolestatus").toString();
		if(role.equals("employeradmin") || role.equals("admin"))
		{
%>
	<%@include file="employerheader1.jsp"%>
<%
		}
		else{
%>
<%@include file="employerheader2.jsp"%>
<%} %>
	<%@include file="toaster.jsp"%>
	<main id="main">
		<section class="section-inner advancedsearch-section">
			<div class="container">
				<div class="row">
					<%@include file="employerdashboard.jsp"%>
					<div class="col-xl-9 col-lg-8 col-md-8">
						<div class="jobdetails-content Profile-details mb-4">
							<div class="d-flex justify-content-between">
								<h3>Company Profile</h3>
								<button class="edit-profile-button" data-bs-toggle="modal"
									data-bs-target="#Company-Profile-edit"
									onclick="companyProfileDetails()">
									<i class="bi bi-pencil"></i> Edit
								</button>
							</div>
							<div class="line2"></div>
							<div class="mt-3">
								<div class="content-txt">
									<div class="row">
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>Name</p>
											<h5 id="companyProfile_Name">${companydetails.name}</h5>
										</div>

										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>Email for Communication</p>
											<h5 id="companyProfile_EmailforCommunuication">
												${companydetails.emailId}</h5>
										</div>

										<!-- <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Role</p>
                      <h5>Recruiter</h5>
                    </div> -->
										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Reporting Manager </p>
                      <h5>Mahendra</h5>
                    </div> -->
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>Mobile Number</p>
											<h5 id="companyProfile_MobileNumber">+91-
												${companydetails.mobileNumber}</h5>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="jobdetails-content Profile-details mb-4">
							<div class="d-flex justify-content-between">
								<h3>Company details</h3>
								<button class="edit-profile-button" data-bs-toggle="modal"
									data-bs-target="#Company-details-edit" onclick="EditcompanyDetails()">
									<i class="bi bi-pencil"></i> Edit
								</button>
							</div>
							<div class="line2"></div>
							<div class="mt-3">
								<div class="content-txt">
									<div class="row">
										<!-- <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Company Type </p>
                      <h5>Corporate House</h5>
                    </div> -->

										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>Industry Type</p>
											<h5 id="editindustrytype">${companydetails.industryType}</h5>
										</div>

										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Contact Person </p>
                      <h5>john legend </h5>
                    </div> -->
										<!-- <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Contact Person Designation </p>
                      <h5>NA</h5>
                    </div> -->
										<!-- <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Website URL</p>
                      <h5>https://www.comunus.in/</h5>
                    </div> -->
										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Profile for Hot Vacancies</p>
                      <h5>NA</h5>
                    </div> -->
										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Profile for Classified</p>
                      <h5>NA</h5>
                    </div> -->
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>Phone Number</p>
											<h5 id="phonenumbertype">${companydetails.mobileNumber}</h5>
										</div>
										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Phone Number 2</p>
                      <h5>9876543210</h5>
                    </div> -->
										<!-- <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Fax Number </p>
                      <h5>NA</h5>
                    </div> -->
										<!-- <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Tan Number</p>
                      <h5>NA</h5>
                    </div> -->
									</div>
								</div>
							</div>
						</div>
						<div class="jobdetails-content Profile-details">
							<div class="d-flex justify-content-between">
								<h3>KYC Compliance details</h3>
								<button class="edit-profile-button" data-bs-toggle="modal"
									data-bs-target="#KYC-Compliance-details" onclick="kycdetailsdetails()">
									<i class="bi bi-pencil"></i> Edit
								</button>
							</div>
							<div class="line2"></div>
							<div class="mt-3">
								<div class="content-txt">
									<div class="row">
										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>KYC Status </p>
                      <h5>Pending</h5>
                    </div> -->

										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>PAN Number </p>
                      <h5> BEDPA5432P </h5>
                    </div> -->

										<!-- <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Name on PAN Card </p>
                      <h5>john legend </h5>
                    </div> -->
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>Address</p>
											<h5 id="kycaddress">${companydetails.address}</h5>
										</div>
										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Address</p>
                      <h5>Mumbai</h5>
                    </div> -->
										<!--  <div class="col-lg-4 col-md-6 col-sm-6">
                      <p>Country</p>
                      <h5>India</h5>
                    </div> -->
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>State</p>
											<h5 id="kycstate">${companydetails.state}</h5>
										</div>
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>City</p>
											<h5 id="kyccity">${companydetails.city}</h5>
										</div>
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>Pin Code</p>
											<h5 id="kycpincode">${companydetails.pincode}</h5>
										</div>
										<div class="col-lg-4 col-md-6 col-sm-6">
											<p>GSTIN</p>
											<h5 id="kycgstnumber">${companydetails.gstnumber}</h5>
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
	<%@include file="footer.jsp"%>
	<!-- End Footer -->



	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/popper.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/nice-select.min.js"></script>
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="employer/js/companydashboard.js"></script>

	<!--Company Profile edit modal   -->
	<div class="modal fade" id="Company-Profile-edit" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Company
						Profile</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">User Name</label> <input
									type="text" name="" id="editUserName" class="form-control"
									placeholder="Enter" maxlength="30"> <span
									class="errors" id="editUserName_error"></span>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Email for Communication</label>
								<input type="text" name="" id="editEmailForComunuication"
									class="form-control" placeholder="Enter"> <span
									class="errors" id="editEmailCommunication_error"></span>
							</div>
						</div>
						<!-- <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Role</label>
                <input type="text" name="" id="" class="form-control" value="Recruiter" placeholder="Enter">
              </div>
            </div> -->
						<!--  <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Reporting Manager</label>
                <input type="text" name="" id="" class="form-control" value="Mahendra" placeholder="Enter">
              </div>
            </div> -->
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Mobile Number</label> <input
									type="text" name="" id="editMobileNumber" class="form-control"
									placeholder="Enter"> <span class="errors"
									id="editMobileNo_error"></span>
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="updatCompanyProfile()">Update</button>
				</div>

			</div>
		</div>
	</div>

	<!--Company-details-edit  Modal   -->
	<div class="modal fade" id="Company-details-edit" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Company
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<!-- <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Company Type</label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="Corporate House">
              </div>
            </div> -->
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Industry Type </label> <select
									class="form-control selet2Single" id="industryDetails" style="width:100%">
									<option value="">Select</option>
									<c:forEach items="${industryDetails}" var="industryDetails">
										<option value="${industryDetails.id}">${industryDetails.name}</option>
									</c:forEach>
								</select>
								<span class="errors" id="editindustrytype_error"></span>
								<!--                 <input type="text" name="" id="" class="form-control" placeholder="Enter" value="Corporate House">
 -->
							</div>
						</div>
						<!--  <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Contact Person </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="john legend">
              </div>
            </div> -->
						<!--  <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Contact Person Designation </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="NA">
              </div>
            </div> -->
						<!--  <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Website URL </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter"
                  value="https://www.comunus.in/">
              </div>
            </div> -->
						<!--  <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Profile for Hot Vacancies </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="NA">
              </div>
            </div> -->
						<!-- <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Profile for Classified </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="NA">
              </div>
            </div> -->
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Phone Number </label> <input
									type="text" name="" id="editphonenumber" class="form-control"
									placeholder="Enter" >
							<span class="errors" id="editphonenumber_error"></span>
							</div>
						</div>
						<!--  <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Phone Number 2 </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="9876543210">
              </div>
            </div> -->
						<!-- <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">Fax Number </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="NA">
              </div>
            </div> -->
						<!--  <div class="col-lg-4 col-md-4">
              <div class="form-group">
                <label for="" class="form-label">TAN Number </label>
                <input type="text" name="" id="" class="form-control" placeholder="Enter" value="NA">
              </div>
            </div> -->
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="updatecompanydetails()">Update</button>
				</div>

			</div>
		</div>
	</div>

	<!--KYC Compliance details  Modal   -->
	<div class="modal fade" id="KYC-Compliance-details" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit KYC
						Compliance Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<!-- <div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">KYC Status</label> <input
									type="text" name="" id="" class="form-control"
									placeholder="Enter" value="Pending">
							</div>
						</div> -->
						<!-- <div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">PAN Number </label> <input
									type="text" name="" id="" class="form-control"
									placeholder="Enter" value="BEDPA5432P">
							</div>
						</div> -->
						<!-- <div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Name on PAN Card </label> <input
									type="text" name="" id="" class="form-control"
									placeholder="Enter" value="john legend">
							</div>
						</div> -->
						<!-- <div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Address Label </label> <input
									type="text" name="" id="" class="form-control"
									placeholder="Enter" value="Primary Address">
							</div>
						</div> -->
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Address </label> <input
									type="text" name="editaddress" id="editaddress" class="form-control"
									placeholder="Enter">
									<span class="errors" id="editaddress_error"></span>
							</div>
						</div>
						<!-- <div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Country </label> <input
									type="text" name="" id="" class="form-control"
									placeholder="Enter" value="India">
							</div>
						</div> -->
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">State</label> <input
									type="text" name="editstate" id="editstate" class="form-control"
									placeholder="Enter" disabled="disabled">
									<span class="errors" id="editstate_error"></span>
							</div>
						</div>
						<div class="col-lg-4 col-md-4" id="currentlocationModal">
							<div class="form-group">
								<label for="" class="form-label">City</label>
							</div>
							<div class="cityclass" style="margin-top:-16px">
							<span class="errors" id="editcity_error"></span>
							</div>
						</div>
						
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">Pin Code </label> <input
									type="text" name="editpincode" id="editpincode" class="form-control"
									placeholder="Enter" onchange="editpincodechange()" maxlength="6" >
									<span class="errors" id="editpincode_error"></span>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="form-group">
								<label for="" class="form-label">GSTIN</label> <input
									type="text" name="editgst" id="editgst" class="form-control"
									placeholder="Enter">
								<span class="errors" id="editgst_error"></span>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="updatekycdetails()">Update</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#industryDetails").select2({
			dropdownParent : $("#Company-details-edit")
		});
		$('.loader').hide();
	});
</script>

</html>