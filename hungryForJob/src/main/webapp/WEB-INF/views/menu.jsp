<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String candidateEmailId = (String) session.getAttribute("candidateEmail");
String headerMenucandidateName = (String) session.getAttribute("candidateName");
String candidateImage = (String) session.getAttribute("profileImage");
String totalpoints=(String) session.getAttribute("totalpoints");
%>
	<div class="col-xl-3 col-lg-3 col-md-4 col-sm-12  ">
		<div class="card-content main-profile ">
			<div class="leftside">
				<div class="profileTxt">
					<div class="avatar-upload animate">
						<div class=" avatar-edit ">
							<input type='file' id="imageUpload" accept=".jpeg " />
							<label for="imageUpload">
								<div class="cam">
									<img src="img/camera.webp ">
								</div>
							</label>
						</div>
						<div class="avatar-preview">
							<div id="imagePreview"
								style="background-image: url('data:image/jpeg;base64,<%=candidateImage%>'); border: 2px solid #fff; background-color: #e6e6e6;">
							</div>
						</div>
					</div>

					<h4><%=headerMenucandidateName%></h4>
					<p>
						<a><%=candidateEmailId%></a>
					</p>
				</div>
				<div class="progressbar">
                  <div class="d-flex align-items-center justify-content-between">
                    <h5>Profile Completed</h5>
                    <p><%=totalpoints%>%</p>
                  </div>
                  <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated progress-bar-width-1"
                      role="progressbar" style="width:<%=totalpoints%>%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                    </div>
                  </div>
                </div>
				
				<ul id="menu">
    <li><a onclick="routeDashobard('candidateDashboard')"> 
        <img src="img/home.svg"> Home
    </a></li>
    <li><a onclick="routeDashobard('myProfile')"> 
        <img src="img/profile.svg"> My Profile
    </a></li>
    <li><a onclick="routeDashobard('appliedJob')"> 
        <img src="img/job.svg"> Applied Jobs
    </a></li>
</ul>
				
			</div>
		</div>
	</div>
	<script>
	 /* function setActive(element) {
         // Remove 'active' class and background style from all <a> tags
         $('#menu a').removeClass('active').css('background', '');

         // Add 'active' class and style to the clicked <a> tag
         $(element).addClass('active').css('background', 'aliceblue');
     }

     // Attach the click event to all links in #menu
     $('#menu a').on('click', function() {
         setActive(this);
     }); */
    
  function routeDashobard(value)
  {
    	 	let url = value;
			let form = document.createElement('form');
			form.method = 'POST'; 
			form.action = url;
			document.body.appendChild(form);
			form.submit(); 
  }
</script>
<!-- 
</body>
</html> -->