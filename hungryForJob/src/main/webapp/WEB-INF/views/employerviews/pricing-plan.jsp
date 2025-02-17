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
  <link href="/employer/img/favicon.png" rel="icon">
  <link href="/employer/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="/employer/css/bootstrap.min.css" rel="stylesheet">
  <link href="/employer/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/employer/css/style.css" rel="stylesheet">
</head>

<body>
 <!--  <div class="loader"><img src="/employer/img/loader.gif"></div> -->
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="/employer/img/logo.svg" alt="">
      </a>
      <nav id="navbar" class="navbar">
        <ul>
         <!--  <li><a class="getstarted" href="#">Candidate Login</a></li>
          <li><a class="getstarted" href="#">Employer Login</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

  <main id="main">
  <!--   <section class="section-inner pricingplan sign-bg">
      <div class="container">
        <div class="row d-flex align-items-center">
          <div class="col-xl-8 col-lg-6 col-md-6  ">
            <div class="sign-left">
              <h4>INDIA’S #1 HIRING PLATFORM</h4>
              <h1>India's Largest Job Portal for Small <span> Businesses & Startups </span>
              </h1>
              <button class="btns mt-3"> Pricing Plan </button>
            </div>
          </div>

          <div class="col-xl-4 col-lg-6 col-md-6  ">
            <div class="sign-bg-img">
              <img src="/employer/img/sign-bg.svg">
            </div>
          </div>
        </div>
      </div>
    </section> -->
    <section class="product-section">
      <div class="container">
        <div class="pro-title">
          <h4>Pricing Plan</h4>
          <h3>Flexible pricing that scales with your business</h3>
        </div>
        <div class="pricing-wrapper comparison-table clearfix">
          <div class="icon-pri"><img src="/employer/img/icon-pri.svg"> </div>
          <div class="row clearfix">
            <div class="col-md-2 col-12 pricing-col list-feature">
              <div class="pricing-card">
                <div class="pricing-header">
                  <h5>Choose a <span>plan</span> </h5>
                </div>
                <div class="pricing-feature">
                  <li> User access </li>
                  <li> Job Postings </li>
                  <li> No. of Searches </li>
                  <li> CV Views </li>
                  <li> Validity. </li>
                </div>
                <div class="pricing-footer1">
                </div>
              </div>
            </div>
           <%-- Assume pricingList contains list of plans where each plan has id, name, price, userAccess, jobPostings, searches, cvViews, validity fields --%>
			
			<c:forEach var="plan" items="${pricingList}">
    <div class="col-md-2 col-12 pricing-col">
        <div class="pricing-card">
            <div class="pricing-header">
                <div class="price-box">
                    <h5>${plan.name}</h5> <!-- Display plan name like Base, Standard, etc. -->
                    <div class="price">
                        <span class="currency"><i class="fa fa-inr" aria-hidden="true"></i></span> ${plan.price}
                    </div>
                </div>
            </div>
            <div class="pricing-feature">
                <li><span class="list-hide">User access</span> <span>${plan.userAccess}</span></li>
                <li><span class="list-hide">Job Postings</span> <span>${plan.jobPostings}</span></li>
                <li><span class="list-hide">No. of Searches</span> <span>${plan.searches}</span></li>
                <li><span class="list-hide">CV Views</span> <span>${plan.cvViews}</span></li>
                <li><span class="list-hide">Validity</span> <span>${plan.validity}</span></li>
            </div>
            <div class="pricing-footer">
               <!--  <button class="btns-border">Buy Now</button>  -->
                <form action="verifyDetails" method="post" onsubmit="return storeplanId('${plan.id}')">
                    <input type="hidden" name="planId" value="${plan.id}" />
                    <button type="submit" class="btns-border">Buy Now</button>
                </form> 
            </div>
        </div>
    </div>
		</c:forEach>

           <!--  <div class="col-md-2 col-12 pricing-col  ">
              <div class="pricing-card">
                <div class="pricing-header">
                  <div class="price-box">
                    <h5>Standard</h5>
                    <div class="price">
                      <span class="currency"><i class="fa fa-inr" aria-hidden="true"></i></span> 10,000
                    </div>
                  </div>
                </div>
                <div class="pricing-feature">
                  <li><span class="list-hide"> User access</span> <span> Single user</span> </li>
                  <li><span class="list-hide">Job Postings</span> <span> 10 Postings </span> </li>
                  <li><span class="list-hide">No. of Searches</span> <span> 10000</span> </li>
                  <li> <span class="list-hide">CV Views</span> <span> 2500 </span></li>
                  <li><span class="list-hide">Validity </span> <span>1 year </span> </li>
                </div>
                <div class="pricing-footer">
                  <button class="btns-border">Buy Now </button>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-12 pricing-col  current">
              <div class="pricing-card">
                <div class="pricing-header currentbrd">
                  <div class="price-box">
                    <h5>Platinum</h5>
                    <div class="price">
                      <span class="currency"><i class="fa fa-inr" aria-hidden="true"></i></span> 15,000
                    </div>
                  </div>
                </div>
                <div class="pricing-feature">
                  <li><span class="list-hide"> User access</span> <span> Single user</span> </li>
                  <li><span class="list-hide">Job Postings</span> <span> 20 Postings </span> </li>
                  <li><span class="list-hide">No. of Searches</span> <span> 10000</span> </li>
                  <li><span class="list-hide">CV Views</span> <span> 2500 </span></li>
                  <li><span class="list-hide">Validity </span> <span>1 year </span> </li>
                </div>
                <div class="pricing-footer">
                  <button class="btns-border">Buy Now </button>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-12 pricing-col ">
              <div class="pricing-card">
                <div class="pricing-header">
                  <div class="price-box">
                    <h5>Premium</h5>
                    <div class="price">
                      <span class="currency"><i class="fa fa-inr" aria-hidden="true"></i></span> 20,000
                    </div>

                  </div>
                </div>
                <div class="pricing-feature">
                  <li><span class="list-hide"> User access</span> <span> 2 User</span> </li>
                  <li><span class="list-hide">Job Postings</span> <span> 10 Postings </span> </li>
                  <li><span class="list-hide">No. of Searches</span> <span> 15000</span> </li>
                  <li><span class="list-hide">CV Views</span> <span>3500 </span></li>
                  <li><span class="list-hide">Validity </span> <span>1 year </span> </li>
                </div>
                <div class="pricing-footer">
                  <button class="btns-border">Buy Now </button>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-12 pricing-col  ">
              <div class="pricing-card">
                <div class="pricing-header">
                  <div class="price-box">
                    <h5>Standard Pro</h5>
                    <div class="price">
                      <span class="currency"><i class="fa fa-inr" aria-hidden="true"></i></span> 25000
                    </div>
                  </div>
                </div>
                <div class="pricing-feature">
                  <li><span class="list-hide"> User access</span> <span> 3 User</span> </li>
                  <li><span class="list-hide">Job Postings</span> <span> 20 Postings </span> </li>
                  <li><span class="list-hide">No. of Searches</span> <span> 20000</span> </li>
                  <li><span class="list-hide">CV Views</span> <span>5000 </span></li>
                  <li><span class="list-hide">Validity </span> <span>1 year </span> </li>
                </div>
                <div class="pricing-footer">
                  <button class="btns-border">Buy Now </button>
                </div>
              </div>
            </div> -->
          </div>

        </div>
      </div>
    </section>


    <section class="product-section keybenefits">
      <div class="container">
        <div class="pro-title">
          <h4>Key Benefits</h4>
          <h3>Get Started in 3 Simple Steps</h3>
        </div>
        <div class="row">
          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-keybenefits ">
              <h5>Step 1</h5>
              <h4>Create your Account</h4>
              <p>Creating your account on Hungry for Job portal, its easy and takes just a few minutes.</p>
              <img src="employer/img/step1.svg">
            </div>
          </div>
          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-keybenefits ">
              <h5>Step 2</h5>
              <h4>Post your Job & Candidate Requirement</h4>
              <p>Post your job openings with detailed descriptions, requirements, and desired qualifications.</p>
              <img src="employer/img/step2.svg">
            </div>
          </div>
          <div class="col-xxl-4 col-lg-4 col-md-4 col-sm-6">
            <div class="card-keybenefits ">
              <h5>Step 3</h5>
              <h4>Find the Right Candidate</h4>
              <p>Find the right candidates faster with our advanced search filters.</p>
              <img src="employer/img/step3.svg">
            </div>
          </div>

        </div>
      </div>
    </section>

    <section class="faq-section">
      <div class="container">
        <div class="faqsection">
          <h3>Frequently Asked Questions</h3>
        </div>
        <div class="row ">
          <div class="col-lg-12">
            <div class="accordion" id="accordionExample">
              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                    aria-expanded="true" aria-controls="collapseOne">
                    How does it work ?
                  </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard
                    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to
                    make a type specimen
                    book.
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    How can I request for a demo session?
                  </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard
                    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to
                    make a type specimen
                    book.
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    How can I make payment?
                  </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                    industry's standard
                    dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to
                    make a type specimen
                    book.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
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



  <script src="/employer/js/jquery.min.js"></script>
  <script src="/employer/js/bootstrap.min.js"></script>
  <script src="/employer/js/main.js"></script>
  <script>
    $(document).ready(function () {
      setTimeout(function () {
        $('body').addClass('loaded');
      }, 1000);
    });
    function storeplanId(planId) {
        sessionStorage.setItem('selectedPlanId', planId);
    }
   </script>
</body>

</html>