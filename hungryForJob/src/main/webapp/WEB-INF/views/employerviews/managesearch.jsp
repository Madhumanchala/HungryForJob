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
  <link href="employer/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="employer/css/style.css" rel="stylesheet">
</head>
<body class="bg">
<%@include file="employerHeader.jsp"%> 
<%@include file="toaster.jsp"%>
	<div class="loader" style="display: flex">
		<img src="employer/img/loader.gif">
	</div>
  <main id="main">
    <section class="section-inner advancedsearch-section ">
      <div class="container">
        <div class="row">
          <div class="col-xl-12 col-lg-12 col-md-12">
            <div class="manageFolders d-flex justify-content-between mb-3">
              <h3 class="maintitle">Manage Search</h3>
              <button class="btn-blue" onclick="findroute('/searchCandidates')"> New Search</button>
            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="row ">
          <div class="col-xl-3 col-lg-4 col-md-4  ">
            <div class="filters-actions">
              <div>
                <button class="btn filter-btn d-md-none"><svg xmlns="http://www.w3.org/2000/svg" class="mr-2"
                    height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
                    <path d="M0 0h24v24H0V0z" fill="none" />
                    <path d="M3 18h6v-2H3v2zM3 6v2h18V6H3zm0 7h12v-2H3v2z" />
                  </svg>
                  Filter</button>
              </div>
            </div>
           <!--  <div class="card-register filters-left manage-check ">
              <form autocomplete="off">
                <div class="card-content sidebar ">
                  <div class="searchFilter sidebar__inner">
                    <h4
                      class="border-bottom filter-header d-flex justify-content-between d-md-none p-3 mb-0 align-items-center">
                      <span> Search Filter</span>
                      <span class="mr-2 filter-close-btn"> X </span>
                    </h4>
                    <h4 class=" d-none d-sm-block"> <i class="bi bi-filter"></i> Filters</h4>

                    <div class="accordion-body">
                      <h5>Created date</h5>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="createddate" id="last7days">
                        <label class="form-check-label" for="last7days">
                          Last 7 days </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="createddate" id="last14days">
                        <label class="form-check-label" for="last14days">
                          Last 14 days
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="createddate" id="last30days">
                        <label class="form-check-label" for="last30days">
                          Last 30 days </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="createddate" id="customdaterange">
                        <label class="form-check-label" for="customdaterange">
                          Custom date range </label>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div> -->
          </div>

          <div class="col-xl-12 col-lg-12 col-md-12">  <!--  col-xl-9 col-lg-8 col-md-8 -->
            <div class="activein mb-3">
              <div class="d-flex align-items-center">
                <h6 class="mb-0">Search</h6>
              </div>
              <div class="d-flex align-items-center">

                <!-- <div class="d-flex align-items-center me-2">
                  <label class="col-form-label">Show</label>
                  <div>
                    <select class="formselect" id="activein">
                      <option selected>All </option>
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
              <div class="card-listinner align-items-center d-flex justify-content-between">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="selectall">
                  <label class="form-check-label" for="selectall">
                    Select All
                  </label>
                </div>
                <!-- <div class="sortby ">
                  <label class="col-form-label">Sort by:</label>
                  <div>
                    <select class="formselect" id="sortby">
                      <option value="createddate">Created date</option>
                      <option value="foldername">Folder name</option>
                    </select>
                  </div>
                </div> -->
              </div>
            </div>
            <div class="advancedsearch-list manage-check">
            <c:forEach items="${savesearchdetails}" var="details">
            
					<div class="card-list-box">
                <div class="card-listinner">
                  <div class="card-search">
                    <div class="searchprfile">
                      <div class="form-check">
                        <input class="form-check-input selectedId" type="checkbox" value="" id="selectbox">
                      </div>
                      <div class="profilTxt ms-2">
                        <h4 onclick='callSearchCandidates({
                        	"foldername": "${details.foldername}",
                            "skills": "${details.skills}",
                            "id": "${details.id}",
                            "userId": "${details.userId}",
                            "companyId": "${details.companyId}",
                            "createdDate": "${details.createdDate}",
                            "savedSkills": "${details.savedSkills}",
                            "savedMinExp": "${details.savedMinExp}",
                            "savedMaxExp": "${details.savedMaxExp}",
                            "savedLocation": "${details.savedLocation}",
                            "savedMinSalary": "${details.savedMinSalary}",
                            "savedMaxSalary": "${details.savedMaxSalary}",
                            "savedCompany": "${details.savedCompany}",
                            "savedNoticePeriod": "${details.savedNoticePeriod}",
                            "savedHighestQualification": "${details.savedHighestQualification}",
                            "savedCourse": "${details.savedCourse}",
                            "savedSpecialization": "${details.savedSpecialization}",
                            "savedCourseType": "${details.savedCourseType}",
                            "savedInstitute": "${details.savedInstitute}",
                            "savedGender": "${details.savedGender}",
                            "savedReadyToLocate": "${details.savedReadyToLocate}"
                        })'>${details.foldername}</h4>
                        <div class="createdTxt">	
                          <!-- <p> Java Developer, DevOps, 2-3-years, 5 Lacs per ann. </p> -->
                          <p class="mt-1">${details.createdDate}</p>
                        </div>
                      </div>
                    </div>
                    <div class="candidatesTxt ">
                      <h5 onclick='callResultSearchCandidates({
    "foldername": "${details.foldername}",
    "skills": "${details.skills}",
    "id": "${details.id}",
    "userId": "${details.userId}",
    "companyId": "${details.companyId}",
    "createdDate": "${details.createdDate}",
    "savedSkills": "${details.savedSkills}",
    "savedMinExp": "${details.savedMinExp}",
    "savedMaxExp": "${details.savedMaxExp}",
    "savedLocation": "${details.savedLocation}",
    "savedMinSalary": "${details.savedMinSalary}",
    "savedMaxSalary": "${details.savedMaxSalary}",
    "savedCompany": "${details.savedCompany}",
    "savedNoticePeriod": "${details.savedNoticePeriod}",
    "savedHighestQualification": "${details.savedHighestQualification}",
    "savedCourse": "${details.savedCourse}",
    "savedSpecialization": "${details.savedSpecialization}",
    "savedCourseType": "${details.savedCourseType}",
    "savedInstitute": "${details.savedInstitute}",
    "savedGender": "${details.savedGender}",
    "savedReadyToLocate": "${details.savedReadyToLocate}"
})'><a href="#"> <i class="bi bi-search" aria-hidden="true"></i> Search </a></h5>

                      <div class="dropdown ">
                        <div class=" " data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="bi bi-three-dots-vertical"></i>
                        </div>
                        <ul class="dropdown-menu dropdown-menu-end">
                         <%--  <li><a class="dropdown-item" href="#" onclick="updatesearch(${details.id})"><i class="bi bi-pencil"></i> Edit</a></li> --%>
                          <li><a class="dropdown-item" href="#" onclick="deletesearch(${details.id})"><i class="bi bi-trash3"></i> Delete</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>            
            
            </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
   <%@include file="employerfooter.jsp"%> 
  </main><!-- End #main -->
  <script src="employer/js/jquery.min.js"></script>
  <script src="employer/js/popper.min.js"></script>
  <script src="employer/js/bootstrap.min.js"></script>
  <script src="employer/js/main.js"></script>
  <script src="js/managesearch.js"></script>
  <script src="js/commonvalidation.js"></script>
  <script>
    $(document).ready(function () {
      setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);
    }); 
    $(".loader").hide();
  </script>

</body>

</html>