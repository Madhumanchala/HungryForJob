<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<%@include file="header2.jsp"%>
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
								<c:choose>
									<c:when test="${jobPosting.jobType eq 'Job'}">
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
														<li><img src="img/year.svg">${jobPosting.fromYears}
															to ${jobPosting.toYears}</li>
														<li><img src="img/inr.svg">${jobPosting.minCtc}
															- ${jobPosting.maxCtc}</li>
														<li><img src="img/map.svg">${jobPosting.location}</li>
													</ul>
												</div>
												<div class="desc">
													<p>
														<img src="img/txt-details.svg">
														${jobPosting.jobDescription}
													</p>
												</div>
												<div class="daytxt">
													<p>${jobPosting.noOfDays}</p>
													<div class="applyNow">
														<a href="#" onclick="viewDetails(${jobPosting.jobId})">
															View Details </a>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:when test="${jobPosting.jobType eq 'Internship'}">
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

														<li><img src="img/year.svg">${jobPosting.duration}</li>
														<c:if test="${jobPosting.stipend ne 'NO' }">
															<li><img src="img/inr.svg">${jobPosting.stipendSal}</li>
														</c:if>
														<li><img src="img/map.svg">${jobPosting.location}</li>
													</ul>
												</div>
												<div class="desc">
													<p>
														<img src="img/txt-details.svg">
														${jobPosting.jobDescription}
													</p>
												</div>
												<div class="daytxt">
													<p>${jobPosting.noOfDays}</p>
													<div class="applyNow">
														<a href="#" onclick="viewDetails(${jobPosting.jobId})">
															View Details </a>
													</div>
												</div>
											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
						<ul class="pagination justify-content-end">
							<c:if test="${totalpages != 0}">
								<c:choose>
									<c:when test="${currentPage == 1}">
										<li class="page-item disabled"><a class="page-link"
											href="#">Previous</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="#"
											onclick="jobpostingdetails(${currentPage - 1})">Previous</a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="1" end="${totalpages}">
									<c:choose>
										<c:when test="${currentPage == i}">
											<li class="page-item active"><a class="page-link"
												href="#" onclick="jobpostingdetails(${i})">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="#"
												onclick="jobpostingdetails(${i})">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${currentPage == totalpages}">
										<li class="page-item disabled"><a class="page-link"
											href="#">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="#"
											onclick="jobpostingdetails(${currentPage + 1})">Next</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
							<%-- <c:if test="${totalpages == 0}">
 									<h4> No records found </h4> 
							</c:if> --%>
						</ul>
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