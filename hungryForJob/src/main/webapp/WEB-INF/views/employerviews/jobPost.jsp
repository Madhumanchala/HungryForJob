<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String companyId = (String) session.getAttribute("companyId");
String userId= (String) session.getAttribute("userId");
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
<link href="employer/img/favicon.png" rel="icon">
<link href="employer/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="employer/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
 <link href="employer/css/daterangepicker.css" rel="stylesheet" />
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/richtext.min.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet">

</head>

<body>
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="toaster.jsp"%>
	<!-- ======= Header ======= -->
	<%@include file="employerHeader.jsp"%> 
	<!-- End Header -->
	<main id="main">
		<section class="section-inner sign-bg postNewJob ">
			<div class="container">
				<div class="row ">
					<div class="col-xl-8 col-lg-8 col-md-8  ">
						<div class="card-register">

							<form autocomplete="off">
								<h3>Post New Job</h3>
								<div class="card-registerinner  ">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12">
											<h5>Please select which of job you want post</h5>
											<div class="form-group1 ">
												<label for="jobtype" class="required" onchange="allChange(jobType_error)">Job type </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="jobtype" id="job" onchange="allChange('jobType_error')" value="Job"> <label
															class="btn" for="job"><span>Job</span> </label></li>
														<!-- <li><input type="radio" class="btn-check"
															name="jobtype" id="internship" onchange="allChange('jobType_error')" value="Internship"> <label
															class="btn" for="internship"><span>Internship
															</span> </label></li> -->
														<li><input type="radio" class="btn-check"
															name="jobtype" id="contract" onchange="allChange('jobType_error')" value="Contract"> <label class="btn"
															for="contract"><span>Contract </span> </label></li>
													</ul>
												</div>
												<span class="errors" id="jobType_error"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="Jobtitle" class="required">Job title</label> <input
													type="text" class="form-control" id="Jobtitle"
													placeholder="Enter a clear and specific title to get better responses" onkeyup="allJobChangeTittle()">
												 <span class="errors" id="jobTittle_error"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group1 ">
												<label for="employmentType" class="required">Employment
													type </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="employmentType" id="fulltime" value="fulltime" onchange="allChange('employmentType_error')"> <label
															class="btn" for="fulltime"><span>Full time</span>
														</label></li>
														<li><input type="radio" class="btn-check"
															name="employmentType" id="parttime" value="parttime" onchange="allChange('employmentType_error')"> <label
															class="btn" for="parttime"><span>Part time
															</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="employmentType" id="permanent" value="permanent" onchange="allChange('employmentType_error')"> <label
															class="btn" for="permanent"><span>Permanent
															</span> </label></li>
													</ul>
												</div>
												 <span class="errors" id="employmentType_error"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group1 ">
												<label for="workMode" class="required">Work Mode </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="workMode" id="inOffice" value="INOFFICE" onchange="allChange('workMode_error')"> <label
															class="btn" for="inOffice"><span>In Office</span>
														</label></li>
														<li><input type="radio" class="btn-check"
															name="workMode" id="workfromhome" value="WORKFROMHOME" onchange="allChange('workMode_error')"> <label
															class="btn" for="workfromhome"><span>Work
																	from home </span> </label></li>
														<li><input type="radio" class="btn-check"
															name="workMode" id="onfield" value="ONFIELD" onchange="allChange('workMode_error')"> <label class="btn"
															for="onfield"><span>On field </span> </label></li>
															
														<li><input type="radio" class="btn-check"
															name="workMode" id="onfield" value="HYBRID" onchange="allChange('workMode_error')"> <label class="btn"
															for="onfield"><span>hybrid</span> </label></li>
													</ul>
												</div>
												 <span class="errors" id="workMode_error"></span>
											</div>
										</div>




										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="keySkills" class="required">Key skills </label>
												<select class="form-select form-control selet2Multiple"
													id="keySkills" multiple="multiple" onchange="allChangeAddSkills('keySkills_error')">
													<option value="">Select skill</option>
													<c:forEach items="${keySkills}" var="skill">
														<option value="${skill.id}">${skill.name}</option>
													</c:forEach>
												</select>
												 <span class="errors" id="keySkills_error"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="jobLocation" class="required">Work
													Experience (years) </label>
												<div class="row  ">
													<div class="col-lg-6 col-md-6 col-sm-12 col-6 mb-2">
														<select class="form-select form-control selet2Single"
															id="workExperienceMin" onchange="maxexpchange('workExperienceMin_error')">
														</select>
														<span class="errors" id="workExperienceMin_error"></span>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-12 col-6">
														<select class="form-select form-control selet2Single "
															id="workExperienceMax" onchange="allChangeMaxExp()">
															<option value="" selected>Max</option>
														</select>
														<span class="errors" id="workExperienceMax_error"></span>
													</div>
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group1 ">
												<label for="salaryType" class="required">Salary Type </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="salaryType" id="fixedshow" onchange="allSalarytypeChange('salaryType_error','fixedshow')" value="FIXED"> <label
															class="btn" for="fixedshow" ><span>Fixed</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="salaryType" id="rangeshow" onchange="allSalarytypeChange('salaryType_error','rangeshow')" value="RANGE"> <label
															class="btn" for="rangeshow"><span>Range </span> </label>
														</li>
														<li><input type="radio" class="btn-check"
															name="salaryType" id="fixedIncentiveshow" onchange="allSalarytypeChange('salaryType_error','fixedIncentiveshow')" value="FIXED_INCENTIVESHOW"> <label
															class="btn" for="fixedIncentiveshow"><span>Fixed
																	+ Incentive </span> </label></li>
													</ul>
												</div>
												 <span class="errors" id="salaryType_error"></span>
											</div>
										</div>

										<div class="col-lg-8 col-md-12 col-sm-12"
											id="fixedshow1">
											<div class="form-group">
												<label for="jobLocation" class="required">Salary
													Figure </label> <small>The salary on the job page will be
													shown in years only.</small>
												<div class="input-group ">
													<span class="input-group-text">₹ (INR)</span> <input
														type="text" class="form-control" id="fixedRuppes"
														placeholder="Enter Min Salary">
												</div>
												<div class="form-check relocate">
													<input class="form-check-input" type="checkbox" value=""
														id="hideSalary"> <label class="form-check-label"
														for="hideSalary"> Hide salary details from
														candidates </label>
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12" id="rangeshow1">
											<div class="form-group">

												<label for="jobLocation" class="required">Salary
													Figure </label> <small class="mb-2 d-block">The salary on
													the job page will be shown in years only.</small>
												<div class="row">
													<div class="col-lg-2 col-md-2 col-sm-2 col-2">
														<select class="form-select form-control selet2Single "
															id="salaryFigureMinRuppes">
															<option value="INR" selected>₹</option>
														</select>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-5">
														<select class="form-select form-control selet2Single "
															id="salaryFigureMin" onchange="maxSalary()" style="width:100%">
															<option value="" selected>Min Salary</option>
															<option value="50000">50,000</option>
															<option value="60000">60,000</option>
															<option value="70000">70,000</option>
															<option value="80000">80,000</option>
															<option value="90000">90,000</option>
															<option value="100000">1 lac</option>
															<option value="125000">1.25 lacs</option>
															<option value="150000">1.5 lacs</option>
															<option value="175000">1.75 lacs</option>
															<option value="200000">2 lacs</option>
															<option value="225000">2.25 lacs</option>
															<option value="250000">2.5 lacs</option>
															<option value="275000">2.75 lacs</option>
															<option value="300000">3 lacs</option>
															<option value="325000">3.25 lacs</option>
															<option value="350000">3.5 lacs</option>
															<option value="375000">3.75 lacs</option>
															<option value="400000">4 lacs</option>
															<option value="425000">4.25 lacs</option>
															<option value="450000">4.5 lacs</option>
															<option value="475000">4.75 lacs</option>
															<option value="500000">5 lacs</option>
															<option value="550000">5.5 lacs</option>
															<option value="600000">6 lacs</option>
															<option value="650000">6.5 lacs</option>
															<option value="700000">7 lacs</option>
															<option value="750000">7.5 lacs</option>
															<option value="800000">8 lacs</option>
															<option value="850000">8.5 lacs</option>
															<option value="900000">9 lacs</option>
															<option value="950000">9.5 lacs</option>
															<option value="1000000">10 lacs</option>
															<option value="1100000">11 lacs</option>
															<option value="1200000">12 lacs</option>
															<option value="1300000">13 lacs</option>
															<option value="1400000">14 lacs</option>
															<option value="1500000">15 lacs</option>
															<option value="1600000">16 lacs</option>
															<option value="1700000">17 lacs</option>
															<option value="1800000">18 lacs</option>
															<option value="1900000">19 lacs</option>
															<option value="2000000">20 lacs</option>
															<option value="2250000">22.5 lacs</option>
															<option value="2500000">25 lacs</option>
															<option value="2750000">27.5 lacs</option>
															<option value="3000000">30 lacs</option>
															<option value="3250000">32.5 lacs</option>
															<option value="3500000">35 lacs</option>
															<option value="3750000">37.5 lacs</option>
															<option value="4000000">40 lacs</option>
															<option value="4500000">45 lacs</option>
															<option value="5000000">50 lacs</option>
															<option value="5500000">55 lacs</option>
															<option value="6000000">60 lacs</option>
															<option value="6500000">65 lacs</option>
															<option value="7000000">70 lacs</option>
															<option value="7500000">75 lacs</option>
															<option value="8000000">80 lacs</option>
															<option value="8500000">85 lacs</option>
															<option value="9000000">90 lacs</option>
															<option value="9500000">95 lacs</option>
															<option value="10000000">1 cr</option>
														</select>
														 <span class="errors" id="minsalary_error"></span>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-5">
														<select class="form-select form-control selet2Single "
															id="salaryFigureMax" style="width:100%" onchange="allMaxSalaryChange()">
															<option value="">Max Salary</option>
														</select>
														 <span class="errors" id="maxsalary_error"></span>
													</div>
												</div>



												<div class="form-check relocate">
													<input class="form-check-input" type="checkbox" value=""
														id="hideSalary1"> <label class="form-check-label"
														for="hideSalary"> Hide salary details from
														candidates </label>
												</div>
											</div>

										</div>

										<div class="col-lg-8 col-md-12 col-sm-12"
											id="fixedIncentiveshow1">
											<div class="form-group mb-2">
												<label for="jobLocation" class="required">Salary
													Figure </label> <small>The salary on the job page will be
													shown in years only.</small>
												<div class="input-group ">
													<span class="input-group-text">₹ (INR)</span> <input
														type="text" class="form-control"
														placeholder="Enter Min Salary">
												</div>

											</div>
											<div class="form-group ">
												<label for="Variable" class="required">Variable</label> <input
													type="text" class="form-control" id="Variable" placeholder="Enter the Percentage">
												 <span class="errors" id="Variable_error"></span>
											</div>
											<div class="form-check relocate">
												<input class="form-check-input" type="checkbox" value=""
													id="hideSalary"> <label class="form-check-label"
													for="hideSalary"> Hide salary details from
													candidates </label>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="jobLocation" class="required">Job
													location ( Maximum 3) </label> <select
													class="form-select form-control selet2Multiple"
													id="jobLocation" multiple="multiple">
													<option value="">Select</option>
													<c:forEach items="${location}" var="location">
														<option value="${location.id}">${location.name}</option>
													</c:forEach>
												</select>
												 <span class="errors" id="location_error"></span>
												<div class="form-check relocate">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckDefault"> <label
														class="form-check-label" for="flexCheckDefault">
														Include candidates ready to relocate to the above location
													</label>
												</div>
											</div>
										</div>

										<!-- <div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="Locality" class="required">Locality</label> <input
													type="text" class="form-control" id="Locality"
													placeholder="Search and add localities">
												<span class="errors"> Please enter your Job title</span>
											</div>
										</div> -->

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="Industry" class="required"> Industry </label> <select
													class="form-select form-control selet2Single "
													id="Industry" onchange="allChangeIndustry()">
													<option value="" selected>Select</option>
													<c:forEach items="${jobCategories}" var="categories">
														<option value="${categories.id}">${categories.name}</option>
													</c:forEach>
												</select>
												 <span class="errors" id="industry_error"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="department" class="required">Department
												</label> <select class="form-select form-control selet2Single"
													id="department" onchange="changejobrole('department_error')">
													<option value="" selected>Select</option>
													<c:forEach items="${department}" var="department">
														<option value="${department.id}">${department.name}</option>
													</c:forEach>
												</select>
												<span class="errors" id="department_error"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="role " class="required">Role </label> <select
													class="form-select form-control selet2Single" id="role" onchange="allChange('role_error')">
													<option value="" >Select</option>
												</select>
												<span class="errors" id="role_error"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-6">
													<div class="form-group">
														<label for="referencecode" class="required">Reference
															code</label> <input type="text" class="form-control"
															id="refercode" placeholder="Enter Reference code" onkeyup="allChange('refercode_error')">
														<span class="errors" id="refercode_error"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-6 mb-2">
													<div class="form-group">
														<label for="numberVacancies" class="required">Number
															of vacancies</label> <input type="text" class="form-control"
															id="numberVacancies"
															placeholder="Enter Number of vacancies" onkeyup="allChangeVacancy()">
														<span class="errors" id="noOfVacancy_error"></span>
													</div>
												</div>

											</div>
										</div>




										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="educationalQualification" class="required">Educational
													qualification </label> <select
													class="form-select form-control selet2Multiple"
													id="educationalQualification" multiple="multiple" onchange="allChange('educationalQualification_error')">
													<option value="" >Select</option>
													<c:forEach items="${education}" var="education">
														<option value="${education.id}">${education.name}</option>
													</c:forEach>
												</select>
												<span class="errors" id="educationalQualification_error"></span>
											</div>
										</div>





										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="jobdescription " class="required">Job
													description </label>
												<textarea class="jobDescription" name="jobDescription" id="jobDescription" onkeyup="allchangedescription(this)"></textarea>
												<small class="d-flex justify-content-end mt-2 text-black-50">Min
													char 200 and Max char 5000.</small>
												<span class="errors" id="jobDescription_error"></span>
											</div>
										</div>
										<!-- <div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group mb-0">
												<div class="form-check relocate">
													<input class="form-check-input" type="checkbox" value=""
														id="videoprofile"> <label class="form-check-label"
														for="videoprofile"> Request candidates for video
														profile </label>
												</div>
											</div>
										</div> -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<div class="form-check relocate">
													<input class="form-check-input" type="checkbox" value=""
														id="walkin" onchange="changeWalkIn()"> <label class="form-check-label"
														for="walkin"> Include walk-in details </label>
												</div>
											</div>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="includeWalk" id="includeWalk">
                        <div class="row">
                          <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="form-group mb-0">
                              <label for="WalkStartDate" class="required">Walk-in start date</label>
                              <input type="text" name="WalkStartDate" class="form-control" id="WalkStartDate"
                                placeholder=" " onchange="allChange('WalkStartDate_error')">
                               <span class="errors" id="WalkStartDate_error"></span>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="form-group mb-0">
                              <label for="WalkinTiming" class="required">Walk-in timing</label>
                              <input type="text" name="WalkinTiming" class="form-control" id="WalkinTiming"
                                placeholder=" " onkeyup="allChange('WalkinTiming_error')">
                               <span class="errors" id="WalkinTiming_error"></span>
                            </div>
                          </div>
                          <div class="col-lg-12">
                            <p class="walkInterview">
                            </p>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="form-group">
                              <label for="contactPerson" class="required">Contact person</label>
                              <input type="text" name="contactPerson" class="form-control" id="contactPerson"
                                placeholder="Recruiter name " onkeyup="allChange('contactPerson_error')">
                               <span class="errors" id="contactPerson_error"></span>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="form-group">
                              <label for="contactNumber" class="required">Contact number</label>
                              <input type="text" name="contactNumber" class="form-control" id="contactNumber"
                                placeholder="Add mobile number" onkeyup="allChange('contactNumber_error')">
                                <span class="errors" id="contactNumber_error"></span>
                            </div>
                          </div>
                          <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                              <label for="Venue" class="required">Venue</label>
                              <textarea name="Venue" class="form-control" id="Venue" value="" onkeyup="allChange('Venue_error')"> </textarea>
                               <span class="errors" id="Venue_error"></span>
                            </div>
                          </div>

                          <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="form-group">
                              <label for="googleMaps" class="required">Google Maps URL</label>
                              <input type="text" name="googleMaps" class="form-control" id="googleMaps"
                                placeholder="Google Maps URL of venue" onkeyup="allChange('googleMaps_error')">
                               <span class="errors" id="googleMaps_error"></span>
                            </div>
                          </div>

                        </div>
                      </div>
                    </div>

										<!-- <div class="col-lg-12 col-md-12 col-sm-12">
											<div class="question-group d-flex justify-content-between">
												<div>
													<h4>Question for Candidates</h4>
													<p>Choose up to 3 questions get information from the
														candidate.</p>
												</div>
												<button class="btns">+ Add a question</button>
											</div>
										</div> -->

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="question-group">
												<div class="form-group">
													<h4>Company Details</h4>
												</div>
												<div class="row">
													<div class="col-lg-12 col-md-12 col-sm-12">
														<div class="form-group">
															<label for="companyName" class="required">Company
																Name</label> <input type="text" class="form-control"
																id="companyName" value="Comunus Technologies" onkeyup="changeCompanyName()">
															 <span class="errors" id="companyName_error"></span>
														</div>
													</div>

													<div class="col-lg-12 col-md-12 col-sm-12">
														<div class="form-group">
															<label for="aboutCompany" class="required">About
																Company </label>
															<textarea class="form-control" id="aboutCompany"
																placeholder="Enter about company " onkeyup="allChange('aboutCompany_error')"> </textarea>
															<span class="errors" id="aboutCompany_error"></span>
														</div>
													</div>
													<div class="col-lg-12 col-md-12 col-sm-12">
														<div class="form-group">
															<label for="aboutCompany" class="required">Company
																Address </label>
															<p class="fw-medium" id="companyAddress">902, 9th Floor, Oriana Business
																Park, Road No.22, Wagle Estate, Thane, Mumbai,
																Maharashtra - 400604.</p>
														</div>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-12">
														<div class="form-group">
															<label for="Telephone" class="required">Telephone
															</label> <input type="text" class="form-control" id="Telephone"
																placeholder="Enter Telephone" onkeyup="changeTelephone()">
															<span class="errors" id="Telephone_error"></span>
														</div>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-12">
														<div class="form-group">
															<label for="emailId" class="required">Email Id </label> <input
																type="text" class="form-control" id="emailId"
																placeholder="Enter Email Id" onkeyup="changeEmailId()">
															<span class="errors" id="emailId_error"></span>
														</div>
													</div>


												</div>
											</div>
										</div>

										<div class="col-lg-12 d-flex justify-content-end">
											<button type="submit" class="btns-border">Save as
												draft</button>
											<button type="button" class="btns" onclick="savejobPost()">
												Post this job</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="col-xl-4 col-lg-4 col-md-4  ">
						<div class="card-register jd-preview-main">
							<h3>JD Preview</h3>
							<div class="card-registerinner ">
								<div class="jd-preview">
									<h4 id="jobTittleHeading"></h4>
									<h6 id="revireIndustry"></h6>
									<ul>
										<li><img src="employer/img/location.svg"><span id="reviewLocation"></span>
											 </li>
										<li><img src="employer/img/years.svg"><span id="minexp"></span>&nbsp;<span id="dash"></span>&nbsp;<span id="maxexp"></span></li>
									</ul>
									<ul>
								   <li><img src="employer/img/salary.svg"><span id="minsal"></span>&nbsp;<span id="dashSal"></span>&nbsp;<span id="maxsal"></span></li>
									</ul>
									<ul>
									 <li id="noOfPostition" style="margin-left:auto"></li>
									</ul>
								</div>
								<div class="jd-preview">
									<h4>Key Skills</h4>
									<div class="keySkillsDetails">
										<ul>
										</ul>
									</div>
								</div>

								<div class="jd-preview">
									<h4>Job Details</h4>
									<div class="jobDetails">
										<p id="descriptionjobDetails"></p>
									</div>

								</div>



								<div class="jd-preview">
									<h4>Recruiter Details</h4>
									<div class="recruiterDetails">
										<p id="reviewCompanyName"></p>
										<p id="reviewMailId"></p>
										<p id="reviewMobileNuumber"></p>
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

	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/moment.min.js"></script>
	 <script src="employer/js/daterangepicker.min.js"></script>
	
	<script src="employer/js/main.js"></script>
	<script src="employer/js/jobPost.js"></script>
	
	<script>
	  $(function () {
	      $('input[name="WalkStartDate"]').daterangepicker({
	    	  locale: {
	              format: 'DD/MM/YYYY' // Set the format to dd/mm/yyyy
	          },
	      });
	    });
	  
		$(document).ready(function() {
			$(".selet2Multiple").select2({
				placeholder : "Select"

			});
			$(".selet2Single").select2({});
		});
		$(document).ready(function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 1000);
		});
		
		$(document).ready(function () {
		    $('.jobDescription').richText();

		    $(document).on('keyup', '.richText-editor', function () {
		        allchangedescription(this);
		    });
		});

		$(document).ready(function() {
			$('input[name="salaryType"]').on('change', function() {
				$('.salaryTypehideshow').hide();
				$('#' + $(this).val()).show();
			});
		});
		var companyId="<%=companyId%>";
		var userId="<%=userId%>";
	</script>


</body>

</html>