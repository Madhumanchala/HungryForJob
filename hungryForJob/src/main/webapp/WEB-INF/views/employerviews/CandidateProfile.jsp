<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Hungry for Job</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<link href="/employer/img/favicon.png" rel="icon">
<link href="/employer/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="/employer/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/employer/css/select2.min.css" rel="stylesheet" />
<link href="/employer/css/richtext.min.css" rel="stylesheet" />
<link href="/employer/css/daterangepicker.css" rel="stylesheet" />
<link href="/employer/css/style.css" rel="stylesheet">

</head>

<body class="bg">
	<!-- <div class="loader">
		<img src="img/loader.gif">
	</div> -->
	<!-- ======= Header ======= -->
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="/employer/img/logo.svg" alt="">
			</a>
			<nav id="navbar" class="navbar">
				<ul>
					<!-- <li><a class="getstarted" href="#">Candidate Login</a></li>
					<li><a class="getstarted" href="#">Employer Login</a></li> -->
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->

	<main id="main" class="maincontent">
		<nav aria-label="breadcrumb" class="breadcrumb profile-breadcrumb">
			<div class="bgtop"></div>
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a> <img
							src="/employer/img/advanced-search.svg"> Advanced Search
					</a></li>
					<!-- <li class="breadcrumb-item"><a href="#">105 Profiles found</a></li> -->
					<li class="breadcrumb-item active" aria-current="page">
						${personalDetails.fullName}</li>
				</ol>
			</div>
		</nav>
		<section class="search-profile-details pt-0  ">
			<div class="container">
				<div class="row">
					<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-12">
						<div class="card-profile-box">
							<div class="card-listinner">
								<div class="card-search">
									<div class="searchprfile">
										<div class="profileImg">
											<c:choose>
												<c:when test="${not empty careerDetails.base64ProfileImage}">
													<img
														src="data:image/jpeg;base64,${careerDetails.base64ProfileImage}"
														alt="Profile Image">
												</c:when>
												<c:otherwise>
													<img src="/employer/img/profile-img.jpg">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="profilTxt">
											<h4>
												<a> ${personalDetails.fullName} </a>
											</h4>
											<h5>Frontend Angular developer</h5>
											<ul>
												<li><img src="/employer/img/years.svg">${careerDetails.totalExperience}
													Years</li>
												<li><img src="/employer/img/salary.svg">₹
													${careerDetails.currentCtc}(expects:
													${careerDetails.expectedCtc})</li>
												<li><img src="/employer/img/location.svg">
													${careerDetails.city}</li>
											</ul>
										</div>
									</div>
									<div class="similardetail ">
										<ul>
											<!-- <li><span> <a href="#" title="Save"> <i
														class="bi bi-bookmark"></i> Save
												</a></span></li> -->
										</ul>
										<div class="cvDownload" onclick="downloadResume()">
											<button class="btnphone cvbtn">
												<i class="bi bi-download"></i> Download CV
											</button>
										</div>
									</div>
								</div>
								<div class="line2"></div>
								<div class="candidate-details">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="detail">
												<div class="item1">Current</div>
												<div class="item2">Software Engineer at MPS Limited</div>
											</div>
											<div class="detail">
												<div class="item1">Highest degree</div>
												<div class="item2">
													<span>${educationDetails.specialization}</span> <span>${educationDetails.institute}
													</span> <span>${educationDetails.endYear}</span>
												</div>
											</div>
											<div class="detail">
												<div class="item1">Pref. locations</div>
												<div class="item2">
													<c:forEach items="${preferedLocation}" var="loc"
														varStatus="status">
														<c:set var="myVar"
															value="${status.first ? '' : myVar} ${loc.name} ${status.last ? '' : ','}" />
													</c:forEach>
													${myVar}
													<!-- <span> <a href="#">+3 more </a></span> -->
												</div>
											</div>

											<%-- <div class="viewphone d-flex align-items-center">
												<button class="btnphone">
													${personalDetails.mobileNumber}
												</button>
												<button class="btnphone">
													<i class="bi bi-telephone"></i> Call candidate
												</button>
												<p class="mb-0">
													Verified <span> phone </span> & <span> email </span>
												</p>
											</div> --%>

											<div class="emailId">
												<p>
													<i class="bi bi-envelope"></i>
													${personalDetails.emailInput}
												</p>
											</div>

										</div>
									</div>

								</div>
							</div>
							<div class="download-list">
								<ul>
									<li><i class="bi bi-eye"></i>
										${careerDetails.candidateViews }</li>
									<li><i class="bi bi-download"></i>${careerDetails.candidateDownload}</li>
									<!-- <li><i class="bi bi-paperclip"></i>CV</li> -->
								</ul>
								<ul>
									<!-- <li>Modified in last: 12 Oct 2024</li> -->
									<li>Active in last: ${careerDetails.lastActive}</li>
								</ul>
							</div>
						</div>
						<div class="jobdetails-content mt-4">
							<div class="navtabs">
								<div class="nav nav-pills" id="nav-tab" role="tablist">
									<button class="nav-link active" id="nav-profile-tab"
										data-bs-toggle="tab" data-bs-target="#nav-profile"
										type="button" role="tab" aria-controls="nav-profile"
										aria-selected="true">
										<i class="bi bi-person-fill"></i> Profile detail
									</button>
									<button class="nav-link" id="nav-profile-tab"
										data-bs-toggle="tab" data-bs-target="#nav-attached"
										type="button" role="tab" aria-controls="nav-attached"
										aria-selected="false">
										<i class="bi bi-paperclip"></i> Attached CV
									</button>

								</div>
							</div>
						</div>

						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade active show" id="nav-profile"
								role="tabpanel" aria-labelledby="nav-profile-tab">
								<div class="jobdetails-content">
									<h3>Key skills</h3>
									<div class="keySkills mt-4">
										<div class="addEmployment">
											<div class="row">
												<div class="col-lg-4 col-md-6 col-sm-6 col-6">
													<h5>Skills</h5>
												</div>
												<div class="col-lg-7 col-md-4 col-sm-3 col-3">
													<h5>Experience</h5>
												</div>
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
															<div></div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>

									</div>
								</div>

								<div class="jobdetails-content">
									<h3>Work summary</h3>
									<p>${careerDetails.resumeheadline}</p>
									<!-- <div class="candidate-details">

								<div class="detail">
									<div class="item1">Industry</div>
									<div class="item2">Software Product</div>
								</div>
								<div class="detail">
									<div class="item1">Department</div>
									<div class="item2">Engineering - Software & QA</div>
								</div>
								<div class="detail">
									<div class="item1">Role</div>
									<div class="item2">Front End Developer</div>
								</div>
							</div> -->
								</div>


								<div class="jobdetails-content">
									<h3 class="mb-3">Education</h3>
									<div class="education-details">
										<div class="edImg">
											<img src="/employer/img/ed.jpg">
										</div>
										<div class="edTxt">
											<h4>
												${educationDetails.specialization},${educationDetails.institute},${educationDetails.endYear}
												<span> Fulltime </span>
											</h4>
											<!-- <h5>
										Frontend Angular developer <span>| 1 Year 2 Months | </span> <span>
											Oct 2021, Dec 2022 </span>
									</h5> -->
										</div>
									</div>

								</div>

								<div class="jobdetails-content">
									<h3>Profile detail</h3>
									<div class="mt-3">
										<div class="content-txt">
											<div class="row">
												<div class="col-lg-4 col-md-6 col-sm-6 ">
													<p>Name</p>
													<h5>${personalDetails.fullName}</h5>
												</div>

												<div class="col-lg-4 col-md-6 col-sm-6 ">
													<p>Mobile No</p>
													<h5>${personalDetails.mobileNumber}</h5>
												</div>

												<div class="col-lg-4 col-md-6 col-sm-6 ">
													<p>Email Address</p>
													<h5>${personalDetails.emailInput}</h5>
												</div>
												<div class="col-lg-4 col-md-6 col-sm-6 ">
													<p>Work Status</p>
													<h5>${personalDetails.work_status}</h5>
												</div>
												<div class="col-lg-4 col-md-6 col-sm-6">
													<p>State</p>
													<h5 id="stateFetch">${careerDetails.state}</h5>
												</div>
												<div class="col-lg-4 col-md-6 col-sm-6">
													<p>Current Location</p>
													<h5 id="cityLocation">${careerDetails.city}</h5>
												</div>

											</div>
										</div>
									</div>
								</div>

								<div class="jobdetails-content">
									<h3>Career Details</h3>
									<div class="mt-3">
										<div class="content-txt">
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
													<p>Preferred Location</p>
													<div class="row">
														<c:forEach items="${preferedLocation}" var="loc"
															varStatus="status">
															<c:set var="myVar"
																value="${status.first ? '' : myVar} ${loc.name} ${status.last ? '' : ','}" />
														</c:forEach>
														<h5 id="preferedlocation">${myVar}</h5>
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
							<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
								<div class="featuredJoblist search-similar-profile  ">
									<!-- <div class="row">
								<div class="col-xl-12 col-lg-12 col-md-12 ">
									<h4>161 similar profiles</h4>
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 ">
									<div class="listbox">
										<div class="d-flex ">
											<div class="company-logo">
												<img src="/employer/img/nikitis-Infocom.png">
											</div>
											<div class="company-details">
												<a href="">
													<h4>UI/UX Designer</h4>
													<p>Nikitis Infocom</p>
												</a>
											</div>
										</div>
										<div class="list-price">
											<ul>
												<li><img src="/employer/img/year.svg"> 1-3 years
												</li>
												<li><img src="/employer/img/inr.svg"> 4-8 Lacs</li>
											</ul>
											<ul class="mt-1">
												<li><img src="/employer/img/map.svg"> Mumbai</li>
											</ul>
										</div>
										<p>
											<span>Angular,</span> <span>HTML,</span><span>CSS, </span> <span>HTML5,</span><span>CSS3,
											</span><span>Javascript, </span> <span>JSON, </span> <span>Rest,
											</span> <span>Web Services, </span>
										</p>
										<div class="daytxt">
											<ul>
												<li><i class="bi bi-paperclip"></i>CV</li>
												<li>2 Days Ago</li>
											</ul>
										</div>
									</div>
								</div>

							</div> -->
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="nav-attached" role="tabpanel"
							aria-labelledby="nav-attached-tab">
							<!-- <iframe src="img/cv.pdf" width="100%" height="600px" style="border:none"></iframe> 
				<object data="img/cv.pdf" type="application/pdf" width="100%" height="100%"> </object>-->
							<object type="application/pdf" width="100%" height="600px"
								data="data:application/pdf;base64,${careerDetails.cvDetails}"></object>
						</div>
					</div>

				</div>
			</div>

		</section>
	</main>
	<!-- End #main -->
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

	<script src="/employer/js/jquery.min.js"></script>
	<script src="/employer/js/bootstrap.min.js"></script>
	<script src="/employer/js/main.js"></script>
	<script>
		$('.similardetail ul li a').click(function() {
			$(this).find('i').toggleClass('bi-bookmark bi-bookmarks-fill')
		});
	</script>
	<script>
		var candiateId = "${careerDetails.candidateId}";

		if (candiateId !== "") {
			function downloadResume() {

				var url = "downloadResumeCandidate";
				var form = document.createElement('form');
				form.method = 'GET';
				form.action = url;

				var input1 = document.createElement('input');
				input1.type = 'hidden';
				input1.name = 'candidateId';
				input1.value = candiateId;
				form.appendChild(input1);

				document.body.appendChild(form);
				form.submit();
			}

		}
	</script>

</body>

</html>