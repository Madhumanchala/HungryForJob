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
              <a class="dropdown-item logOutLink" href="#"> <i class="bi bi-box-arrow-right"></i>
                Logout</a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </header>
