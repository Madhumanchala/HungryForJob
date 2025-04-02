<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String header3candidateName = (String) session.getAttribute("candidateName");
String header3candidateId = (String) session.getAttribute("candidateId");
String candidateImage1 = (String) session.getAttribute("profileImage");
%>
<link href="css/select2.min.css" rel="stylesheet" />
<header id="header" class="header fixed-top">
	<div
		class="container-fluid container-xl d-flex align-items-center justify-content-between">
		<nav id="navbar" class="navbar">
			<div class="d-flex align-items-center">
				<i class="bi bi-list mobile-nav-toggle"></i> <a href="#" onclick="route('/candidateDashboard')"
					class="logo"> <img src="img/logo.svg" alt="Logo">
				</a>
				<ul>
					<!-- Additional navigation items can be added here -->
				</ul>
			</div>
		</nav>

		<div class="d-flex">
			<div class="profileBtn">
				<div class="dropdown">
					<button class="btn dropdown-toggle" type="button"
						id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<div class="profile-img">
							<img style="background-image: url('data:image/jpeg;base64,<%=candidateImage1%>'); border: 2px solid #fff; background-color: #e6e6e6;"> <i
								class="bi bi-chevron-down"></i>
						</div>
					</button>
					<div class="dropdown-menu dropdown-menu-end"
						aria-labelledby="dropdownMenuButton">
						<div class="proTxt">
							<strong><%=header3candidateName%></strong>
						</div>
						<a class="dropdown-item logOutLink" onclick="route('logout')">
							<i class="bi bi-box-arrow-right"></i> Logout
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- End Header -->

<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/select2.min.js"></script>
<script>
$(document).ready(function() {
	sessionStorage.removeItem("location");
	sessionStorage.removeItem("experience");
	sessionStorage.removeItem("jobTitle");
});

</script>
