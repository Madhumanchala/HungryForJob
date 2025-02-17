<%
 String employerEmailId=session.getAttribute("employerEmailId").toString();
String empoyerCompanyName=session.getAttribute("employerCompanyName").toString();
%>
<div class="col-xl-3 col-lg-4 col-md-4 ">
            <div class="card-register company-profile p-2">
              <div class="card-content sidebar">
                <div class="card-search">
                  <div class="searchprfile">
                    <div class="profileImg">
                      <img src="employer/img/profile-img.jpg" alt="">
                    </div>
                    <div class="profilTxt">
                      <h4><a href="#"><%=empoyerCompanyName%></a> </h4>
                      <h5><%=employerEmailId%></h5>
                    </div>
                  </div>
                </div>
                <div class="line2"></div>
                <div class="content-txt">
                  <div class="row">
                    <div class="vertical-menu">
                      <a onclick="route" class="active"> <img src="" alt=""> Company Profile</a>
                      <a href="#"><img src="" alt=""> My Subscription</a>
                      <a href="#"><img src="" alt=""> Settting </a>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
