<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%@include file="toaster.jsp"%>
<input type="hidden" id="sessionRole" value="<%= session.getAttribute("role") != null ? session.getAttribute("role") : " " %>" />
<header id="header" class="header fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">
			<a href="/" class="logo d-flex align-items-center"> <img
				src="img/logo.svg" alt="">
			</a>
			<nav id="navbar" class="navbar">
				<ul>
					<li>Welcome <%=username%>
					</li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
</header>
	<!-- In JSP, print the session attribute value -->
	
	<main id="main">
    <!-- ======= register Section ======= -->
    <section id="worksection" class="worksection ">
      <div class="container">
        <div class="row">
          <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12
offset-xl-2 ">
            <div id="stepindicator" role="group">
              <ol>
                <li class="stepvisited"> <span> Basic details
                  </span> </li>
                   <%
								if (workstatus != null && workstatus.equals("exp")) {
					%> 
                  <li class="stepvisited"> <span>Work </span>
                  <li class="stepvisited"> <span>Employment </span>
                  </li>
                  <%
								}
					%>
                <li class="stepvisited"> <span>Education </span>
                </li>
                <li aria-current="true"> <span>Last step
                  </span></li>
              </ol>
            </div>
            <div class="card-content register-card work-card">
              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="form-group">
                    <label for="new_course" class="required">Resume
                      Headline</label>
                    <textarea class="form-control" name="resume_headline" id="resume_headline" rows="5" placeholder="Write a small introduction of yourself" required></textarea>
                    <span class="resumeheadline_error errorfield"></span>
                     <%
                    if(workstatus != null && workstatus.equals("exp"))
                    {
   					%>
                    <div class="">
                      <div class="generateAIclicks">
                         <button class="btn-process" id="generateAIclick"> Generate with AI <span
                            class="btn-ring"></span>
                        </button>
                      </div>
                    </div>
                     <%} %>
                  </div>
                </div>
                <!-- Container to display CV -->

                <div id="cvViewer"></div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <a id="fetchCVButton" style="cursor:pointer;color:blue"></a>
                  <div class="content-txt1">
                    <div class="row">

                      <div class="col-lg-5 col-md-9 col-sm-12 ">
                        <div class="form-group">
                          <label for="resume_doc" class="form-label required">Upload your
                            resume here.</label>
                          <input type="file" name="candidate_cv" id="candidate_cv" class="form-control"
                            accept=".pdf,.doc,.docx">
                          <span style="font-size:12px;color:blue">(Only pdf, doc and docx
                            type are allowed and file size upTo 2mb)</span><br>
                            <span class="resume_error errorfield" style="color:red"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="form-group d-flex justify-content-between nextback">
                    <button class="btns" id="candidateRegister" style="margin-left:85%" onclick="saveLastDetails()">SUBMIT</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
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
	<script>
	var flag = ${flag};
	var techname="${techname}";
	var month="${months}";
	var years="${years}";	
	var designation="${designation}";
	var arr = [
        "I am " + designation + " proficient in " + techname + " with experience in full-stack development and a passion for creating robust, scalable solutions",
        "I am " + designation + " proficient with experience and expertise in " + techname + " and a passion for creating robust, scalable solutions",
        "Skilled " + designation + " proficient with expertise in " + techname + " and a passion for creating robust, scalable solutions",
        "Experienced "+ designation +" specializing in "+ techname +" with a proven track record in building scalable applications and a passion for innovation",
        "I am a "+ designation+" with deep expertise in "+techname +" and a commitment to delivering high-quality, scalable solutions in full-stack development",
        designation+" with advanced skills in "+techname+" , driving full-stack development projects with a focus on scalable and efficient solutions",
        designation+"  specializing in "+techname+" , leveraging experience in full-stack development to lead projects and drive exceptional results",
        "Dynamic "+designation+"  with a strong "+techname +" background, committed to advancing technology solutions and ensuring seamless, scalable implementations."
    ];
	
	function showRandom()
	{
		var randomIndex = Math.floor(Math.random() * arr.length);
		$("#resume_headline").val(arr[randomIndex]);
	}
	 $("#generateAIclick").click(function () {
		 showRandom();
	 });
 	</script>
 	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/select2.min.js" type="text/javascript"></script>
	<script src="js/lastStep.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
	<script>
	setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);
	</script>
</body>
</html>