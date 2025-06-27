<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%
// Get the current year dynamically
int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
String username = (String) session.getAttribute("username");
String candidateId = (String) session.getAttribute("candidateId");
%>
<!DOCTYPE html>
<html>
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/select2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<%@include file="header1.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main">
		<div class="loader" style="display: flex !important">
			<img src="employer/img/loader.gif">
		</div>
		<!-- ======= register  Section ======= -->
		<section id="worksection" class="worksection  ">
			<div class="container">
				<div class="row">
					<div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 offset-xl-2 ">
						<div id="stepindicator" role="group">
							<ol>
								<li class="stepvisited"><span> Basic details </span></li>
								<li class="stepvisited"><span>Work </span></li>
								<li aria-current="true"><span>Employment </span></li>
								<li><span>Education </span></li>
								<li><span>Last step </span></li>
							</ol>
						</div>
						<div class="card-content register-card work-card ">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<h2>Employment Details</h2>
									<p>Employment details are employment summary of a person.</p>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12">
									<h4>Job Experience (Oldest to Newest)</h4>
								</div>
								<div id="workContainerParent">
									<div id="workContainer" class="workContainer row">
										<div class="col-lg-12">
											<div class="form-group">
												<div class="form-check currentlywork">
													<input class="form-check-input currentlywork"
														type="checkbox" value="Active" id="currentlywork"
														onchange="updateCurrentlyWorking(this)"
														name="currentlywork"> <label
														class="form-check-label"> I am currently working
														here </label>
												</div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label for="jobtitle" class="form-label required">Your
													Job title </label> <input type="text" name="Job_Title"
													id="Job_Title" class="form-control"
													placeholder="Enter Job title" maxlength="80" required>
											</div>
											<span class="job_title_error" style="color: red"></span>

										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label for="jobcompany" class="form-label required">Company
													Name </label> <select class="selet2Single form-control  jobcompany"
													id="jobcompany" name="job_company"
													onchange="companyChange(this)" required="required">
												</select>
												<!--                     <input type="text" name="job_company" id="job_company" class="form-control" placeholder="Enter Company Name" required>
 -->
											</div>
											<span class="job_company_error" style="color: red"></span>
										</div>
										<%
										// Your dateOfBirth as a string
										String dateOfBirthStr = (String) request.getAttribute("dateOfBirth");

										// Define the correct formatter for yyyy-MM-dd
										DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);

										// Default date if dateOfBirth is empty or null
										LocalDate localDateOfBirth;
										if (dateOfBirthStr == null || dateOfBirthStr.trim().isEmpty()) {
											// Set to January 1, 1970
											localDateOfBirth = LocalDate.of(1970, 1, 1);
										} else {
											// Parse the string to LocalDate
											localDateOfBirth = LocalDate.parse(dateOfBirthStr, formatter);
										}

										// Add 18 years
										LocalDate newLocalDate = localDateOfBirth.plusYears(13);

										// Get the new year
										int newYear = newLocalDate.getYear();
										%>
										<!-- <div class="col-lg-6 col-md-6 col-sm-12">
                  <div class="form-group">
                    <label for="jobStartYear" class="form-label required">From Date</label>
                    <input type="text" id="jobStartYear" name="jobStartYear" class="form-control datepicker" placeholder="From Date" autocomplete="false">
                  </div>
                  <span class="start_year_error errorfield" style="color:red"></span>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                  <div class="form-group">
                    <label for="jobEndYear" class="form-label required">To Date</label>
                    <input type="text" id="jobEndYear" name="jobEndYear" class="form-control datepicker" placeholder="To Date" autocomplete="false">
                  </div>
                  <span class="end_year_error errorfield" style="color:red"></span>
                </div> -->
										<div class="col-lg-3 col-md-3 col-sm-6">
											<div class="form-group">
												<label for="jobStartYear" class="form-label required">Start
													Year</label> <select
													class="selet2Single form-control jobStartYear jobStartYear1"
													id="jobStartYear" name="jobStartYear"
													onchange="updatestartyear(this)" required>
													<option value="" selected>Select</option>
													<c:forEach var="i" begin="<%=newYear%>"
														end="<%=currentYear%>">
														<option value="${i}">${i}</option>
													</c:forEach>
												</select>
											</div>
											<span class="start_year_error errorfield"></span>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6">
											<div class="form-group">
												<label for="jobStartMonth" class="form-label required">Month</label>
												<select class="selet2Single form-control jobStartMonth"
													id="jobStartMonth" name="jobStartMonth"
													onchange="updateStartMonth(this)" required>
													<option value="" selected>Select</option>
													<option value="January">January</option>
													<option value="February">February</option>
													<option value="March">March</option>
													<option value="April">April</option>
													<option value="May">May</option>
													<option value="June">June</option>
													<option value="July">July</option>
													<option value="August">August</option>
													<option value="September">September</option>
													<option value="October">October</option>
													<option value="November">November</option>
													<option value="December">December</option>
												</select>
											</div>
											<span class="start_month_error errorfield"></span>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 endyeardiv">
											<div class="form-group">
												<label for="jobEndYear" class="form-label required">Till
													Year</label> <select
													class="selet2Single form-control jobEndYear jobEndYear1"
													id="jobEndYear" name="jobEndYear"
													onchange="updatejobEndYear(this)">
													<!-- validButton('jobStartYear_2','jobEndYear','1') -->
													<option value="" selected>Select</option>
													<c:forEach var="i" begin="<%=newYear%>"
														end="<%=currentYear%>">
														<option value="${i}">${i}</option>
													</c:forEach>
												</select>
											</div>
											<span class="end_year_error errorfield" style="color: red"></span>
										</div>
										<div class="col-lg-3 col-md-3 col-sm-6 endmonthdiv">
											<div class="form-group">
												<label for="jobEndMonth" class="form-label required">Month
												</label> <select class="selet2Single form-control  jobEndMonth"
													id="jobEndMonth" name="jobEndMonth"
													onchange="updateEndMonth(this)" required>
													<option value="" selected>Select</option>
													<option value="January">January</option>
													<option value="February">February</option>
													<option value="March">March</option>
													<option value="April">April</option>
													<option value="May">May</option>
													<option value="June">June</option>
													<option value="July">July</option>
													<option value="August">August</option>
													<option value="September">September</option>
													<option value="October">October</option>
													<option value="November">November</option>
													<option value="December">December</option>
												</select> <span class="end_month_error errorfield" style="color: red"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-6 col-sm-6">

											<button type="button"
												class="btn btn-primary btn-md addSection">+</button>
											<button type="button"
												class="btn btn-danger btn-md deleteSection">-</button>
										</div>
									</div>
								</div>
								<span class="maximum_skills_error errorfield"></span>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div
									class="form-group d-flex
                  justify-content-end nextback">
									<button type="button" class="btns"
										id="employmentRegisterSubmit">Next</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<div id="sessionData" data-username="<%=username%>"
		data-candidateid="<%=candidateId%>"></div>
	<%@include file="footer.jsp"%>



	<!-- employmentAddModal   -->
	<div class="modal fade" id="otherAddModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Company
						Name</h5>
					<button type="button" class="btn-close" onclick="clearInput()"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="NewcompanyName" class="form-label required">Company
									Name</label> <input type="text" name="NewcompanyName"
									id="NewcompanyName" class="form-control"
									placeholder="Enter Company Name">
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" onclick="clearInput()"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="companyMasterSave()">Submit</button>
				</div>

			</div>
		</div>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/toastr.min.js" type="text/javascript"></script>
	<script src="js/select2.min.js" type="text/javascript"></script>
	<script src="js/employmentDetails.js" type="text/javascript"></script>
	<script>
		$('.datepicker').datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true,
		});
		$('#dateofBirth').on('keypress', function(e) {
			e.preventDefault(); // Prevent manual typing
		});
		$('#dateofBirth').on('keypress', function(e) {
			e.preventDefault(); // Prevent manual typing
		});
		$(document).ready(function() {
			setTimeout(function() {
				$(".loader").hide()
			}, 1000);
		});
	</script>

</body>
</html>