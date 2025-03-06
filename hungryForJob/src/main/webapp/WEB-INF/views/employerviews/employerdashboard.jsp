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
                      <a onclick="route('companydashboard')" class="active" id="companydashboard"> <img src="employer/img/company-profile.svg" alt=""> Company Profile</a>
                      <a onclick="route('mysubscription')" id="mysubscription"><img src="employer/img/my-subscription.svg" alt=""> My Subscription</a>
                      <!-- <a href="#"><img src="" alt=""> Settting </a> -->
                      <a onclick="route('manageuser')" id="manageuser"><img src="employer/img/manage-users.svg" alt="">Manage users</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
<script>
function route(value)
{
		sessionStorage.setItem("companydashroute", value);
  	 	let url = value;
			let form = document.createElement('form');
			form.method = 'POST'; 
			form.action = url;
			document.body.appendChild(form);
			form.submit(); 
}
$(document).ready(function() {
	
  var value=sessionStorage.getItem("companydashroute").toString();
  if(value)
	{
	  $(".active").removeClass("active");
	  $("#" + value).attr('class', 'active');
	  
	}else
	{
		 $("#companydashboard").attr('class', 'active');
	}
});
</script>