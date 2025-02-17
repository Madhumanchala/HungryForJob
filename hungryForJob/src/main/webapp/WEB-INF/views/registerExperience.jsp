<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<%
String username = (String) session.getAttribute("username");
String candidateId = (String) session.getAttribute("candidateId");
String workStatus = (String) session.getAttribute("workStatus");
%>
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
</head>
<body>
	<div class="loader"><img src="employer/img/loader.gif"></div> 
	<%@include file="header1.jsp"%>
	<main id="main">
		<!-- ======= register  Section ======= -->
		<section id="worksection" class="worksection  ">
			<div class="container">
				<input type="hidden" id="last_insert_id" value="">
				<div class="row">
					<div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 offset-xl-2 ">
						<div id="stepindicator" role="group">
							<ol>
								<li class="stepvisited"><span> Basic details </span></li>
								<li aria-current="true"><span>Work </span></li>
								<li><span>Employment </span></li>
								<li><span>Education </span></li>
								<li><span>Last step </span></li>
							</ol>
						</div>

						<div class="card-content register-card work-card ">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 mt-2">
									<h2>Career Details</h2>
									<p>Career details are career summary of a person.</p>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label for="currentCTC" class="form-label required">Current
											CTC (In Rupees) </label> <input type="number" name="currentCTC"
											id="current_ctc" class="form-control"
											placeholder="Enter Current CTC" maxlength="8" min="1"
											max="99999999" required> <span class="errorfield"
											id="current_ctc_error"></span> <span class="inRuppes"
											id="inRuppes"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label for="expectedCTC" class="form-label required">Expected
											CTC (In Rupees) </label> <input type="number" name="expectedCTC"
											id="expected_ctc" class="form-control"
											placeholder="Enter Expected CTC" maxlength="8" min="1"
											max="99999999" required> <span class="errorfield"
											id="expected_ctc_error"></span><span class="expectedCtcRuppes"
											id="expectedCtcRuppes"></span>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label for="pincode" class="form-label required">Enter
											the PinCode </label> <input type="text" name="pincode" id="pincode"
											class="form-control" placeholder="Enter pincode" maxlength="6" required>
										<span class="pincode_error errorfield" id="pincode_error"></span>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12"
									id="statelocationModal">
									<div class="form-group">
										<label for="stateLocation" class="form-label required">State</label>
										<input type="text" name="stateLocation" id="stateLocation"
											class="form-control" placeholder="Enter the State"> <span
											class="errorfield" id="state_location_error"
											style="color: red"></span>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12"
									id="currentlocationModal">
									<div class="form-group">
										<label for="currentLocation" class="form-label required">Current
											Location</label>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label class="form-label required">I want WFH Only</label>
										<div class="serving">
											<ul>
												<li><input type="radio" class="btn-check wfh-class"
													name="wfh-option" id="wfh-yes" style="margin: 5px"
													autocomplete="off" value="YES"> <label class="btn"
													for="wfh-yes"><span>Yes</span></label></li>
												<li><input type="radio" class="btn-check wfh-class"
													name="wfh-option" id="wfh-no" style="margin: 5px"
													autocomplete="off" value="NO"> <label class="btn"
													for="wfh-no"><span>No</span></label></li>
											</ul>
											<span class="errorfield" id="wfherror" style="color: red"></span>
										</div>
									</div>
								</div>


								<div class="col-lg-6 col-md-6 col-sm-6 ready_to_relocate">
									<div class="form-group">
										<label class="form-label required">Ready to Relocate</label>
										<div class="serving">
											<ul>
												<li><input type="radio"
													class="btn-check ready_to_relocate_class"
													name="relocate-option" id="relocate-yes"
													style="margin: 5px" autocomplete="off"> <label
													class="btn" for="relocate-yes" value="YES"><span>Yes</span></label></li>
												<li><input type="radio"
													class="btn-check ready_to_relocate_class"
													name="relocate-option" id="relocate-no" style="margin: 5px"
													autocomplete="off" value="NO"> <label class="btn"
													for="relocate-no"><span>No</span></label></li>
											</ul>
											<span class="errorfield" id="relocateerror"
												style="color: red"></span>
										</div>
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 pref_location" id="prefered_location1">
									<div class="form-group">
										<label for="Preferredlocations" class="form-label required">Preferred
											Work locations (Maximum 5)</label> <select
											class="selet2Multiple form-control" id="pref_location"
											name="" multiple="multiple">
											<option value="">Select</option>
											<c:forEach items="${allCities}" var="allCities">
												<option value="${allCities.id}">${allCities.name}</option>
											</c:forEach>
										</select><span class="errorfield" id="pref_location_error"
											style="color: red"></span>
									</div>
								</div>

								<div class="clearfix"></div>


								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label class="form-label required">Serving Notice
													Period</label>
												<div class="serving">
													<ul>
														<li><input type="radio"
															class="btn-check currently_working_class"
															name="notice-period-option" id="notice-period-yes"
															style="margin: 5px" autocomplete="off" value="YES">
															<label class="btn" for="notice-period-yes"><span>Yes</span></label>
														</li>
														<li><input type="radio"
															class="btn-check currently_working_class"
															name="notice-period-option" id="notice-period-no"
															style="margin: 5px" autocomplete="off" value="NO">
															<label class="btn" for="notice-period-no"><span>No</span></label>
														</li>
													</ul>
													<span class="errorfield" id="servingnNoticePeriodError"
														style="color: red"></span>
												</div>
											</div>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-6 notice_period"
											style="display: none;">
											<div class="form-group">
												<label for="noticePeriod" class="form-label required">Notice
													Period(In days)</label> <input type="number" name="noticePeriod"
													id="notice_period" class="form-control"
													placeholder="Enter Notice Period"><span
													class="errorfield" id="noticePeriodDaysError"
													style="color: red"></span>
											</div>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-6 last_working_date"
											style="display: none;">
											<div class="form-group">
												<label for="lastWorkingDate" class="form-label required">Last
													Working Date </label> <input type="text" name="lastWorkingDate"
													id="last_working_date" class="form-control"
													placeholder="DD/MM/YYYY"><span
													class="errorfield" id="lastWorkingDayError"
													style="color: red"></span>
											</div>
										</div>

									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-6">
											<div class="form-group required">
												<label class="form-label required">Offer in Hand</label>
												<div class="serving">
													<ul>
														<li><input type="radio"
															class="btn-check offer_in_hand_class" name="offer-option"
															id="offer-yes" style="margin: 5px" autocomplete="off"
															value="YES"> <label class="btn" for="offer-yes"><span>Yes</span></label></li>
														<li><input type="radio"
															class="btn-check offer_in_hand_class" name="offer-option"
															id="offer-no" style="margin: 5px" autocomplete="off"
															value="NO"> <label class="btn" for="offer-no"><span>No</span></label></li>
													</ul>
													<span class="errorfield" id="offerinhanderror"
														style="color: red"></span>
												</div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 offered_ctc"
											style="display: none;">
											<div class="form-group">
												<label for="noticePeriod" class="form-label required">Offered
													CTC</label> <input type="text" name="offered_ctc" id="offered_ctc"
													maxlength="12" min="1" max="99999999"
													class="form-control" placeholder="Enter Offered CTC">
												<span class="errorfield" id="offeredCtcError"
													style="color: red"></span>
												<span class="offerCtc" id="offerCtc"></span>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 joining_date"
											style="display: none;">
											<div class="form-group">
												<label for="joining_date" class="form-label required">Joining
													Date </label> <input type="text" name="joining_date"
													id="joining_date" class="form-control datepicker"
													placeholder="Enter DD/MM/YYYY"><span
													class="errorfield" id="joindateError" style="color: red"></span>
											</div>
										</div>

									</div>

								</div>
								<div class="col-lg-12 col-md-12 col-sm-12">
									<h4>Total Experience</h4>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<label for="total_experience" class="form-label required">Year</label>
									<div class="form-group">

										<select class="selet2Single form-control wide"
											name="total_exp_years" id="total_exp_years">
											<option value="" class="experience">Select Year</option>
											<c:forEach var="i" begin="0" end="40">
												<option value="${i}">${i} Year</option>
											</c:forEach>

										</select> <span class="errorfield" id="total_exp_years_error"
											style="color: red"></span>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<label for="total_experience" class="form-label required">Month</label>
									<div class="form-group">
										<select class="selet2Single form-control wide"
											name="total_exp_months" id="total_exp_months">
											<option value="" class="experience">Select Month	</option>
											<c:forEach var="i" begin="0" end="11">
												<option value="${i}">${i} Month</option>
											</c:forEach>

										</select> <span class="errorfield" id="total_exp_months_error"
											style="color: red"></span>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12">
									<h4>Key Skills</h4>
								</div>
								<div id="skillsContainerParent">
									<div id="skillsContainer" class="skillsContainer row">

										<div class="col-lg-4 col-md-4 col-sm-6">
											<label for="additional_skills" class="form-label required">
												Skill </label>
											<div class="form-group">
												<select class="selet2Single form-control skillset_dropdown"
													id="additional_skillsets" name="additional_skills" required>
													<option value="">Select skill</option>
													<c:forEach items="${technicalSkills}" var="skill">
														<option value="${skill.id}">${skill.name}</option>
													</c:forEach>
												</select> <span class="skillset_error errorfield" style="color: red"></span>
											</div>
										</div>

										<div class="col-lg-4 col-md-4 col-sm-6">
											<label for="skillExp" class="form-label required">Year</label>
											<div class="form-group">

												<select
													class="selet2Single form-control wide skillset_dropdown skillExp"
													name="skillExp" id="skillExp">
													<option value="" class="experience">Select Year</option>

												</select> <span class="errorfield skillExp_error" style="color: red"></span>
											</div>
										</div>


										<div class="col-lg-4 col-md-4 col-sm-6">
											<label for="months" class="form-label required">
												Month </label>
											<div class="form-group">
												<select
													class="selet2Single form-control wide skillset_dropdown skillExpMonth"
													name="skillExpMonth" id="skillExpMonth">
													<option value="" class="experience">Select Month</option>
												</select> <span class="errorfield skillExpMonth_error"
													style="color: red"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-6 col-sm-6">
											<button type="button"
												class="btn btn-primary btn-md addSkillSection">+</button>
											<button type="button"
												class="btn btn-danger btn-md deleteSkillSection">-</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group d-flex justify-content-end nextback">
									<button type="button" class="btns"
										onclick="workdetailsSubmit()" id="experienceRegisterSubmit">Next</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<%@include file="toaster.jsp"%>
	</main>
	<div id="sessionData"
     data-username="<%= username %>"
     data-candidateid="<%= candidateId %>"
     data-workstatus="<%= workStatus %>">
	</div>
	<%@include file="footer.jsp"%>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/select2.min.js" type="text/javascript"></script>
	<script src="js/registerExperience.js"></script>
	<script>
		$(".selet2Multiple").select2({
			placeholder : "Please Select",
			maximumSelectionLength : 5,
			allowClear : true
		});
		$(".selet2Single").select2({});
		
		function fetchSkills(callback) {
			// Ensure technicalSkillsString is a valid JSON string
			var technicalSkillsString = [
				<c:forEach items="${technicalSkills}" var="item" varStatus="status">
					{
						"id": "${item.id}",
						"name": "${item.name}"
		            }
					<c:if test="${!status.last}">,</c:if>
				</c:forEach>
			];
			populateSkills($('.skillsContainer').last(), technicalSkillsString);
			console.log("======", technicalSkillsString);

			$('.skillsContainer select').select2();

			// Execute the callback if provided
			if (typeof callback === 'function') {
				callback(technicalSkillsString);
			}
		}
		 $(document).ready(function() {
			/* $('.loader').show(); */
			 $("#prefered_location1").hide();
			 setTimeout(function () {
	    	        $('body').addClass('loaded');
	    	      }, 1000);
		}); 
	</script>

</body>
</html>