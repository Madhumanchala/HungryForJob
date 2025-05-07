<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="employer/css/bootstrap.min.css" rel="stylesheet">
<link href="employer/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="employer/css/select2.min.css" rel="stylesheet" />
<link href="employer/css/nice-select.css" rel="stylesheet">
<link href="employer/css/richtext.min.css" rel="stylesheet" />
<link href="employer/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="employer/css/style.css" rel="stylesheet"/>

<style>
.folder-link:hover {
    color: #007bff; /* Change to your preferred hover color */
    text-decoration: none; /* Optional: Add underline on hover */
}
</style>
</head>
<body class="bg">
	<div class="loader">
		<img src="employer/img/loader.gif">
	</div>
	<%@include file="toaster.jsp"%>
	<%@include file="employerHeader.jsp"%>
	<main id="main">
		<section class="section-inner advancedsearch-section ">
			<div class="container">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<div class="manageFolders d-flex justify-content-between mb-3">
							<h3 class="maintitle">Manage Folders</h3>
							<button class="btn-blue" data-bs-toggle="modal"
								data-bs-target="#createFolderModal">Create folder</button>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row ">
					<div class="col-xl-3 col-lg-4 col-md-4  ">
						<div class="filters-actions">
							<div>
								<button class="btn filter-btn d-md-none">
									<svg xmlns="http://www.w3.org/2000/svg" class="mr-2"
										height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
                    <path d="M0 0h24v24H0V0z" fill="none" />
                    <path
											d="M3 18h6v-2H3v2zM3 6v2h18V6H3zm0 7h12v-2H3v2z" />
                  </svg>
									Filter
								</button>
							</div>
						</div>

						<div class="card-register filters-left manage-check ">
							<form autocomplete="off">
								<div class="card-content sidebar ">
									<div class="searchFilter sidebar__inner">
										<h4
											class="border-bottom filter-header d-flex justify-content-between d-md-none p-3 mb-0 align-items-center">
											<span> Search Filter</span> <span
												class="mr-2 filter-close-btn"> X </span>
										</h4>
										<h4 class=" d-none d-sm-block">
											<i class="bi bi-filter"></i> Filters
										</h4>

										<div class="accordion-body">
											<h5>Created date</h5>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="createddate" id="last7days"
													onchange="updateSelection('7','last7days')">
												<label class="form-check-label" for="last7days">
													Last 7 days </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="createddate" id="last14days"
													onchange="updateSelection('14','last14days')">
												<label class="form-check-label" for="last14days">
													Last 14 days </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="createddate" id="last30days"
													onchange="updateSelection('30','last30days')">
												<label class="form-check-label" for="last30days">
													Last 30 days </label>
											</div>
											<!-- <div class="form-check">
                        <input class="form-check-input" type="radio" name="createddate" id="customdaterange">
                        <label class="form-check-label" for="customdaterange">
                          Custom date range </label>
                      </div> -->
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="col-xl-9 col-lg-8 col-md-8">
						<div class="activein mb-3">
							<div class="d-flex align-items-center">
								<h6 class="mb-0">My folders (${foldesize})</h6>
							</div>
							<div class="d-flex align-items-center">

								<!-- <div class="d-flex align-items-center me-2">
									<label class="col-form-label">Show</label>
									<div>
										<select class="formselect" id="activein">
											<option selected>All</option>
											<option value="20">20</option>
											<option value="30">30</option>
											<option value="40">40</option>
											<option value="50">50</option>
											<option value="60">60</option>
											<option value="80">80</option>
											<option value="100">100</option>
											<option value="150">150</option>
											<option value="200">200</option>
										</select>
									</div>
								</div> -->
							</div>
						</div>

						<div class="selectAll ">
							<div
								class="card-listinner align-items-center d-flex justify-content-between">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="selectall"> <label class="form-check-label"
										for="selectall"> Select All </label>
								</div>
								<div class="sortby ">
									<label class="col-form-label">Sort by:</label>
									<div>
										<select class="formselect" id="sortby">
											<option value="createddate">Created date</option>
											<option value="foldername">Folder name</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="advancedsearch-list manage-check">
							<c:forEach items="${folderdetails}" var="folderdetails">
								<div class="card-list-box">
									<div class="card-listinner">
										<div class="card-search">
											<div class="searchprfile">
												<div class="form-check">
													<input class="form-check-input selectedId" type="checkbox"
														value="" id="selectbox">
												</div>
												<div class="profilTxt ms-2">

													<h4>
														<span class="folder-link"
															onclick="handleFolderClick('${folderdetails.id}')">${folderdetails.foldername}</span>
													</h4>
												</div>
											</div>
											<div class="candidatesTxt ">
												<h5>${folderdetails.totalCandidates} Candidates</h5>

												<div class="dropdown ">
													<div class=" " data-bs-toggle="dropdown"
														aria-expanded="false">
														<i class="bi bi-three-dots-vertical"></i>
													</div>
													<ul class="dropdown-menu dropdown-menu-end">
														<li><a class="dropdown-item" href="#"
															data-bs-toggle="modal" onclick="handleedit('${folderdetails.foldername}',${folderdetails.id})">  <!-- #editFolderModal -->
																<i class="bi bi-pencil"></i> Edit
														</a></li>
														<li><a class="dropdown-item" href="#"> <i
																class="bi bi-share"></i> Share/Unshare
														</a></li>
														<li><a class="dropdown-item" href="#" onclick="handledelete(${folderdetails.id})"><i
																class="bi bi-trash3"></i> Delete</a></li>
													</ul>
												</div>

											</div>
										</div>
										<div class="createdTxt">
											<p>
												<span> Created on ${folderdetails.createdDate} </span> | <span>Shared
													with All users </span>
											</p>
										</div>
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

	<!-- editFolderModal   -->
	<div class="modal fade" id="editFolderModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Edit
						folder</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="salesforceDeveloper" class="required">Folder
									name</label> <input type="text" name="salesforceDeveloper"
									id="salesforceDeveloper" class="form-control"
									placeholder="Enter folder name">

							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn-blue" onclick="handlesubmitfolderName()">Save</button>
				</div>
			</div>
		</div>
	</div>

	<!-- createFolderModal   -->
	<div class="modal fade" id="createFolderModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title  ms-2" id="exampleModalLabel">Create
						folder</h5>
					<button type="button" class="btn-close  me-2"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pe-4 ps-4 py-4">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="folderName" class="required">Folder name</label> <input
									type="text" name="folderName" id="folderName"
									class="form-control" placeholder="Enter folder name">

							</div>
						</div>
						<!-- <div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="sharewithusers" class="required">Share with
									users </label> <input type="text" name="sharewithusers"
									id="sharewithusers" class="form-control"
									placeholder="Search user by email">
							</div>
						</div> -->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn-blue" onclick="createfolder()">Create</button>
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
	<script src="employer/js/jquery.richtext.js"></script>
	<script src="employer/js/main.js"></script>
	<script src="employer/js/managefolders.js"></script>
	<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

     var userId="<%=userId%>";
    var companyId="<%=companyId%>";
    
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
      
      var filter =sessionStorage.getItem("filterdays");
      if(filter)
      {
    	   $('#'+filter).prop('checked',true);
    	   sessionStorage.removeItem("filterdays","");
      }else
    	{
    	  filter = "";
    	 }
    });

    $(document).ready(function () {
      $('#selectall').click(function () {
        $('.selectedId').prop('checked', this.checked);
      });

      $('.selectedId').change(function () {
        var check = ($('.selectedId').filter(":checked").length == $('.selectedId').length);
        $('#selectall').prop("checked", check);
      });
    });

  </script>


	<script>
    // if < then 768
    // mobile sorting overlay jquery start
    const mediaQuerymobile = window.matchMedia("(max-width: 767px)");

    if (mediaQuerymobile.matches) {
      $(".sort-drop").on("show.bs.dropdown", function () {
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