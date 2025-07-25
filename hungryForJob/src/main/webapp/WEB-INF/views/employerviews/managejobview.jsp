<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="employer/css/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" />
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
						<li class="active"><a href="#"> <img
								src="employer/img/candidates.svg"> Candidates <span
								class="count"> ${jobpostdetails.candidateApplied}</span>
						</a></li>
						<li><a href="#" onclick="findNewroute2(${jobpostId})"> <img
								src="employer/img/jobinfo.svg"> Job Info
						</a></li>
						<li><a href=""><img src="employer/img/calendar.svg">
								Calendar </a></li>
					</ul>

					<div class="searchBox">
						<div class="row">
							<div class="col-lg-12 col-12">
								<div class="form-group ">
									<span class="input-groups "> <i class="bi bi-search"></i></span>
									<input type="text" class="form-control input-group-form "
										id="searchBox" placeholder="Search Job">
								</div>
							</div>
						</div>
					</div>


				</div>

				<div class="contentkanban">
					<div class="row">
						<!-- New Applied -->
						<c:forEach items="${cardnames}" var="cardnames">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="contentbox ${fn:replace(cardnames.name, ' ', '')}">
									<h3>
										${cardnames.name}
										<c:if test="${cardnames.id eq 1}">
											<span>${jobpostdetails.countApplied}</span>
										</c:if>
										<c:if test="${cardnames.id eq 2}">
											<span>${jobpostdetails.countScreening}</span>
										</c:if>
										<c:if test="${cardnames.id eq 3}">
											<span>${jobpostdetails.countScheduledInterview}</span>
										</c:if>
										<c:if test="${cardnames.id eq 4}">
											<span>${jobpostdetails.countStatus}</span>
										</c:if>

									</h3>
									<div class="scrollbar" id="itemListBox">
										<c:forEach items="${candidatesDetails}" var="candidateDetails">
											<c:if
												test="${candidateDetails.candidateStatus == cardnames.id}">
												<div class="card-box">
													<div class="prfilesbox">
														<div class="profileImgs">
															<c:if
																test="${not empty candidateDetails.candidateProfileImage}">
																<img
																	src="data:image/jpeg;base64,${candidateDetails.candidateProfileImage}">
															</c:if>
															<c:if
																test="${empty candidateDetails.candidateProfileImage}">
																<img src="employer/img/profile-img.jpg">
															</c:if>
														</div>
														<div class="profilTxt">
															<h5>${candidateDetails.candidateName}</h5>
															<p>${candidateDetails.candidateEmail}</p>
														</div>
													</div>
													<div class="list-price">
														<ul class="list-group list-group-horizontal">
															<li class="me-2"><img src="employer/img/year.svg">
																0-${candidateDetails.candidateTotalExp} years</li>
															<li class="me-2"><img src="employer/img/inr.svg">${candidateDetails.candidateCurrentCtc}-${candidateDetails.candidateExpectedCtc}
																Lacs</li>
														</ul>
													</div>
													<div class="appliedat">
														<p>
															Applied at <span>
																${candidateDetails.candidateAppliedDate} </span>
														</p>
														<c:if test="${cardnames.id eq 4}">
															<span
																class="${fn:toLowerCase(candidateDetails.hiringStatus)}">
																${candidateDetails.hiringStatus} </span>
														</c:if>
														<c:if test="${cardnames.id ne 4}">
															<span data-bs-toggle="modal" data-bs-target="#stepModal"
																onclick="changestatus('${cardnames.id}','${candidateDetails.candidateName}','${candidateDetails.id}','${candidateDetails.candidateId}')"><a
																href="#"> <i class="bi bi-chevron-right"></i></a> </span>
														</c:if>

													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>

	</main>

	<!-- Modal -->

	<div class="modal fade" id="stepModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel"></h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="schedule" class="required">Schedule</label> <select
									class="selet2Single form-control" id="schedule"
									style="width: 100%;" onchange="selectStatus(this)">
									<option value="" selected="" disabled>Select</option>
									<c:forEach items="${cardnames}" var="cardnames">
										<option value="${cardnames.id}">${cardnames.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="scheduleInterview" id="scheduleInterview"
						style="display: none;">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label for="interviewDate" class="required">Interview
										Date</label> <input type="text" name="interviewDate"
										id="interviewDate" class="form-control datepicker"
										readonly="readonly" placeholder="Interview Date">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label for="interviewTime" class="required">Interview
										Time</label> <input type="text" name="interviewTime"
										id="interviewTime" class="form-control"
										placeholder="Interview Time">
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-12">
								<div class="form-group">
									<label for="jobTitle">Job Title</label> <input type="text"
										name="jobTitle" id="jobTitle" class="form-control" disabled>
								</div>
							</div>
							
							<div class="col-lg-12 col-md-12 col-12">
								<div class="form-group">
									<label for="interviewerEmail" class="required">Interview Panel</label>
										<select class="form-select form-control selet2Multiple" multiple="multiple" id="interviewerEmail" style="width: 100%;" placeholder="">
										<option value="">Select</option>
										<c:forEach items="${interviewPanel}" var="interviewPanel">
											<option value="${interviewPanel.name}">${interviewPanel.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<!-- <div class="col-lg-12 col-md-12 col-12">
								<div class="form-group">
									<label for="interviewPanel" class="required">Interview
										Panel</label>
									<div class="email-id-row">
										<div class="all-mail" id="interviewPanelAllMail"></div>
										<input type="text" name="email" id="interviewPanel"
											class="enter-mail-id" placeholder="Enter Interview Panel">
									</div>
								</div>
							</div> -->

							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label for="interviewMode" class="required">Interview
										Mode</label> <select class="selet2Single form-control"
										id="interviewMode" style="width: 100%;">
										<option value="" selected="" disabled>Select</option>
										<c:forEach items="${interviewmode}" var="interviewmode">
											<option value="${interviewmode.name}">${interviewmode.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<div class="form-group">
									<label for="link" class="required">Link</label> <input
										type="text" name="link" id="link" class="form-control"
										placeholder="Enter link">
								</div>
							</div>
						</div>
					</div>

					<div class="statusHide" id="statusHide" style="display: none;">
						<div class="col-lg-12 col-md-12 col-12">
							<div class="form-group">
								<label for="statusvalue" class="required">Status</label> <select
									class="selet2Single form-control" id="statusvalue"
									style="width: 100%;">
									<option value="" selected="" disabled>Select</option>
									<option value="Selected">Selected</option>
									<option value="Hold">Hold</option>
									<option value="Rejected">Rejected</option>
								</select>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="reviewDescription">Description </label>
								<textarea class="form-control" id="reviewDescription"
									placeholder="Enter reviewDescription" maxlength="30"> </textarea>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btns" id="candidatejobid">Submit</button>
				</div>
			</div>
		</div>
	</div>




	<script src="employer/js/jquery.min.js"></script>
	<script src="employer/js/popper.min.js"></script>
	<script src="employer/js/bootstrap.min.js"></script>
	<script src="employer/js/select2.min.js"></script>
	<script src="employer/js/nice-select.min.js"></script>
	<script src="employer/js/moment.min.js"></script>
	<script src="employer/js/bootstrap-datepicker.min.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="js/commonvalidation.js"></script>
	<script src="employer/js/bootstrap-datetimepicker.min.js"
		type="text/javascript"></script>
	<script>
		$('.datepicker').datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true,
			startDate: new Date()
		});
		
		 $("#interviewTime").datetimepicker({
		        format : "hh:mm A",
				icons: {
		          time: 'fa fa-clock-o',
		          date: 'fa fa-calendar',
		          up: 'fa fa-chevron-up',
		          down: 'fa fa-chevron-down',
		          previous: 'fa fa-chevron-left',
		          next: 'fa fa-chevron-right',
		          today: 'fa fa-calendar-check-o',
		          clear: 'fa fa-trash',
		          close: 'fa fa-times'
		        }
		     });

		
		 $(".enter-mail-id").keydown(function (e) {
			  if (e.keyCode == 13 || e.keyCode == 32) {
			    //alert('You Press enter');
				 var getValue = $(this).val();
				 $('.all-mail').append('<span class="email-ids">'+ getValue +' <span class="cancel-email">x</span></span>');
				 $(this).val('');
			  }
			});


			/// Cancel 

			$(document).on('click','.cancel-email',function(){
				  
				      $(this).parent().remove();
				
				});

			  // $('.enter-mail-id').click()
			 

		$(document).ready(function() {
			$(".selet2Single").select2({
				placeholder : "Select"
			});
			$(".selet2Multiple").select2({
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
			
			$("#statusvalue").select2({
				dropdownParent : $("#statusvalue").parent()
			});
			
			$("#interviewerEmail").select2({
				dropdownParent : $("#interviewerEmail").parent()
			});
			
			
		});

		$(document).ready(function() {
			$('select').niceSelect();
		});
		
		
		$(document).ready(function () {
		    $('#searchBox').on('keyup', function () {
		        var value = $(this).val().toLowerCase();
		        var hasMatch = false;

		        $('#itemListBox .card-box').each(function () {
		            var match = $(this).text().toLowerCase().indexOf(value) > -1;
		            $(this).toggle(match);
		            if (match) hasMatch = true;
		        });

		    });
		});



		function findNewroute(element) {
			var id = element.value;

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
		function findNewroute2(id) {

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
		function changestatus(id, name, jobid, candidateId) {
			$("#exampleModalLabel").text(name);
			$("#statusHide").hide();
			$("#scheduleInterview").hide();
			$("#schedule").val("").trigger('change');
			$("#candidatejobid").attr("onclick", "sendChangeStatus('" + jobid + "', '" + candidateId + "')");
			if (id === "1") {
				$('#schedule option[value="1"]').prop('disabled', true);
			} else if (id === "2") {
				$('#schedule option[value="1"]').prop('disabled', true);
				$('#schedule option[value="2"]').prop('disabled', true);
			} else if (id === "3") {
				$('#schedule option[value="1"]').prop('disabled', true);
				$('#schedule option[value="2"]').prop('disabled', true);
				$('#schedule option[value="3"]').prop('disabled', true);
			} else if (id === "4") {
				$('#schedule option[value="1"]').prop('disabled', true);
				$('#schedule option[value="2"]').prop('disabled', true);
				$('#schedule option[value="3"]').prop('disabled', true);
				$('#schedule option[value="4"]').prop('disabled', true);
			} else {
				$('#schedule option[value="1"]').prop('disabled', true);
				$('#schedule option[value="2"]').prop('disabled', true);
				$('#schedule option[value="3"]').prop('disabled', true);
				$('#schedule option[value="4"]').prop('disabled', true);
			}
		}
		function selectStatus(element) {
			var id = element.value;
			var jobpostname = $("#allCategories option:selected").text();
			$("#jobTitle").val(jobpostname);
			if (id === "3") {
				$("#statusHide").hide();
				$("#scheduleInterview").show();
			}else if(id === "4")
			{
				$("#statusHide").show();
				$("#scheduleInterview").hide();
			}
			else {
				$("#statusHide").hide();
				$("#scheduleInterview").hide();
			}
			
		}
		function sendChangeStatus(jobid,candidateId)
		{
			var isvalid =true;
			var status = $("#schedule").val();
			if(checkvalidation(status))
			{
				isvalid=false;
				showToast("info","please select the status ");
			}else if(status === "3")
			{
					var interviewDate = $("#interviewDate").val();
					if(checkvalidation(interviewDate))
					{
						showToast("info","please enter the date");
						isvalid=false;
						return
					}
					var interviewTime = $("#interviewTime").val();
					if(checkvalidation(interviewTime))
					{
						showToast("info","please enter the time");
						isvalid=false;
						return
					}
					var jobtitle = $("#jobTitle").val();
					if(checkvalidation(jobtitle))
					{
						showToast("info","please enter the jobtittle");
						isvalid=false;
						return
					}
					var emails = $("#interviewerEmail").val();
					if (checkvalidation(emails)) {
						showToast("info","please enter the interviewer");
						isvalid=false;
						return
					}
					
					var interviewmode = $("#interviewMode").val();
					if(checkvalidation(interviewmode))
					{
						showToast("info","please enter the interview mode");
						isvalid=false;
						return
					}
					var link = $("#link").val();
					if(checkvalidation(link))
					{
						showToast("info","please enter the link");
						isvalid=false;
						return
					}
					
					if(isvalid)
					{
						$.ajax({
							url:"changeCandidateStatusjob",
							type:'post',
							contentType: 'application/json',
							data: JSON.stringify({
						        id: jobid,
						        status: status,
						        candidateId: candidateId,
						        interviewDate:interviewDate,
						        interviewTime:interviewTime,
						        jobTittle:jobtitle,
						        interViewerEmail:emails,
						        interviewmode:interviewmode,
						        interviewLink:link
						    }),
					        success: function(response) {
					            // Success callback
					            if(response.errors.errorCode === "0000")
					            {
					            	showToast("success","Updated Sucessfully");
					            	setTimeout(function() {
					            	    location.reload();
					            	},2000);

								}else
								{
									console.log("error ocurred in service"+error)	
									showToast("error","failed");
								}
					        },
					        error: function(xhr, status, error) {
					            // Error callback
					            console.log("error ocurred"+error)
					        }
						})
					}
			
			}else if(status === "4")
			{
				var candidatefinalstatus= $("#statusvalue").val();
				var desc = $("#reviewDescription").val();
				if(checkvalidation(candidatefinalstatus))
				{
					showToast("info","please enter the status");
					isvalid=false;
					return
				}
				if(isvalid)
				{
					$.ajax({
						url:"changeCandidateStatusjob",
						type:'post',
						contentType: 'application/json',
						data: JSON.stringify({
					        id: jobid,
					        status: status,
					        candidateId: candidateId,
					        hiringStatus: candidatefinalstatus,
					        review: desc
					    }),
				        success: function(response) {
				            // Success callback
				            if(response.errors.errorCode === "0000")
				            {
				            	showToast("success","Updated Sucessfully");
				            	setTimeout(function() {
				            	    location.reload();
				            	},2000);

							}else
							{
								console.log("error ocurred in service"+error)	
								showToast("error","failed");
							}
				        },
				        error: function(xhr, status, error) {
				            // Error callback
				            console.log("error ocurred"+error)
				        }
					})
				}
			}
			else 
			{
				if(isvalid)
				{
					$.ajax({
						url:"changeCandidateStatusjob",
						type:'post',
						contentType: 'application/json',
						data: JSON.stringify({
					        id: jobid,
					        status: status,
					        candidateId: candidateId,
					        
					    }),
				        success: function(response) {
				            // Success callback
				            if(response.errors.errorCode === "0000")
				            {
				            	showToast("success","Updated Sucessfully");
				            	setTimeout(function() {
				            	    location.reload();
				            	},2000);

							}else
							{
								console.log("error ocurred in service"+error)	
								showToast("error","failed");
							}
				        },
				        error: function(xhr, status, error) {
				            // Error callback
				            console.log("error ocurred"+error)
				        }
					})
				}
			}
			
			
		}
	</script>
</body>

</html>