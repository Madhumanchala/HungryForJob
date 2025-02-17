<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="jakarta.tags.core"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
String username = (String) session.getAttribute("username");
String workstatus = (String) session.getAttribute("workStatus");
String candidateId = (String) session.getAttribute("candidateId");
%>
<!DOCTYPE html>
<html>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet">
<link href="css/toastr.css" rel="stylesheet" />
</head>
<body>
	<div class="loader"><img src="employer/img/loader.gif"></div> 

<%@include file="header1.jsp"%>
	<main id="main">
		<!-- ======= register  Section ======= -->
		<section id="worksection" class="worksection  ">
		<input type="hidden" id="candidateId" value="<%= candidateId %>">
			<div class="container">
				<div class="row">
					<div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 offset-xl-2 ">
						<div id="stepindicator" role="group">

							<ol>
								<li class="stepvisited"><span> Basic details </span></li>
								  <%
								if (workstatus != null && workstatus.equals("exp")) {
								%> 
								<li class="stepvisited"><span>Work </span></li>
								<li class="stepvisited"><span>Employment </span></li>
								 <%
								}
								%>
								<li aria-current="true"><span>Education </span></li>
								<li><span>Last step </span></li>
							</ol>

						</div>
						<div class="card-content register-card work-card">
							<div class=" row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<h2>Education Details</h2>
									<p>Education details are academic summary of a person.</p>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 highest_qualification">
									<div class="form-group">
										<label for="highest_qualification" class="form-label required">Highest
											Qualification/ Degree currently pursuing</label> <select
											class="selet2Single form-control" id="degree" name="degree"
											style="width: 100%" onchange="getCourse(this.value)">
											<option value="" disabled selected>Select</option>
											<c:forEach items="${highestQualification}" var="qualification">
												<option value="${qualification.id}">${qualification.name}</option>
											</c:forEach>
										</select> <span class="degree_error errorfield"></span>
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 courses_div"
									style="display: none">
									<div class="form-group">
										<label for="currentLocation" class="form-label required">Course</label>
										<select name="course" class="selet2Single form-control"
											id="course" name="course" required style="width: 100%" onchange="getSpecialization(this.value)">
											<option value="" disabled selected>Select</option>
											<!-- <option value="not_in_list">Not in the list</option> -->
										</select> <span class="course_error errorfield"></span>
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 add_new_course"
									style="display: none;">
									<div class="form-group">
										<label for="new_course">Add New Course</label> <input
											type="text" id="new_course" class="form-control">
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 specialization_div"
									style="display: none">
									<div class="form-group">
										<label for="specialization" class="form-label required">Specialization</label>
										<select class="selet2Single form-control" id="specialization"
											name="specialization" style="width: 100%" required onchange="getcourseType()">
											<option value="" disabled selected>Select</option>
											<!-- <option value="not_in_list">Not in the list</option> -->
										</select> <span class="specialization_error errorfield"></span>
									</div>
								</div>

								<div
									class="col-lg-12 col-md-12 col-sm-12 add_second_new_specialization"
									style="display: none;">
									<div class="form-group">
										<label for="new_specialization">Add New Specialization</label>
										<input type="text" id="new_specialization"
											class="form-control">
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 course_type_div"
									style="display: none">
									<div class="form-group">
										<label for="course_type" class="form-label required">Course
											Type</label> <select name="course_type"
											class="selet2Single form-control" id="course_type" required
											style="width: 100%" onchange="getCourseStartYear()">
											<option value="" disabled selected>Select</option>
											<c:forEach items="${courseType}" var="courseType">
												<option value="${courseType.id}">${courseType.name}</option>
											</c:forEach>
										</select> <span class="course_type_error errorfield"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 course_start_date"
									style="display: none">
									<div class="form-group">
										<label for="course_start_date" class="form-label required">Course
											Start Year </label> <select class="selet2Single form-control"
											id="course_start_date" name="course_start_date" required
											style="width: 100%">
											<option value="" disabled selected>Select</option>
											<c:forEach var="i" begin="${dateOfBirth}" end="${currentYear}">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select> <span class="course_start_date_error errorfield"></span>
										<!-- <input type="date" name="start_date" id="start_date" class="form-control"> -->
									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-sm-6 course_end_date"
									style="display: none">
									<div class="form-group">
										<label for="course_end_date" class="form-label required" id="yearType"> </label> <select class="selet2Single form-control"
											id="course_end_date" name="course_end_date" required
											style="width: 100%">
											<option value="" disabled selected>Select</option>
											<c:forEach var="i" begin="${dateOfBirth}" end="${currentYear}">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select> <span class="course_end_date_error errorfield"></span>
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 uni_input"
									style="display: none">
									<div class="form-group">
										<label for="university" class="form-label required">University/
											Institute</label> <select name="uni"
											class="selet2Single form-control" id="uni" required
											style="width: 100%" onchange="getGradingSystem(this.value)">
											<option value="" disabled selected>Select</option>
											<c:forEach items="${institute}" var="institute">
												<option value="${institute.id}">${institute.name}</option>
											</c:forEach>
											<option value="not_in_list">Not in the list</option>
										</select> <span class="uni_error errorfield errorfield"></span>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 add_new_university"
									style="display: none;">
									<div class="form-group">
										<label for="new_university">Add New
											University/Institute</label> <input type="text" id="new_university"
											class="form-control">
										<span class="add_newuniversity_error  errorfield"></span>
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 grading_system_input"
									style="display: none">
									<div class="form-group">
										<label for="specialization" class="form-label required">Grading
											System</label> <select name="grading"
											class="selet2Single form-control" id="grading"
											style="width: 100%" onchange="getScaling(this.value)">
											<option value="" disabled selected>Select</option>
											<c:forEach items="${grading}" var="grading">
												<option value="${grading.id}">${grading.name}</option>
											</c:forEach>
											<!-- <option value="not_in_list">Not in the list</option> -->
										</select> <span class="grading_system_error errorfield"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-12 marksInput"
									style="display: none;">
									<div class="form-group">
										<label for="marks"><span class="second_grade_input_text_tewelve" id="markslabel"></span></label> 
										<input type="text" id="marks" name="marks"
											class="form-control" maxlength="100"> <span
											class="marks_error errorfield"></span>
									</div>
								</div>
								
								<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="form-group d-flex justify-content-end nextback">
										<button type="button" class="btns"
											id="educationRegisterSubmit" onclick="saveEducationDetails()">Next</button>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
	</main>
	<%@include file="footer.jsp"%>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/toastr.min.js" type="text/javascript"></script>
	<script src="js/select2.min.js" type="text/javascript"></script>
	<script src="js/Education.js" type="text/javascript"></script>
	<script>
	 $(document).ready(function() {
			 setTimeout(function () {
	    	        $('body').addClass('loaded');
	    	      }, 1000);
		}); 
	</script>
</body>
</html>