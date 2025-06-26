<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="employer/css/style.css" rel="stylesheet">

</head>

<body>
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="employerHeader.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main">
		<section class="section-inner advancedsearch-section ">
			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="dashboardHeading">
							<h3>
								Welcome,
								<%=session.getAttribute("fullName")%>! <span>👋</span>
							</h3>
							<p>Manage and monitor your opportunity with real-time
								insights from this dashboard</p>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div
					class=" d-md-flex d-sm-inline-flex justify-content-between align-items-center mt-2 mb-4">
					<div
						class="d-flex align-items-center gap-3 dashboardIcon card-listinner">
						<div class="icondashboard">
							<img src="employer/img/job-posted.svg" alt="">
						</div>
						<div class="dashboardDetails ">
							<h3>${countjobdetails.countJobPosted}</h3>
							<p>Job Posted</p>
						</div>
					</div>
					<div
						class="d-flex align-items-center gap-3 shortListed dashboardIcon card-listinner">
						<div class="icondashboard">
							<img src="employer/img/shortlisted.svg" alt="">
						</div>
						<div class="dashboardDetails ">
							<h3>${countjobdetails.countJobShortlisted}</h3>
							<p>Shortlisted</p>
						</div>
					</div>

					<!-- <div class="d-flex align-items-center gap-3 jobsApplied dashboardIcon card-listinner">
            <div class="icondashboard">
              <img src="employer/img/jobApplied.svg" alt="">
            </div>
            <div class="dashboardDetails">
              <h3>286</h3>
              <p>Jobs Applied</p>
            </div>
          </div> -->
					<div
						class="d-flex align-items-center gap-3 applicants dashboardIcon card-listinner">
						<div class="icondashboard">
							<img src="employer/img/applicants.svg" alt="">
						</div>
						<div class="dashboardDetails">
							<h3>${countjobdetails.countJobApplicants}</h3>
							<p>Applicants</p>
						</div>
					</div>
					<div
						class="d-flex align-items-center gap-3 hiredSuccess dashboardIcon card-listinner">
						<div class="icondashboard">
							<img src="employer/img/hiredSuccess.svg" alt="">
						</div>
						<div class="dashboardDetails">
							<h3>${countjobdetails.countJobHired}</h3>
							<p>Hired Success</p>
						</div>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row ">
					<div class="col-xl-8 col-lg-8 col-md-12">
						<div class="dashboard-hiringpipe">
							<div class="card-listinner py-0 px-0">
								<div
									class="title d-flex justify-content-between align-items-center">
									<h4>Hiring Pipeline</h4>
									<p>
										<a href="#" onclick="managejobpost()">View all jobs</a>
									</p>
								</div>
								<table class="table dashboardtable">
									<thead>
										<tr>
											<!-- <th class="jobtit">Job Type</th> -->
											<th class="jobtit">Job Title</th>
											<c:forEach items="${carddetails}" var="cardname">
												<th class="jobtit2">${cardname.name}</th>
											</c:forEach>
											<!-- <th class="jobtit2">New&nbsp;Applied</th>
											<th class="jobtit2">Screening</th>
											<th class="jobtit2">Interview</th>
											<th class="jobtit2">Tests</th>
											<th class="jobtit2">Hired</th> -->
											<th class="jobtit3 ">View</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${jobdetails}" var="details">
											<tr class="detailslist">
												<%-- <td>
													<h5>${details.jobType}</h5>
												</td> --%>
												<td>
													<h5>${details.jobHeading}</h5>
													<p>${details.postingStartDate}to
														${details.postingEndDate}</p>
												</td>

												<td colspan="4">
													<ul class="progressbar">
														<c:choose>
															<c:when test="${details.postingHired gt 0}">
																<li class="active">${details.postingApplied }&nbsp;
																	Candidates</li>
																<li class="active">${details.postingScreening}&nbsp;
																	Candidates</li>
																<li class="active">${details.postingInterview }&nbsp;
																	Candidates</li>
																<li class="active">${details.postingHired}&nbsp;
																	Candidates</li>
															</c:when>
															<c:when test="${details.postingInterview gt 0}">
																<li class="active">${details.postingApplied }&nbsp;
																	Candidates</li>
																<li class="active">${details.postingScreening}&nbsp;
																	Candidates</li>
																<li class="active">${details.postingInterview }&nbsp;
																	Candidates</li>
																<li class="">${details.postingHired}&nbsp;Candidates</li>
															</c:when>
															<c:when test="${details.postingScreening gt 0}">
																<li class="active">${details.postingApplied }&nbsp;
																	Candidates</li>
																<li class="active">${details.postingScreening}&nbsp;
																	Candidates</li>
																<li class="">${details.postingInterview }&nbsp;
																	Candidates</li>
																<li class="">${details.postingHired}&nbsp;Candidates</li>
															</c:when>
															<c:when test="${details.postingApplied gt 0}">
																<li class="active">${details.postingApplied }&nbsp;
																	Candidates</li>
																<li class="">${details.postingScreening}&nbsp;Candidates</li>
																<li class="">${details.postingInterview }&nbsp;
																	Candidates</li>
																<li class="">${details.postingHired}&nbsp;Candidates</li>
															</c:when>
															<c:otherwise>
																<li class="">${details.postingApplied }&nbsp;Candidates</li>
																<li class="">${details.postingScreening}&nbsp;Candidates</li>
																<li class="">${details.postingInterview }&nbsp;
																	Candidates</li>
																<li class="">${details.postingHired}&nbsp;Candidates</li>
															</c:otherwise>
														</c:choose>
													</ul>
												</td>
												<td class="text-center eye"><a href="#"> <i
														class="bi bi-eye"></i>
												</a></td>
											</tr>
										</c:forEach>
										<!--  <tr class="detailslist">
                      <td>
                        <h5>HR Recruiter</h5>
                        <p>01-01-25 to 25-01-25</p>
                      </td>
                      <td colspan="5">
                        <ul class="progressbar">
                          <li class="active">33 Candidates</li>
                          <li class="active">16 Candidates</li>
                          <li class="active">13 Candidates</li>
                          <li class="active">3 Candidates</li>
                          <li>1 Candidates</li>
                        </ul>
                      </td>
                      <td class="text-center eye"><a href=""> <i class="bi bi-eye"></i> </a></td>
                    </tr>
                    <tr class="detailslist">
                      <td>
                        <h5>HR Recruiter</h5>
                        <p>01-01-25 to 25-01-25</p>
                      </td>
                      <td colspan="5">
                        <ul class="progressbar">
                          <li class="active">33 Candidates</li>
                          <li class="active">16 Candidates</li>
                          <li class="active">13 Candidates</li>
                          <li>3 Candidates</li>
                          <li>1 Candidates</li>
                        </ul>
                      </td>
                      <td class="text-center eye"><a href=""> <i class="bi bi-eye"></i> </a></td>
                    </tr>

                    <tr class="detailslist">
                      <td>
                        <h5>HR Recruiter</h5>
                        <p>01-01-25 to 25-01-25</p>
                      </td>
                      <td colspan="5">
                        <ul class="progressbar">
                          <li class="active">33 Candidates</li>
                          <li class="active">16 Candidates</li>
                          <li class="active">13 Candidates</li>
                          <li>3 Candidates</li>
                          <li>1 Candidates</li>
                        </ul>
                      </td>
                      <td class="text-center eye"><a href=""> <i class="bi bi-eye"></i> </a></td>
                    </tr>
                    <tr class="detailslist">
                      <td>
                        <h5>HR Recruiter</h5>
                        <p>01-01-25 to 25-01-25</p>
                      </td>
                      <td colspan="5">
                        <ul class="progressbar">
                          <li class="active">33 Candidates</li>
                          <li class="active">16 Candidates</li>
                          <li class="active">13 Candidates</li>
                          <li class="active">3 Candidates</li>
                          <li>1 Candidates</li>
                        </ul>
                      </td>
                      <td class="text-center eye"><a href=""> <i class="bi bi-eye"></i> </a></td>
                    </tr>
                    <tr class="detailslist">
                      <td>
                        <h5>HR Recruiter</h5>
                        <p>01-01-25 to 25-01-25</p>
                      </td>
                      <td colspan="5">
                        <ul class="progressbar">
                          <li class="active">33 Candidates</li>
                          <li class="active">16 Candidates</li>
                          <li class="active">13 Candidates</li>
                          <li>3 Candidates</li>
                          <li>1 Candidates</li>
                        </ul>
                      </td>
                      <td class="text-center eye"><a href=""> <i class="bi bi-eye"></i> </a></td>
                    </tr>
                    <tr class="detailslist">
                      <td>
                        <h5>HR Recruiter</h5>
                        <p>01-01-25 to 25-01-25</p>
                      </td>
                      <td colspan="5">
                        <ul class="progressbar">
                          <li class="active">33 Candidates</li>
                          <li class="active">16 Candidates</li>
                          <li class="active">13 Candidates</li>
                          <li>3 Candidates</li>
                          <li>1 Candidates</li>
                        </ul>
                      </td>
                      <td class="text-center eye"><a href=""> <i class="bi bi-eye"></i> </a></td>
                    </tr> -->
									</tbody>
								</table>
							</div>
						</div>

					</div>
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="myToDoc card-listinner ">
							<div
								class="d-flex justify-content-between align-items-center mb-0 myToDocHeader">
								<div class="myToDocTitle">
									<h4>My to-dos</h4>
								</div>
								<button data-bs-toggle="modal" data-bs-target="#addTask"
									class="btn-task">
									<i class="bi bi-plus"></i> Add Task
								</button>
							</div>
							<div class="scrollbar1">
								<div class="todotask align-items-stretch gap-2">
									<div class="datetime d-flex justify-content-between">
										<div class="datetxt ">
											<span>08-01-2025</span>
											<p>09:30 AM to 10:30 AM</p>
										</div>
										<div class="form-check todotaskCheck">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckChecked">
										</div>

									</div>
									<div class="description">
										<span>Review job descriptions and requirements provided
											by hiring managers. </span>
									</div>
								</div>

								<div class="todotask align-items-stretch gap-2">
									<div class="datetime d-flex justify-content-between">
										<div class="datetxt ">
											<span>08-01-2025</span>
											<p>09:30 AM to 10:30 AM</p>
										</div>
										<div class="form-check todotaskCheck">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckChecked">
										</div>

									</div>
									<div class="description">
										<span>Review job descriptions and requirements provided
											by hiring managers. </span>
									</div>
								</div>

								<div class="todotask align-items-stretch gap-2">
									<div class="datetime d-flex justify-content-between">
										<div class="datetxt ">
											<span>08-01-2025</span>
											<p>09:30 AM to 10:30 AM</p>
										</div>
										<div class="form-check todotaskCheck">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckChecked" checked>
										</div>
									</div>
									<div class="description">
										<span>Review job descriptions and requirements provided
											by hiring managers. </span>
									</div>
								</div>

								<div class="todotask align-items-stretch gap
                -2">
									<div class="datetime d-flex justify-content-between">
										<div class="datetxt ">
											<span>08-01-2025</span>
											<p>09:30 AM to 10:30 AM</p>
										</div>
										<div class="form-check todotaskCheck">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckChecked" checked>
										</div>

									</div>
									<div class="description">
										<span>Review job descriptions and requirements provided
											by hiring managers. </span>
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

	<!-- addCommentModal   -->
	<div class="modal fade" id="addTask" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Task</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="Industry" class="form-label required">Task</label> <input
									type="text" name="Industry" id="Industry" class="form-control"
									placeholder="Enter Industry">
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

	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/popper.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="/js/commonvalidation.js"></script>
	<script>
		$(document).ready(function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 1000);
		});
		function managejobpost() {
			findroute('managejobpost');
		}
	</script>
</body>

</html>