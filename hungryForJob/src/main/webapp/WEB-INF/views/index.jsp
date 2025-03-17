<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="css/slick.css" rel="stylesheet">
<link href="css/select2.min.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet">
</head>

<body>
  <div class="modal fade" id="comingsoonModal" tabindex="-1" aria-labelledby="comingsoonLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-body ">
          <button type="button" class="btn-close float-end" data-bs-dismiss="modal" aria-label="Close"></button>
          <div class="comingsoon">
            <img src="img/coming-soon.svg" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </div>
   <%@include file="header.jsp"%>
   <%@include file="toaster.jsp"%>
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="hero-txt">
            <h1>Lets get your <span class="">Dream Job</span> Today!</h1>
            <h5>Find Jobs, Employment & Career Opportunities </h5>
          </div>
          <form autocomplete="off" action="/searchedJob" onsubmit="return checkValidation()" method="post">
          <div class="searchbox">
            <div class="hero-search-content ">
              <div class="row classic-search-box m-0 gx-2">
                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
                  <div class="form-group briod">
                    <div class="input-with-icon">
                      <input type="text" class="form-control" placeholder="Search by skills" id="skills" name="skills">
                      <span class="fa-icon"><img src="img/search.svg"> </span>
                    </div>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12">
                  <div class="form-group briod">
                    <div class="input-with-icon">
                      <select class="form-control selet2Single" id="exp" name="exp">
                        <option value="" class="experience">Select Experience</option>
                        <option value="0">Fresh</option>
                        <option value="1">1 year</option>
                        <option value="2">2 years</option>
                        <option value="3">3 years</option>
                        <option value="4">4 years</option>
                        <option value="5">5 years</option>
                        <option value="6">6 years</option>
                        <option value="7">7 years</option>
                        <option value="8">8 years</option>
                        <option value="9">9 years</option>
                        <option value="10">10 years</option>
                      </select>
                      <span class="fa-icon"><img src="img/experience.svg"> </span>

                    </div>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12">
                  <div class="form-group">
                    <div class="input-with-icon">
                      <!-- <input type="text" class="form-control" placeholder="Enter Location" id="location" name="location">
                      <span class="fa-icon"><img src="img/location.svg"> </span> -->
                      <span class="fa-icon1"><img src="img/location.svg"> </span>
					 <select class="form-control selet2Multiple" multiple="multiple" name="location" id="location">
					    <c:forEach items="${Location}" var="location">
					        <option value="${location.id}">${location.name}</option>
					    </c:forEach>
					</select>
                    </div>
                  </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12">
                  <div class="form-group">
                    <button type="submit" class="btn search-btn">Search</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </form>
        </div>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">
    <!-- ======= Featured Job List Section ======= -->
    <section id="featuredJoblist" class="featuredJoblist featuredwhitebg">
      <div class="container">
        <header class="section-header">
          <h2>Featured Job List</h2>
          <p>Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over
            3000+ companies worldwide.</p>
        </header>
        <div class="featuredsection">
          <div class="row featuredSlider">
           <c:forEach items="${jobDetails}" var="jobdetails">
    <div class="col-xl-4 col-lg-4 col-md-6">
        <div class="listbox">
            <div class="d-flex justify-content-between">
                <div class="company-details">
                    <a href="#">
                        <h4>${jobdetails.jobHeading}</h4>
                        <p>${jobdetails.companyName}</p>
                    </a>
                </div>
                <div class="company-logo">
                    <img src="data:image/jpeg;base64,${jobdetails.logo}">
                </div>
            </div>
            <div class="list-price">
                <ul>
                    <li><img src="img/year.svg" alt="Experience">${jobdetails.fromYearExp} - ${jobdetails.toYearExp}</li>
                    <li><img src="img/inr.svg" alt="Salary">${jobdetails.fromCtc} - ${jobdetails.toCtc}</li>
                    <li><img src="img/map.svg" alt="Location">${jobdetails.location}</li>
                </ul>
            </div>
            <div class="desc">
           	 <img src="img/txt-details.svg" alt="Details">${jobdetails.jobDescription}
            </div>
            <div class="daytxt">
                <p></p>
                <div class="save">
                    <i class="bi bi-bookmark"></i>
                    <i class="bi bi-bookmark-check-fill" style="display:none;"></i> Save
                </div>
            </div>
        </div>
    </div>
</c:forEach>
           
            
           <!--  <div class="col-xl-4 col-lg-4 col-md-6 ">
              <div class="listbox">
                <div class="d-flex justify-content-between ">
                  <div class="company-details">
                    <a href="">
                      <h4>UI/UX Designer</h4>
                      <p>Nikitis Infocom</p>
                    </a>
                  </div>
                  <div class="company-logo"><img src="img/nikitis-Infocom.png"> </div>
                </div>
                <div class="list-price">
                  <ul>
                    <li> <img src="img/year.svg"> 1-3 years </li>
                    <li> <img src="img/inr.svg"> 4-8 Lacs </li>
                    <li> <img src="img/map.svg"> Mumbai </li>
                  </ul>
                </div>
                <p><img src="img/txt-details.svg"> We are looking for experienced creative... </p>
                <div class="daytxt">
                  <p> 2 Days Ago</p>
                  <div class="save"> <i class="bi bi-bookmark"></i> Save</div>
                </div>
              </div>
            </div> -->

            <!-- <div class="col-xl-4 col-lg-4 col-md-6 ">
              <div class="listbox">
                <div class="d-flex justify-content-between ">
                  <div class="company-details">
                    <a href="">
                      <h4>UI/UX Designer</h4>
                      <p>Nikitis Infocom</p>
                    </a>
                  </div>
                  <div class="company-logo"><img src="img/nikitis-Infocom.png"> </div>
                </div>
                <div class="list-price">
                  <ul>
                    <li> <img src="img/year.svg"> 1-3 years </li>
                    <li> <img src="img/inr.svg"> 4-8 Lacs </li>
                    <li> <img src="img/map.svg"> Mumbai </li>
                  </ul>
                </div>
                <p><img src="img/txt-details.svg"> We are looking for experienced creative... </p>
                <div class="daytxt">
                  <p> 2 Days Ago</p>
                  <div class="save"> <i class="bi bi-bookmark"></i> Save</div>
                </div>
              </div>
            </div> -->

         <!--    <div class="col-xl-4 col-lg-4 col-md-6 ">
              <div class="listbox">
                <div class="d-flex justify-content-between ">
                  <div class="company-details">
                    <a href="">
                      <h4>UI/UX Designer</h4>
                      <p>Nikitis Infocom</p>
                    </a>
                  </div>
                  <div class="company-logo"><img src="img/nikitis-Infocom.png"> </div>
                </div>
                <div class="list-price">
                  <ul>
                    <li> <img src="img/year.svg"> 1-3 years </li>
                    <li> <img src="img/inr.svg"> 4-8 Lacs </li>
                    <li> <img src="img/map.svg"> Mumbai </li>
                  </ul>
                </div>
                <p><img src="img/txt-details.svg"> We are looking for experienced creative... </p>
                <div class="daytxt">
                  <p> 2 Days Ago</p>
                  <div class="save"> <i class="bi bi-bookmark"></i> Save</div>
                </div>
              </div>
            </div> -->

           <!--  <div class="col-xl-4 col-lg-4 col-md-6 ">
              <div class="listbox">
                <div class="d-flex justify-content-between ">
                  <div class="company-details">
                    <a href="">
                      <h4>UI/UX Designer</h4>
                      <p>Nikitis Infocom</p>
                    </a>
                  </div>
                  <div class="company-logo"><img src="img/nikitis-Infocom.png"> </div>
                </div>
                <div class="list-price">
                  <ul>
                    <li> <img src="img/year.svg"> 1-3 years </li>
                    <li> <img src="img/inr.svg"> 4-8 Lacs </li>
                    <li> <img src="img/map.svg"> Mumbai </li>
                  </ul>
                </div>
                <p><img src="img/txt-details.svg"> We are looking for experienced creative... </p>
                <div class="daytxt">
                  <p> 2 Days Ago</p>
                  <div class="save"> <i class="bi bi-bookmark"></i> Save</div>
                </div>
              </div>
            </div> -->
          </div>
        </div>
      </div>
    </section><!-- End Featured Job List Section -->

    <!-- ======= work Section ======= -->
    <section id="work" class="work">
      <div class="container">
        <header class="section-header">
          <h2> How it’s work?</h2>
          <p>To choose your trending job dream & to make future bright.</p>
        </header>
        <div class="row">
          <div class="col-xl-3 col-lg-3 col-md-6 ">
            <div class="workbox">
              <div class="workimg">
                <img src="img/account-create.svg">
              </div>
              <h3>Create Account</h3>
              <p>Fill out your details and start exploring. </p>
              <div class="arrow-up"><img src="img/arrow-up1.svg"></div>
            </div>

          </div>

          <div class="col-xl-3 col-lg-3 col-md-6 ">
            <div class="workbox">
              <div class="workimg">
                <img src="img/upload-resume.svg">
              </div>
              <h3>Upload Resume</h3>
              <p>Showcase your achievements to get attention by recruiters </p>
              <div class="arrow-up"><img src="img/arrow-down1.svg"></div>
            </div>

          </div>

          <div class="col-xl-3 col-lg-3 col-md-6 ">
            <div class="workbox">
              <div class="workimg">
                <img src="img/find-jobs.svg">
              </div>
              <h3>Find Jobs</h3>
              <p>Seek your dream job and explore abundant opportunities</p>
              <div class="arrow-up"><img src="img/arrow-up1.svg"></div>
            </div>

          </div>
          <div class="col-xl-3 col-lg-3 col-md-6 ">
            <div class="workbox">
              <div class="workimg">
                <img src="img/get-hired.svg">
              </div>
              <h3>Get Hired</h3>
              <p>Apply to your desired job and connect with the community </p>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End work Section -->

    <!-- ======= Values Section ======= -->
    <section id="find-companies" class="find-companies">
      <div class="container">
        <header class="section-header">
          <h2>Find Best Companies</h2>
          <p>Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over
            30000+ companies worldwide.</p>
        </header>
        <div class="companiesection ">
          <ul class="companiesSlider">
            <li><a href="#"> <img src="img/comunus.png"> </a> </li>
            <li><a href="#"> <img src="img/hrms.png"> </a> </li>
            <li><a href="#"> <img src="img/tag.png"> </a> </li>
            <!-- <li><a href="#"> <img src="img/hungry.png"> </a> </li> -->
            <li><a href="#"> <img src="img/comunus.png"> </a> </li>
            <li><a href="#"> <img src="img/hrms.png"> </a> </li>
            <li><a href="#"> <img src="img/tag.png"> </a> </li>
            <!-- <li><a href="#"> <img src="img/hungry.png"> </a> </li> -->
          </ul>
        </div>
      </div>
      <%@include file="toaster.jsp"%> 
    </section><!-- End Values Section -->
  </main><!-- End #main -->
 <%@include file="footer.jsp"%>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/slick.min.js"></script>
<script src="js/select2.min.js"></script>
  <script src="js/main.js"></script>
  <script>

  $(".selet2Multiple").select2({
        placeholder: "Location"
      });
      $(".selet2Single").select2({
        placeholder: "Experience",
      });

    $(".featuredSlider").slick({
      dots: false,
      margin: 60,
      infinite: false,
      arrows: true,
      autoplay: true,
      slidesToShow: 3,
      slidesToScroll: 1,
      responsive: [
        {
          breakpoint: 1100,
          settings: {
            slidesToShow: 3,
            infinite: false,
            arrows: false,
            autoplay: true,
          },
        },
        {
          breakpoint: 1028,
          settings: {
            slidesToShow: 2,
            infinite: false,
            arrows: true,

          },
        },
        {
          breakpoint: 768,
          settings: {
            slidesToShow: 2,
            arrows: false,
            autoplay: true,
          },
        },
        ,
        {
          breakpoint: 640,
          settings: {
            slidesToShow: 2,
            arrows: false,
            autoplay: true,

          },
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            arrows: false,
            autoplay: true,
            dots: false,
            centerMode: true,
            variableWidth: true,
          },
        },
      ],
    });


    $(".companiesSlider").slick({
      dots: false,
      infinite: false,
      arrows: false,
      autoplay: true,
      slidesToShow: 3,
      slidesToScroll: 1,
      responsive: [
        {
          breakpoint: 1100,
          settings: {
            slidesToShow: 3,
            infinite: false,
            arrows: false,
            autoplay: true,
          },
        },
        {
          breakpoint: 990,
          settings: {
            slidesToShow: 2,
          },
        },
        {
          breakpoint: 768,
          settings: {
            slidesToShow: 2,
            arrows: false,
            autoplay: true,
          },
        },
        ,
        {
          breakpoint: 640,
          settings: {
            slidesToShow: 2,
            arrows: false,
            autoplay: true,

          },
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            arrows: false,
            autoplay: true,
            dots: false,

          },
        },
      ],
    });
  </script>
  <script>
  	function checkValidation()
  	{
  		/* showToast('warning','this is message'); */
  		var skills=$('#skills').val();
  		var exp=$('#exp').val();
  		var location=$('#location').val();
  		
 		if(skills == "")
 		{
 			 showToast('info',"Enter the skills");
 			return false;
 		}
 		else if(exp == "")
 		{
 			showToast('info',"Enter the Experience");
 			return false;
 		}
 		else if(location == "")
 		{
 			showToast('info',"Enter the location");
 			return false;
 		}else
 		{
 			return true;
 		}
  	}
  </script>

</body>

</html>