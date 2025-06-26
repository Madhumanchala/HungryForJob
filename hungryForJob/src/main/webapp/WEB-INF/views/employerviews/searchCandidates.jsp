<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="employer/img/favicon.png" rel="icon">
<link href="employer/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="employer/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/richtext.min.css" rel="stylesheet" />
<link href="employer/css/daterangepicker.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="employerHeader.jsp"%>
	<%@include file="toaster.jsp"%>
	<!-- ======= Header ======= -->
	<!-- End Header -->
	<main id="main">
		<section class="section-inner sign-bg searchCandates ">
			<div class="container">
				<div class="row ">
					<div class="col-xl-8 col-lg-10 col-md-12  ">
						<!-- <form autocomplete="off"> -->
						<div class="card-register">
							<div
								style="display: flex; justify-content: space-between; align-items: center;">
								<h3>Search Candidates</h3>

								<c:if test="${isVisible == '1'}">
									<button class="btn-blue mt-2 ml-3" data-bs-toggle="modal"
										data-bs-target="#addCandidate">+ Add Candidate</button>
								</c:if>
							</div>

							<div class="card-registerinner">
								<div class="row">
									<!--  <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="Keywords">Keywords</label>
                        <input type="text" class="form-control" id="Keywords"
                          placeholder="Enter keywords like skills, designation and company">
                      </div>
                    </div>
                   <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="excludeKeywords">Exclude Keywords</label>
                        <input type="text" class="form-control" id="excludeKeywords"
                          placeholder="Enter keywords like skills, designation and company">
                      </div>
                    </div> -->
									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="iTSkills">Skills </label>
											<%-- <select
													class="form-select form-control selet2Multiple"
													id="iTSkills" multiple="multiple" onchange="allChange('skills_error')">
													<option value="">Select</option>
													<c:forEach items="${skills}" var="skills">
														<option value="${skills.id}">${skills.name}</option>
													</c:forEach>
												</select> --%>
											<div class="multi-select-container">
												<input type="text"
													class="dropdown-input form-control form-select "
													placeholder="Select keywords"
													onchange="allChange('skills_error')" readonly>
												<div class="dropdown1">
													<c:forEach items="${skills}" var="skills">
														<div data-value="${skills.id}">${skills.name}</div>
													</c:forEach>
												</div>
												<div class="selected-items"></div>
											</div>
											<span class="errors" id="skills_error"></span>
										</div>
									</div>





									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group mb-0">
											<label for="Keywords">Experience</label>
										</div>
										<div class="row">
											<div class="col-lg-4 col-md-6 col-sm-6 col-6 ">
												<div class="form-group">
													<select class="form-select form-control selet2Single"
														id="workExperienceMin"
														onchange="allChange('minExp_error')">
														<option value="" selected="">Min Experience</option>
														<option value="0">0 Yr</option>
														<option value="1">1 Yr</option>
														<option value="2">2 Yrs</option>
														<option value="3">3 Yrs</option>
														<option value="4">4 Yrs</option>
														<option value="5">5 Yrs</option>
														<option value="6">6 Yrs</option>
														<option value="7">7 Yrs</option>
														<option value="8">8 Yrs</option>
														<option value="9">9 Yrs</option>
														<option value="10">10 Yrs</option>
														<option value="11">11 Yrs</option>
														<option value="12">12 Yrs</option>
														<option value="13">13 Yrs</option>
														<option value="14">14 Yrs</option>
														<option value="15">15 Yrs</option>
														<option value="16">16 Yrs</option>
														<option value="17">17 Yrs</option>
														<option value="18">18 Yrs</option>
														<option value="19">19 Yrs</option>
														<option value="20">20 Yrs</option>
														<option value="21">21 Yrs</option>
														<option value="22">22 Yrs</option>
														<option value="23">23 Yrs</option>
														<option value="24">24 Yrs</option>
														<option value="25">25 Yrs +</option>
													</select> <span class="errors" id="minExp_error"></span>
												</div>
											</div>
											<div class="col-lg-4 col-md-6 col-sm-6 col-6 ">
												<div class="form-group">
													<select class="form-select form-control selet2Single"
														id="workExperienceMax"
														onchange="allChange('maxExp_error')">
														<option value="" selected="">Max Experience</option>
														<option value="0">0 Yr</option>
														<option value="1">1 Yr</option>
														<option value="2">2 Yrs</option>
														<option value="3">3 Yrs</option>
														<option value="4">4 Yrs</option>
														<option value="5">5 Yrs</option>
														<option value="6">6 Yrs</option>
														<option value="7">7 Yrs</option>
														<option value="8">8 Yrs</option>
														<option value="9">9 Yrs</option>
														<option value="10">10 Yrs</option>
														<option value="11">11 Yrs</option>
														<option value="12">12 Yrs</option>
														<option value="13">13 Yrs</option>
														<option value="14">14 Yrs</option>
														<option value="15">15 Yrs</option>
														<option value="16">16 Yrs</option>
														<option value="17">17 Yrs</option>
														<option value="18">18 Yrs</option>
														<option value="19">19 Yrs</option>
														<option value="20">20 Yrs</option>
														<option value="21">21 Yrs</option>
														<option value="22">22 Yrs</option>
														<option value="23">23 Yrs</option>
														<option value="24">24 Yrs</option>
														<option value="25">25 Yrs +</option>
													</select> <span class="errors" id="maxExp_error"></span>
												</div>
											</div>

										</div>
									</div>

									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="jobLocation">Current location of
												candidate </label> <select
												class="form-select form-control selet2Multiple"
												id="jobLocation" multiple="multiple"
												onchange="allChange('location_error')">
												<option value="">Select</option>
												<c:forEach items="${location}" var="location">
													<option value="${location.id}">${location.name}</option>
												</c:forEach>
											</select>
											<div class="form-check relocate">
												<input class="form-check-input" type="checkbox" value=""
													id="includeCandidates" value="YES" checked> <label
													class="form-check-label" for="includeCandidates">
													Include candidates ready to relocate to the above location
												</label>
											</div>
											<span class="errors" id="location_error"></span>
										</div>
									</div>


									<div class="col-lg-10 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="jobLocation">Annual Salary </label>
											<div class="row">
												<div class="col-lg-2 col-md-2 col-sm-2 col-2">
													<div class="input-group ">
														<span class="input-group-text  w-100 text-center"><i
															class="bi bi-currency-rupee"></i> (INR)</span>
													</div>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-4 col-5">
													<select class="form-select form-control selet2Single"
														id="searchMinSalary">
														<option value="">Min</option>
														<!-- 	<option value="50000">50,000</option>
															<option value="60000">60,000</option>
															<option value="70000">70,000</option>
															<option value="80000">80,000</option>
															<option value="90000">90,000</option> -->
														<option value="100000">1 lac</option>
														<option value="125000">1.25 lacs</option>
														<option value="150000">1.5 lacs</option>
														<option value="175000">1.75 lacs</option>
														<option value="200000">2 lacs</option>
														<option value="225000">2.25 lacs</option>
														<option value="250000">2.5 lacs</option>
														<option value="275000">2.75 lacs</option>
														<option value="300000">3 lacs</option>
														<option value="325000">3.25 lacs</option>
														<option value="350000">3.5 lacs</option>
														<option value="375000">3.75 lacs</option>
														<option value="400000">4 lacs</option>
														<option value="425000">4.25 lacs</option>
														<option value="450000">4.5 lacs</option>
														<option value="475000">4.75 lacs</option>
														<option value="500000">5 lacs</option>
														<option value="550000">5.5 lacs</option>
														<option value="600000">6 lacs</option>
														<option value="650000">6.5 lacs</option>
														<option value="700000">7 lacs</option>
														<option value="750000">7.5 lacs</option>
														<option value="800000">8 lacs</option>
														<option value="850000">8.5 lacs</option>
														<option value="900000">9 lacs</option>
														<option value="950000">9.5 lacs</option>
														<option value="1000000">10 lacs</option>
														<option value="1100000">11 lacs</option>
														<option value="1200000">12 lacs</option>
														<option value="1300000">13 lacs</option>
														<option value="1400000">14 lacs</option>
														<option value="1500000">15 lacs</option>
														<option value="1600000">16 lacs</option>
														<option value="1700000">17 lacs</option>
														<option value="1800000">18 lacs</option>
														<option value="1900000">19 lacs</option>
														<option value="2000000">20 lacs</option>
														<option value="2250000">22.5 lacs</option>
														<option value="2500000">25 lacs</option>
														<option value="2750000">27.5 lacs</option>
														<option value="3000000">30 lacs</option>
														<option value="3250000">32.5 lacs</option>
														<option value="3500000">35 lacs</option>
														<option value="3750000">37.5 lacs</option>
														<option value="4000000">40 lacs</option>
														<option value="4500000">45 lacs</option>
														<option value="5000000">50 lacs</option>
														<option value="5500000">55 lacs</option>
														<option value="6000000">60 lacs</option>
														<option value="6500000">65 lacs</option>
														<option value="7000000">70 lacs</option>
														<option value="7500000">75 lacs</option>
														<option value="8000000">80 lacs</option>
														<option value="8500000">85 lacs</option>
														<option value="9000000">90 lacs</option>
														<option value="9500000">95 lacs</option>
														<option value="10000000">1 cr</option>
													</select>
												</div>
												<div class="col-lg-4 col-md-4 col-sm-4 col-5">
													<select class="form-select form-control selet2Single "
														id="salaryFigureMax">
														<option value="">Max</option>
														<!-- <option value="50000">50,000</option>
															<option value="60000">60,000</option>
															<option value="70000">70,000</option>
															<option value="80000">80,000</option>
															<option value="90000">90,000</option> -->
														<option value="100000">1 lac</option>
														<option value="125000">1.25 lacs</option>
														<option value="150000">1.5 lacs</option>
														<option value="175000">1.75 lacs</option>
														<option value="200000">2 lacs</option>
														<option value="225000">2.25 lacs</option>
														<option value="250000">2.5 lacs</option>
														<option value="275000">2.75 lacs</option>
														<option value="300000">3 lacs</option>
														<option value="325000">3.25 lacs</option>
														<option value="350000">3.5 lacs</option>
														<option value="375000">3.75 lacs</option>
														<option value="400000">4 lacs</option>
														<option value="425000">4.25 lacs</option>
														<option value="450000">4.5 lacs</option>
														<option value="475000">4.75 lacs</option>
														<option value="500000">5 lacs</option>
														<option value="550000">5.5 lacs</option>
														<option value="600000">6 lacs</option>
														<option value="650000">6.5 lacs</option>
														<option value="700000">7 lacs</option>
														<option value="750000">7.5 lacs</option>
														<option value="800000">8 lacs</option>
														<option value="850000">8.5 lacs</option>
														<option value="900000">9 lacs</option>
														<option value="950000">9.5 lacs</option>
														<option value="1000000">10 lacs</option>
														<option value="1100000">11 lacs</option>
														<option value="1200000">12 lacs</option>
														<option value="1300000">13 lacs</option>
														<option value="1400000">14 lacs</option>
														<option value="1500000">15 lacs</option>
														<option value="1600000">16 lacs</option>
														<option value="1700000">17 lacs</option>
														<option value="1800000">18 lacs</option>
														<option value="1900000">19 lacs</option>
														<option value="2000000">20 lacs</option>
														<option value="2250000">22.5 lacs</option>
														<option value="2500000">25 lacs</option>
														<option value="2750000">27.5 lacs</option>
														<option value="3000000">30 lacs</option>
														<option value="3250000">32.5 lacs</option>
														<option value="3500000">35 lacs</option>
														<option value="3750000">37.5 lacs</option>
														<option value="4000000">40 lacs</option>
														<option value="4500000">45 lacs</option>
														<option value="5000000">50 lacs</option>
														<option value="5500000">55 lacs</option>
														<option value="6000000">60 lacs</option>
														<option value="6500000">65 lacs</option>
														<option value="7000000">70 lacs</option>
														<option value="7500000">75 lacs</option>
														<option value="8000000">80 lacs</option>
														<option value="8500000">85 lacs</option>
														<option value="9000000">90 lacs</option>
														<option value="9500000">95 lacs</option>
														<option value="10000000">1 cr</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

						<div class="card-register">
							<h3>Employment Details</h3>
							<div class="card-registerinner">
								<div class="row">

									<!-- <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="department">Department
                        </label>
                        <select class="form-select form-control selet2Single" id="department">
                          <option value="" disabled selected>Select</option>
                          <option value="BFSI, Investments &amp; Trading">BFSI, Investments &amp; Trading</option>
                          <option value="Customer Success, Service &amp; Operations">Customer Success, Service &amp;
                            Operations</option>
                          <option value="Data Science &amp; Analytics">Data Science &amp; Analytics</option>
                          <option value="Engineering - Hardware &amp; Networks">Engineering - Hardware &amp;
                            Networks
                          </option>
                          <option value="Engineering - Software &amp; QA">Engineering - Software &amp; QA
                          </option>
                          <option value="Finance &amp; Accounting">Finance &amp; Accounting</option>
                          <option value="Human Resources">Human Resources</option>
                          <option value="IT &amp; Information Security">IT &amp; Information Security</option>
                          <option value="Marketing &amp; Communication">Marketing &amp; Communication</option>
                          <option value="Product Management">Product Management</option>
                          <option value="Production, Manufacturing &amp; Engineering">Production, Manufacturing
                            &amp;
                            Engineering</option>
                          <option value="Project &amp; Program Management">Project &amp; Program Management</option>
                          <option value="Quality Assurance">Quality Assurance</option>
                          <option value="Sales &amp; Business Development">Sales &amp; Business Development</option>
                          <option value="UX, Design &amp; Architecture">UX, Design &amp; Architecture</option>
                          <option value="Administration &amp; Facilities">Administration &amp; Facilities</option>
                          <option value="Aviation &amp; Aerospace">Aviation &amp; Aerospace</option>
                          <option value="Construction &amp; Site Engineering">Construction &amp; Site Engineering
                          </option>
                          <option value="Consulting">Consulting</option>
                          <option value="Content, Editorial &amp; Journalism">Content, Editorial &amp; Journalism
                          </option>
                          <option value="CSR &amp; Social Service">CSR &amp; Social Service</option>
                          <option value="Energy &amp; Mining">Energy &amp; Mining</option>
                          <option value="Environment Health &amp; Safety">Environment Health &amp; Safety</option>
                          <option value="Food, Beverage &amp; Hospitality">Food, Beverage &amp; Hospitality</option>
                          <option value="Healthcare &amp; Life Sciences">Healthcare &amp; Life Sciences</option>
                          <option value="Legal &amp; Regulatory">Legal &amp; Regulatory</option>
                          <option value="Media Production &amp; Entertainment">Media Production &amp; Entertainment
                          </option>
                          <option value="Merchandising, Retail &amp; eCommerce">Merchandising, Retail &amp;
                            eCommerce
                          </option>
                          <option value="Procurement &amp; Supply Chain">Procurement &amp; Supply Chain</option>
                          <option value="Research &amp; Development">Research &amp; Development</option>
                          <option value="Risk Management &amp; Compliance">Risk Management &amp; Compliance</option>
                          <option value="Security Services">Security Services</option>
                          <option value="Shipping &amp; Maritime">Shipping &amp; Maritime</option>
                          <option value="Sports, Fitness &amp; Personal Care">Sports, Fitness &amp; Personal Care
                          </option>
                          <option value="Strategic &amp; Top Management">Strategic &amp; Top Management</option>
                          <option value="Teaching &amp; Training">Teaching &amp; Training</option>
                          <option value="Other">Other</option>

                        </select>
                      </div>
                    </div> -->

									<!--  <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="role ">Role </label>
                        <select class="form-select form-control selet2Single" id="role ">
                          <option value="" disabled selected>Select</option>
                          <option value="asuggested">Suggested roles</option>
                          <option value="a2.1009.106suggested">Appliance Installer / Repairman</option>
                          <option value="a2.1009.107suggested">Electrician</option>
                          <option value="a2.1009.108suggested">Electronics Installer / Repairman</option>
                          <option value="a2.1009">After Sales Service & Repair</option>
                          <option value="a2.1009.106">Appliance Installer / Repairman</option>
                          <option value="a2.1009.107">Electrician</option>
                          <option value="a2.1009.108">Electronics Installer / Repairman</option>
                          <option value="a2.1009.109">Mechanic</option>
                          <option value="a2.1009.110">Plumber</option>
                          <option value="a2.1009.111">Service Engineer</option>
                          <option value="a2.1009.112">Service Manager</option>
                          <option value="a2.1009.113">After Sales Service & Repair - Other</option>
                          <option value="a2.1010">Back Office</option>
                          <option value="a2.1010.114">Back Office Operations</option>
                          <option value="a2.1010.115">Billing / Records</option>
                          <option value="a2.1010.116">Data Entry / MIS</option>
                          <option value="a2.1010.117">Dialer Manager</option>
                          <option value="a2.1010.118">Back Office - Other</option>
                          <option value="a2.1011">Customer Success</option>
                          <option value="a2.1011.119">Customer Success Associate</option>
                          <option value="a2.1011.120">Customer Success Manager</option>
                          <option value="a2.1011.121">Head - Customer Success</option>
                          <option value="a2.1011.122">Customer Success - Other</option>
                          <option value="a2.1012">Non Voice</option>
                          <option value="a2.1012.123">Account / Relationship Management - Non Voice</option>
                          <option value="a2.1012.124">Bilingual / Multilingual Support - Non Voice</option>
                          <option value="a2.1012.125">Chat Support</option>
                          <option value="a2.1012.126">Customer Advocacy</option>
                          <option value="a2.1012.127">Customer Onboarding - Non Voice</option>
                          <option value="a2.1012.128">Customer Retention - Non Voice</option>
                          <option value="a2.1012.129">Email Support</option>
                          <option value="a2.1012.130">Non Tech Support - Non Voice</option>
                          <option value="a2.1012.131">Technical Support - Non Voice</option>
                          <option value="a2.1012.132">Non Voice - Other</option>
                          <option value="a2.1013">Operations</option>
                          <option value="a2.1013.133">Assistant Manager</option>
                          <option value="a2.1013.134">Head - Operations</option>
                          <option value="a2.1013.135">Operations Manager</option>
                          <option value="a2.1013.136">Subject Matter Expert</option>
                          <option value="a2.1013.137">Team Leader</option>
                          <option value="a2.1013.138">Operations - Other</option>
                          <option value="a2.1014">Operations Support</option>
                          <option value="a2.1014.139">MIS Executive</option>
                          <option value="a2.1014.140">Operations Engineer</option>
                          <option value="a2.1014.141">Technical Operations (Tech Ops)</option>
                          <option value="a2.1014.142">Operations Support - Other</option>
                          <option value="a2.1015">Service Delivery</option>
                          <option value="a2.1015.143">Service Delivery Associate</option>
                          <option value="a2.1015.144">Service Delivery Leader</option>
                          <option value="a2.1015.145">Service Delivery Manager</option>
                          <option value="a2.1015.146">Service Delivery - Other</option>
                          <option value="a2.1016">Voice / Blended</option>
                          <option value="a2.1016.147">Account / Relationship Management - Voice / Blended</option>
                          <option value="a2.1016.148">Bilingual / Multilingual Support - Voice / Blended</option>
                          <option value="a2.1016.149">Collections</option>
                          <option value="a2.1016.150">Customer Onboarding - Voice / Blended</option>
                          <option value="a2.1016.151">Customer Retention - Voice / Blended</option>
                          <option value="a2.1016.152">Guest Services</option>
                          <option value="a2.1016.153">Non Tech Support - Voice / Blended</option>
                          <option value="a2.1016.154">Technical Support - Voice / Blended</option>
                          <option value="a2.1016.155">Voice / Blended - Other</option>
                          <option value="a2.1017">Customer Success, Service & Operations - Other</option>
                          <option value="a2.1017.156">Customer Service</option>
                          <option value="a2.1017.157">Customer Success, Service & Operations - Other</option>

                        </select>
                      </div>
                    </div> -->

									<!--  <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="Industry"> Industry </label>
                        <select class="form-select form-control selet2Single " id="Industry">
                          <option value="" disabled selected>Select</option>
                          <option value="Analytics / KPO / Research">Analytics / KPO / Research</option>
                          <option value="BPM / BPO">BPM / BPO</option>
                          <option value="IT Services">IT Services</option>
                          <option value="Technology">Technology</option>
                          <option value="Electronic Components / Semiconductors">Electronic Components /
                            Semiconductors
                          </option>
                          <option value="Electronics Manufacturing">Electronics Manufacturing</option>
                          <option value="Emerging Technologies">Emerging Technologies</option>
                          <option value="Hardware & Networking">Hardware & Networking</option>
                          <option value="Internet">Internet</option>
                          <option value="Software Product">Software Product</option>
                          <option value="BFSI">BFSI</option>
                          <option value="Banking">Banking</option>
                          <option value="Financial Services">Financial Services</option>
                          <option value="FinTech / Payments">FinTech / Payments</option>
                          <option value="Insurance">Insurance</option>
                          <option value="Investment Banking / Venture Capital / Private Equity">Investment Banking /
                            Venture Capital / Private
                            Equity</option>
                          <option value="NBFC">NBFC</option>
                          <option value="Education">Education</option>
                          <option value="Education / Training">Education / Training</option>
                          <option value="E-Learning / EdTech">E-Learning / EdTech</option>
                          <option value="Manufacturing & Production">Manufacturing & Production</option>
                          <option value="Auto Components">Auto Components</option>
                          <option value="Automobile">Automobile</option>
                          <option value="Building Material">Building Material</option>
                          <option value="Chemicals">Chemicals</option>
                          <option value="Defence & Aerospace">Defence & Aerospace</option>
                          <option value="Electrical Equipment">Electrical Equipment</option>
                          <option value="Fertilizers / Pesticides / Agro chemicals">Fertilizers / Pesticides / Agro
                            chemicals</option>
                          <option value="Industrial Automation">Industrial Automation</option>
                          <option value="Industrial Equipment / Machinery">Industrial Equipment / Machinery</option>
                          <option value="Iron & Steel">Iron & Steel</option>
                          <option value="Metals & Mining">Metals & Mining</option>
                          <option value="Packaging & Containers">Packaging & Containers</option>
                          <option value="Petrochemical / Plastics / Rubber">Petrochemical / Plastics / Rubber
                          </option>
                          <option value="Pulp & Paper">Pulp & Paper</option>
                          <option value="Infrastructure, Transport & Real Estate">Infrastructure, Transport & Real
                            Estate</option>
                          <option value="Aviation">Aviation</option>
                          <option value="Courier / Logistics">Courier / Logistics</option>
                          <option value="Engineering & Construction">Engineering & Construction</option>
                          <option value="Oil & Gas">Oil & Gas</option>
                          <option value="Ports & Shipping">Ports & Shipping</option>
                          <option value="Power">Power</option>
                          <option value="Railways">Railways</option>
                          <option value="Real Estate">Real Estate</option>
                          <option value="Urban Transport">Urban Transport</option>
                          <option value="Water Treatment / Waste Management">Water Treatment / Waste Management
                          </option>
                          <option value="Consumer, Retail & Hospitality">Consumer, Retail & Hospitality</option>
                          <option value="Beauty & Personal Care">Beauty & Personal Care</option>
                          <option value="Beverage">Beverage</option>
                          <option value="Consumer Electronics & Appliances">Consumer Electronics & Appliances
                          </option>
                          <option value="Fitness & Wellness">Fitness & Wellness</option>
                          <option value="FMCG">FMCG</option>
                          <option value="Food Processing">Food Processing</option>
                          <option value="Furniture & Furnishing">Furniture & Furnishing</option>
                          <option value="Gems & Jewellery">Gems & Jewellery</option>
                          <option value="Hotels & Restaurants">Hotels & Restaurants</option>
                          <option value="Leather">Leather</option>
                          <option value="Retail">Retail</option>
                          <option value="Textile & Apparel">Textile & Apparel</option>
                          <option value="Travel & Tourism">Travel & Tourism</option>
                          <option value="Healthcare & Life Sciences">Healthcare & Life Sciences</option>
                          <option value="Biotechnology">Biotechnology</option>
                          <option value="Clinical Research / Contract Research">Clinical Research / Contract
                            Research
                          </option>
                          <option value="Medical Devices & Equipment">Medical Devices & Equipment</option>
                          <option value="Medical Services / Hospital">Medical Services / Hospital</option>
                          <option value="Pharmaceutical & Life Sciences">Pharmaceutical & Life Sciences</option>
                          <option value="Media, Entertainment & Telecom">Media, Entertainment & Telecom</option>
                          <option value="Advertising & Marketing">Advertising & Marketing</option>
                          <option value="Animation & VFX">Animation & VFX</option>
                          <option value="Events / Live Entertainment">Events / Live Entertainment</option>
                          <option value="Film / Music / Entertainment">Film / Music / Entertainment</option>
                          <option value="Gaming">Gaming</option>
                          <option value="Printing & Publishing">Printing & Publishing</option>
                          <option value="Sports / Leisure & Recreation">Sports / Leisure & Recreation</option>
                          <option value="Telecom / ISP">Telecom / ISP</option>
                          <option value="TV / Radio">TV / Radio</option>
                          <option value="Professional Services">Professional Services</option>
                          <option value="Accounting / Auditing">Accounting / Auditing</option>
                          <option value="Architecture / Interior Design">Architecture / Interior Design</option>
                          <option value="Content Development / Language">Content Development / Language</option>
                          <option value="Design">Design</option>
                          <option value="Facility Management Services">Facility Management Services</option>
                          <option value="Law Enforcement / Security Services">Law Enforcement / Security Services
                          </option>
                          <option value="Legal">Legal</option>
                          <option value="Management Consulting">Management Consulting</option>
                          <option value="Recruitment / Staffing">Recruitment / Staffing</option>
                          <option value="Miscellaneous">Miscellaneous</option>
                          <option value="Agriculture / Forestry / Fishing">Agriculture / Forestry / Fishing</option>
                          <option value="Government / Public Administration">Government / Public Administration
                          </option>
                          <option value="Import & Export">Import & Export</option>
                          <option value="Miscellaneous">Miscellaneous</option>
                          <option value="NGO / Social Services / Industry Associations">NGO / Social Services /
                            Industry Associations</option>
                        </select>
                      </div>
                    </div> -->


									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="company"> Company </label> <select
												class="form-select form-control selet2Single " id="company">
												<option value="">Select</option>
												<c:forEach items="${company}" var="company">
													<option value="${company.id}">${company.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<!--   <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="designation"> Designation </label>
                        <select class="form-select form-control selet2Single " id="designation">
                          <option value="" disabled selected>Select</option>

                        </select>
                      </div>
                    </div> -->

									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group1 ">
											<label for="noticePeriod">Notice Period/ Availabilty
												to join </label>
											<div class="formchecks">
												<ul>
													<!-- <li><input type="checkbox" class="btn-check"
															name="noticePeriod" id="Any" value="0"> <label
															class="btn" for="Any"><span>Any</span> </label></li> -->
													<li><input type="checkbox" class="btn-check"
														name="noticePeriod" id="015days" value="15"> <label
														class="btn" for="015days"><span>0 - 15 days</span>
													</label></li>
													<li><input type="checkbox" class="btn-check"
														name="noticePeriod" id="1month" value="30"> <label
														class="btn" for="1month"><span>1 month </span> </label></li>
													<li><input type="checkbox" class="btn-check"
														name="noticePeriod" id="2month" value="60"> <label
														class="btn" for="2month"><span>2 month </span> </label></li>
													<li><input type="checkbox" class="btn-check"
														name="noticePeriod" id="3month" value="90"> <label
														class="btn" for="3month"><span>3 month </span> </label></li>
													<li><input type="checkbox" class="btn-check"
														name="noticePeriod" id="morethan3months" value="365">
														<label class="btn" for="morethan3months"><span>More
																than 3 months </span> </label></li>
													<li><input type="checkbox" class="btn-check"
														name="noticePeriod" id="currentlyserving" value="365">
														<label class="btn" for="currentlyserving"><span>Currently
																serving notice period</span> </label></li>
												</ul>
											</div>
											<!-- <span class="errors"> Please select work mode</span>-->
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="card-register">
							<h3>Education Details</h3>
							<div class="card-registerinner">
								<div class="row">

									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group1 ">
											<label for="ug-qualification">Highest Qualification/
												Degree currently pursuing </label>
											<div class="formchecks">
												<ul>
													<li><input type="radio" class="btn-check"
														name="highestQualification" id="doctoratePHD"
														onchange="changeEducation('phd')" value="phd"> <label
														class="btn" for="doctoratePHD"><span>Doctorate/PHD</span>
													</label></li>
													<li><input type="radio" class="btn-check"
														name="highestQualification" id="mastersPostGraduate"
														onchange="changeEducation('master')" value="master">
														<label class="btn" for="mastersPostGraduate"><span>Masters/Post
																Graduate</span> </label></li>
													<li><input type="radio" class="btn-check"
														name="highestQualification" id="graduationDiploma"
														onchange="changeEducation('degree')" value="degree">
														<label class="btn" for="graduationDiploma"><span>Graduation/Diploma
														</span> </label></li>
												</ul>
											</div>
											<!-- <span class="errors"> Please select work mode</span>-->
										</div>
									</div>

									<div class="col-lg-12" id="masterCourses">
										<div class="includeWalk">
											<div class="row">

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="course1">Course </label> <select
															class="form-select form-control selet2Single"
															id="course1"
															onchange="getSpecialization(this.value,'specialization1')"
															style="width: 100%">
															<option value="">Select</option>
															<c:forEach items="${masterCourse}" var="course">
																<option value="${course.id}">${course.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="specialization">Specialization </label> <select
															class="form-select form-control selet2Single"
															id="specialization1" style="width: 100%">
															<option value="">Select</option>
														</select>
													</div>
												</div>
												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group1 ">
														<label for="courseType1">Course Type </label>
														<div class="formchecks">
															<ul>
																<li><input type="radio" class="btn-check"
																	name="courseType1" id="fullTime1" value="fullTime">
																	<label class="btn" for="fullTime1"><span>Full
																			Time</span> </label></li>
																<li><input type="radio" class="btn-check"
																	name="courseType1" id="partTime1" value="partTime">
																	<label class="btn" for="partTime1"><span>Part
																			Time</span> </label></li>
																<li><input type="radio" class="btn-check"
																	name="courseType1" id="distanceLearning1"
																	value="DistanceLearning"> <label class="btn"
																	for="distanceLearning1"><span>Distance
																			Learning</span> </label></li>
															</ul>
														</div>
														<!-- <span class="errors"> Please select work mode</span>-->
													</div>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="university">University/ Institute </label> <select
															class="form-select form-control selet2Single"
															id="university1" style="width: 100%">
															<option value="">Select</option>
															<c:forEach items="${insitiute}" var="university">
																<option value="${university.id}">${university.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>

											</div>
										</div>
									</div>


									<div class="col-lg-12" id="degreeCourses">
										<div class="includeWalk">
											<div class="row">
												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="chooseCourse">Course </label> <select
															class="form-select form-control  selet2Single "
															id="course2"
															onchange="getSpecialization(this.value,'specialization2')"
															style="width: 100%">
															<option value="">Select</option>
															<c:forEach items="${degreeCourse}" var="university">
																<option value="${university.id}">${university.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="specialization">Specialization </label> <select
															class="form-select form-control selet2Single "
															id="specialization2" style="width: 100%">
															<option value="">Select</option>
														</select>
													</div>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group1 ">
														<label for="courseType2">Course Type </label>
														<div class="formchecks">
															<ul>
																<li><input type="radio" class="btn-check"
																	name="courseType2" id="fullTime2" value="fullTime">
																	<label class="btn" for="fullTime2"><span>Full
																			Time</span> </label></li>
																<li><input type="radio" class="btn-check"
																	name="courseType2" id="partTime2" value="partTime">
																	<label class="btn" for="partTime2"><span>Part
																			Time</span> </label></li>
																<li><input type="radio" class="btn-check"
																	name="courseType2" id="distanceLearning2"
																	value="DistanceLearning"> <label class="btn"
																	for="distanceLearning2"><span>Distance
																			Learning</span> </label></li>
															</ul>
														</div>
														<!-- <span class="errors"> Please select work mode</span>-->
													</div>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="university">University/ Institute </label> <select
															class="form-select form-control selet2Single"
															id="university2" style="width: 100%">
															<option value="">Select</option>
															<c:forEach items="${insitiute}" var="university">
																<option value="${university.id}">${university.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>


									<div class="col-lg-12" id="phdCourses">
										<div class="includeWalk">
											<div class="row">
												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="chooseCourse">Course </label> <select
															class="form-select form-control  selet2Single "
															id="course3"
															onchange="getSpecialization(this.value,'specialization3')"
															style="width: 100%">
															<option value="">Select</option>
															<c:forEach items="${PHDCOURSE}" var="university">
																<option value="${university.id}">${university.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="specialization">Specialization </label> <select
															class="form-select form-control selet2Single "
															id="specialization3" style="width: 100%">
															<option value="">Select</option>
														</select>
													</div>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group1 ">
														<label for="courseType3">Course Type </label>
														<div class="formchecks">
															<ul>
																<li><input type="radio" class="btn-check"
																	name="courseType3" id="fullTime3" value="fullTime">
																	<label class="btn" for="fullTime3"><span>Full
																			Time</span> </label></li>
																<li><input type="radio" class="btn-check"
																	name="courseType3" id="partTime3" value="partTime">
																	<label class="btn" for="partTime3"><span>Part
																			Time</span> </label></li>
																<li><input type="radio" class="btn-check"
																	name="courseType3" id="distanceLearning3"
																	value="DistanceLearning"> <label class="btn"
																	for="distanceLearning3"><span>Distance
																			Learning</span> </label></li>
															</ul>
														</div>
														<!-- <span class="errors"> Please select work mode</span>-->
													</div>
												</div>

												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="form-group">
														<label for="university">University/ Institute </label> <select
															class="form-select form-control selet2Single"
															id="university3" style="width: 100%">
															<option value="">Select</option>
															<c:forEach items="${insitiute}" var="university">
																<option value="${university.id}">${university.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="card-register">
							<h3>Diversity and Additional Details</h3>
							<div class="card-registerinner">
								<div class="row">
									<div class="col-lg-12">
										<h5 class="mb-3">Diversity details</h5>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group1 ">
											<label for="genderDiv">Gender </label>
											<div class="formchecks">
												<ul>
													<li><input type="radio" class="btn-check"
														name="genderDiv" id="allCandidates" value=""> <label
														class="btn" for="allCandidates"><span>All
																candidates</span> </label></li>
													<li><input type="radio" class="btn-check"
														name="genderDiv" id="maleCandidates" value="male">
														<label class="btn" for="maleCandidates"><span>Male
																candidates</span> </label></li>
													<li><input type="radio" class="btn-check"
														name="genderDiv" id="femaleCandidates" value="female">
														<label class="btn" for="femaleCandidates"><span>Female
																candidates </span> </label></li>
												</ul>
											</div>
											<!-- <span class="errors"> Please select work mode</span>-->
										</div>
									</div>

									<!-- <div class="col-lg-12">
											<div class="form-group">
												<div class="form-check relocate">
													<input class="form-check-input" type="checkbox" value=""
														id="includeCandidates" value="YES"> <label
														class="form-check-label" for="includeCandidates">
														Include candidates ready to relocate to the above location
													</label>
												</div>
											</div>
										</div> -->
									<!-- <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="candidateCategory">Candidate Category </label>
                        <select class="form-select form-control selet2Multiple" id="candidateCategory"
                          multiple="multiple">
                          <option value="" disabled>Select</option>
                          <option value=" ">Scheduled Caste (SC)</option>
                          <option value=" ">Scheduled Tribe (ST)</option>
                          <option value=" ">OBC - Creamy</option>
                          <option value=" ">OBC - Non Creamy</option>
                          <option value=" ">Other</option>
                        </select>
                      </div>
                    </div> -->


									<!--   <div class="col-lg-12">
                      <h5 class="mb-3">Work details</h5>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="row">
                        <div class="col-lg-12">
                          <div class="form-group mb-0">
                            <label>Show candidates seeking</label>
                          </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                          <div class="form-group ">
                            <select class="form-select form-control selet2Single" id="candidatesSeeking1">
                              <option value="" disabled selected>Select</option>
                              <option value=" ">Any</option>
                              <option value=" ">Permanent</option>
                              <option value=" ">Temporary/Contract job</option>
                            </select>
                          </div>
                        </div> 
                        <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                          <div class="form-group  choose-position">
                            <select class="form-select form-control selet2Single" id="candidatesSeeking">
                              <option value="" disabled selected>Select</option>
                              <option value=" ">Any</option>
                              <option value=" ">Full time</option>
                              <option value=" ">Part time</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>-->

									<!-- <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="workPermit">Work permit for </label>
                        <select class="form-select form-control selet2Multiple" id="workPermit" multiple="multiple">
                          <option value="" disabled>Select</option>
                          <option value=" ">India</option>
                        </select>
                      </div>
                    </div> 

                    <div class="col-lg-12">
                      <h5 class="mb-3">Display details</h5>
                    </div>-->

									<!-- <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group1 ">
                        <label for="showDis">Show </label>
                        <div class="formchecks">
                          <ul>
                            <li>
                              <input type="radio" class="btn-check" name="showDis" id="allCandidates1">
                              <label class="btn" for="allCandidates1"><span>All candidates</span>
                              </label>
                            </li>
                            <li>
                              <input type="radio" class="btn-check" name="showDis" id="newRegistrations">
                              <label class="btn" for="newRegistrations"><span>New registrations</span>
                              </label>
                            </li>
                            <li>
                              <input type="radio" class="btn-check" name="showDis" id="modifiedCandidates">
                              <label class="btn" for="modifiedCandidates"><span>Modified candidates </span>
                              </label>
                            </li>
                          </ul>
                        </div>
                        <span class="errors"> Please select work mode</span>
                      </div>
                    </div> -->

									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="form-group1 ">
											<!-- <label for="showonly">Show only candidates with </label> -->
											<div class="formchecks">
												<!-- <ul> -->
												<!--  <li>
                              <input type="checkbox" class="btn-check" name="showonly" id="verifiedMobilenumber">
                              <label class="btn" for="verifiedMobilenumber"><span>Verified mobile number </span>
                              </label>
                            </li> -->
												<!-- <li><input type="checkbox" class="btn-check"
															name="showonly" id="verifiedEmailID"> <label
															class="btn" for="verifiedEmailID"><span>Verified
																	email ID</span> </label></li>
														<li><input type="checkbox" class="btn-check"
															name="showonly" id="attachedResume"> <label
															class="btn" for="attachedResume"><span>Attached
																	resume </span> </label></li>
													</ul> -->
											</div>
											<!-- <span class="errors"> Please select work mode</span>-->
										</div>
									</div>
								</div>
							</div>
							<div class="searchCandidates d-flex justify-content-end">
								<button type="button" class="btns"
									onclick="submitSearchCandidates()">Search candidates</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<div class="modal fade" id="addCandidate" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Candidates</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="Industry" class="form-label required">Email
								</label> <input type="text" name="email" id="Industry"
									class="form-control" placeholder="Enter Email/Phone no">
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button"
						onclick="search(document.getElementById('Industry').value)"
						class="btns">Submit</button>
				</div>

			</div>
		</div>
	</div>
	<%@include file="employerfooter.jsp"%>

	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/daterangepicker.min.js"></script>
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="employer/js/searchCandidates.js"></script>
	<script>
		$(function() {
			$('input[name="WalkStartDate"]').daterangepicker();
		});

		$(document).ready(function() {
			$(".selet2Multiple").select2({
				placeholder : "Select"
			});
			$(".selet2Single").select2({});

		});

		$(document).ready(function() {
			setTimeout(function() {
				$('body').addClass('loaded');
			}, 1000);
		});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$(".dropdown-input").click(function() {

								$(".dropdown1").toggle();
							});

							/*  $(".dropdown div").click(function () {
							   var value = $(this).data("value");

							   if ($(".selected-items .selected-item[data-value='" + value + "']").length === 0) {
							     $(".selected-items").append(`
							           <div class="selected-item" data-value="${value}">
							               ${value}
							               <i class="fa fa-star star"></i>
							               <span class="remove">&times;</span>
							           </div>
							       `);
							     $(this).addClass("active"); // Mark as active in dropdown
							   }
							   $(".dropdown").hide();
							 }); */

							$(".dropdown1 div")
									.click(
											function() {
												var value = $(this).text();
												var valueId = $(this).data(
														"value");
												var $selectedItems = $(".selected-items");
												var $dropdownItem = $(this);

												if ($selectedItems
														.find(".selected-item[data-value='"
																+ value + "']").length === 0) {
													var html = '<div class="selected-item" data-value="' + valueId + '">'
															+ value
															+ '<i class="fa fa-star star"></i>'
															+ '<span class="remove">&times;</span>'
															+ '</div>';
													$selectedItems.append(html);
													$dropdownItem
															.addClass("active");
												}

												$(".dropdown1").hide();
											});

							$(document).on("click", ".star", function() {
								$(this).toggleClass("mandatory");
							});

							$(document).on(
									"click",
									".remove",
									function() {
										var value = $(this).parent().data(
												"value");
										$(this).parent().remove();
										$(
												".dropdown1 div[data-value='"
														+ value + "']")
												.removeClass("active"); // Remove active state
									});

							$(document)
									.click(
											function(e) {
												if (!$(e.target)
														.closest(
																".multi-select-container").length) {
													$(".dropdown1").hide();
												}
											});
						});
	</script>

	<script type="text/javascript">
		function search(email) {
			console.warn("Button click", email);
			$
					.ajax({
						url : "/searchbyemail",
						type : "POST",
						contentType : "application/json",
						data : JSON.stringify({
							"email" : email

						}),
						success : function(response) {
							console.log("Response received:", response); // Log the response to verify it
							if (response === 'User Found') { // Trim to remove any leading/trailing spaces
								console.warn('inside if condition');
								var form = document.createElement("form");
								form.method = "POST";
								form.action = "/searchCandidates";

								/*  form.appendChild(emailInput); */

								document.body.appendChild(form);
								form.submit();
							} else if (response === 'No User Found') {
								showToast("info",
										"No user found or some condition did not match.");
								/*window.location.href = "/portalRegister?email="+data;*/
								var form = document.createElement("form");
								form.method = "POST";
								form.action = "/empportalRegister";
								var emailInput = document
										.createElement("input");
								emailInput.type = "hidden";
								emailInput.name = "email";
								emailInput.value = email;

								form.appendChild(emailInput);

								document.body.appendChild(form);
								form.submit();
							}
						},
						error : function(xhr, status, error) {
							console.log("error ========== " + error);
						}
					});
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {

			sessionStorage.setItem("isVisibleFlag", "${isVisibleFlag}");
			var isVisible = sessionStorage.getItem("isVisibleFlag").toString();
			if (isVisible === "1") {
				$("#availcredits").hide();
			}
			sessionStorage.setItem("companyId", "${companyId}");
			sessionStorage.setItem("userId", "${userId}");
		});
	</script>
</body>

</html>