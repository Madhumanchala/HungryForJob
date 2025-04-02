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
<link href="/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="admin/css/select2.min.css" rel="stylesheet" />
<link href="admin/css/font-awesome.min.css" rel="stylesheet">
<link href="admin/css/datatables.bootstrap5.css" rel="stylesheet" />
<link href="admin/css/style.css" rel="stylesheet">
<link href="admin/css/bootstrap-datepicker.min.css" rel="stylesheet" />
</head>
<body class="bg">
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="toaster.jsp"%>
	<header id="header" class="header fixed-top">
		<div
			class="container-fluid  d-flex align-items-center justify-content-between">
			<div class="">
				<div class="d-flex align-items-center">
					<a href="index.html" class="logo "> <img src="img/logo.svg"
						alt="">
					</a>
					<nav id="navbar" class="navbar">
						<i class="bi bi-list mobile-nav-toggle"></i>
						<ul>	
							<li><a href="dashboard.html" class="active">Dashboard </a></li>
							<li><a href="pricing-plan.html">Pricing Plan</a></li>
							<!-- <li class="dropdown"><a href="javascript:void(0)">Post a jobs <i class="bi bi-chevron-down"></i> </a>
                <ul>
                  <li> <a href="post-new-job.html">Post a Job </a></li>
                  <li> <a href="post-internship.html">Post an Internship </a></li>
                </ul>
              </li>-->

						</ul>
					</nav>
					<!-- navbar -->
				</div>
			</div>
			<div class=" d-flex">
				<div class="profileBtn">
					<div class="dropdown">
						<button class="btn dropdown-toggle" type="button"
							id="dropdownMenuButton" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<div class="d-flex align-items-center">
								<div class="profile-img">
									<img src="admin/img/profile-img.jpg">
								</div>
								<div class="proTxt">
									<strong>John legend</strong>
									<p>Admin</p>
								</div>
								<i class="bi bi-chevron-down"></i>
							</div>
						</button>
						<div class="dropdown-menu dropdown-menu-end"
							aria-labelledby="dropdownMenuButton">

							<a class="dropdown-item myProfLink" href="company-profile.html">
								<i class="bi bi-person"></i> My Profile
							</a> <a class="dropdown-item myProfLink" href="change-password.html">
								<i class="bi bi-lock"></i> Change Password
							</a> <a class="dropdown-item logOutLink" href="#"> <i
								class="bi bi-box-arrow-right"></i> Logout
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- End Header -->

	<main id="main">

		<section class="section-inner advancedsearch-section">
			<div class="container-fluid">
				<div
					class=" d-md-flex d-sm-inline-flex justify-content-between align-items-center mt-2 mb-4">
					<div
						class="d-flex align-items-center gap-3 dashboardIcon card-listinner">

						<div class="dashboardDetails ">
							<h3>${countOfCompanyDetails.countRegister}</h3>
							<p>Registered</p>
						</div>
						<div class="icondashboard">
							<img src="admin/img/registered.svg" alt="">
						</div>
					</div>
					<div
						class="d-flex align-items-center gap-3 active2 dashboardIcon card-listinner">

						<div class="dashboardDetails ">
							<h3>${countOfCompanyDetails.countActive}</h3>
							<p>Active</p>
						</div>
						<div class="icondashboard">
							<img src="admin/img/active.svg" alt="">
						</div>
					</div>

					<div
						class="d-flex align-items-center gap-3 pending2 dashboardIcon card-listinner">
						<div class="dashboardDetails">
							<h3>${countOfCompanyDetails.countPending}</h3>
							<p>Pending</p>
						</div>
						<div class="icondashboard">
							<img src="admin/img/pending.svg" alt="">
						</div>
					</div>
					<div
						class="d-flex align-items-center gap-3 pending2 dashboardIcon card-listinner">
						<div class="dashboardDetails">
							<h3>${countOfCompanyDetails.countProcessing}</h3>
							<p>Processing</p>
						</div>
						<div class="icondashboard">
							<img src="admin/img/processing.svg" alt="">
						</div>
					</div>
					<div
						class="d-flex align-items-center gap-3 failure2 dashboardIcon card-listinner">

						<div class="dashboardDetails">
							<h3>${countOfCompanyDetails.countFailure}</h3>
							<p>Failure</p>
						</div>
						<div class="icondashboard">
							<img src="admin/img/failure.svg" alt="">
						</div>
					</div>
					<div
						class="d-flex align-items-center gap-3 expired2 dashboardIcon card-listinner">
						<div class="dashboardDetails">
							<h3>${countOfCompanyDetails.countExpired}</h3>
							<p>Expired</p>
						</div>
						<div class="icondashboard">
							<img src="admin/img/expired.svg" alt="">
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="companyList">
							<div class="card">
								<div class="d-flex justify-content-between align-items-center ">
									<h4>Company List</h4>
									<div class="formchecks">
										<ul>

											<li><input type="radio" class="btn-check"
												name="companyList" id="Registered" onchange="choosestatus('Registered')"> <label
												class="btn" for="Registered"><span>Registered
												</span> </label></li>
											<li><input type="radio" class="btn-check"
												name="companyList" id="Active" onchange="choosestatus('Active')"> <label class="btn"
												for="Active"><span>Active </span> </label></li>
											<li><input type="radio" class="btn-check"
												name="companyList" id="Pending" onchange="choosestatus('Pending')"> <label class="btn"
												for="Pending"><span>Pending </span> </label></li>
											<li><input type="radio" class="btn-check"
												name="companyList" id="Processing" onchange="choosestatus('Processing')"> <label
												class="btn" for="Processing"><span>Processing
												</span> </label></li>
											<li><input type="radio" class="btn-check"
												name="companyList" id="Failure" onchange="choosestatus('Failure')"> <label class="btn"
												for="Failure"><span>Failure </span> </label></li>
											<li><input type="radio" class="btn-check"
												name="companyList" id="Expired" onchange="choosestatus('Expired')"> <label class="btn"
												for="Expired"><span>Expired </span> </label></li>
										</ul>
									</div>
								</div>
								<div class="line2"></div>
	<div class="col-12 pt-0 p-3">
    <div class="table-responsive1">
        <div id="no-more-tables">
            <table id="activecompanydetails" class="table display nowrap companytable scroll" style="width:100%">
                <thead>
                    <tr>
                        <th>Company Name</th>
                        <th>Mobile No</th>
                        <th>User Name</th>
                        <th class="hideplan">Plan Name</th>
                        <th class="hideplan">Amount Paid</th>
                        <th class="hideplan">User Access</th>
                        <th class="hideplan">UTR No</th>
                        <th class="hideplan">UTR Date</th>
                        <th class="hideplan">Status</th>
                        <th class="hideplan">Action</th>
                        <th class="hideplan starthide">Plan Start</th>
                        <th class="hideplan starthide">Plan End</th>
                        <th class="hideplan">GST No</th>
                        <th>Industry</th>
                    </tr>
                </thead>
                <tbody>
                            <c:forEach items="${companydetails}" var="details"> 
                                <tr>
                                    <td data-title="Company Name">
                                        <div class="comp-circle d-flex align-items-center">
                                            <span class="txtcri d-flex align-items-center justify-content-center">
                                                <img src="admin/img/company03.svg">
                                            </span>
                                            <div>
                                                <span class="ctitle">${details.companyName}</span>
                                                <span class="email">${details.companyEmailId}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-title="Mobile No">${details.mobileNo}</td>
                                    <td data-title="User Name">${details.name}</td>
                                    <td data-title="Plan Name" class="hideplan">${details.planName}</td>
                                    <td data-title="Amount Paid" class="hideplan">
                                        <span class="price"><i class="bi bi-currency-rupee"></i> ${details.amount}</span>
                                    </td>
                                    <td data-title="User Access" class="hideplan">${details.userAccess}</td>
                                    <td data-title="UTR No" class="hideplan">${details.utr_no}</td>
                                    <td data-title="UTR Date" class="hideplan">${details.utrDate}</td>
                                    <td data-title="Status" class="hideplan">
                                        <span class="status ${details.statuscolor}">${statusvalue}</span>
                                    </td>
                                    <td data-title="Action" class="hideplan">
                                        <div class="activetable">
                                            <select class="form-control form-select select2Single  actionfrom" id="selectmodal${details.id}" onchange="openmodal('selectmodal${details.id}','${details.planName}')" style="width: 100%" ${details.status == '1' || details.status == '3' || details.status == '2' ? 'disabled' : ''}>
                                                <option value="pending" ${details.status == '0' ? 'selected' : ''} class="pendingdisabled" >Pending</option>
                                                <option value="active" ${details.status == '1' ? 'selected' : ''} class="activedisabled">Active</option>
                                                <option value="failure" ${details.status == '2' ? 'selected' : ''}>Failure</option>
                                                <option value="expired" ${details.status == '3' ? 'selected' : '' } class="hideExpired">Expired</option>
                                                <option value="processing" ${details.status == '4' ? 'selected' : '' } class="processingdisabled">Processing</option>
                                            </select>
                                        </div>
                                    </td>
                                     <td data-title="Plan End" class="hideplan starthide">${details.planStart}</td>
                                    <td data-title="Plan End" class="hideplan starthide">${details.validity}</td>
                                    <td data-title="GST No" class="hideplan">${details.gst_no}</td>
                                    <td data-title="Industry">${details.industry}</td>
                                </tr>
                            </c:forEach>
                        
                </tbody>
            </table>
        </div>
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
			<div class="copyright text-">
				<p>© Copyright. Hungry for job all right reserved</p>
			</div>
		</div>
	</footer>
	<!-- End Footer -->


	<div class="modal fade" id="activeModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Active
						Plan</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="selectPlan" class="required">Select Plan</label> <select
									class="form-control form-select" id="selectPlan" disabled>
									<option value="">Select</option>
									<c:forEach items="${plandetails}" var="plan">
										<option value="${plan.id}">${plan.planName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="planStartDate" class="required">Plan Start
									Date </label> <input type="text" name="planStartDate" id="startDate"
									class="form-control datepicker" placeholder="Plan Start Date">

							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal" id="cancelbutton">Cancel</button>
					<button type="button" class="btn-blue" id="submitbutton">Submit</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="statusmodal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Active
						Plan</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<span>Are You Sure Want to Submit</span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal" id="dialogcancelbutton">No</button>
					<button type="button" class="btn-blue" id="submitstatus">Yes</button>
				</div>
			</div>
		</div>
	</div>


	<script src="admin/js/jquery.min.js"></script>
	<script src="admin/js/popper.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/dataTables.js"></script>
	<script src="admin/js/dataTables.bootstrap5.js"></script>
	<script src="admin/js/select2.min.js"></script>
	<script src="admin/js/main.js"></script>
	<script src="js/commonvalidation.js"></script>
	<script src="admin/js/bootstrap-datepicker.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".selet2Multiple").select2({});
			$(".select2Single").select2({
				minimumResultsForSearch : -1,
			}); 
			$('.datepicker').datepicker({
			    format: 'dd-mm-yyyy',
			    autoclose: true,
			    startDate: new Date(new Date().getFullYear(), new Date().getMonth() - 1, 1), // First day of the previous month
			    changeYear: true,  // Enables year selection
			    changeMonth: true  // Enables month selection
			});
		});

		$(document).ready(function() {
			var choosestatusvalue = "${statusvalue}";
			var columnDefs = [];
			if (choosestatusvalue === "Registered" || choosestatusvalue === "") {
			    columnDefs = [{ targets: 'hideplan', visible: false }];
			} else if (choosestatusvalue === "Pending" || choosestatusvalue === "Failure") {
			    columnDefs = [{ targets: 'starthide', visible: false }];
			}

			$('#activecompanydetails').dataTable({
				scrollX: true,
				ordering: false,
		        autoWidth: false,
		        responsive: false,
				columnDefs: columnDefs,
				
			});
		});

		$(document).ready(function() {
			$('#actionfrom').change(function() {
				var modalId = $(this).val();
				if (modalId) {
					$('#' + modalId).modal('show');
					$(this).val("");
				}
			});
			var table = $('#activecompanydetails').DataTable();
			var choosestatusvalue = "${statusvalue}";
			if(choosestatusvalue)
			{
				$(".loader").hide();
				$("#"+choosestatusvalue).prop("checked",true);
				if(choosestatusvalue === 'Registered')
				{
					$(".hideplan").hide();
				}else
				{
					$(".hideplan").show();
				}
				$(".select2Single").each(function() {
			        if ($(this).find("option:selected").val() === "pending") {
			            $(this).find(".hideExpired").remove();
			            $(this).find(".pendingdisabled").attr("disabled",true)
			            $(this).find(".processingdisabled").attr("disabled",true)
			        }
			        if ($(this).find("option:selected").val() === "processing") {
			            $(this).find(".hideExpired").remove();
			            $(this).find(".processingdisabled").attr("disabled",true)
			             $(this).find(".activedisabled").attr("disabled",true)
			        }
			    });
			}else
			{
				$("#Registered").prop("checked",true);
				$(".hideplan").hide();
				$(".loader").hide();
			}
		});
		function choosestatus(id)
		{
				let form = document.createElement('form');
				form.method = 'GET'; 
				form.action = "/admindashboard";
				
				var input = document.createElement('input');
				input.name='statusvalue'
				input.value=id;
				form.append(input);
				
				document.body.appendChild(form);
				form.submit(); 
		}
		function openmodal(id,name) {
			$("#statusmodal").modal("hide");
		    var status = $("#" + id).val();
		    var idvalue = id.replace("selectmodal","");
		    if (status === "active") {
		        $("#activeModal").modal("show");
		        $("#cancelbutton").attr("onclick", "cancelAction('" + id + "', '" + '${statusvalue}' + "')");
		        $("#submitbutton").attr("onclick", "submitplanstatus(" + idvalue + ")");
		        var selectElement = document.getElementById("selectPlan");
		        if(name)
		        {
		        	for (var i = 0; i < selectElement.options.length; i++) {
		                if (selectElement.options[i].text.trim() === name.trim()) {
		                    selectElement.selectedIndex = i;
		                    break;
		                }
		            }
		        }
		    } else {
		        $("#activeModal").modal("hide");
		        $("#dialogcancelbutton").attr("onclick", "cancelAction('" + id + "', '" + '${statusvalue}' + "')");
		        $("#submitstatus").attr("onclick", "changestatus('" + idvalue + "', '" + '${statusvalue}' + "')");
		        $("#statusmodal").modal("show");
		    }
		}

		function cancelAction(id, value) {
			
			var onclickAttr = $("#" + id).attr("onChange");
			$("#" + id).removeAttr("onChange");
		    $("#" + id).val(value.toLowerCase()).trigger("change");
		    $("#" + id).attr("onChange",onclickAttr);
		}
		
		function submitplanstatus(id)
		{
			var isvalid=true;
			var startdatevalue=$("#startDate").val();
			if(checkvalidation(startdatevalue))
			{
				isvalid=false;
				showToast("info","please enter the date");
				return 
			}
			if(isvalid)
			{
				$(".loader").show();
				$.ajax({
					url:"updatePlanStatus",
					type:'post',
					contentType: 'application/json',
					data: JSON.stringify({
						"id":id,
						"startDate":startdatevalue
		            }),
		            success: function(response) {
		                // Success callback
		                if(response)
		                {
		                	if(response.errors.errorCode === "0000")
			                {
								showToast("success","Sucessfully updated");
								$("#activeModal").modal("hide");
								$("#selectmodal"+id).attr("disabled",true);
							}else
							{
								showToast("info","please try again");
								$("#activeModal").modal("hide");
								$("#selectmodal"+id).val("pending").trigger('change');
							}
		                }else
		                {
		                	showToast("info","please try again");
							$("#activeModal").modal("hide");
							$("#selectmodal"+id).val("pending").trigger('change');
		                }
		            	setTimeout(function() {
	    					window.location.reload(true); // Reload with cache bypass
					}, 2000); // 2000ms = 2 seconds
		            	  $('.loader').hide();
		            },
		            error: function(xhr, status, error) {
		                // Error callback
		                console.log("error ocurred"+error)
		                showToast("error","failed to update");
		                $("#selectmodal"+id).val("pending").trigger('change');
		                $("#activeModal").modal("hide");
		                $('.loader').hide();
		            }
				})
			}
		}
		
		function changestatus(id,statusval)
		{
			var isvalid=true;
			var value="";
			var actionvalue = $("#selectmodal"+id).val();
			if(actionvalue)
			{
				if(actionvalue === "pending")
				{
					value="0";
				}
				else if(actionvalue === "failure")
				{
					value="2";
				}
			}else
			{
				isvalid=false;
			}
			
			if(isvalid)
			{
				$(".loader").show();
				$.ajax({
					url:"updatePlanStatus",
					type:'post',
					contentType: 'application/json',
					data: JSON.stringify({
						"id":id,
						"status":value
		            }),
		            success: function(response) {
		                // Success callback
		                if(response)
		                {
		                	if(response.errors.errorCode === "0000")
			                {
								showToast("success","Sucessfully updated");
								$("#statusmodal").modal("hide");
								$("#selectmodal"+id).attr("disabled",true);
							}else
							{
								showToast("info","please try again");
								$("#statusmodal").modal("hide");
								$("#selectmodal"+id).val(statusval.toLowerCase()).trigger('change');
							}
		                }else
		                {
		                	showToast("info","please try again");
							$("#statusmodal").modal("hide");
							$("#selectmodal"+id).val(statusval.toLowerCase()).trigger('change');
		                }
		            	setTimeout(function() {
	    					window.location.reload(true); // Reload with cache bypass
					}, 2000); // 2000ms = 2 seconds
		            	  $('.loader').hide();
		            },
		            error: function(xhr, status, error) {
		                // Error callback
		                console.log("error ocurred"+error)
		                showToast("error","failed to update");
		                $("#selectmodal"+id).val(statusval.toLowerCase()).trigger('change');
		                $("#statusmodal").modal("hide");
		                $('.loader').hide();
		            }
				})
			}
		}
		
	</script>
</body>

</html>