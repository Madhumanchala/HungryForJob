<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="java.util.List"%>
<header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <div class="">
        <div class="d-flex align-items-center">
          <a href="index.html" class="logo ">
            <img src="img/logo.svg" alt="">
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
        <div class="availableCredits">

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
        </div>

        <div class="profileBtn">
          <div class="dropdown">
            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              <div class="profile-img"> <img src="employer/img/profile-img.jpg"> <i class="bi bi-chevron-down"></i> </div>
            </button>
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
              <div class="proTxt">
                <strong><%= session.getAttribute("fullName") %></strong>
                <p></p>
              </div>
              <a class="dropdown-item myProfLink" href="#"> <i class="bi bi-person"></i>
                My Profile</a>
              <a class="dropdown-item myProfLink" href="#"> <i class="bi bi-lock"></i>
                Change Password</a>
              <a class="dropdown-item logOutLink" onclick="route('logout')"> <i class="bi bi-box-arrow-right"></i>
                Logout</a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </header><!-- End Header -->
  <script>
<%--   <%
  	List<Menu> menudetails= (List<Menu>) session.getAttribute("menuDetails");
  %> --%>
  var status='${status}'
  if(status === "1")
	{
	  var menuDetails1 = [
	      <c:forEach items="${menuDetails}" var="menu" varStatus="status">
	          {
	              id: '${menu.id}',
	              menuname: '${menu.menuName}',
	              parentId:'${menu.parentId}',
	              menuUrl:'${menu.menuUrl}'
	          }<c:if test="${!status.last}">,</c:if>
	      </c:forEach>
	  ]; 
	  sessionStorage.setItem('menuDetails', JSON.stringify(menuDetails1));
	}
  var menuDetails = JSON.parse(sessionStorage.getItem('menuDetails'));
  console.log(menuDetails);
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
</script>
<script src="employer/js/popper.min.js"></script>