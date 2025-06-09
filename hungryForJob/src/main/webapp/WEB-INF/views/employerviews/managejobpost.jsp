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
<link href="fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
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
		<section class="section-inner manageJobs-section ">
			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="manageJobstitle d-flex justify-content-between mb-3">
							<h3 class="maintitle">Manage Jobs</h3>
							<button class="btn-blue" onclick="findroute('jobPost')">
								<i class="bi bi-plus"></i> Post a job
							</button>
						</div>
					</div>
				</div>


				<div class="sortbyjob">
					<div class="form-groupsort">
						<div class="input-group ">
							<span class="input-group-text "> <i class="bi bi-search"></i></span>
							<input type="text" class="form-control " id="searchBox"
								placeholder="Search Job">
						</div>

					</div>

					<%-- <div class="form-groupsort">
						<select class="formselect " id="allCategories">
							<option value="select">All Categories</option>
							<c:forEach items="${listofjobpostdetails}" var="jobdetails">
								<option value="${jobdetails.jobTittle}">${jobdetails.jobTittle}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-groupsort">
						<select class="formselect " id="allStatus">
							<option value="select">All Status</option>
							<c:forEach items="${status}" var="status">
								<option value="${status.id}">${status.name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-groupsort">
						<select class="formselect " id="allLocation">
							<option value="">All Location</option>
							<c:forEach items="${cities}" var="city">
								<option value="${city.id}">${city.name}</option>
							</c:forEach>
						</select>
					</div> --%>
				</div>


				<div class="manageJobsbox">
					<ul class="row " id="itemListBox">


						<c:forEach items="${listofjobpostdetails}" var="jobdetails">
							<li class="col-xl-4 col-lg-4 col-md-6 ">
								<div class="card-listinner">
									<div
										class="jobtitle d-flex justify-content-between align-items-center">
										<h4>
											<a onclick="findNewroute('managejobview','${jobdetails.id}')">${jobdetails.jobTittle}</a>
										</h4>
										<div class="statusBtn ${jobdetails.status}">
											${jobdetails.status}</div>
									</div>
									<div class="list-price">
										<ul class="list-group list-group-horizontal">
											<li class="me-2"><img src="employer/img/year.svg">
												${jobdetails.minExp}-${jobdetails.maxExp}&nbsp;years</li>
											<li class="me-2"><img src="employer/img/inr.svg">
												${jobdetails.salaryFigureMin}-${jobdetails.salaryFigureMax}
											</li>
											<li class="me-2"><img src="employer/img/map.svg">
												${jobdetails.jobloc}</li>
										</ul>
									</div>
									<div class="candidatestxtbox">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-6">
												<div class="candidatestxt">
													<h4>${jobdetails.candidateApplied}</h4>
													<p>Applied</p>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-6">
												<div class="candidatestxt">
													<h4>${jobdetails.candidateInterview}</h4>
													<p>Interview</p>
												</div>
											</div>
										</div>
									</div>

									<div class="postedby">
										<div
											class="postedtxt d-flex justify-content-between align-items-center">
											<p>
												Posted by <span>${jobdetails.startDate}</span>
											</p>
											<%-- <p>
												Expired at <span>${jobdetails.endDate}</span>
											</p> --%>
										</div>
										<%-- <div class="progress " role="progressbar"
											aria-label="Basic example" aria-valuenow="25"
											aria-valuemin="0" aria-valuemax="100">
											<div class="progress-bar ${jobdetails.status}"
												style="width: ${jobdetails.statusBar}%"></div>
										</div> --%>
									</div>

									<div class="createdby">
										<div
											class="postedtxt d-flex justify-content-between align-items-center">
											<p>
												Created by <span>${jobdetails.createdBy}</span>
											</p>
											<ul class="list-group list-group-horizontal">
												<li class="list-group me-3" data-bs-toggle="tooltip" onclick="insertjobpost(${jobdetails.id})"
													data-bs-placement="top" data-bs-title="Copy"><a
													><img src="employer/img/copy.svg"> </a></li>
												<li class="list-group me-3" data-bs-toggle="tooltip"
													data-bs-placement="top" data-bs-title="Edit" onclick="updateJobpost(${jobdetails.id})"><a
													><img src="employer/img/edit3.svg"> </a></li>
												<li class="list-group me-3" data-bs-toggle="tooltip"
													data-bs-placement="top" data-bs-title="View" onclick="findNewroute('/managejobinfo',${jobdetails.id})" ><a
													href="#"><img src="employer/img/view3.svg"> </a></li>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>

						<p id="noResults" style="display: none; color: red;">No
							results found</p>

					</ul>
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
	<script src="employer/js/popper.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/nice-select.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="js/commonvalidation.js"></script>
	<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    $(document).ready(function () {
      $('select').niceSelect();
    });
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
      setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);
    });

    $(".my-textbox").keyup(function (e) {
      var val = $(this).val();
      filter(val.toLowerCase());
    });


    $(document).ready(function () {
      $('#searchBox').on('keyup', function () {
        var value = $(this).val().toLowerCase();
        var hasMatch = false;

        $('#itemListBox  li').filter(function () {
          var match = $(this).text().toLowerCase().indexOf(value) > -1;
          $(this).toggle(match);
          if (match) hasMatch = true;
        });

        $('#noResults').toggle(!hasMatch);
      });
    });

    $(document).ready(function () {
      $('#searchSelectBox').on('keyup', function () {
        var searchTerm = $(this).val().toLowerCase();

        $('#mySelect option').each(function () {
          var text = $(this).text().toLowerCase();
          $(this).toggle(text.indexOf(searchTerm) > -1);
        });
      });
    });

    function updateJobpost(id)
    {
    	let form = document.createElement('form');
        form.method = 'POST'; 
        form.action = '/editjobpost'; 

        let input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'id';
        input.value = id;
        form.appendChild(input);
        
        sessionStorage.setItem("jobPostName", "editjobpost");

        document.body.appendChild(form);
        form.submit(); 
    }
    
    function insertjobpost(id)
    {
    	let form = document.createElement('form');
        form.method = 'POST'; 
        form.action = '/editjobpost'; 

        let input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'id';
        input.value = id;
        form.appendChild(input);
        
        sessionStorage.setItem("jobPostName", "copyjobpost");

        document.body.appendChild(form);
        form.submit(); 
    }
    
    function findNewroute(value,id)
    {
    	let form = document.createElement('form');
        form.method = 'POST'; 
        form.action = value; 

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