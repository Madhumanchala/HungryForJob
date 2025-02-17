<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="/" class="logo d-flex align-items-center">
        <img src="img/logo.svg" alt="">
      </a>
      <nav id="navbar" class="navbar">
        <ul>
          <!--  <li><a class="getstarted" href="/industrylist">Industry List</a></li> -->
          <li><a class="login" href="/login"> Login</a></li>
		  <li><a class="register" href="/verifyEmail">Register</a></li>
          <li><a href="/employerlogin">Employer Login</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

</body>
</html>