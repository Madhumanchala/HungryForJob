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
		<!-- .navbar -->

		<div class="searchboxtop">
			<div class="hero-search-content">
				<div class="classic-search-box">
					<div class="form-group">
						<div class="input-with-icon" data-bs-toggle="modal"
							data-bs-target="#searchModal" >
							<input type="text" class="form-control"
								placeholder="" id="searchvalue"> <span
								class="fa-icon"><img src="img/search.svg"></span>
						</div>
					</div>
				</div>
			</div>
		</div>

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
						<a class="dropdown-item " onclick="route('candidatenewpassword')">
							<i class="bi bi-lock"></i> Change Password
						</a>
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

<div class="modal fade searchboxmodal" id="searchModal"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header1">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="searchbox">
					<h4>Search Jobs</h4>
					<div class="hero-search-content">
						<div class="row classic-search-box m-0 gx-2">
							<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
								<div class="form-group briod">
									<div class="input-with-icon">
										<input type="text" class="form-control"
											placeholder="Search by job, company or skills"
											id="selectTittle"> <span class="fa-icon"><img
											src="img/search.svg"></span>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12">
								<div class="form-group briod">
									<div class="input-with-icon">
										<select class="form-control selet2Single" id="selectexp">
											<option value="" class="experience">Select
												Experience</option>
											<option value="">Fresh</option>
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
										<span class="fa-icon"><img src="img/experience.svg"></span>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12">
								<div class="form-group briod">
									<div class="input-with-icon">
										<select class="form-control selet2Multiple" multiple="multiple" id="selectLocation">
											<option value="" class="location">Select Location</option>
											<c:forEach items="${cities}" var="perksAndBenfits">
												<option value="${perksAndBenfits.id}">${perksAndBenfits.name}</option>
											</c:forEach>
										</select> 
										<span class="fa-icon"><img src="img/location.svg"></span>
									</div>
								</div>
							</div>
							<div class="col-xl-2 col-lg-2 col-md-12 col-sm-12">
								<div class="form-group">
									<button type="button" class="btn search-btn"
										onclick="fetchDetails()">Search</button>
								</div>
							</div>
						</div>
					</div>
					<span class="error_field" id="error_field" style="padding-left:60px; color:red"></span>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/select2.min.js"></script>
<script>
$(document).ready(function () {

    $("#selectexp").select2({
      placeholder: "Experience",
      dropdownParent: $("#searchModal")
    });
    
    $("#selectLocation").select2({
      placeholder: "Location",
      dropdownParent: $("#searchModal")
    });

  });
  
	function route(value) {
		
		$('#selectTittle').val("");
		$('#selectexp').val("");
		$('#selectLocation').val("")
		
		let form = document.createElement('form');
		form.method = 'POST';
		form.action = value;
		document.body.appendChild(form);
		form.submit();
	}

	function fetchDetails() {
		let jobTittle = $('#selectTittle').val();
		let experience = $('#selectexp').val();
		let locationValue = $('#selectLocation').val();
		let locationArray = []; // Initialize an empty array
		locationArray.push(locationValue); // Push the value into the array
		var isvalid=true;
		if(jobTittle === "")
		{
			isvalid=false;
			$('#error_field').text("please Enter job tittle");
			$('#error_field').show();
			/* $('#error_field').fadeOut(3000) */
		}
		if(isvalid)
		{
			sessionStorage.setItem('jobTitle', jobTittle);
		    sessionStorage.setItem('experience', experience);
		    sessionStorage.setItem('location', JSON.stringify(locationArray));
		    
			let form = document.createElement('form');
			form.method = 'POST';
			form.action = "candidateDashboard";

			// Add input fields for the selected values
			let jobTitleInput = document.createElement('input');
			jobTitleInput.type = 'hidden';
			jobTitleInput.name = 'jobTitle';
			jobTitleInput.value = jobTittle;
			form.appendChild(jobTitleInput);

			let experienceInput = document.createElement('input');
			experienceInput.type = 'hidden';
			experienceInput.name = 'experience';
			experienceInput.value = experience;
			form.appendChild(experienceInput);

			let locationInput = document.createElement('input');
			locationInput.type = 'hidden';
			locationInput.name = 'location';
			locationInput.value = locationArray;
			form.appendChild(locationInput);
			
			let paginationInput = document.createElement('input');
			paginationInput.type = 'hidden';
			paginationInput.name = 'paginationOffSet';
			paginationInput.value = '1';
			form.appendChild(paginationInput);

			document.body.appendChild(form);
			form.submit();
		}
		
	}
</script>
<script>
$(document).ready(function() {
    
    var allCities = [
        <c:forEach items="${cities}" var="city" varStatus="status">
            {
                id: '${city.id}',
                name: '${city.name}'
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
    
    let storedJobTitle = sessionStorage.getItem('jobTitle');
    let storedExperience = sessionStorage.getItem('experience');
    let storedLocation = sessionStorage.getItem('location');
    let flattenedValue=[];
    if(storedLocation)
    {
    	let storedLocation = sessionStorage.getItem('location').toString();
        
        let parsedValue = JSON.parse(storedLocation.replace(/\\+/g, ''));
        
        // Flatten the array if it’s nested
     	flattenedValue = parsedValue[0].map(item => parseInt(item, 10));
    }
    


    
    // Set jobTitle field and trigger change for Select2
    if (storedJobTitle) {
        $('#selectTittle').val(storedJobTitle).trigger('change');
    }

    // Set experience field and trigger change for Select2
    if (storedExperience) {
        $('#selectexp').val(storedExperience).trigger('change');
    }
    
    var preferredlocation = $('#selectLocation');
    preferredlocation.empty(); // Clear the select options

    let storedLocation1 = [];
    for (let i = 0; i < flattenedValue.length; i++) {
        // Append each item from storedLocation to storedLocation1
        storedLocation1.push(flattenedValue[i].toString());
    }

    for (var i = 0; i < allCities.length; i++) {
        var isSelected = storedLocation1.includes(allCities[i].id) ? ' selected' : '';
        preferredlocation.append('<option value="' + allCities[i].id + '"' + isSelected + '>' + allCities[i].name + '</option>');
    }
    if(storedJobTitle)
    {
    	let selectedText = $("#selectLocation option:selected").map(function() {
    	    return $(this).text();
    	}).get();
    	$("#searchvalue").val(storedJobTitle+", "+storedExperience+" years, "+selectedText);
    }else
    {
    	 $("#searchvalue").attr("placeholder","Search by job, company or skills");
    }

});

</script>