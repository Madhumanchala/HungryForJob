<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String candidateId = (String) session.getAttribute("candidateId");
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
<link href="css/style.css" rel="stylesheet">
<link href="assets/plugins/general/toastr/build/toastr.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@include file="header2.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main" class="maincontent">
		<nav aria-label="breadcrumb" class="breadcrumb">
			<div class="bgtop"></div>
			<div class="container d-flex justify-content-between align-items-center mt-2">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Recommended Job</a></li>
					<li class="breadcrumb-item active" aria-current="page">Recommended
						Job Details</li>
				</ol>
				<a class=" btn-goBack" onclick="goBack()">
			        <i class="bi bi-arrow-left-short"></i> Back
			    </a>
			</div>
		</nav>
		<section class="jobcareers-details pt-0  ">
			<div class="" id="myHeader">
			
				<div class="container">
					<div class="content-banner job-banner">
						<div class="jobdetails-header ">
							<div class="row ">
								<div class="col-xl-9 col-lg-8 col-md-7 col-sm-12 col-12 ">
									<div class="banner-txt careers-title d-flex">
										<div class="company-logo">
											<img src="img/nikitis-Infocom.png" class="logoImage">
										</div>
										<div class="">
											<h3>${jobPostingDetails.jobHeading}</h3>
											<h6>${jobPostingDetails.companyName}</h6>
											<ul class="job-info">
												<li><img src="img/year.svg">${jobPostingDetails.fromYearExp} to ${jobPostingDetails.toYearExp}
												</li>
												<li><img src="img/inr.svg">${jobPostingDetails.fromCtc} - ${jobPostingDetails.toCtc}
												</li>
												<li><img src="img/map.svg">${jobPostingDetails.location}
												</li>
											</ul>
										</div>
									</div>

								</div>
								<div class="col-xl-3 col-lg-4 col-md-5 col-sm-12 col-12 ">
									<div class="apply-btn">
										<div>
										<c:if test="${appliedOrNot == 0}">
											<a href="#" class="applyNow" id="applyJob" onclick="appliedJob(${id})"> Apply Now </a>
										</c:if>
										<c:if test="${appliedOrNot == 1}">
											<a href="#" class="applyNow" id="Appliedjob" style="">Applied</a>
										</c:if>
										</div>

									</div>
									<c:set var="startDate" value="${jobPostingDetails.createdDate}" ></c:set>
									<%
    // Assuming similar_job is an object with a createdDate property
    String createdDateString1 = (String) pageContext.getAttribute("startDate");; // Fetching the created date string
    
    DateTimeFormatter inputFormatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate createdDate1 = LocalDate.parse(createdDateString1, inputFormatter1);
    LocalDate today1 = LocalDate.now();
    
    long days1 = ChronoUnit.DAYS.between(createdDate1, today1);
    String postedDays1;
    
    if (days1 > 365) {
        long years1 = days1 / 365;
        postedDays1 = years1 + (years1 == 1 ? " Year Ago" : " Years Ago");
    } else if (days1 > 28) {
        long months1 = days1 / 30;
        postedDays1 = months1 + (months1 == 1 ? " Month Ago" : " Months Ago");
    } else {
        postedDays1 = days1 + (days1 == 1 ? " Day Ago" : " Days Ago");
    }
%>
									<div class="posted">
										<ul>
											<li>Posted: <%= postedDays1 %></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-12">
						<div class="jobdetails-content">
							<h3>Job description</h3>
							<p>${jobPostingDetails.jobDescription}</p>
						</div>

						<div class="jobdetails-content">
							<h3>About company</h3>
							<h5>${jobPostingDetails.companyName}</h5>
							 <p>
								<!-- Since 2016, ComUnus Technologies Pvt Ltd is one of the fastest
								growing IT Services and Consulting company based out of INDIA.

								ComUnus word comes from community, which joins two Latin word
								Com('together', 'with') and Unus('One'). As the name suggest, we
								at ComUnus believe in building relationship with our customers,
								team members, investors, and partners.<br> Website :
								comunus.com -->
								${jobPostingDetails.aboutCompany}
							</p>
							<h5>Company Info</h5>
							<p>
								<strong>Address: </strong>
								<!-- 902, 9th Floor, Oriana Business Park,
								Road No.22, Wagle Estate, Thane, Mumbai, Maharashtra - 400604. -->
								${jobPostingDetails.companyAddress}
							</p> 
							
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
						<div id="featuredJoblist"
							class="featuredJoblist recommendedJob similarjobs  ">
							<div class="row">
								<div class="col-xl-12 col-lg-12 col-md-12 text-center">
									<div class="jobdetails-content">
    <h4>Similar jobs</h4>
</div>
								</div>


								<c:forEach items="${similiarJobs}" var="jobs">
									<c:if test="${id != jobs.id}">
										<div class="col-xl-12 col-lg-12 col-md-12 mt-4">
											<div class="listbox">
												<div class="d-flex justify-content-between ">
													<div class="company-details">
														<a href="">
															<h4>${jobs.jobHeading}</h4>
															<p>ComUnus Technology</p>
														</a>
													</div>
													<div class="company-logo">
														<img src="img/nikitis-Infocom.png">
													</div>
												</div>
												<div class="list-price">
													<ul>
														<li><img src="img/year.svg">${jobs.fromYearExp}.${jobs.fromMonthExp}-${jobs.toYearExp}.${jobs.toMonthExp} years</li>
														<li><img src="img/inr.svg"> Up to ${jobs.fromCtc}.${jobs.toCtc} Lacs</li>
														<li><img src="img/map.svg">${jobs.areaName}</li>

													</ul>
												</div>
												<div class="desc">
													<img src="img/txt-details.svg">
													${jobs.jobDescription}
												</div>
												
												<div class="daytxt">
											<c:set var="startingDate" value="${jobs.createdDate}" ></c:set>
										<%
    // Assuming similar_job is an object with a createdDate property
    String createdDateString = (String) pageContext.getAttribute("startingDate");; // Fetching the created date string
    
    DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate createdDate = LocalDate.parse(createdDateString, inputFormatter);
    LocalDate today = LocalDate.now();
    
    long days = ChronoUnit.DAYS.between(createdDate, today);
    String postedDays;
    
    if (days > 365) {
        long years = days / 365;
        postedDays = years + (years == 1 ? " Year Ago" : " Years Ago");
    } else if (days > 28) {
        long months = days / 30;
        postedDays = months + (months == 1 ? " Month Ago" : " Months Ago");
    } else {
        postedDays = days + (days == 1 ? " Day Ago" : " Days Ago");
    }
%>
											<p><%= postedDays %> </p>
													<div class="applyNow">
														<a href="#" onclick="viewDetails(${jobs.id})"> View
															Details </a>
													</div>
												</div>
											</div>
										</div>
									</c:if>

								</c:forEach>


							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<%@include file="footer.jsp"%>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/candidateViewDetails.js"></script>
	<script src="js/main.js"></script>
	<script>
		$(document).ready(function() {
			var sucessMsg = '${loginSucessMessage}';
			console.log('sucessMsg:' + sucessMsg)
			if (sucessMsg != null && sucessMsg != '') {
				showToast('success',"Successfully Job is applied");
			}
		});
		function goBack()
		{
			var flag="${viewDetailStatus}";
			if(flag == "")
			{
				let url = "appliedJob";
				let form = document.createElement('form');
				form.method = 'POST'; 
				form.action = url;
				document.body.appendChild(form);
				form.submit();
			}else
			{
				let url = "candidateDashboard";
				let form = document.createElement('form');
				form.method = 'POST'; 
				form.action = url;
				document.body.appendChild(form);
				form.submit();
			}
			
		}
		var candidateId="<%=candidateId%>";
	</script>

</body>

</html>