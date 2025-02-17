<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
<link href="css/select2.min.css" rel="stylesheet" />
</head>

<body>
	<%@include file="header3.jsp"%>
	<main id="main" class="maincontent">
		<nav aria-label="breadcrumb" class="breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Applied
						Jobs</li>
				</ol>
			</div>
		</nav>

		<!-- ======= Featured Job List Section ======= -->
		<section id="featuredJoblist" class="featuredJoblist recommendedJob">
			<div class="container">
				<div class="row">
					<%@include file="menu.jsp"%>
					<div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 ">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 recommended">
								<h2>Applied Jobs</h2>
							</div>

							<c:forEach items="${jobapplied}" var="jobPosting">
								<div class="col-xl-6 col-lg-6 col-md-12 ">
									<div class="listbox">
										<div class="d-flex justify-content-between ">
											<div class="company-details">
												<a href="#">
													<h4>${jobPosting.jobHeading }</h4>
													<p>${jobPosting.companyName}</p>
												</a>
											</div>
											<div class="company-logo">
												<img src="img/nikitis-Infocom.png">
											</div>
										</div>
										<div class="list-price">
											<ul>
												<li><img src="img/year.svg">${jobPosting.fromYears} to  ${jobPosting.toYears}</li>
												<li><img src="img/inr.svg">${jobPosting.minCtc} - ${jobPosting.maxCtc}</li>
												<li><img src="img/map.svg">${jobPosting.location}</li>
											</ul>
										</div>
										<div class="desc">
										<p>
											<img src="img/txt-details.svg"> ${jobPosting.jobDescription}
										</p>
										</div>
										
										<c:set var="startingDate" value="${jobPosting.createdDate}" ></c:set>
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
										<div class="daytxt">
											<p><%= postedDays %></p>
											<div class="applyNow">
												<a href="#" onclick="viewDetails(${jobPosting.jobId})"> View Details
												</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>



						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Featured Job List Section -->


	</main>
	<%@include file="footer.jsp"%>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/appliedjob.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/select2.min.js"></script>
	<script>
	var candidateId="<%=candidateId%>";
	</script>


</body>

</html>