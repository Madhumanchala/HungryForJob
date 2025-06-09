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
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="employer/css/bootstrap.min.css" rel="stylesheet">
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="employer/css/font-awesome.min.css" rel="stylesheet">
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/nice-select.css" rel="stylesheet">
<link href="employer/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet">

</head>

<body class="bg">
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="employerHeader.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main">
		<section class="section-inner managejobviewsection pt-4">
			<div class="container">
				<div class="manageJobsbox  ">
					<div class="row d-flex align-items-center">
						<div class="col-lg-8">
							<div class="jobCardtxt d-flex">
								<div class="back">
									<a href="#" onclick="findroute('/managejobpost')"> <img
										src="employer/img/back-left.svg">
									</a>
								</div>
								<div>
									<div class="jobtitle d-flex align-items-center">
										<div class="form-groupsort">
											<select class="formselect " id="allCategories"
												onchange="findNewroute(this)">
												<c:forEach items="${listofjobpost}" var="jobpost">
													<option value="${jobpost.id}"
														<c:if test="${jobpost.id == jobpostId}">selected</c:if>>${jobpost.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="statusBtn opening">${jobpostdetails.type}</div>
									</div>
								</div>
							</div>

							<div class="list-price manageJoblist">
								<ul class="list-group flex-wrap list-group-horizontal">
									<li class="me-3"><img src="img/year.svg">
										${jobpostdetails.minExp } -
										${jobpostdetails.maxExp}&nbsp;years</li>
									<li class="me-3"><img src="employer/img/inr.svg">
										${jobpostdetails.salaryFigureMin } -
										${jobpostdetails.salaryFigureMax} Lacs</li>
									<li class="me-3"><img src="employer/img/map.svg">
										${jobpostdetails.jobloc}</li>
									<li class="me-3">Created by <span class="nametxt">${jobpostdetails.createdBy}</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="jobmanageTab">
					<ul>
						<li><a href="#" onclick="findNewroute2(${jobpostId})"> <img src="employer/img/candidates.svg">
								Candidates <span class="count">
									${jobpostdetails.candidateApplied}</span>
						</a></li>
						<li class="active"><a href="#"
							onclick="findNewroute1(${jobpostId})"> <img
								src="employer/img/jobinfo.svg"> Job Info
						</a></li>
						<li><a href=""><img src="employer/img/calendar.svg">
								Calendar </a></li>
					</ul>
				</div>

				<div class="jobinfo mt-4">
					<div class="card-listinner">
						<h4>Key Skills</h4>
						<div class="keySkills">
							<ul>
								<c:forEach items="${tech}" var="skills">
									<li>${skills.name}</li>
								</c:forEach>
							</ul>
						</div>
						<hr>
						<h4>Job Description</h4>
						<div>${jobpostdetails.jobDescription}</div>
						<p>
							<span>Role:</span> ${jobpostdetails.internRole }
						</p>
						<p>
							<span>Industry Type:</span> ${jobpostdetails.internIndustry }
						</p>
						<p>
							<span>Department:</span> ${jobpostdetails.internDepartment }
						</p>
						<p>
							<span>Employment Type:</span>
							${jobpostdetails.internEmploymentType}
						</p>
						<hr>
						<h4>Education</h4>
						<div class="keySkills">
							<ul>
								<c:forEach items="${education}" var="education">
									<li>${education.name}</li>
								</c:forEach>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
	<%@include file="employerfooter.jsp"%>

	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/popper.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/nice-select.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="/js/commonvalidation.js"></script>
	<script>
		$('.datepicker').datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		});

		$(document).ready(function() {
			$(".selet2Multiple").select2({
				placeholder : "Select"
			});
			$(".selet2Single").select2({
				placeholder : "Select"
			});
		});

		$(document).ready(function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 1000);
		});

		$(document).ready(function() {
			$("#schedule").select2({
				dropdownParent : $("#schedule").parent()
			});

			$("#interviewMode").select2({
				dropdownParent : $("#interviewMode").parent()
			});
		});

		$(document).ready(function() {
			$('select').niceSelect();
		});

		function findNewroute(element) {
			var id = element.value;

			let form = document.createElement('form');
			form.method = 'POST';
			form.action = '/managejobinfo';

			let input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'jobId';
			input.value = id;
			form.appendChild(input);

			document.body.appendChild(form);
			form.submit();
		}
		function findNewroute2(id) {

			let form = document.createElement('form');
			form.method = 'POST';
			form.action = '/managejobview';

			let input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'jobId';
			input.value = id;
			form.appendChild(input);

			document.body.appendChild(form);
			form.submit();
		}
		function findNewroute1(id) {

			let form = document.createElement('form');
			form.method = 'POST';
			form.action = '/managejobinfo';

			let input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'jobId';
			input.value = id;
			form.appendChild(input);

			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>

</html>