<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String userId = (String) session.getAttribute("userId");
String companyId = (String) session.getAttribute("companyId");
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
<link href="employerviews/img/apple-touch-icon.png"
	rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="employer/css/bootstrap.min.css" rel="stylesheet">
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<!-- <link href="employer/css/font-awesome.min.css" rel="stylesheet"> -->
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/nice-select.css" rel="stylesheet">
<link href="employer/css/richtext.min.css" rel="stylesheet" />
<link href="employer/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet">

</head>

<body>
	<div class="loader" style="display: flex; !important">
		<img src="employer/img/loader.gif">
	</div>
	<!-- ======= Header ======= -->
	<%@include file="toaster.jsp"%>
	<%@include file="employerheader1.jsp"%>
	<!-- End Header -->
	<div class="advanced-search-bread">
		<div class="container">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12">
					<div class="advanced-search ">
						<ul class="search-criteria ">
							<li><strong> <img
									src="employer/img/advanced-search.svg">
									${TotalCandidates} candidates
							</strong> for</li>
							<li class="dropdown"><span id="valueSearchResult"></span>&nbsp;<a>View
									Details </a>
								<div class="dropdown-menu">
									<h5>Showing results for</h5>
									<div class="detail">
										<div class="item1">Key skills</div>
										<div class="item2">
											<span id="keySkillsSearch"></span>
										</div>
									</div>
									<div class="detail">
										<div class="item1">Experience</div>
										<div class="item2" id="experienceSearch"></div>
									</div>
									<div class="detail">
										<div class="item1">CTC</div>
										<div class="item2">
											<span id="ctcSearch"></span>
										</div>
									</div>
									<!-- <div class="detail">
										<div class="item1">Locations</div>
										<div class="item2">
											<span>Mumbai,</span> <span>Noida</span> <span>Gurugram</span>
										</div>
									</div> -->
									<div class="detail">
										<div class="item1">Location</div>
										<div class="item2">
											<span id="locationSearch"></span>
										</div>
									</div>
									<div class="detail">
										<div class="item1">Notice Period</div>
										<div class="item2">
											<span id="noticePeriodSearch"></span>
										</div>
									</div>

								</div></li>

						</ul>
						<div class="modifySearch ">
							<div class="">
								<button class="btn-blue-border" onclick="modifySearch()">
									Modify Search</button>
								<!-- <a href="/searchCandidates" class="btn-blue-border" onclick="modifySearch()">Modify
									Search</a> -->
							</div>
							<div class="">
								<button class="btn-blue-border" onclick="saveSearch()">Save
									Search</button>
							</div>
							<div class="">
								<button class="btn-blue-border" onclick="NewSearch()">
									New Search</button>
								<!-- <a href="/searchCandidates" class="btn-blue-border">
									New Search </a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<main id="main">
		<section class="section-inner advancedsearch-section ">
			<div class="container">
				<div class="row ">
					<div class="col-xl-3 col-lg-4 col-md-4  ">
						<div class="filters-actions">
							<div>
								<button class="btn filter-btn d-md-none">
									<svg xmlns="http://www.w3.org/2000/svg" class="mr-2"
										height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
                    <path d="M0 0h24v24H0V0z" fill="none" />
                    <path
											d="M3 18h6v-2H3v2zM3 6v2h18V6H3zm0 7h12v-2H3v2z" />
                  </svg>
									Filter
								</button>
							</div>

						</div>

						<div class="card-register filters-left ">
							<form autocomplete="off">
								<div class="card-content sidebar ">
									<div class="searchFilter sidebar__inner">
										<h4
											class="border-bottom filter-header d-flex justify-content-between d-md-none p-3 mb-0 align-items-center">
											<span> Search Filter</span> <span
												class="mr-2 filter-close-btn"> X </span>
										</h4>
										<h4 class=" d-none d-sm-block">
											<i class="bi bi-filter"></i> Filters
										</h4>

										<div class="accordion" id="accordionExample">

											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#keywordsOpen-collapse1"
														aria-expanded="false"
														aria-controls="keywordsOpen-collapse1">Keywords</button>
												</h2>
												<div id="keywordsOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="">
															<div class="form-group">
																<select class="form-select form-control selet2Multiple"
																	id="iTSkills" multiple="multiple" style="width: 100%">
																	<option value="">Select</option>
																	<c:forEach items="${keySkills}" var="skills">
																		<option value="${skills.id}">${skills.name}</option>
																	</c:forEach>
																</select>
																<!-- <span class="searchIcon"> <i class="bi bi-search"></i> -->
																</span>
															</div>
														</div>


													</div>
												</div>
											</div>

											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#departmentStayOpen-collapse2"
														aria-expanded="false"
														aria-controls="departmentStayOpen-collapse2">
														Experience (Years)</button>
												</h2>
												<div id="departmentStayOpen-collapse2"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="experience-container">
															<div class=" d-flex align-items-center">
																<select class="form-select form-control selet2Single"
																	id="filterMinExp" style="width: 100%">
																	<option value="">Select</option>
																	<c:forEach var="i" begin="1" end="40">
																		<option value="${i}">${i}</option>
																	</c:forEach>
																</select>
																<!-- <input type="text" class="form-control" id="minAge"
																	placeholder="Enter Min"> -->
																<p class="txtlgrey mb-0 ms-2 me-2">To</p>
																<!-- <input type="text" class="form-control" id="maxAge"
																	placeholder="Enter Max"> -->
																<select class="form-select form-control selet2Single"
																	id="filterMaxExp" style="width: 100%">
																	<option value="">Select</option>
																	<c:forEach var="i" begin="1" end="40">
																		<option value="${i}">${i}</option>
																	</c:forEach>
																</select>
															</div>

														</div>
													</div>
												</div>
											</div>

											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#departmentStayOpen-collapse3"
														aria-expanded="false"
														aria-controls="departmentStayOpen-collapse3">
														Location</button>
												</h2>
												<div id="departmentStayOpen-collapse3"
													class="accordion-collapse collapse">

													<div class="accordion-body">
														<select class="form-select form-control selet2Multiple"
															id="filterLocation" multiple="multiple">
															<option value="">Select</option>
															<c:forEach items="${Location}" var="location">
																<option value="${location.id}">${location.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#departmentStayOpen-collapse6"
														aria-expanded="false"
														aria-controls="departmentStayOpen-collapse6">
														Salary (INR-Lacs)</button>
												</h2>
												<div id="departmentStayOpen-collapse6"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class=" d-flex align-items-center">
															<select class="form-select form-control selet2Single"
																id="filtersearchMinSalary" style="width: 100%">
																<option value="">Min</option>
																<!-- <option value="50000">50,000</option>
																<option value="60000">60,000</option>
																<option value="70000">70,000</option>
																<option value="80000">80,000</option>
																<option value="90000">90,000</option> -->
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
															<p class="txtlgrey mb-0 ms-2 me-2">To</p>
															<select class="form-select form-control selet2Single "
																id="filtersalaryFigureMax" style="width: 100%">
																<option value="">Max</option>
																<!-- <option value="50000">50,000</option>
																<option value="60000">60,000</option>
																<option value="70000">70,000</option>
																<option value="80000">80,000</option>
																<option value="90000">90,000</option> -->
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
														</div>

													</div>
												</div>
											</div>

											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#departmentStayOpen-collapse4"
														aria-expanded="false"
														aria-controls="departmentStayOpen-collapse4">
														Gender</button>
												</h2>
												<div id="departmentStayOpen-collapse4"
													class="accordion-collapse collapse">

													<div class="accordion-body">
														<div class="form-check">
															<input class="form-check-input" type="radio" value=""
																id="workfromoffice" name="workmode"> <label
																class="form-check-label" for="workfromoffice">
																All </label>
														</div>

														<div class="form-check">
															<input class="form-check-input" type="radio" value="male"
																name="workmode" id="hybrid"> <label
																class="form-check-label" for="hybrid"> male </label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																value="female" id="remote" name="workmode"> <label
																class="form-check-label" for="remote"> female </label>
														</div>
													</div>
												</div>
											</div>
											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#companyOpen-collapse1"
														aria-expanded="false"
														aria-controls="companyOpen-collapse1">Company</button>
												</h2>
												<div id="companyOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="">
															<div class="form-group">
																<select class="form-select form-control selet2Single"
																	id="company" style="width: 100%">
																	<option value="">Select</option>
																	<c:forEach items="${companylist}" var="company">
																		<option value="${company.id}">${company.name}</option>
																	</c:forEach>
																</select>
																<!-- <span class="searchIcon"> <i class="bi bi-search"></i> -->
																</span>
															</div>
														</div>


													</div>
												</div>
											</div>
											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#noticeperiodOpen-collapse1"
														aria-expanded="false"
														aria-controls="noticeperiodOpen-collapse1">Notice
														Period</button>
												</h2>
												<div id="noticeperiodOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<!-- <div class="form-check">
															<input class="form-check-input" type="radio" value=""
																id="anyNotice" name="noticePeriod"> <label
																class="form-check-label" for="anyNotice"> Any </label>
														</div> -->

														<div class="form-check">
															<input class="form-check-input" type="checkbox" value="15"
																name="noticeperiod" id="15noticeperiod"> <label
																class="form-check-label" for="15noticeperiod"> 0
																- 15 days </label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value="30"
																id="30noticeperiod" name="noticeperiod"> <label
																class="form-check-label" for="30noticeperiod"> 1
																month </label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value="60"
																id="60noticeperiod" name="noticeperiod"> <label
																class="form-check-label" for="60noticeperiod"> 2
																month </label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value="90"
																id="90noticeperiod" name="noticeperiod"> <label
																class="form-check-label" for="90noticeperiod"> 3
																month </label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value="365"
																id="365noticeperiod" name="noticeperiod"> <label
																class="form-check-label" for="365noticeperiod">
																Currently Serving Notice Period </label>
														</div>
													</div>
												</div>
											</div>
											<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#highestQualifcationOpen-collapse1"
														aria-expanded="false"
														aria-controls="highestQualifcationOpen-collapse1">Highest
														Qualification</button>
												</h2>
												<div id="highestQualifcationOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="form-check">
															<input class="form-check-input" type="radio" value="phd"
																id="phdhighestqualification" name="highestqualification"
																onchange="onChangeHighestQualification()"> <label
																class="form-check-label" for="phdhighestqualification">
																Doctorate/PHD </label>
														</div>

														<div class="form-check">
															<input class="form-check-input" type="radio"
																value="degree" name="highestqualification"
																id="graduationhighestqualification"
																onchange="onChangeHighestQualification()"> <label
																class="form-check-label" for="15noticeperiod">
																Graduation/Diploma </label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																value="master" id="masterhighestqualification"
																name="highestqualification"
																onchange="onChangeHighestQualification()"> <label
																class="form-check-label" for="30noticeperiod">
																Masters/Post Graduate </label>
														</div>
													</div>
												</div>
											</div>
											<div class="accordion-item" id="courseAccordian">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#CourseOpen-collapse1"
														aria-expanded="false"
														aria-controls="highestQualifcationOpen-collapse1">Course</button>
												</h2>
												<div id="CourseOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="">
															<div class="form-group">
																<select class="form-select form-control selet2Single"
																	id="course" style="width: 100%" name="coursename"
																	onchange="getSpecialization()">
																	<option value="">Select</option>
																</select>
																<!-- <span class="searchIcon"> <i class="bi bi-search"></i> -->
																</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="accordion-item" id="specializationAccordian">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#SpecializationOpen-collapse1"
														aria-expanded="false"
														aria-controls="SpecializationOpen-collapse1">Specialization</button>
												</h2>
												<div id="SpecializationOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="">
															<div class="form-group">
																<select class="form-select form-control selet2Single"
																	id="specialization" name="specializationname"
																	style="width: 100%">
																	<option value="">Select</option>
																</select>
																<!-- <span class="searchIcon"> <i class="bi bi-search"></i> -->
																</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="accordion-item" id="courseTypeAccordian">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#courseTypeOpen-collapse1"
														aria-expanded="false"
														aria-controls="courseTypeOpen-collapse1">Course
														Type</button>
												</h2>
												<div id="courseTypeOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="form-check">
															<input class="form-check-input" type="radio"
																value="fullTime" id="fulltime" name="courseType"
																onchange="getcoursetypestatus()"> <label
																class="form-check-label" for="fulltime"> Full
																Time </label>
														</div>

														<div class="form-check">
															<input class="form-check-input" type="radio"
																value="partTime" name="courseType" id="partime"
																onchange="getcoursetypestatus()"> <label
																class="form-check-label" for="courseType"> Part
																Time </label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																value="DistanceLearning" id="distancelearning"
																onchange="getcoursetypestatus()" name="courseType">
															<label class="form-check-label" for="distancelearning">
																Distance Learning </label>
														</div>
													</div>
												</div>
											</div>
											<div class="accordion-item" id="universityAccordian">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#universityOpen-collapse1"
														aria-expanded="false"
														aria-controls="courseTypeOpen-collapse1">University</button>
												</h2>
												<div id="universityOpen-collapse1"
													class="accordion-collapse collapse">
													<div class="accordion-body">
														<div class="">
															<div class="form-group">
																<select class="form-select form-control selet2Single"
																	id="university" style="width: 100%"
																	name="institutename">
																	<option value="">Select</option>
																	<c:forEach items="${insitiute}" var="university">
																		<option value="${university.id}">${university.name}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>


											<!-- 			<div class="accordion-item">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#departmentStayOpen-collapse5"
														aria-expanded="false"
														aria-controls="departmentStayOpen-collapse5">
														Work Type</button>
												</h2>
												<div id="departmentStayOpen-collapse5"
													class="accordion-collapse collapse">

													<div class="accordion-body">
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value="FULLTIME" name="worktype"
																id="fullTime"> <label class="form-check-label"
																for="fullTime"> Full time </label>
														</div>

														<div class="form-check">
															<input class="form-check-input" type="checkbox" value="PARTTIME"  name="worktype"
																id="partTime"> <label class="form-check-label"
																for="partTime"> Part time </label>
														</div>

													</div>
												</div>
											</div> -->
											<div class="col-lg-12 col-md-12 col-sm-12 mb-3">
												<div class="form-group d-flex justify-content-end nextback">
													<button type="button" class="btns" id="filtersubmit"
														style="margin-right: 30%"
														onclick="submitSearchCandidate()">Submit</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="col-xl-9 col-lg-8 col-md-8">
						<div class="activein mb-3">
							<div class="d-flex align-items-center">
								<div class="col-auto">
									<label class="col-form-label">Active In</label>
								</div>
								<div class="col-auto">
									<select class="formselect" id="activein" name="lastactivein">
										<option value="">All resumes</option>
										<option value="1">1 day</option>
										<option value="3">3 days</option>
										<option value="7">7 days</option>
										<option value="15">15 days</option>
										<option value="30">30 days</option>
										<option value="60">2 months</option>
									</select>
								</div>
							</div>
							<!-- -- shahrukh -->
							<div class="similardetail d-flex justify-content-between">
								<span> <a href="" data-bs-toggle="modal"
									data-bs-target="#gstin-add" title="Similar Profiles">Add
										Candidate</a></span>
							</div>
							<!-- -- shahrukh -->
							<div class="d-flex align-items-center">
								<!-- <div class="d-flex align-items-center  me-3">
									<div class="col-auto">
										<label class="col-form-label">Sort by: </label>
									</div>
									<div class="col-auto">
										<select class="formselect" id="activein">
											<option value="freshness">Freshness</option>
											<option value="lastactivedate">Last active date</option>
											<option value="relevance" selected>Relevance</option>
											<option value="emailoptimized">Email optimized</option>
										</select>
									</div>
								</div> -->

								<!-- <div class="d-flex align-items-center me-2">
									<label class="col-form-label">Show</label>
									<div>
										<select class="formselect" id="activein">
											<option selected>All</option>
											<option value="20">20</option>
											<option value="30">30</option>
											<option value="40">40</option>
											<option value="50">50</option>
											<option value="60">60</option>
											<option value="80">80</option>
											<option value="100">100</option>
											<option value="150">150</option>
											<option value="200">200</option>
										</select>
									</div>
								</div> -->
							</div>
						</div>

						<div class="selectAll">
							<div class="card-listinner">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="selectall"> <label class="form-check-label"
										for="selectall"> Select All </label>

								</div>
							</div>
						</div>
						<div class="advancedsearch-list">
							<c:forEach items="${resultData}" var="item">
								<div class="card-list-box">
									<div class="card-listinner">
										<div class="card-search">
											<div class="searchprfile">
												<div class="form-check">
													<input class="form-check-input selectedId" type="checkbox"
														value="" id="selectbox">
												</div>
												<div class="profileImg">
													<c:choose>
														<c:when test="${not empty item.searchImage}">
															<img src="data:image/jpeg;base64,${item.searchImage}"
																alt="searchImage">
														</c:when>
														<c:otherwise>
															<img src="/employer/img/profile-img.jpg">
														</c:otherwise>
													</c:choose>
												</div>
												<div class="profilTxt">
													<h4>
														<a href="#"
															onclick="isPhoneNumber(${item.searchId},'name','name')">${item.searchName}
														</a> <span class="check1"> <c:if
																test="${item.tickMark eq '1'}">
																<img src="employer/img/check.svg">
															</c:if>
														</span>
													</h4>
													<%-- <h4>
														<span>${item.searchName}</span>
													</h4> --%>
													<!-- <h5>Frontend Angular developer</h5> -->
													<ul>
														<li><img src="employer/img/location.svg">
															${item.searchCurrentLocation}&nbsp;</li>
														<li><img src="employer/img/years.svg"><%-- ${item.searchMinExp} - --%>
															${item.searchMaxExp}</li>
														<li><img src="employer/img/salary.svg"><%-- ${item.searchMinSal} - --%>
															 ${item.searchMaxSal}</li>
													</ul>
												</div>
											</div>


											<div class="share-list">
												<ul>
													<!-- <li data-bs-toggle="tooltip" data-bs-placement="top"
														data-bs-custom-class="custom-tooltip"
														data-bs-title="Forward"><a href="#"
														data-bs-toggle="modal" data-bs-target="#forwardCVModal">
															<i class="bi bi-envelope"></i>
													</a></li> -->
													<li data-bs-toggle="tooltip" data-bs-placement="top"
														data-bs-custom-class="custom-tooltip"
														data-bs-title="Add to" data-id="${item.searchId}"><a
														href="#" data-bs-toggle="modal"> <i
															class="bi bi-folder2"
															onclick="handleClick('${item.searchId}')"></i></a></li>
													<!-- <li data-bs-toggle="tooltip" data-bs-placement="top"
														data-bs-custom-class="custom-tooltip"
														data-bs-title="Set reminder"><a href=""> <i
															class="bi bi-clock"></i></a></li> -->
												</ul>

											</div>


										</div>
										<div class="line2"></div>
										<div class="candidate-details">
											<div class="row">
												<div class="col-lg-9 col-md-8 col-sm-12 col-12">
													<!-- <div class="detail">
														<div class="item1">Current</div>
														<div class="item2">Software Engineer at MPS Limited</div>
													</div> -->
													<div class="detail">
														<div class="item1">Education</div>
														<div class="item2">
															<span>${item.searchCourse}</span> <span>${item.searchUniversity}</span>
															<span>${item.searchEndYearOfCourse}</span>
														</div>
													</div>
													<div class="detail">
														<div class="item1">Pref. locations</div>
														<div class="item2">
															<span>${item.searchPreferedLocation}</span>
															<!-- <span> <a href="#">+3 more </a></span> -->
														</div>
													</div>
													<div class="detail">
														<div class="item1">Key skills</div>
														<div class="item2">
															<span id="keySkills">${item.searchKeySkills}</span>
															<!-- <span> <span> <a href="#">+3 more </a></span> </span> -->

														</div>
													</div>

													<!-- <div class="detail">
														<div class="item1">May also know</div>
														<div class="item2">
															<span> <span class="highlight">Angular
																	Development </span> <span class="pipe"> | </span>
															</span> <span> <span>Frontend Developm...</span>
															</span>


														</div>
													</div> -->
												</div>

												<div class="col-lg-3 col-md-4 col-sm-12 col-12">
													<div class="viewphone">
														<button class="btnphone"
															onclick="isPhoneNumber(${item.searchId},'phoneNumber_${item.searchId}','viewPhoneNumber__${item.searchId}')">
															<i class="bi bi-eye"></i> <span
																id="viewPhoneNumber__${item.searchId}"
																class="viewphones"></span>
														</button>
														<p>
															Verified <span> email </span>
														</p>
														<span id="phoneNumber_${item.searchId}"
															class="hidephoneno">${item.searchMobileNumber}</span>
														<!-- <button class="btnphone">
															<i class="bi bi-telephone"></i> Call candidate
														</button> -->
													</div>
												</div>
											</div>
											<div class="line2"></div>
											<div class="similardetail d-flex justify-content-between">
												<span> <a href="#" target="_blank"
													title="Similar Profiles"></a></span>   <%-- ${item.searchSimilarProfiles } --%>
												<div class="">
													<!-- <span> <a href="#" title="Comment"> Comment</a></span> -->
													 <span>
                          <a data-bs-toggle="collapse" href="#viewComment" role="button" aria-expanded="false"
                            aria-controls="viewComment">Comment</a></span>
													<!-- <span
														class="pipe"> | </span> <span> <a href="#"
														data-bs-toggle="tooltip" data-bs-placement="top"
														data-bs-custom-class="custom-tooltip"
														data-bs-title="Save the profile to view it later"
														title="Save"> <i class="bi bi-bookmark"></i> Save
													</a></span> -->
												</div>
											</div>
											  <div class="collapse" id="viewComment">
                      <div class="card card-body viewCommentbody mt-3">
                        <div class="row">
                          <div class="col-lg-9 col-md-9 col-sm-12">
                            <div class="form-group addcommentfrom">
                              <label for="addcomment" class="form-label">Comment</label>
                              <textarea id="addcomment" class="form-control" rows="2"> </textarea>
                            </div>
                          </div>
                          <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="addsubmitcom">
                              <button type="submit" class="btn-blue ">Add Comment</button>
                            </div>
                          </div>
                        </div>

                        <div class="viewComment">
                          <div class="profile-img">
                            <img src="employer/img/profile-img.jpg">
                          </div>
                          <div class="">
                            <p> Current location Matching</p>
                            <p class="date"> 24-Feb-2025 06:30pm</p>
                          </div>
                        </div>

                        <div class="viewComment">
                          <div class="profile-img">
                            <img src="employer/img/profile-img.jpg">
                          </div>
                          <div class="">
                            <p>Interested</p>
                            <p class="date"> 24-Feb-2025 04:30pm</p>
                          </div>
                        </div>


                      </div>
                    </div>
										</div>
									</div>
									<div class="download-list">
										<ul>
											<li><i class="bi bi-eye"></i>${item.viewCount}</li>
											<li><i class="bi bi-download"></i>${item.downloadCount}</li>
											<!-- <li><i class="bi bi-paperclip"></i>CV</li> -->
										</ul>
										<ul>
											<!-- <li>Modified in last: 12 Oct 2024</li> -->
											<li>Active in last: ${item.lastActive}</li>
										</ul>

									</div>
								</div>
							</c:forEach>
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

	<!-- employmentAddModal   -->
	<div class="modal fade" id="forwardCVModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Forward
						CV</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body   pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="from" class="required">From</label> <input
									type="text" name="from" id="from" class="form-control"
									placeholder="" value="mahi@comunus.in">

							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="to" class="required">To</label> <input type="text"
									name="to" id="to" class="form-control" placeholder="">

							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="subject">Subject </label> <input type="text"
									name="to" id="subject" class="form-control" placeholder=" ">

							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="message" class="form-label">Message</label>
								<textarea id="message" class="form-control" rows="3"> </textarea>

							</div>
						</div>

						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-check ms-2">
								<input class="form-check-input" type="checkbox" value=""
									id="sendResume"> <label class="form-check-label"
									for="sendResume"> Send Resume as an attachment </label>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn-blue">Forward</button>
				</div>
			</div>
		</div>
	</div>


	<!-- createFolderModal   -->
	<div class="modal fade" id="addToModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Add to
						Folder</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">

					<div id="createnewfolder1">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<div class="d-flex justify-content-between">
										<label for="addExistingfolder" class="required">Add to
											existing folder</label> <span><a href="#" id="createNew">
												<strong>Create new</strong>
										</a></span>
									</div>
									<select class="form-select form-control selet2Single"
										id="addExistingfolder" style="width: 100%;">
										<option value="" selected>Select</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div id="addExistingfolder1" style="display: none;">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<div class="d-flex justify-content-between">
										<label for="createnewfolder" class="required">Create
											new folder </label> <span><a href="#" id="addexisting1"><strong>
													Add to existing </strong> </a></span>
									</div>
									<input type="text" name="createnewfolder" id="createnewfolder"
										class="form-control" placeholder="Enter folder name">
								</div>
							</div>
							<!-- <div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label for="sharewithusers" class="required">Share with
										users</label> <select class="form-select form-control selet2Multiple"
										id="sharewithusers" multiple="multiple" style="width: 100%;">
										<option value="" disabled>Select</option>
										<option value="mahi@comunus.in">mahi@comunus.in</option>
										<option value="sagar@comunus.in">mahi@comunus.in</option>
									</select>
								</div>
							</div> -->
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn-blue" id="isSubmit"
						onclick="isCreateOrExisting()"></button>
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
	<script src="employer/js/resultSearchCandidate.js"></script>
	<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    $('.datepicker').datepicker({
      format: 'dd/mm/yyyy',
      autoclose: true,
    });

    $(document).ready(function () {
      $(".selet2Multiple").select2({
        placeholder: "Select"
      });
      $(".selet2Single").select2({
        placeholder: "Select"
      });
    });
    $(document).ready(function () {
      $('select').niceSelect();
    });

    $(document).ready(function () {
      $("#addExistingfolder").select2({
        dropdownParent: $("#addToModal")
      });

      $("#sharewithusers").select2({
        dropdownParent: $("#addToModal")
      });
      filtersValidation();

    });

    $(document).ready(function () {
      setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);
    });
    $(document).ready(function () {
    	
    	const modal = document.getElementById('createnewfolder1');
    	if (modal.classList.contains('show')) {
    		 $('#isSubmit').text("Create");
    	} else {
    		 $('#isSubmit').text("Submit");
    	}
      });

    $(document).ready(function () {
      $('#selectall').click(function () {
        $('.selectedId').prop('checked', this.checked);
      });

      $('.selectedId').change(function () {
        var check = ($('.selectedId').filter(":checked").length == $('.selectedId').length);
        $('#selectall').prop("checked", check);
      });

      $("#createNew").click(function () {
        $("#createnewfolder1").hide();
        $("#addExistingfolder1").show();
        $('#isSubmit').text("Create");
      });
      $("#addexisting1").click(function () {
        $("#createnewfolder1").show();
        $('#isSubmit').text("Submit");
        $("#addExistingfolder1").hide();
      });
      
      let keySkills = $("#iTSkills option:selected").map(function() {
    	    return $(this).text(); // Get the text of the selected options
    	}).get();
        document.getElementById('keySkillsSearch').innerText = keySkills || '';
        document.getElementById('valueSearchResult').innerText = keySkills || '';
        let Exp=sessionStorage.getItem('Experience');
        let minExp=$("#filterMinExp").val();
        let maxExp=$("#filterMaxExp").val();
        if(minExp === "" || maxExp === "")
    		{
      	  document.getElementById('experienceSearch').innerText = '';
    		}else
    		{
    			 document.getElementById('experienceSearch').innerText = minExp+" - "+maxExp+" years";
    		}
      
        let minctc= $("#filtersearchMinSalary option:selected").text();
        let maxctc=$("#filtersalaryFigureMax option:selected").text();
        if(minctc === "" ||  maxctc === "")
      	{
      	  document.getElementById('ctcSearch').innerText = '';
      	}else
      	{
      		 document.getElementById('ctcSearch').innerText = minctc+" - "+maxctc;
      	}
        let location = $("#filterLocation option:selected").map(function() {
      	    return $(this).text(); // Get the text of each selected option
      	}).get().join(", ");
        document.getElementById('locationSearch').innerText = location || '';
        
        let noticePeriod=sessionStorage.getItem('saveSearchNoticePeriod');
        if(noticePeriod === null || noticePeriod === "null")
      	{
      	  document.getElementById('noticePeriodSearch').innerText="";
      	}else
      	{
      		document.getElementById('noticePeriodSearch').innerText=noticePeriod+" days" || '';
      	}
      
      $('#phoneNumber').hide();
      $('#viewPhoneNumber').text("View phone number");
      $('.hidephoneno').hide();
      $('.viewphones').text("View phone number");
    });

  </script>


	<script>
    // if < then 768
    // mobile sorting overlay jquery start
    const mediaQuerymobile = window.matchMedia("(max-width: 767px)");

    if (mediaQuerymobile.matches) {
      $(".sort-drop").on("show.bs.dropdown", function () {
        $(".overlay").show();
      });
      $(".sort-drop").on("hide.bs.dropdown", function () {
        $(".overlay").hide();
      });
    }
    //  mobile sorting overlay jquery end

    // mobile filter jquery start

    $(".filter-btn").click(function () {
      $(".sidebar").addClass("open");
      $("body").addClass("overflow-hidden vh-100");
    });
    $(".filter-close-btn").click(function () {
      $(".sidebar").removeClass("open");
      $("body").removeClass("overflow-hidden vh-100");
    });
    // mobile filter jquery end

    // sidebar sticky
    const mediaQuerySM = window.matchMedia('(min-width: 768px)')
    // if > then = to 768
    if (mediaQuerySM.matches) {
      // sidebar sticky function
      var sidebar = new StickySidebar('.sidebar',
        {
          topSpacing: 80,
          bottomSpacing: 20,
          containerSelector: '.main-content',
          innerWrapperSelector: '.sidebar__inner'
        });
    }
    
    
  </script>
	<div class="modal fade" id="gstin-add" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Candidates</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="Industry" class="form-label required">Email
								</label> <input type="text" name="email" id="Industry"
									class="form-control" placeholder="Enter Email/Phone no">
							</div>
							<!-- <div class="form-group">
                <label for="Industry" class="form-label required">Phone No </label>
                <input type="text" name="email" id="sec_phone" class="form-control" placeholder="Enter Email/Phone no">
              </div> -->
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button"
						onclick="search(document.getElementById('Industry').value)"
						class="btns">Submit</button>
				</div>

			</div>
		</div>
	</div>

</body>
<script>
var companyId="<%=companyId%>";
var userId="<%=userId%>";
</script>

</html>