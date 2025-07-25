<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/richtext.min.css" rel="stylesheet" />
<link href="employer/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet">
</head>

<body>
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="employerHeader.jsp"%>
	<%@include file="toaster.jsp"%>
	<main id="main">
		<section class="section-inner sign-bg postNewJob ">
			<div class="container">
				<div class="row ">
					<div class="col-xl-8 col-lg-8 col-md-8  ">
						<div class="card-register">

							<form autocomplete="off">
								<h3>Edit Internship Details</h3>
								<div class="card-registerinner  ">
									<div class="row">
										<div class="col-lg-12 col-md-12 col-sm-12">
											<h5>Please select which of job you want post</h5>
											<div class="form-group1 ">
												<label for="company" class="required">Job type </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="jobtype" id="internship" value="Internship" checked>
															<label class="btn" for="internship"><span>Internship
															</span> </label></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="Jobtitle" class="required">Job title</label> <input
													type="text" class="form-control" id="Jobtitle"
													placeholder="Enter a clear and specific title to get better responses"
													onkeyup="internTittleModal('internJobTittle',this.value)"
													value="${editjobpostdetails.jobTittle}"> <span
													class="errors" id="internJobTittle"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group1 ">
												<label for="company" class="required">Employment
													type </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="employmentType" id="fulltime" value="FULLTIME"
															onchange="internEmployModal('internEmployementType',this.value)"
															<c:if test="${editjobpostdetails.employmentType == 'FULLTIME'}">checked</c:if>>
															<label class="btn" for="fulltime"><span>Full
																	time</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="employmentType" id="parttime" Value="PARTTIME"
															onchange="internEmployModal('internEmployementType',this.value)"
															<c:if test="${editjobpostdetails.employmentType == 'PARTTIME'}">checked</c:if>>
															<label class="btn" for="parttime"><span>Part
																	time </span> </label></li>
													</ul>
												</div>
												<span class="errors" id="internEmployementType"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group1 ">
												<label for="company" class="required">Work Mode </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="workMode" id="inOffice" value="INOFFICE"
															onchange="internWorkModal('internModeType',this.value)"
															<c:if test="${editjobpostdetails.workMode == 'INOFFICE'}">checked</c:if>>
															<label class="btn" for="inOffice"><span>In
																	Office</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="workMode" id="Hybrid" value="HYBRID"
															onchange="internWorkModal('internModeType',this.value)"
															<c:if test="${editjobpostdetails.workMode == 'HYBRID'}">checked</c:if>>
															<label class="btn" for="Hybrid"><span>Hybrid
															</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="workMode" id="Remote" value="REMOTE"
															onchange="internWorkModal('internModeType',this.value)"
															<c:if test="${editjobpostdetails.workMode == 'REMOTE'}">checked</c:if>>
															<label class="btn" for="Remote"><span>Remote
															</span> </label></li>
													</ul>
												</div>
												<span class="errors" id="internModeType"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="internshipDescription" class="required">Internship
													description</label>
												<textarea class="internshipDescription"
													name="internshipDescription" id="internDescription">${editjobpostdetails.jobDescription}</textarea>
												<span class="errors" id="error_internDescription"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="perksbenefits" class="required">Perks
													and benefits</label> <select
													class="form-select form-control selet2Multiple"
													id="perksbenefits" multiple="multiple"
													onchange="hideModal('internPerksAndBenefits_error')">

													<option value="">Select</option>

													<c:forEach items="${perksAndBenfists}"
														var="perksAndBenfits">
														<c:set var="isSelected" value="false" />
														<c:forEach items="${savedperksList}" var="savedPerk">
															<c:if test="${savedPerk == perksAndBenfits.name}">
																<c:set var="isSelected" value="true" />
															</c:if>
														</c:forEach>
														<option value="${perksAndBenfits.id}"
															<c:if test="${isSelected}">selected</c:if>>
															${perksAndBenfits.name}</option>
													</c:forEach>

												</select> <span class="errors" id="internPerksAndBenefits_error"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="educationalQualification" class="required">Educational
													qualification </label> <select
													class="form-select form-control selet2Multiple"
													id="educationalQualification" multiple="multiple"
													onchange="hideModal('internEducationQualification')">
													<option value="">Select</option>
													<c:forEach items="${education}" var="education">
														<option value="${education.id}"
															<c:if test="${education.id == editjobpostdetails.jobPostEducation}">selected</c:if>>${education.name}</option>
													</c:forEach>
												</select> <span class="errors" id="internEducationQualification"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<%-- Convert comma-separated string into array --%>
											<c:set var="selectedSkillIds"
												value="${fn:split(editjobpostdetails.jobPostkeySkills, ',')}" />
											<div class="form-group">
												<label for="keySkills" class="required">Key skills </label>
												<select class="form-select form-control selet2Multiple"
													id="keySkills" multiple="multiple"
													onchange="internKeySkills('internKeySkills')">
													<option value="">Select</option>
													<c:forEach items="${keySkills}" var="keySkills">
														<c:set var="isSelected" value="false" />
														<c:forEach items="${selectedSkillIds}" var="selectedId">
															<c:if test="${selectedId == keySkills.id}">
																<c:set var="isSelected" value="true" />
															</c:if>
														</c:forEach>

														<option value="${keySkills.id}"
															<c:if test="${isSelected}">selected</c:if>>
															${keySkills.name}</option>
													</c:forEach>
												</select> <span class="errors" id="internKeySkills"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<%-- Convert comma-separated string into array --%>
											<c:set var="jobloc"
												value="${fn:split(editjobpostdetails.jobloc, ',')}" />

											<div class="form-group">
												<label for="internshipLocation" class="required">Internship
													location </label> <select
													class="form-select form-control selet2Multiple"
													id="internshipLocation" multiple="multiple"
													onchange="internLocationModal('internLocation')">
													<option value="">Select</option>
													<c:forEach items="${location}" var="location">
														<c:set var="isSelected" value="false" />
														<c:forEach items="${jobloc}" var="locationId">
															<c:if test="${locationId == location.id}">
																<c:set var="isSelected" value="true" />
															</c:if>
														</c:forEach>

														<option value="${location.id}"
															<c:if test="${isSelected}">selected</c:if>>${location.name}</option>
													</c:forEach>
												</select> <span class="errors" id="internLocation"></span>
												<div class="form-check relocate">
													<input class="form-check-input" type="checkbox"
														value="${editjobpostdetails.internReadyToReLocate}"
														id="includeCandidates"
														<c:if test="${editjobpostdetails.internReadyToReLocate}">checked</c:if>>
													<label class="form-check-label" for="includeCandidates">
														Include candidates ready to relocate to the above location
													</label>
												</div>
											</div>
										</div>


										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="internshipduration" class="required">Internship
													duration </label> <select
													class="form-select form-control selet2Single"
													id="internshipduration"
													onchange="hideModal('internDuration')">
													<option value="">Select</option>
													<option value="1"
														<c:if test="${editjobpostdetails.internDuration == '1'}">selected</c:if>>1
														month</option>
													<option value="2"
														<c:if test="${editjobpostdetails.internDuration == '2'}">selected</c:if>>2
														months</option>
													<option value="3"
														<c:if test="${editjobpostdetails.internDuration == '3'}">selected</c:if>>3
														months</option>
													<option value="4"
														<c:if test="${editjobpostdetails.internDuration == '4'}">selected</c:if>>4
														months</option>
													<option value="5"
														<c:if test="${editjobpostdetails.internDuration == '5'}">selected</c:if>>5
														months</option>
													<option value="6"
														<c:if test="${editjobpostdetails.internDuration == '6'}">selected</c:if>>6
														months</option>
													<option value="No Fixed"
														<c:if test="${editjobpostdetails.internDuration == 'No Fixed'}">selected</c:if>>No
														fixed duration</option>
												</select> <span class="errors" id="internDuration"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group1 ">
												<label for="company" class="required">When would the
													internship start? </label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="internCheck" id="internshipStart"
															value="SpecificDate"
															onchange="changeinternshipStartDate('internStart')"
															<c:if test="${editjobpostdetails.internStartType == 'SpecificDate'}">checked</c:if>>
															<label class="btn" for="internshipStart"><span>On
																	a specific date</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="internCheck" id="specificstartdate"
															value="NoSpecificeDate"
															onchange="changeinternshipStartDate('internStart')"
															<c:if test="${editjobpostdetails.internStartType == 'NoSpecificeDate'}">checked</c:if>>
															<label class="btn" for="specificstartdate"><span>No
																	specific start date </span> </label></li>
													</ul>
												</div>
												<span class="errors" id="internStart"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12"
											id="startDateSpecify">
											<div class="form-group">
												<label for="specifystartdate" class="required">Please
													specify the start date</label> <input type="text"
													class="form-control datepicker" id="specifystartdate"
													placeholder="DD/MM/YYYY"
													value="${editjobpostdetails.internStartDateApply}"
													onchange="hideModal('internStartDate')"> <span
													class="errors" id="internStartDate"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12"
											id="willStartWithin">
											<div class="form-group1">
												<label for="specifystartdate" class="required">Will
													start within</label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="startwithin" id="01month" value="0-1 month"
															onchange="hideModal('internStartWithIn_error')"
															<c:if test="${editjobpostdetails.internWillStartWithin == '0-1 month'}">checked</c:if>>
															<label class="btn" for="01month"><span>0-1
																	month</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="startwithin" id="13months" value="1-3 month"
															onchange="hideModal('internStartWithIn_error')"
															<c:if test="${editjobpostdetails.internWillStartWithin == '1-3 month'}">checked</c:if>>
															<label class="btn" for="13months"><span>1-3
																	months</span> </label></li>
														<li><input type="radio" class="btn-check"
															name="startwithin" id="36months" value="3-6 month"
															onchange="hideModal('internStartWithIn_error')"
															<c:if test="${editjobpostdetails.internWillStartWithin == '3-6 month'}">checked</c:if>>
															<label class="btn" for="36months"><span>3-6
																	months </span> </label></li>
													</ul>
													<span class="errors" id="internStartWithIn_error"></span>
												</div>
											</div>
										</div>


										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="lastdate" class="required">Last date to
													apply</label> <input type="text" class="form-control datepicker"
													id="lastdate" placeholder="DD/MM/YYYY"
													value="${editjobpostdetails.internLastDateApply}"
													onchange="hideModal('internLastDate')"> <span
													class="errors" id="internLastDate"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group1 ">
												<label for="company" class="required">Are you
													offering a stipend with the internship?</label>
												<div class="formchecks">
													<ul>
														<li><input type="radio" class="btn-check"
															name="internshipYesNo" id="internshipYes" value="YES"
															onchange="OnOffStipend('internStipend_error')"
															<c:if test="${editjobpostdetails.internStipendConfirm == 'YES'}">checked</c:if>>
															<label class="btn" for="internshipYes"><span>Yes</span>
														</label></li>
														<li><input type="radio" class="btn-check"
															name="internshipYesNo" id="internshipNo" value="NO"
															onchange="OnOffStipend('internStipend_error')"
															<c:if test="${editjobpostdetails.internStipendConfirm == 'NO'}">checked</c:if>>
															<label class="btn" for="internshipNo"><span>No
															</span> </label></li>
													</ul>
												</div>
												<span class="errors" id="internStipend_error"></span>
											</div>
										</div>

										<div class="col-lg-8 col-md-12 col-sm-12  " id="stipendOnOff">
											<div class="form-group">
												<div class="input-group ">
													<span class="input-group-text">₹ (INR)</span> <input
														type="text" class="form-control"
														value="${editjobpostdetails.internStipendMoney}"
														placeholder="Enter Min Salary"
														onkeyup="hideModal('internMinSalary')" id="internSalary">
												</div>
												<span class="errors" id="internMinSalary"></span>
											</div>
										</div>

										<div class="col-lg-8 col-md-12 col-sm-12"
											id="internBetterResponse">
											<div class="form-group">
												<div class="input-group ">
													<span class="input-group-text "><i
														class="bi bi-info-circle-fill me-1"></i> Internships with
														a stipend get better responses</span>
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="Industry" class="required"> Industry </label> <select
													class="form-select form-control selet2Single "
													id="Industry"
													onchange="internIndustryModal('internIndustry',this.options[this.selectedIndex].text)">
													<option value="">Select</option>
													<c:forEach items="${jobCategories}" var="jobCategories">
														<option value="${jobCategories.id}"
															<c:if test="${jobCategories.id == editjobpostdetails.companyIndustry}">Selected</c:if>>${jobCategories.name}</option>
													</c:forEach>
												</select> <span class="errors" id="internIndustry"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="department" class="required">Department
												</label> <select class="form-select form-control selet2Single"
													id="department"
													onchange="changehideModalRole('internDepartment')">
													<option value="">Select</option>
													<c:forEach items="${department}" var="department">
														<option value="${department.id}"
															<c:if test="${department.id == editjobpostdetails.departmentId}">Selected</c:if>>${department.name}</option>
													</c:forEach>
												</select> <span class="errors" id="internDepartment"></span>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="role " class="required">Role </label> <select
													class="form-select form-control selet2Single"
													id="internRole" onchange="hideModal('internRole_error')">
													<option value="">Select</option>
													<option value="${editjobpostdetails.roleName}" selected>${editjobpostdetails.internRole}</option>
												</select> <span class="errors" id="internRole_error"></span>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-12">
													<div class="form-group">
														<label for="referencecode" class="">Reference code</label>
														<input type="text" class="form-control" id="referencecode"
															placeholder="Enter Reference code" maxlength="30"
															value="${editjobpostdetails.reference}"
															onkeyup="hideModal('internReferenceCode_error')">
														<span class="errors" id="internReferenceCode_error"></span>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-12 mb-2">
													<div class="form-group">
														<label for="numberVacancies" class="required">Number
															of vacancies</label> <input type="text" class="form-control"
															id="numberVacancies"
															placeholder="Enter Number of vacancies"
															onkeyup="hideModal('internOfVacancy')"
															value="${editjobpostdetails.noOfVacancy}"
															oninput="this.value = this.value.replace(/[^0-9]/g, '')">
														<span class="errors" id="internOfVacancy"> </span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="question-group">
												<div class="form-group">
													<div class="d-flex justify-content-between align-items-center ">
														<h4>Client Details</h4>
														<button type="button" class="btn-blue mt-2 ml-3" data-bs-toggle="modal"
															data-bs-target="#addClient">+ Add New Client</button>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-12 col-md-12 col-sm-12">
														<div class="form-group">
															<label for="companyName">Client Name</label>
															<%-- <input type="text" class="form-control"
																id="companyName"
																value="${editjobpostdetails.companyName}"
																onkeyup="internCompanyModal('InternCompanyDetails',this.value)"> --%>
															<select class="form-select form-control selet2Single"
																id="companyName">
																<option value="">Select</option>
																<c:forEach items="${client}" var="client">
																	<option value="${client.name}"
																		<c:if test="${client.name == editjobpostdetails.companyName}">Selected</c:if>>${client.name}</option>
																</c:forEach>
															</select> <span class="errors" id="InternCompanyDetails"></span>
														</div>
													</div>

													<%-- <div class="col-lg-12 col-md-12 col-sm-12">
														<div class="form-group">
															<label for="aboutCompany" class="required">About
																Company </label>
															<textarea class="form-control" id="aboutCompany"
																placeholder="Enter about company"
																${editjobpostdetails.aboutCompany}
																onkeyup="hideModal('InternAboutCompany')">${editjobpostdetails.aboutCompany}</textarea>
															<span class="errors" id="InternAboutCompany"></span>
														</div>
													</div>
													<div class="col-lg-12 col-md-12 col-sm-12">
														<div class="form-group">
															<label for="aboutCompany" class="required">Company
																Address </label>
															<p class="fw-medium" id="internCompanyAddress">902,
																9th Floor, Oriana Business Park, Road No.22, Wagle
																Estate, Thane, Mumbai, Maharashtra - 400604.</p>
														</div>
													</div>
													<div class="col-lg-6 col-md-6 col-sm-12">
														<div class="form-group">
															<label for="Telephone" class="required">Telephone
															</label> <input type="text" class="form-control" id="Telephone"
																placeholder="Enter Telephone" maxlength="10"
																value="${editjobpostdetails.telephoneNumber}"
																onkeyup="internTelephoneModal('InternTelephone',this.value)"
																oninput="validateMobileNumber(this)"> <span
																class="errors" id="InternTelephone"></span>
														</div>
													</div> --%>
													<div class="col-lg-6 col-md-6 col-sm-12">
														<div class="form-group">
															<label for="emailId">Email Id </label> <input
																type="text" class="form-control" id="emailId"
																placeholder="Enter Email Id "
																value="${editjobpostdetails.emailId}"
																onkeyup="internEmailIdModal('InternEmailId',this.value)">
															<span class="errors" id="InternEmailId"></span>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label for="jobpoststatus" class="required">Status </label>
												<select class="form-select form-control selet2Single"
													id="jobpoststatus">
													<c:forEach items="${masterstatus}" var="masterstatus">
														<option value="${masterstatus.id}">${masterstatus.name}</option>
													</c:forEach>
												</select> <span class="errors" id="jobpoststatus"></span>
											</div>
										</div>
										<c:if test="${userRole == 'employeradmin'}">
											<div class="col-lg-12 col-md-12 col-sm-12">
												<div class="form-group">
													<label for="operatedby">Operated By</label>
													<select class="form-select form-control selet2Single"
														id="operatedby">
														<option value="">Select</option>
														<c:forEach items="${operatedByUser}" var="operatedByUser">
															<option value="${operatedByUser.id}">${operatedByUser.name}</option>
														</c:forEach>
													</select> <span class="errors" id="operatedby"></span>
												</div>
											</div>
										</c:if>

										<div class="col-lg-12 d-flex justify-content-end">
											<button type="submit" class="btns-border">Save as
												draft</button>
											<button type="button" class="btns"
												onclick="postInternship('Update_JI','${editjobpostdetails.id}')">
												Post this job</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="col-xl-4 col-lg-4 col-md-4  ">
						<div class="card-register jd-preview-main">
							<h3>Job Details</h3>
							<div class="card-registerinner ">
								<div class="jd-preview">
									<h4>Job Title</h4>
									<p id="internTittle">${editjobpostdetails.jobTittle}</p>
									<h6 id="internSubTittle"></h6>
									<ul>
										<li><img src="employer/img/location.svg"><span
											id="internLocationDisplay"></span> </li>
										<!-- <li><img src="employer/img/years.svg"> 3 - 5 Years</li>
                    <li><img src="employer/img/salary.svg"> 3.0 - 6 LPA</li> -->
									</ul>
									<ul>
										<li id="internEmploymentType">${editjobpostdetails.employmentType}</li>
										<li id="internWorkModeType">${editjobpostdetails.workMode}</li>
									</ul>
								</div>
								<div class="jd-preview">
									<h4>Key Skills</h4>
									<div class="keySkillsDetails">
										<ul>

										</ul>
									</div>
								</div>
								<div class="jd-preview">
									<h4>Job Details</h4>
									<div class="jobDetails" id="internJobDescriptionDetails">

									</div>

								</div>
								<div class="jd-preview">
									<h4>Recruiter Details</h4>
									<div class="recruiterDetails">
										<p id="interCompanyName"></p>
										<p id="internEmailId"></p>
										<p id="internMobileNumber"></p>
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
	
	<!-- addCommentModal   -->
	<div class="modal fade" id="addClient" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add New Client</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="clientName" class="form-label required">Client
									Name</label> <input type="text" name="clientName" id="clientName"
									class="form-control" placeholder="Enter Client Name">
								<div class="text-danger" id="clientNameError"></div>
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" onclick="submitForm()">Submit</button>
				</div>

			</div>
		</div>
	</div>
	
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
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="employer/js/jobInternship.js"></script>
	<script>
		$('.datepicker').datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
		});

		$(document)
				.ready(
						function() {
							$(".selet2Multiple").select2({
								placeholder : "Select"
							});
							$(".selet2Single").select2({
								placeholder : "Select"
							});

							var isVisible = sessionStorage.getItem(
									"isVisibleFlag").toString();
							if (isVisible !== "1") {

								$
										.ajax({
											url : "checkingpoints",
											type : 'post',
											contentType : 'application/json',
											success : function(response) {
												// Success callback
												console
														.log(response.data.userdetails);
												if (response.errors.errorCode === "0000") {
													let totalPost = parseInt(
															response.data.userdetails.totalPosting,
															10);
													let usedPost = parseInt(
															response.data.userdetails.usedPost,
															10);

													if (totalPost == usedPost) {
														setTimeout(
																function() {

																	let form = document
																			.createElement('form');
																	form.method = 'POST';
																	form.action = 'searchCandidates';
																	document.body
																			.appendChild(form);
																	form
																			.submit();

																}, 2000); // 
														showToast("info",
																"please upgrade your plan");

													}
												} else {
													console
															.log("error ocurred in service"
																	+ error)

												}
											},
											error : function(xhr, status, error) {
												// Error callback
												console.log("error ocurred"
														+ error)
											}
										})
							}
						});

		$(document).ready(function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 1000);
			$('#startDateSpecify').hide();
			$('#willStartWithin').hide();
			$('#stipendOnOff').hide();
			$('#internBetterResponse').hide();
			var value = $('#companyName').val();
			$('#interCompanyName').text(value);
		});

		$(document).ready(function() {
			$('.internshipDescription').richText();

			$(document).on('keyup', '.richText-editor', function() {
				internChangeDescriptionModal('error_internDescription', this);
			});
		});

		var companyId = sessionStorage.getItem("companyId");
		var userId = sessionStorage.getItem("userId");
	</script>
	<script type="text/javascript">
		$(document).ready(
				function() {

					var selectedIndustryText = $('#Industry option:selected')
							.text();
					$('#internSubTittle').text(selectedIndustryText);
					var selectedinternshipLocationText = $(
							'#internshipLocation option:selected').map(
							function() {
								return $(this).text();
							}).get().join(', ');

					$('#internLocationDisplay').text(
							selectedinternshipLocationText);

					// First, clear previous <li> items (if needed)
					$('.keySkillsDetails ul').empty();

					// Loop through each selected option and append separately
					$('#keySkills option:selected').each(
							function() {
								var skill = $(this).text();
								$('.keySkillsDetails ul').append(
										'<li>' + skill + '</li>');
							});
					$("#internMobileNumber").text(
							'${editjobpostdetails.telephoneNumber}');
					$("#internEmailId").text('${editjobpostdetails.emailId}');

					var jobDescrption = `${editjobpostdetails.jobDescription}`;
					$('#internJobDescriptionDetails').html(jobDescrption);
					//
				});
	</script>
	<!-- <script type="text/javascript">
		var internStipendConfirm = "${editjobpostdetails.internStipendConfirm}";
		
		const stipendDiv = document.getElementById('stipendOnOff');
		if (internStipendConfirm === 'YES') {
			stipendDiv.style.display = 'block';
		} else {
			stipendDiv.style.display = 'none';
		}
		
	</script> -->
</body>

</html>