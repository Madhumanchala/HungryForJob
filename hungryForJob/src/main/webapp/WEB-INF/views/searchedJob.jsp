<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
</head>

<body>
	<%@include file="header.jsp"%>
	<main id="main" class="maincontent">
		<nav aria-label="breadcrumb" class="breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">searchedJob</li>
				</ol>
			</div>
		</nav>

		<!-- ======= Featured Job List Section ======= -->
		<section id="featuredJoblist" class="featuredJoblist recommendedJob">
			<div class="container">
				<div class="row">
					<div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 ">
						<div class="row">
							 <c:forEach items="${jobDetails}" var="jobPosting"> 
								<div class="col-xl-6 col-lg-6 col-md-12 ">
									<div class="listbox">
										<div class="d-flex justify-content-between ">
											<div class="company-details">
												<a href="">
													<h4>${jobPosting.jobHeading}</h4>
													<p>ComUnUs Technology</p>
												</a>
											</div>
											<div class="company-logo">
												<img src="img/nikitis-Infocom.png">
											</div>
										</div>
										<div class="list-price">
											<ul>
												<li><img src="img/year.svg"> ${jobPosting.fromYearExp}-${jobPosting.toYearExp}years</li>
												<li><img src="img/inr.svg"> ${jobPosting.fromCtc}-${jobPosting.toCtc}</li>
												<li><img src="img/map.svg">${jobPosting.location}</li>
											</ul>
										</div>
										<p>
											<img src="img/txt-details.svg"> ${jobPosting.jobDescription}
										</p>
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
												<a href="/login"> Login/Apply
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


</body>

</html>