<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

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
</head>

<body>
 

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="img/logo.svg" alt="">
      </a>
      <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown"><a href="#"><span>John legend</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#"> Sign Out</a></li>
            </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

<%@include file="toaster.jsp"%>
  <main id="main" class="maincontent">

    <section id="Industry" class="industry">
      <div class="container">
        <div class="row">
          <div class="col-xl-12 col-lg-12 col-md-8 col-sm-12 ">
            <div class="card-content">
              <div class="headtitle d-flex justify-content-between align-items-center">
                <h3>Industry List</h3>
                <div> <a href="#" data-bs-toggle="modal" data-bs-target="#industryAddModal" class="editBtn"> <i
                      class="bi bi-plus"></i> Industry </a> </div>
              </div>
             <!--  <div class="content-txt">
                <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 ">
                    <h5>Tata aig</h5>
                    <h5>Tata aig</h5>
                  </div>
                </div>

              </div> -->
            
              <div class="table-responsive1">
										<div id="no-more-tables">
											<table id="leadList" class="table tablelist leadList"
												style="width: 100%;">
												<thead>
													<tr>
														<th>Available Industry List</th>	
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${industryList}" var="item">
														<tr style="cursor: pointer;">
															<td data-title="Industry Name">${item.industryName}</td>
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
    </section><!-- End Featured Job List Section -->
  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="container">
      <div class="copyright">
        <ul>
          <li><a href="#"> About Us </a> </li>
          <li><a href="#"> Contact Us</a> </li>
        </ul>
        <p>Copyright © 2024. Hungry for job all right reserved</p>
      </div>
    </div>
  </footer><!-- End Footer -->


  <!-- employmentAddModal   -->
  <div class="modal fade" id="industryAddModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  ">
      <div class="modal-content">
        <div class="modal-header">
        <form id="IndustryDetailsForm">
          <h5 class="modal-title" id="exampleModalLabel">Add Industry</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body pe-4 ps-4 py-4">
          <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
              <div class="form-group">
                <label for="Industry" class="form-label required">Industry</label>
                <input type="text" name="industryName" id="industryName" class="form-control" placeholder="Enter Industry">
              </div>
            </div>

          </div>

        </div>
        <div class="modal-footer">
        
											
          <button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
          <button type="button" class="btns" onclick="saveIndustryDetails()" >Submit</button>
        </div>

      </div>
    </div>
  </div>



<script>
		function saveIndustryDetails() {
			var formData = $("#IndustryDetailsForm").serializeArray();
		/* 	if (!validateprojectDetailsForm()) {
				return;
			}
 */
		var industryName = $("#industryName").val();

		/* 	var loginFormObjectt = {};
			$.each(formData, function(i, v) {
				loginFormObjectt[v.name] = v.value;
			}); */

			$.ajax({
				url : "save-industry",
				type : "POST",
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify({industryName: industryName}),
				//data : JSON.stringify(loginFormObjectt),
				success : function(result) {
		        	 $('#industryAddModal').modal('hide');
		            showToast("success","Project Details Saved!");
		            window.location.reload();
				},
				error : function(err) {
					 $('#industryAddModal').modal('hide');
		            showToast("error","Fail to Save!");
				}
			});
		}
		</script>
		
		<script>
		function validateprojectDetailsForm() {
			var projecttype = $("#projecttype").val();
			var isValid = true;

			$("#projecttypeError").text("");
			if (projecttype == null || projecttype.trim() == "") {
				$("#projecttypeError").text("Project Name is required.");
				isValid = false;
			} 
			return isValid;
		}
		
		function showNotificationModal(message) {
		    $('#notificationMessage').text(message);
		    $('#notificationModal').modal('show');
		}
	</script>


  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>


</body>

</html>