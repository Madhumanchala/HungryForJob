<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
String candidateId = (String) session.getAttribute("candidateId");
int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
%>
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="css/select2.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet">
</head>

<body>

	<div id="preloader">
		<div id="loader" class="loader">
			<div class="loader-container">
				<div class="loader-icon">
					<img src="assets/img/logo/preloader.svg" alt="Preloader">
				</div>
			</div>
		</div>
	</div>
	<%@include file="header3.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main" class="maincontent">
		<nav aria-label="breadcrumb" class="breadcrumb">
			<div class="bgtop"></div>
		</nav>
		<section id="featuredJoblist" class="featuredJoblist myprofile">
			<div class="container">
				<div class="row">
					<%-- <%@include file="menu.jsp"%> --%>
					<div class="col-xl-9 col-lg-9 col-md-8 col-sm-12 ">

						<div class="profile-card1">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 recommended">
								<h2>Profile</h2>
							</div>


							<div class="card-content">
								<div class="headtitle ">
									<h3>Resume</h3>
								</div>
								<div class="content-txt">
									<div class="row">

										<div class="col-xl-5 col-lg-6 col-md-9 col-sm-12 ">
											<div class="form-group">
												<label for="resume_doc" class="form-label">Upload
													your resume here.</label> <input type="file" name="resume_doc"
													id="resume_doc" class="form-control"> <span
													style="font-size: 12px;">(Only pdf, doc and docx
													type are allowed)</span><br>
											</div>
										</div>
										<div class="col-xl-3 col-lg-2 col-md-3 col-sm-12 ">
											<div class="cvUpload">
												<a class="btns" id="cvUpload" onclick="updateCv()">Upload</a>
											</div>
										</div>
										<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 ">
											<div class="downloadResume">
												<h4>
													<a onclick="downloadResume()" style="color: white"> <i
														class="bi bi-download" style="color: white"></i> Download
														Resume
													</a>
												</h4>
												<span>Uploaded on Jul 03, 2024</span>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="card-content">
								<div class="headtitle">
									<h3>
										Education Details <a href="#" data-bs-toggle="modal"
											data-bs-target="#educationModal" class="editBtn2"
											onclick="geteducationDetailsByid(${educationDetails.id})">
											<img src="img/edit-2.svg">
										</a>
									</h3>
								</div>

								<div class="content-txt">
									<div class="row">
										<c:choose>
											<c:when
												test="${educationDetails.qualificationtype == '12th' or educationDetails.qualificationtype == '10th'}">
												<div class="col-lg-4 col-md-6 col-sm-6">
													<p>Qualification</p>
													<h5 class="ssc_marks">${educationDetails.qualificationtype}</h5>
												</div>
												<div class="col-lg-4 col-md-6 col-sm-6">
													<p>${educationDetails.qualificationtype}Marks</p>
													<h5 class="hsc_marks">${educationDetails.marks}</h5>
												</div>
											</c:when>
											<c:when
												test="${educationDetails.qualificationtype == 'Below 10th'}">
												<div class="col-lg-4 col-md-6 col-sm-6">
													<p>Qualification</p>
													<h5 class="ssc_marks">${educationDetails.qualificationtype}</h5>
												</div>
											</c:when>
											<c:otherwise>
												<div class="row">
													<div class="col-lg-4 col-md-6 col-sm-6">
														<p>Course</p>
														<h5>${educationDetails.courseName}</h5>
													</div>
													<div class="col-lg-4 col-md-6 col-sm-6">
														<p>Specialization</p>
														<h5>${educationDetails.specialization}</h5>
													</div>
													<div class="col-lg-4 col-md-6 col-sm-6">
														<p>Institute</p>
														<h5>${educationDetails.institute}</h5>
													</div>
													<div class="col-lg-4 col-md-6 col-sm-6">
														<p>Course Start Year</p>
														<h5 id="courseStartYear">${educationDetails.startYear}</h5>
													</div>
													<div class="col-lg-4 col-md-6 col-sm-6">
														<p>Course End Year</p>
														<h5 id="courseEndYear">${educationDetails.endYear}</h5>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

							</div>


							<div class="card-content">
								<div
									class="headtitle d-flex justify-content-between align-items-center">
									<h3>Employment</h3>
									<div>
										<a href="#" data-bs-toggle="modal"
											data-bs-target="#employmentAddModal" class="editBtn"> <i
											class="bi bi-plus"></i> Employment
										</a>
									</div>
								</div>

								<div class="content-txt">
									<c:forEach items="${employmentDetails}" var="emloyementDetails">
										<div class="addEmployment">
											<div class="row">
												<div class="col-lg-4 col-md-6 col-sm-6 ">
													<p>Company Name</p>
													<h5>${emloyementDetails.companyName}</h5>
												</div>
												<div class="col-lg-3 col-md-3 col-sm-3 ">
													<p>Job Title</p>
													<h5>${emloyementDetails.jobTittle}</h5>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-4 col-9 ">
													<p>Start / End Date </p>
													<h5>${emloyementDetails.startMonth} ${emloyementDetails.startYear} TO ${emloyementDetails.endMonth} ${emloyementDetails.endYear}</h5>
												</div>
												<div class="col-lg-1 col-md-1 col-sm-1 col-3 ">
													<div>
														<a href="#" data-bs-toggle="modal"
															data-bs-target="#employmentEditModal" class="editBtn2"
															onclick="getEditemploymentdetails(${emloyementDetails.id},'${emloyementDetails.companyName}','${emloyementDetails.jobTittle}',${emloyementDetails.startYear},'${emloyementDetails.startMonth}',${emloyementDetails.endYear},'${emloyementDetails.endMonth}')">
															<img src="img/edit-2.svg">
														</a>
													</div>
												</div>
												<%-- <div class="col-lg-4 col-md-6 col-sm-6 col-9 ">
													<p>Start Month</p>
													<h5>${emloyementDetails.startMonth}</h5>
												</div> --%>
												<%-- <div class="col-lg-4 col-md-6 col-sm-6 col-9 ">
													<p>End Year</p>
													<h5>${emloyementDetails.endYear}</h5>
												</div>
												<div class="col-lg-3 col-md-6 col-sm-6 col-9 ">
													<p>End month</p>
													<h5>${emloyementDetails.endMonth}</h5>
												</div> --%>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>


							<div class="card-content">
								<div
									class="headtitle d-flex justify-content-between align-items-center">
									<h3>Skills</h3>
									<div>
										<a href="#" data-bs-toggle="modal"
											data-bs-target="#skillsAddModal" class="editBtn"
											onclick="getTechnologyDetails()" id="addSkillsBtn"> <i class="bi bi-plus"></i>Add
											Skills
										</a>
									</div>
								</div>

								<div class="content-txt">
									<c:forEach items="${skills}" var="skills">
										<div class="addEmployment skills">
											<div class="row">
												<div class="col-lg-4 col-md-6 col-sm-6 col-6">
													<h5>${skills.techName}</h5>
												</div>
												<div class="col-lg-7 col-md-4 col-sm-3 col-3">
													<h5>${skills.years}.${skills.months}Yrs</h5>
												</div>

												<div class="col-lg-1 col-md-2 col-sm-1 col-3 ">
													<div>
														<a href="#" data-bs-toggle="modal"
															data-bs-target="#skillsEditModal" class="editBtn2"
															onclick="editSkillsDetails(${skills.id},'${skills.years}.${skills.months}','${skills.techName}')">
															<img src="img/edit-2.svg">
														</a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>

							</div>

							<div class="card-content">
								<div class="headtitle ">
									<h3>
										Personal details <a href="#" data-bs-toggle="modal"
											data-bs-target="#personaldetailsModal" class="editBtn2">
											<img src="img/edit-2.svg" onclick="getPersonalDetails()">
										</a>
									</h3>
								</div>
								<div class="content-txt">
									<div class="row">
										<div class="col-lg-4 col-md-6 col-sm-6 ">
											<p>Name</p>
											<h5 id="peronalNames">${personalDetails.fullName}</h5>
										</div>

										<div class="col-lg-4 col-md-6 col-sm-6 ">
											<p>Mobile No</p>
											<h5 id="personalMobileNos">${personalDetails.mobileNumber}</h5>
										</div>

										<div class="col-lg-4 col-md-6 col-sm-6 ">
											<p>Email Address</p>
											<h5 id="personalEmailInputs">
												<%-- <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
													data-cfemail="f993969197d7959c9e9c979db99e94989095d79a9694">${personalDetails.emailInput}</a> --%>
												${personalDetails.emailInput}
											</h5>
										</div>
										<div class="col-lg-4 col-md-6 col-sm-6 ">
											<p>Work Status</p>
											<h5 id="personalWorkStatus">${personalDetails.work_status}</h5>
										</div>

									</div>
								</div>
							</div>
							<div class="card-content">
								<div class="headtitle">
									<h3>
										Career Details <a href="#" data-bs-toggle="modal"
											data-bs-target="#EditCarrerModal" class="editBtn2"> <img
											src="img/edit-2.svg" onclick="getCarrerDetails()">
										</a>
									</h3>
								</div>

								<div class="content-txt">
									<div class="row">
										<div class="row">
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Current CTC</p>
												<h5 id="currentctcfetch">${careerDetails.currentCtc}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Expected CTC</p>
												<h5 id="expectedctcFetch">${careerDetails.expectedCtc}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Total Experience</p>
												<h5 id="totalExpfetch">${careerDetails.totalExperience}
													yrs</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Serving Notice Period</p>
												<h5 id="serviceNoticePeriodFetch">${careerDetails.serviceNoticePeriod}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Notice Period</p>
												<h5 id="noticePeriodFetch">${careerDetails.noticePeriod}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Ready to Relocate</p>
												<h5 id="readyTolocateFetch">${careerDetails.readyToRelocate}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Offer in Hand</p>
												<h5 id="offerInHandFetch">${careerDetails.offerInHand}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Offer CTC</p>
												<h5 id="offerCtcFetch">${careerDetails.offeredCtc}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Work From Home</p>
												<h5 id="workFromHomeFetch">${careerDetails.workFromHome}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>State</p>
												<h5 id="stateFetch">${careerDetails.state}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Current Location</p>
												<h5 id="cityLocation">${careerDetails.city}</h5>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6">
												<p>Preferred Location</p>
												<div class="row">
													<c:forEach items="${preferedLocation}" var="loc"
														varStatus="status">
														<c:set var="myVar"
															value="${status.first ? '' : myVar} ${loc.name} ${status.last ? '' : ','}" />
													</c:forEach>
													<h5>${myVar}</h5>
												</div>

											</div>
											<div class="col-lg-12 col-md-6 col-sm-6">
												<p>Resume Headline</p>
												<h5 id="resmeHeadlineFetch">${careerDetails.resumeheadline}</h5>
											</div>
										</div>

									</div>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
		</section>
		<!-- End Featured Job List Section -->
	</main>
	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<%@include file="footer.jsp"%>
	<!-- End Footer -->
	<!-- personaldetailsModal   -->
	<div class="modal fade" id="personaldetailsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Personal
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Name" class="form-label required">Name </label> <input
									type="text" name="Name" id="Name" class="form-control"
									placeholder="Enter Name"><span
									class="name_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="mobileNo" class="form-label required">Mobile
									No </label> <input type="text" name="mobileNo" id="mobileNo"
									class="form-control" placeholder="Enter Mobile No"
									maxlength="10"><span class="mobileno_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="emailAddress" class="form-label">Email
									Address </label> <input type="text" name="emailAddress"
									id="emailAddress" class="form-control"
									placeholder="Enter Email Address" ><span
									class="email_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="work_status" class="form-label required">Work
									Status</label>
								<div class="workstatus row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="work_status" id="experienced"
											autocomplete="off" value="exp" class="btn-check"> <label
											class="btn" for="experienced"><span> I'm
												Experienced</span> </label>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="work_status" value="fresher"
											id="fresher" autocomplete="off" class="btn-check"> <label
											class="btn" for="fresher"><span>I'm a fresher
										</span> </label>
									</div>
								</div>
								<span class="workStatus_error errorfield"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns"
						onclick="updatePersonalDetails()">Submit</button>
				</div>

			</div>
		</div>
	</div>

	<!-- educationModal   -->
	<div class="modal fade" id="educationModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Education
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12"
							id="editQualificationModal">
							<div class="form-group">
								<label for="editQualification" class="form-label">Highest
									Qualififcation/ Degree currently pursuing</label> <select
									name="editQualification" id="editQualification"
									class="form-control selet2Single" style="width: 100%">
									<option>Select</option>
								</select><span class="editQualification_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="editCourseModal">
							<div class="form-group">
								<label for="editcourse" class="form-label">Course</label> <select
									name="editcourse" id="editcourse"
									class="form-control selet2Single" style="width: 100%">
									<option>Select</option>
								</select><span class="editcourse_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="specializationModal">
							<div class="form-group">
								<label for="editspecialization" class="form-label">Specialization
								</label> <select name="editspecialization" id="editspecialization"
									class="form-control selet2Single" style="width: 100%">
									<option>Select</option>
								</select><span class="editspecialization_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="courseTypeModal">
							<div class="form-group">
								<label for="editcoursetype" class="form-label">Course
									Type</label> <select name="editcoursetype" id="editcoursetype"
									class="form-control selet2Single" style="width: 100%">
									<option>Select</option>
								</select><span class="editcoursetype_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="courseStartYearModal">
							<div class="form-group">
								<label for="CourseStartYear" class="form-label required">Course
									Start Year</label> <select name="CourseStartYear" id="CourseStartYear"
									class="form-control selet2Single" style="width: 100%">
									<option value="">Select</option>
								</select><span class="CourseStartYear_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="courseEndYearModal">
							<div class="form-group">
								<label for="CourseEndYear" class="form-label" id="yearType">
								</label> <select name="CourseEndYear" id="CourseEndYear"
									class="form-control selet2Single" style="width: 100%">
									<option value="">Select</option>
								</select><span class="CourseEndYear_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="instituteModal">
							<div class="form-group">
								<label for="editInstitute" class="form-label">Institute
								</label> <select name="editInstitute" id="editInstitute"
									class="form-control selet2Single" style="width: 100%">
									<option>Select</option>
								</select><span class="editInstitute_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="newInstituteModal">
							<div class="form-group">
								<label for="newInstitute" class="form-label">Enter the
									New Institute</label> <input type="text" name="newInstitute"
									id="newInstitute" class="form-control"
									placeholder="Enter NewInstitute"><span
									class="newInstitute_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="gradingSystemModal">
							<div class="form-group">
								<label for="editgradingsystem" class="form-label">Grading
									System</label> <select name="editgradingsystem" id="editgradingsystem"
									class="form-control selet2Single" style="width: 100%">
									<option>Select</option>
								</select><span class="editgradingsystem_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12" id="editGradeModal">
							<div class="form-group">
								<label for="editgrade" class="form-label" id="marksLabel"></label>
								<input type="text" name="editgrade" id="editgrade"
									class="form-control" placeholder=""><span
									class="editgrade_error errorfield"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns"
						onclick="updateEducationDetails()">Submit</button>
				</div>

			</div>
		</div>
	</div>


	<!-- employmentAddModal   -->
	<div class="modal fade" id="employmentAddModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Employment
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="companyName" class="form-label required">Company
									Name</label> <input type="text" name="companyName" id="companyName"
									class="form-control" placeholder="Enter Company Name"><span
									class="companyName_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="jobTitle" class="form-label required">Job
									Title</label> <input type="text" name="jobTitle" id="jobTitle"
									class="form-control" placeholder="Enter jobTitle "><span
									class="jobTitle_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="startYear" class="form-label required">Start
									Year</label> <select class="selet2Single form-control jobStartYear"
									id="startYear" name="startYear" style="width: 100%" required>
									<option value="" disabled selected>Select</option>
									<c:forEach var="i" begin="1970" end="<%=currentYear%>">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select><span class="startYear_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="startMonth" class="form-label required">Start
									Month </label> <select class="selet2Single form-control"
									id="startMonth" name="startMonth" style="width: 100%" required>
									<option value="" disabled selected>Select</option>
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
								</select> <span class="startMonth_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="endYear" class="form-label required">End
									Year </label><select class="selet2Single form-control jobStartYear"
									id="endYear" name="endYear" style="width: 100%" required>
									<option value="" disabled selected>Select</option>
									<c:forEach var="i" begin="1970" end="<%=currentYear%>">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select> <span class="endYear_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="endMonth" class="form-label required">End
									Month </label><select class="selet2Single form-control" id="endMonth"
									name="endMonth" style="width: 100%" required>
									<option value="" disabled selected>Select</option>
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
								</select> <span class="endMonth_error errorfield"></span>
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="addEmployeement()">Submit</button>
				</div>

			</div>
		</div>
	</div>


	<!-- Add SkillsModal   -->
	<div class="modal fade" id="skillsAddModal"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Skills</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="addskills" class="form-label">Skills</label> <select
									name="addskills" id="addskills"
									class="form-control selet2Single" style="width: 100%;">
									<option disabled selected>Select</option>
								</select> <span class="addskills_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="addexperienceYears" class="form-label">Years</label>
								<select name="addexperienceYears" id="addexperienceYears"
									class="form-control selet2Single" style="width: 100%;">
									<option disabled selected>Select</option>
								</select><span class="addexperienceYears_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="addexperienceMonth" class="form-label">Month</label>
								<select name="addexperienceMonth" id="addexperienceMonth"
									class="form-control selet2Single" style="width: 100%;">
									<option disabled selected>Select</option>
								</select><span class="addexperienceMonth_error errorfield"></span>
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="addSkills()">Submit</button>
				</div>

			</div>
		</div>
	</div>

	<!-- Edit SkillsModal   -->
	<div class="modal fade" id="skillsEditModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Skills</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editSkills" class="form-label">Skills</label> <select
									name="editSkills" id="editSkills"
									class="form-control  selet2Single" style="width: 100%;">
									<option disabled selected>Select</option>
								</select><span class="editSkills_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editexperienceYears" class="form-label">Years</label>
								<select name="editexperienceYears" id="editexperienceYears"
									class="form-control selet2Single" style="width: 100%;">
									<option disabled selected>Select</option>
								</select><span class="editexperienceYears_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editexperienceMonths" class="form-label">Months</label>
								<select name="editexperienceMonths" id="editexperienceMonths"
									class="form-control selet2Single" style="width: 100%;">
									<option disabled selected>Select</option>
								</select><span class="editexperienceMonths_error errorfield"></span>
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" id="editskillsbutton">Submit</button>
				</div>

			</div>
		</div>
	</div>

	<!-- employmentEditModal   -->
	<div class="modal fade" id="employmentEditModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Employment
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editcompanyName" class="form-label required">Company
									Name</label> <input type="text" name="editcompanyName"
									id="editcompanyName" class="form-control"
									placeholder="Enter Company Name"><span
									class="editcompanyName_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editjobTitle" class="form-label required">Job
									Title</label> <input type="text" name="editjobTitle" id="editjobTitle"
									class="form-control" placeholder="Enter jobTitle "><span
									class="editjobTitle_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editstartYear" class="form-label required">Start
									Year</label> <select class="selet2Single form-control jobStartYear"
									id="editstartYear" name="editstartYear" style="width: 100%"
									required>
								</select><span class="editstartYear_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editstartMonth" class="form-label required">Start
									Month </label> <select class="selet2Single form-control"
									id="editstartMonth" name="editstartMonth" style="width: 100%"
									required>
								</select> <span class="editstartMonth_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editendYear" class="form-label required">End
									Year </label><select class="selet2Single form-control jobStartYear"
									id="editendYear" name="editendYear" style="width: 100%"
									required>
								</select> <span class="editendYear_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editendMonth" class="form-label required">End
									Month </label><select class="selet2Single form-control"
									id="editendMonth" name="editendMonth" style="width: 100%"
									required>
								</select> <span class="editendMonth_error errorfield"></span>
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" id="editemploymentsbutton">Submit</button>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="EditCarrerModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit Career
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Name" class="form-label required">Current
									CTC </label> <input type="text" name="editCurrentCtc"
									id="editCurrentCtc" class="form-control"
									placeholder="Enter Current Ctc "><span
									class="editCurrentCtc_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="Name" class="form-label required">Expected
									CTC </label> <input type="text" name="editExpectedCtc"
									id="editExpectedCtc" class="form-control"
									placeholder="Enter Expected Ctc"><span
									class="editExpectedCtc_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label class="form-label required">Total Experience</label>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<label class="form-label">Years</label> <select
											name="edityearsExp" id="edityearsExp"
											class="form-control select2Single" style="width: 100%">
											<option value="">Select</option>
										</select> <span class="edityearsExp_error errorfield"></span>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<label class="form-label">Months</label> <select
											name="editmonthsExp" id="editmonthsExp"
											class="form-control select2Single" style="width: 100%">
											<option value="">Select</option>
											<!-- Dynamically populate options for months -->
										</select> <span class="editmonthsExp_error errorfield"></span>
									</div>
								</div>
								<span class="editTotalexperience_error errorfield"></span>
							</div>
						</div>


						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editServingNoticePeriod" class="form-label required">Serving
									Notice Period</label>
								<div class="workstatus row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editServingNoticePeriod"
											id="editServingNoticePeriodYes" autocomplete="off"
											value="Yes" class="btn-check"> <label class="btn"
											for="editServingNoticePeriodYes"><span> Yes </span> </label>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editServingNoticePeriod" value="No"
											id="editServingNoticePeriodNo" autocomplete="off"
											class="btn-check"> <label class="btn"
											for="editServingNoticePeriodNo"><span>No </span> </label>
									</div>
								</div>
								<span class="editServingNoticePeriod_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editNoticePeriod" class="form-label"> Notice
									Period </label> <input type="text" name="editNoticePeriod"
									id="editNoticePeriod" class="form-control"
									placeholder="Enter Notice Period"> <span
									class="editNoticePeriod_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editRelocate" class="form-label required">Ready
									to Relocate</label>
								<div class="workstatus row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editRelocate" id="editRelocateYes"
											autocomplete="off" value="Yes" class="btn-check"> <label
											class="btn" for="editRelocateYes"><span> Yes </span>
										</label>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editRelocate" value="No"
											id="editRelocateNo" autocomplete="off" class="btn-check">
										<label class="btn" for="editRelocateNo"><span>No
										</span> </label>
									</div>
								</div>
								<span class="editRelocate_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editOfferInHand" class="form-label required">Offer
									in Hand</label>
								<div class="workstatus row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editOfferInHand"
											id="editOfferInHandYes" autocomplete="off" value="Yes"
											class="btn-check"> <label class="btn"
											for="editOfferInHandYes"><span> Yes </span> </label>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editOfferInHand" value="No"
											id="editOfferInHandNo" autocomplete="off" class="btn-check">
										<label class="btn" for="editOfferInHandNo"><span>No
										</span> </label>
									</div>
								</div>
								<span class="editOfferInHand_error errorfield"></span>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editOfferCtc" class="form-label">Offer CTC</label> <input
									type="text" name="editOfferCtc" id="editOfferCtc"
									class="form-control" placeholder="Enter Offer Ctc"> <span
									class="editOfferCtc_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editWorkfromhome" class="form-label required">Work
									From Home</label>
								<div class="workstatus row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editWorkfromhome"
											id="editWorkfromhomeYes" autocomplete="off" value="Yes"
											class="btn-check"> <label class="btn"
											for="editWorkfromhomeYes"><span> Yes </span> </label>
									</div>
									<div class=" col-lg-6 col-md-6 col-sm-12 col-6">
										<input type="radio" name="editWorkfromhome" value="No"
											id="editWorkfromhomeNo" autocomplete="off" class="btn-check">
										<label class="btn" for="editWorkfromhomeNo"><span>No
										</span> </label>
									</div>
								</div>
								<span class="editWorkFromHome_error errorfield"></span>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editstate" class="form-label">State</label> <input
									type="text" name="editstate" id="editstate"
									class="form-control" placeholder="Enter State">
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editcurrentlocation" class="form-label">Current
									Location</label>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="editpreferredlocation" class="form-label">Preferred
									Location</label> <select name="editpreferredlocation"
									id="editpreferredlocation" class="form-control selet2Multiple"
									style="width: 100%" multiple="multiple">
									<option value="">Select</option>
									<option value="">option1</option>
									<option value="">otpion2</option>
									<option value="">Select</option>
								</select><span class="editCurrentLocation_error errorfield"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns">Submit</button>
				</div>

			</div>
		</div>
	</div>


	<script data-cfasync="false"
		src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/addCandidates.js"></script>

	<script>
		$(".selet2Multiple").select2({});
		$(".selet2Single").select2({});

		$(document).ready(function() {
			$("#addskills").select2({
				dropdownParent : $("#skillsAddModal")
			});
			$("#addexperience").select2({
				dropdownParent : $("#skillsAddModal")
			});
			$("#editSkills").select2({
				dropdownParent : $("#skillsEditModal")
			});
			$("#editExperience").select2({
				dropdownParent : $("#skillsEditModal")
			});
			$("#editcourse").select2({
				dropdownParent : $("#educationModal")
			});
			$("#editspecialization").select2({
				dropdownParent : $("#educationModal")
			});
			$("#editQualification").select2({
				dropdownParent : $("#educationModal")
			});
			$("#editcoursetype").select2({
				dropdownParent : $("#educationModal")
			});
			$("#editInstitute").select2({
				dropdownParent : $("#educationModal")
			});
			$("#editgradingsystem").select2({
				dropdownParent : $("#educationModal")
			});
			$("#CourseStartYear").select2({
				dropdownParent : $("#educationModal")
			});
			$("#CourseEndYear").select2({
				dropdownParent : $("#educationModal")
			});
			$("#startYear").select2({
				dropdownParent : $("#employmentAddModal")
			});
			$("#startMonth").select2({
				dropdownParent : $("#employmentAddModal")
			});
			$("#endYear").select2({
				dropdownParent : $("#employmentAddModal")
			});
			$("#endMonth").select2({
				dropdownParent : $("#employmentAddModal")
			});
			$("#addexperienceMonth").select2({
				dropdownParent : $("#skillsAddModal")
			});
			$("#addexperienceYears").select2({
				dropdownParent : $("#skillsAddModal")
			});
			$("#editexperienceYears").select2({
				dropdownParent : $("#skillsEditModal")
			});
			$("#editexperienceMonths").select2({
				dropdownParent : $("#skillsEditModal")
			});
			$("#editstartYear").select2({
				dropdownParent : $("#employmentEditModal")
			});
			$("#editstartMonth").select2({
				dropdownParent : $("#employmentEditModal")
			});
			$("#editendYear").select2({
				dropdownParent : $("#employmentEditModal")
			});
			$("#editendMonth").select2({
				dropdownParent : $("#employmentEditModal")
			});
			$("#edityearsExp").select2({
				dropdownParent : $("#EditCarrerModal")
			});
			$("#editpreferredlocation").select2({
				dropdownParent : $("#EditCarrerModal")
			});
			
			
		});
	</script>

	<script>
	var candidateId="<%=candidateId%>";
		$(document).ready(function() {
			progress_bar();
		});

		$(window).on('load', function() {
			preloader();
			wowAnimation();
			aosAnimation();
		});

		/*===========================================
		 =            Preloader          =
		 =============================================*/
		function preloader() {
			$('#preloader').delay(0).fadeOut();
		};
	</script>
	<script>
	var eduMarks = "${educationDetails.marks}" !== "" ? "${educationDetails.marks}" : null;
	var marks = null;
	var qualificationsType="${educationDetails.qualificationtype}";
	if (eduMarks !== null) {
		marks = eduMarks;
	}
	var endYear="${educationDetails.endYear}" !== "" ? "${educationDetails.endYear}" : null
	var endyear=null;
	if(endYear != null)
	{
		endyear=endYear;
	}
	var exp="${careerDetails.totalExperience}" !== "" ? "${careerDetails.totalExperience}" :0
			
			 var ids = [
			        <c:forEach items="${skills}" var="item" varStatus="status">
			        "${item.techName}"<c:if test="${!status.last}">,</c:if>
			        </c:forEach>
			    ];
	console.log(ids);
	document.addEventListener('DOMContentLoaded', function () {
	    var skillsCount = document.querySelectorAll('.skills').length;
	
	    var addSkillsBtn = document.getElementById('addSkillsBtn');

	    if (skillsCount >= 5) {
	        addSkillsBtn.style.display = 'none'; // Hide the button
	    }
	});
	</script>
</body>
</html>