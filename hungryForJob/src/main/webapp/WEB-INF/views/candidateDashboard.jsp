<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
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
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<link href="css/select2.min.css" rel="stylesheet" />
</head>
<style>
.desc {
	display: flex;
	align-items: center;
	overflow: hidden;
}

.desc img {
	margin-right: 8px;
	flex-shrink: 0;
}

.desc .one-line-text {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	flex: 1;
}
</style>
<body>
	<%@include file="header3.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main" class="maincontent">
		<nav aria-label="breadcrumb" class="breadcrumb">
			<div class="bgtop"></div>
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Recommended
						Job</li>
				</ol>
			</div>
		</nav>
		<!-- ======= Featured Job List Section ======= -->
		<section id="featuredJoblist" class="featuredJoblist recommendedJob">
			<div class="container">
				<div class="row">
					<%@include file="menu.jsp"%>
					<div class="col-xl-9 col-lg-9 col-md-8 col-sm-12 ">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 recommended">
								<h2>Recommended Job</h2>
							</div>
							<c:forEach items="${jobPostingDetails}" var="jobPosting">
								<c:choose>
									<c:when test="${jobPosting.jobType == 'Job'}">
										<div class="col-xl-6 col-lg-6 ">
											<div class="listbox">
												<div class="d-flex justify-content-between ">
													<div class="company-details">
														<a href="#" onclick="viewDetails(${jobPosting.id})">
															<h4>${jobPosting.jobHeading}</h4>
															<p>${jobPosting.companyName}</p>
														</a>
													</div>
													<div class="company-logo">
														<img src="img/nikitis-Infocom.png">
													</div>
												</div>
												<div class="list-price">
													<ul>
														<li><img src="img/year.svg">${jobPosting.fromYearExp}
															to ${jobPosting.toYearExp}</li>
														<c:choose>
															<c:when test="${hideSalary  = '1'}">
																<li><img src="img/inr.svg">Not disclosed</li>
															</c:when>
															<c:when
																test="${empty jobPosting.fromCtc or jobPosting.fromCtc eq 'null' or empty jobPosting.toCtc or jobPosting.toCtc eq 'null'}">
																<li><img src="img/inr.svg">0-0</li>
															</c:when>
															<c:otherwise>
																<li><img src="img/inr.svg">${jobPosting.fromCtc}
																	- ${jobPosting.toCtc}</li>
															</c:otherwise>
														</c:choose>
														<li><img src="img/map.svg">${jobPosting.location}</li>
													</ul>
												</div>

												<div class="desc">
													<img src="img/txt-details.svg" alt="Details">
													<div class="one-line-text">
														${jobPosting.jobDescription}</div>
												</div>

												<div class="daytxt">
													<p>${jobPosting.noOfDays}</p>
													<c:if test="${jobPosting.isJobApplied eq 'applied'}">
														<p class="appliedjob">
															<img src="img/appliedjob.png"> Applied
														</p>
													</c:if>
													<div class="applyNow">
														<a href="#" onclick="viewDetails(${jobPosting.id})">
															View Details </a>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:when test="${jobPosting.jobType == 'Internship'}">
										<div class="col-xl-6 col-lg-6 ">
											<div class="listbox">
												<div class="d-flex justify-content-between ">
													<div class="company-details">
														<a href="#" onclick="viewDetails(${jobPosting.id})">
															<h4>${jobPosting.jobHeading}</h4>
															<p>${jobPosting.companyName}</p>
														</a>
													</div>
													<div class="company-logo">
														<img src="img/nikitis-Infocom.png">
													</div>
												</div>
												<div class="list-price">
													<ul>
														<li><img src="img/icon-clock.svg">${jobPosting.Duration}</li>
														<c:choose>
															<c:when test="${hideSalary  = '1'}">
																<li><img src="img/inr.svg">Not disclosed</li>
															</c:when>
															<c:when
																test="${empty jobPosting.fromCtc or jobPosting.fromCtc eq 'null' or empty jobPosting.toCtc or jobPosting.toCtc eq 'null'}">
																<li><img src="img/inr.svg">0-0</li>
															</c:when>
															<c:otherwise>
																<li><img src="img/inr.svg">${jobPosting.internFromSalary}</li>
															</c:otherwise>
														</c:choose>
														<li><img src="img/map.svg">${jobPosting.location}</li>
													</ul>
												</div>

												<div class="desc">
													<img src="img/txt-details.svg" alt="Details">
													<div class="one-line-text">
														${jobPosting.jobDescription}</div>
												</div>

												<div class="daytxt">
													<p>${jobPosting.noOfDays}</p>
													<c:if test="${jobPosting.isJobApplied eq 'applied'}">
														<p class="appliedjob">
															<img src="img/appliedjob.png"> Applied
														</p>
													</c:if>
													<div class="applyNow">
														<a href="#" onclick="viewDetails(${jobPosting.id})">
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
	<script src="js/candidateDashboard.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/main.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script>
		
	/* let totalPages=${totalpages}; */
 	<%-- let totalPages="${totalpages}";	
	let currentPage="${currentpage}";
	if(totalPages)
	{
		totalPages=parseInt(totalPages, 10);
	}
	if(currentPage)
	{
		currentPage=parseInt(currentPage, 10);
	}
		$(document).ready(function() {
			var sucessMsg = '${loginSucessMessage}';
			let value = sessionStorage.getItem("loginsucess") ? sessionStorage.getItem("loginsucess") : "";
			if (sucessMsg != null && sucessMsg != '' && value !== "") {
				showToast('success',sucessMsg);
				sessionStorage.removeItem("loginsucess");
			}
			generatePagination(currentPage);
		});

		function generatePagination(selectedPage)
		{
			if(selectedPage != 0)
			{
				let $pagination = $("#pagination");
				$pagination.empty();
				let startPage = Math.max(1, selectedPage - 5);
			    let endPage = Math.min(totalPages, startPage + 9);
			    if (endPage - startPage < 9) {
		            startPage = Math.max(1, endPage - 9);
		        }
				$pagination.append(`<li class="page-item"><a class="page-link" href="#" id="prevpage" onclick="changePage('prev')">Previous</a></li>`);
				let p=0;
				for(let i=startPage;i<=endPage;i++)
				{
					if(startPage !== 1 && p == 0)
					{
						p=1;
						let $li = $("<li>").addClass("page-item");
					    let $a = $("<a>")
					        .addClass("page-link")
					        .attr("href", "#")
					        .text(1)
					        .on("click", function () {
					            changePage(1);
					        });

					    if (i === selectedPage) {
					        $li.addClass("active");
					    }

					    $li.append($a);
					    
					    let $li2 = $("<li>").addClass("page-item");
					    let $a1 = $("<a>")
				        .addClass("page-link")
				        .attr("href", "#")
				        .text('...')
				      	 $li2.append($a1);
					    
					    $pagination.append($li);
					    $pagination.append($li2);
						
					}
					let $li = $("<li>").addClass("page-item");
				    let $a = $("<a>")
				        .addClass("page-link")
				        .attr("href", "#")
				        .text(i)
				        .on("click", function () {
				            changePage(i);
				        });

				    if (i === selectedPage) {
				        $li.addClass("active");
				    }

				    $li.append($a);
				    $pagination.append($li);
				}
				$pagination.append(`<li class="page-item"><a class="page-link" href="#" id="nextpage" onclick="changePage('next')">Next</a></li>`)
			}
			
		}
		function changePage(page) {
	        if (page === "prev" && currentPage > 1) {
	            currentPage--;
	        } else if (page === "next" && currentPage < totalPages) {
	            currentPage++;
	        } else if (typeof page === "number") {
	            currentPage = page;
	        }
	        jobpostingdetails(currentPage);
	        generatePagination(currentPage);
	       	
	    } --%>
	    var candidateId="${candidateId}";
	</script>

</body>

</html>

