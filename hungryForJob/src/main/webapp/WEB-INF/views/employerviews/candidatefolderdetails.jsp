<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String userId = (String) session.getAttribute("userId");
String companyId= (String) session.getAttribute("companyId");
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
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="employerHeader.jsp"%> 
	<!-- ======= Header ======= -->
	<!-- End Header -->
	<main id="main">
		<section class="section-inner advancedsearch-section ">
			<div class="container">
				<div class="row ">
					<div class="col-xl-12 col-lg-12 col-md-12">
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
												<c:when test="${not empty item.image}">
													<img src="data:image/jpeg;base64,${item.image}" alt="Image">
												</c:when>
												<c:otherwise>
													<img src="/employer/img/profile-img.jpg">
												</c:otherwise>
											</c:choose>
												</div>
												<div class="profilTxt">
													<h4>
														<a href="#"
															onclick="isPhoneNumber(${item.id},'name','name')">${item.name}
														</a> <span class="check1">
															<c:if
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
															${item.currentLocation}&nbsp;</li>
														<li><img src="employer/img/years.svg"> ${item.totalexperience} years</li>
														<li><img src="employer/img/salary.svg">${item.expectedCtc}</li>
													</ul>
												</div>
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
															<span> ${item.courseName}</span> <span >${item.instituteNames}</span>
															<span>${item.courseEndYear}</span>
														</div>
													</div>
													<div class="detail">
														<div class="item1">Pref. locations</div>
														<div class="item2">
															<span> ${item.cityNames}</span>
															<!-- <span> <a href="#">+3 more </a></span> -->
														</div>
													</div>
													<div class="detail">
														<div class="item1">Key skills</div>
														<div class="item2">
															<span id="keySkills"> ${item.skillsNames} </span>
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
															onclick="isPhoneNumber(${item.id},'phoneNumber_${item.id}','viewPhoneNumber__${item.id}')">
															<i class="bi bi-eye"></i> <span
																id="viewPhoneNumber__${item.id}"
																class="viewphones"></span>
														</button>
														<p>
															Verified <span> email </span>
														</p>
														<span id="phoneNumber_${item.id}"
															class="hidephoneno">${item.mobileNumber}</span>
														<!-- <button class="btnphone">
															<i class="bi bi-telephone"></i> Call candidate
														</button> -->
													</div>
												</div>
											</div>
											<div class="line2"></div>
											<div class="similardetail d-flex justify-content-between">
												<span> <a href="#" target="_blank"
													title="Similar Profiles"><!-- 1,007 similar profiles --></a></span>
												<div class="">
													<span> <a href="#" title="Comment"> Comment</a></span> <!-- <span
														class="pipe"> | </span> --> <span> <!-- <a href="#"
														data-bs-toggle="tooltip" data-bs-placement="top"
														data-bs-custom-class="custom-tooltip"
														data-bs-title="Save the profile to view it later"
														title="Save"> <i class="bi bi-bookmark"></i> Save
													</a></span> -->
												</div>
											</div>
										</div>
									</div>
									<div class="download-list">
										<ul>
											<li><i class="bi bi-eye"></i> ${item.candidateViews}</li>
											<li><i class="bi bi-download"></i>${item.candidateDownload}</li>
											<!-- <li><i class="bi bi-paperclip"></i>CV</li> -->
										</ul>
										<ul>
											<!-- <li>Modified in last: 12 Oct 2024</li> -->
											<li>Active in last: ${item.lastActiveDate}</li>
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
	<%@include file="employerfooter.jsp"%> 
	<!-- End Footer -->

	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/popper.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/nice-select.min.js"></script>
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="employer/js/candidatefolderdetails.js"></script>
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
      
      $('#phoneNumber').hide();
      $('#viewPhoneNumber').text("View phone number");
      $('.hidephoneno').hide();
      $('.viewphones').text("View phone number");
    });
    
    $(document).ready(function () {
      $('select').niceSelect();
    });

    $(document).ready(function () {
      setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);

    });

  </script>

	<script>
    // if < then 768
    // mobile sorting overlay jquery start
    const mediaQuerymobile = window.matchMedia("(max-width: 767px)");

    if (mediaQuerymobile.matches) {
      $(".sort-drop").on("	show.bs.dropdown", function () {
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

    var userId="<%=userId%>";
    var companyId="<%=companyId%>";
    
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
</body>

</html>