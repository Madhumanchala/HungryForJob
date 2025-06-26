<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%
String rolestatus = session.getAttribute("rolestatus").toString();
%>
<header id="header" class="header fixed-top">
	<div
		class="container-fluid container-xl d-flex align-items-center justify-content-between">
		<div class="">
			<div class="d-flex align-items-center">
				<a href="index.html" class="logo "> <img src="img/logo.svg"
					alt="">
				</a>
				<nav id="navbar" class="navbar">
					<i class="bi bi-list mobile-nav-toggle"></i>
					<ul id="menuContainer">

					</ul>
				</nav>
			</div>
		</div>
		<div class=" d-flex">
			<!-- <div class="bookmark-content">
          <ul class="list-box">
            <li> <i class="bi bi-bookmark"></i></li>
            <li> <i class="bi bi-bell"></i></li>
          </ul>
        </div> -->
			<div class="adminEmp" id="employeradminheader">
				<div class="switcher">
					<input type="radio" name="balance" value="Admin" id="Admin"
						class="switcher-input switcher-input--adm"
						onchange="route('companydashboard')"> <label for="Admin"
						class="switcher-label">Admin</label> <input type="radio"
						name="balance" value="Employer" id="Employer"
						class="switcher-input switcher-input--emp"
						onchange="route('searchCandidates')" checked> <label
						for="Employer" class="switcher-label">Employer</label> <span
						class="switcher-toggle"></span>
				</div>
			</div>
			<%-- <div class="availableCredits">

          <div class=" dropdown">
            <button class="dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              <div class="profile-img"> Available Credits <i class="bi bi-chevron-down"></i> </div>
            </button>
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">

              <div class="progressbar">
                <!-- <h4>10 Postings</h4>-->
                <div class="d-flex align-items-center justify-content-between"> 

                  <!-- <p>2550 used</p> -->
                  <h5><%= session.getAttribute("credit") %> left</h5>
                </div>
               <!--  <div class="progress">
                  <div class="progress-bar progress-bar-striped progress-bar-animated progress-bar-width-1"
                    role="progressbar" style="width:50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                  </div>
                </div> -->
              </div>


            </div>
          </div>
        </div> --%>

			<div class="profileBtn">
				<div class="dropdown">
					<button class="btn dropdown-toggle" type="button"
						id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<div class="profile-img">
							<img src="employer/img/profile-img.jpg"> <i
								class="bi bi-chevron-down"></i>
						</div>
					</button>
					<br> <strong><%=session.getAttribute("fullName")%></strong> <br><%=session.getAttribute("employerCompanyName")%>
					<div class="dropdown-menu dropdown-menu-end"
						aria-labelledby="dropdownMenuButton">
						<div class="proTxt">
							<strong><%=session.getAttribute("fullName")%></strong>
							<p></p>
						</div>
						<a class="dropdown-item myProfLink" href="#" id="myprofilemenu">
							<i class="bi bi-person"></i> My Profile
						</a> <a class="dropdown-item myProfLink" href="#"
							onclick="route('changepassword')"> <i class="bi bi-lock"></i>
							Change Password
						</a> <a class="dropdown-item logOutLink"
							onclick="route('employerlogin')" href="#"> <i
							class="bi bi-box-arrow-right"></i> Logout
						</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</header>
<!-- End Header -->
<button class="availablebtn  btn-blue" type="button"
	onclick="checkAllPoints()" id="availcredits">Available Credits</button>

<div class="offcanvas offcanvas-end availablehead" tabindex="-1"
	id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasRightLabel">
			<img src="employer/img/available-credits.svg"> Available
			Credits
		</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>
	<div class="offcanvas-body availableCredits">
		<div class="progressbar ">
			<div class="jobPostings mb-3">
				<div class="d-flex align-items-center justify-content-between">
					<h4>
						<svg width="21" height="19" viewBox="0 0 21 19" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                <path
								d="M6.26394 3.96827V2.24617C6.26394 1.56078 6.82472 1 7.51011 1H13.9903C14.6757 1 15.2364 1.56078 15.2364 2.24617V3.96827M19.2972 9.53739V16.1411C19.2972 16.7791 18.775 17.3013 18.137 17.3013H3.36336C2.72535 17.3013 2.20312 16.7792 2.20312 16.1411V9.57606"
								stroke="#3AA086" stroke-width="1.7" stroke-miterlimit="22.9256"
								stroke-linecap="round" stroke-linejoin="round" />
                <path
								d="M9.20326 11.4905C5.11192 11.2566 1.42969 10.0867 1.42969 7.98071V5.23494C1.42969 4.59592 1.95086 4.07471 2.58992 4.07471H18.9105C19.5496 4.07471 20.0708 4.59596 20.0708 5.23494V7.98071C20.0708 10.0998 16.342 11.2712 12.2199 11.4948"
								stroke="#3AA086" stroke-width="1.7" stroke-miterlimit="22.9256"
								stroke-linecap="round" stroke-linejoin="round" />
                <path fill-rule="evenodd" clip-rule="evenodd"
								d="M9.32031 10.3398H12.1822V11.6741C12.1822 12.408 11.5818 13.0084 10.848 13.0084H10.6546C9.92073 13.0084 9.32031 12.408 9.32031 11.6741V10.3398Z"
								stroke="#3AA086" stroke-width="1.7" stroke-miterlimit="22.9256"
								stroke-linecap="round" stroke-linejoin="round" />
              </svg>
						Postings
					</h4>
					<h4 id="totalpost"></h4>
				</div>
				<div class="d-flex align-items-center justify-content-between">
					<p id="usedpost"></p>
					<h5 id="leftpost"></h5>
				</div>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated progress-bar-width-1"
						role="progressbar" id="progresspost" aria-valuenow="80"
						aria-valuemin="0" aria-valuemax="100"></div>
				</div>
			</div>

			<div class="searchesNo mb-3">
				<div class="d-flex align-items-center justify-content-between">
					<h4>
						<svg width="18" height="18" viewBox="0 0 18 18" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_3023_2638)">
                  <path
								d="M17.4245 16.3951L13.1405 11.9395C14.2424 10.6322 14.8464 8.97725 14.8455 7.26749C14.8455 3.26026 11.5853 0 7.57804 0C3.57081 0 0.310547 3.26026 0.310547 7.26749C0.310547 11.2747 3.57081 14.535 7.57804 14.535C9.08241 14.535 10.516 14.0812 11.7417 13.2199L16.0583 17.7093C16.2387 17.8967 16.4814 18 16.7414 18C16.9875 18 17.2211 17.9062 17.3983 17.7355C17.5792 17.5611 17.6836 17.322 17.6885 17.0708C17.6934 16.8195 17.5985 16.5765 17.4245 16.3951ZM7.57804 1.89587C10.54 1.89587 12.9497 4.30552 12.9497 7.26749C12.9497 10.2295 10.54 12.6391 7.57804 12.6391C4.61606 12.6391 2.20641 10.2295 2.20641 7.26749C2.20641 4.30552 4.61606 1.89587 7.57804 1.89587Z"
								fill="#D89523" />
                </g>
                <defs>
                  <clipPath id="clip0_3023_2638">
                    <rect width="18" height="18" fill="white" />
                  </clipPath>
                </defs>
              </svg>
						Searches
					</h4>
					<h4 id="totalsearch"></h4>
				</div>

				<div class="d-flex align-items-center justify-content-between">
					<p id="usedsearch"></p>
					<h5 id="leftsearch"></h5>
				</div>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated progress-bar-width-1"
						role="progressbar" id="progresssearch" aria-valuenow="0"
						aria-valuemin="0" aria-valuemax="100"></div>
				</div>
			</div>

			<div class="cvViews ">
				<div class="d-flex align-items-center justify-content-between">
					<h4>
						<svg width="18" height="18" viewBox="0 0 18 18" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd"
								d="M1 2.84615C1 2.35652 1.1945 1.88695 1.54073 1.54073C1.88695 1.1945 2.35652 1 2.84615 1H15.1538C15.6435 1 16.1131 1.1945 16.4593 1.54073C16.8055 1.88695 17 2.35652 17 2.84615V9C17 9.16321 16.9352 9.31974 16.8198 9.43514C16.7044 9.55055 16.5478 9.61538 16.3846 9.61538C16.2214 9.61538 16.0649 9.55055 15.9495 9.43514C15.8341 9.31974 15.7692 9.16321 15.7692 9V2.84615C15.7692 2.68294 15.7044 2.52642 15.589 2.41101C15.4736 2.2956 15.3171 2.23077 15.1538 2.23077H2.84615C2.68294 2.23077 2.52642 2.2956 2.41101 2.41101C2.2956 2.52642 2.23077 2.68294 2.23077 2.84615V15.1538C2.23077 15.4935 2.50646 15.7692 2.84615 15.7692H9C9.16321 15.7692 9.31974 15.8341 9.43514 15.9495C9.55055 16.0649 9.61538 16.2214 9.61538 16.3846C9.61538 16.5478 9.55055 16.7044 9.43514 16.8198C9.31974 16.9352 9.16321 17 9 17H2.84615C2.35652 17 1.88695 16.8055 1.54073 16.4593C1.1945 16.1131 1 15.6435 1 15.1538V2.84615Z"
								fill="#357A9D" stroke="#357A9D" stroke-width="0.4" />
                <path fill-rule="evenodd" clip-rule="evenodd"
								d="M12.282 10.4358C11.7924 10.4358 11.3228 10.6304 10.9766 10.9766C10.6304 11.3228 10.4358 11.7924 10.4358 12.282C10.4358 12.7716 10.6304 13.2412 10.9766 13.5874C11.3228 13.9337 11.7924 14.1282 12.282 14.1282C12.7716 14.1282 13.2412 13.9337 13.5874 13.5874C13.9337 13.2412 14.1282 12.7716 14.1282 12.282C14.1282 11.7924 13.9337 11.3228 13.5874 10.9766C13.2412 10.6304 12.7716 10.4358 12.282 10.4358ZM9.20508 12.282C9.20508 11.466 9.52925 10.6833 10.1063 10.1063C10.6833 9.52925 11.466 9.20508 12.282 9.20508C13.0981 9.20508 13.8807 9.52925 14.4577 10.1063C15.0348 10.6833 15.3589 11.466 15.3589 12.282C15.3589 13.0981 15.0348 13.8807 14.4577 14.4577C13.8807 15.0348 13.0981 15.3589 12.282 15.3589C11.466 15.3589 10.6833 15.0348 10.1063 14.4577C9.52925 13.8807 9.20508 13.0981 9.20508 12.282Z"
								fill="#357A9D" stroke="#357A9D" stroke-width="0.4" />
                <path fill-rule="evenodd" clip-rule="evenodd"
								d="M13.8517 13.5391C13.9536 13.4115 14.1019 13.3297 14.2641 13.3116C14.4263 13.2934 14.589 13.3404 14.7165 13.4422L16.7678 15.0833C16.831 15.1337 16.8835 15.1962 16.9226 15.267C16.9616 15.3378 16.9863 15.4156 16.9952 15.4959C17.0042 15.5763 16.9972 15.6576 16.9747 15.7352C16.9523 15.8129 16.9147 15.8853 16.8642 15.9485C16.8137 16.0116 16.7513 16.0642 16.6805 16.1032C16.6097 16.1422 16.5319 16.1669 16.4516 16.1759C16.3712 16.1848 16.2899 16.1779 16.2123 16.1554C16.1346 16.1329 16.0621 16.0954 15.999 16.0449L13.9477 14.4039C13.8203 14.3019 13.7386 14.1535 13.7206 13.9913C13.7026 13.8292 13.7498 13.6665 13.8517 13.5391ZM4.28125 5.71792C4.28125 5.55471 4.34608 5.39819 4.46149 5.28278C4.5769 5.16737 4.73342 5.10254 4.89663 5.10254H13.1018C13.265 5.10254 13.4215 5.16737 13.5369 5.28278C13.6523 5.39819 13.7171 5.55471 13.7171 5.71792C13.7171 5.88113 13.6523 6.03766 13.5369 6.15307C13.4215 6.26847 13.265 6.33331 13.1018 6.33331H4.89663C4.73342 6.33331 4.5769 6.26847 4.46149 6.15307C4.34608 6.03766 4.28125 5.88113 4.28125 5.71792ZM4.28125 8.99998C4.28125 8.83676 4.34608 8.68024 4.46149 8.56483C4.5769 8.44943 4.73342 8.38459 4.89663 8.38459H8.17869C8.3419 8.38459 8.49842 8.44943 8.61383 8.56483C8.72924 8.68024 8.79407 8.83676 8.79407 8.99998C8.79407 9.16319 8.72924 9.31971 8.61383 9.43512C8.49842 9.55052 8.3419 9.61536 8.17869 9.61536H4.89663C4.73342 9.61536 4.5769 9.55052 4.46149 9.43512C4.34608 9.31971 4.28125 9.16319 4.28125 8.99998Z"
								fill="#357A9D" stroke="#357A9D" stroke-width="0.4" />
              </svg>
						CV Views
					</h4>
					<h4 id="totalcv"></h4>
				</div>

				<div class="d-flex align-items-center justify-content-between">
					<p id="usedcv"></p>
					<h5 id="leftcv"></h5>
				</div>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated progress-bar-width-1"
						role="progressbar" id="progesscv" aria-valuenow="30"
						aria-valuemin="0" aria-valuemax="100"></div>
				</div>
			</div>

		</div>
	</div>
</div>
<script src="employer/js/jquery.min.js"></script>
<script>
<%--   <%
  	List<Menu> menudetails= (List<Menu>) session.getAttribute("menuDetails");
  %> --%>
  const menuDetails2 = sessionStorage.getItem('menuDetails');
  if (!menuDetails2 || menuDetails2 === '[]') {
 /*  if (!sessionStorage.getItem('menuDetails')) { */
	    var menuDetails1 = [
	        <c:forEach items="${menuDetails}" var="menu" varStatus="status">
	            {
	                id: '${menu.id}',
	                menuname: '${menu.menuName}',
	                parentId: '${menu.parentId}',
	                menuUrl: '${menu.menuUrl}'
	            }<c:if test="${!status.last}">,</c:if>
	        </c:forEach>
	    ];
	    sessionStorage.setItem('menuDetails', JSON.stringify(menuDetails1));
	} 
	/*   var menuDetails1 = [
	      <c:forEach items="${menuDetails}" var="menu" varStatus="status">
	          {
	              id: '${menu.id}',
	              menuname: '${menu.menuName}',
	              parentId:'${menu.parentId}',
	              menuUrl:'${menu.menuUrl}'
	          }<c:if test="${!status.last}">,</c:if>
	      </c:forEach>
	  ]; 
	  sessionStorage.setItem('menuDetails', JSON.stringify(menuDetails1)); */
  var menuDetails = JSON.parse(sessionStorage.getItem('menuDetails'));
  var menuContainer = document.getElementById('menuContainer');

//Function to create the menu
menuDetails.forEach(function (menu) {
 // Check if the menu item is a parent
 var hasChildren = menuDetails.some(child => child.parentId === menu.id);

 // Create a new list item
 var li = document.createElement('li');

 // If the menu has children, create a dropdown
 if (hasChildren) {
   li.classList.add('dropdown'); // Add dropdown class

   // Create the anchor tag for the parent
   var parentA = document.createElement('a');
   parentA.href = 'javascript:void(0)';
   parentA.textContent = menu.menuname;

   // Add a dropdown indicator
   var icon = document.createElement('i');
   icon.className = 'bi bi-chevron-down';
   parentA.appendChild(icon);

   // Append the parent anchor to the list item
   li.appendChild(parentA);

   // Create a nested list for the dropdown items
   var ul = document.createElement('ul');

   // Add the children as dropdown items
   menuDetails
     .filter(child => child.parentId === menu.id)
     .forEach(function (child) {
       var childLi = document.createElement('li');
       var childA = document.createElement('a');
       childA.href = '#';
       childA.setAttribute('onclick', 'handleMenuClick( "' + child.menuname + '", "' + child.menuUrl + '")');
       childA.textContent = child.menuname;

       childLi.appendChild(childA);
       ul.appendChild(childLi);
     });

   // Append the nested list to the parent list item
   li.appendChild(ul);
 } else if (menu.parentId === '') {
   // Only add top-level items (parentId === null) to the menu
   var a = document.createElement('a');
   a.href = '#';
   a.setAttribute('onclick', 'handleMenuClick( "' + menu.menuname + '", "' + menu.menuUrl + '")');
   a.textContent = menu.menuname;

   // Append the anchor to the list item
   li.appendChild(a);
 }

 // Append the list item to the menu container
 menuContainer.appendChild(li);
});
function handleMenuClick(menuname,menuurl)
{
	var url = menuurl;
	var form = document.createElement('form');
	form.method = 'POST'; // or 'POST', depending on your needs
	form.action = url;
	document.body.appendChild(form);
	form.submit();
}
function route(value) {
	let form = document.createElement('form');
	form.method = 'POST';
	form.action = value;
	document.body.appendChild(form);
	form.submit();
}
$(document).ready(function() {
	 var flag="<%=rolestatus%>";
	if(flag === "employeradmin")
	{
		 $("#employeradminheader").show();
		 $("#availcredits").show();
		 $("#myprofilemenu").attr('onclick',"route('companydashboard')")
		 
	}else if(flag === "admin")
	{
		$("#employeradminheader").hide();
		$("#availcredits").hide();
		 $("#myprofilemenu").attr('onclick',"route('companydashboard')")
	}
	else
	{
		 $("#employeradminheader").hide();
		 $("#availcredits").show();
		 $("#myprofilemenu").attr('onclick',"route('searchCandidates')")
	}
});
function checkAllPoints()
{
	$.ajax({
		url:"checkingpoints",
		type:'post',
		contentType: 'application/json',
        success: function(response) {
            // Success callback
            console.log(response.data.userdetails);
            
            if(response.errors.errorCode === "0000")
            {
            	let usedViews= parseInt(response.data.userdetails.usedViews,10);
            	let usedSearch= parseInt(response.data.userdetails.usedSearch,10);
            	let usedPost= parseInt(response.data.userdetails.usedPost,10);
            	
            	let totalPost=parseInt(response.data.userdetails.totalPosting,10);
            	let totalSearch=parseInt(response.data.userdetails.totalSearches,10);
            	let totalViews=parseInt(response.data.userdetails.totalClicks,10);
            	
            	$("#totalcv").text(totalViews);
            	$("#usedcv").text(usedViews+" used");
            	$("#leftcv").text((totalViews - usedViews) +' left');
            	let progressPercentagecv = (usedViews / totalViews) * 100;
            	$("#progesscv").css("width",progressPercentagecv+"%");
            	
            	$("#totalsearch").text(totalSearch);
            	$("#usedsearch").text(usedSearch+" used");
            	$("#leftsearch").text((totalSearch - usedSearch) + ' left');
            	let progressPercentagesearch = (usedSearch / totalSearch) * 100;
            	$("#progresssearch").css("width",progressPercentagesearch+"%")
            	
            	$("#totalpost").text(totalPost);
            	$("#usedpost").text(usedPost+" used");
            	$("#leftpost").text((totalPost - usedPost) + ' left');
            	let progressPercentagepost = (usedPost / totalPost) * 100;
            	$("#progresspost").css("width",progressPercentagepost+"%")
            		
				var offcanvasElement = document.getElementById("offcanvasRight");
			     var offcanvas = new bootstrap.Offcanvas(offcanvasElement);
			     offcanvas.show();
			}
            else if(response.errors.errorCode === "0000")
            {
            	let usedViews= parseInt(response.data.userdetails.usedViews,10);
            	let usedSearch= parseInt(response.data.userdetails.usedSearch,10);
            	let usedPost= parseInt(response.data.userdetails.usedPost,10);
            	
            	let totalPost=parseInt(response.data.userdetails.totalPosting,10);
            	let totalSearch=parseInt(response.data.userdetails.totalSearches,10);
            	let totalViews=parseInt(response.data.userdetails.totalClicks,10);
            	
            	$("#totalcv").text(totalViews);
            	$("#usedcv").text(usedViews+" used");
            	$("#leftcv").text((totalViews - usedViews) +' left');
            	let progressPercentagecv = (usedViews / totalViews) * 100;
            	$("#progesscv").css("width",progressPercentagecv+"%");
            	
            	$("#totalsearch").text(totalSearch);
            	$("#usedsearch").text(usedSearch+" used");
            	$("#leftsearch").text((totalSearch - usedSearch) + ' left');
            	let progressPercentagesearch = (usedSearch / totalSearch) * 100;
            	$("#progresssearch").css("width",progressPercentagesearch+"%")
            	
            	$("#totalpost").text(totalPost);
            	$("#usedpost").text(usedPost+" used");
            	$("#leftpost").text((totalPost - usedPost) + ' left');
            	let progressPercentagepost = (usedPost / totalPost) * 100;
            	$("#progresspost").css("width",progressPercentagepost+"%")
            		
				var offcanvasElement = document.getElementById("offcanvasRight");
			     var offcanvas = new bootstrap.Offcanvas(offcanvasElement);
			     offcanvas.show();
			}else
			{
				console.log("error ocurred in service"+error)
				var offcanvasElement = document.getElementById("offcanvasRight");
			    var offcanvas = new bootstrap.Offcanvas(offcanvasElement);
			    offcanvas.hide();
			}
        },
        error: function(xhr, status, error) {
            // Error callback
            	console.log("error ocurred in service http "+error)
            console.log("error ocurred"+error)
        }
	})

}
</script>
<script src="employer/js/popper.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {

			var isVisible = sessionStorage.getItem("isVisibleFlag").toString();
			if (isVisible === "1") {
				$("#availcredits").hide();
			}
		});
	</script>