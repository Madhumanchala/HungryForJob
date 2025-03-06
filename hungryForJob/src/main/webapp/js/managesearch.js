function callResultSearchCandidates(value) {
	var skills=value.savedSkills;
	var minExp=value.savedMinExp;
	var maxExp=value.savedMaxExp;
	var location=value.savedLocation;
	var minSalary=value.savedMinSalary;
	var maxSalary=value.savedMaxSalary;
	var company=value.savedCompany;
	var noticePeriod=value.savedNoticePeriod;
	var educationDetails=value.savedHighestQualification;
	var course=value.savedCourse;
	var specialization=value.savedSpecialization;
	var courseType=value.savedCourseType;
	var university=value.savedInstitute;
	var gender=value.savedGender;
	var isReadyToLocate=value.savedReadyToLocate;
	
	sessionStorage.setItem("saveSearchSkill",skills);
	sessionStorage.setItem("saveSearchMinExp",minExp);
	sessionStorage.setItem("courseType",courseType);
	sessionStorage.setItem("saveSearchMaxExp",maxExp);
	sessionStorage.setItem("saveSearchLocation",location);
	sessionStorage.setItem("saveSearchMinSalary",minSalary);
	sessionStorage.setItem("saveSearchMaxSalary",maxSalary);
	sessionStorage.setItem("saveSearchCompany",company);
	sessionStorage.setItem("saveSearchNoticePeriod",noticePeriod);
	sessionStorage.setItem("saveSearchHighestQualification",educationDetails);
	sessionStorage.setItem("saveSearchCourse",course);
	sessionStorage.setItem("saveSearchSpecialization",specialization);
	sessionStorage.setItem("saveSearchUniversity",university);
	sessionStorage.setItem("gender",gender);
	sessionStorage.setItem("readytoLocate",isReadyToLocate);
	
		var url = "resultSearchCandidates";
		
		var form = document.createElement('form');
		form.method = 'POST'; // or 'POST', depending on your needs
		form.action = url;
		
		 var formSkills = document.createElement('input');
		  formSkills.type = 'hidden'; // Use hidden inputs for data
		  formSkills.name = 'skill';      // Set the name of the input
		  formSkills.value = skills;   // Set the value of the input
		 form.appendChild(formSkills);
		 
		  var formMinExp = document.createElement('input');
		  formMinExp.type = 'hidden'; // Use hidden inputs for data
		  formMinExp.name = 'minExp';      // Set the name of the input
		  formMinExp.value = minExp;   // Set the value of the input
		 form.appendChild(formMinExp);
		 
		  var formMaxExp = document.createElement('input');
		  formMaxExp.type = 'hidden'; // Use hidden inputs for data
		  formMaxExp.name = 'maxExp';      // Set the name of the input
		  formMaxExp.value = maxExp;   // Set the value of the input
		  form.appendChild(formMaxExp);
		  
		  var formLocation = document.createElement('input');
		  formLocation.type = 'hidden'; // Use hidden inputs for data
		  formLocation.name = 'location';      // Set the name of the input
		  formLocation.value = location;   // Set the value of the input
		  form.appendChild(formLocation);
		  
		  var formMinSalary = document.createElement('input');
		  formMinSalary.type = 'hidden'; // Use hidden inputs for data
		  formMinSalary.name = 'minSal';      // Set the name of the input
		  formMinSalary.value = minSalary;   // Set the value of the input
		  form.appendChild(formMinSalary);
		  
		   var formMaxSalary = document.createElement('input');
		  formMaxSalary.type = 'hidden'; // Use hidden inputs for data
		  formMaxSalary.name = 'maxSal';      // Set the name of the input
		  formMaxSalary.value = maxSalary;   // Set the value of the input
		  form.appendChild(formMaxSalary);
		  
		  var formCompany = document.createElement('input');
		  formCompany.type = 'hidden'; // Use hidden inputs for data
		  formCompany.name = 'company';      // Set the name of the input
		  formCompany.value = company;   // Set the value of the input
		  form.appendChild(formCompany);
		  
		  var formNoticePeriod = document.createElement('input');
		  formNoticePeriod.type = 'hidden'; // Use hidden inputs for data
		  formNoticePeriod.name = 'noticePeriod';      // Set the name of the input
		  formNoticePeriod.value = noticePeriod;   // Set the value of the input
		  form.appendChild(formNoticePeriod);
		  
		  var formHighestQualification = document.createElement('input');
		  formHighestQualification.type = 'hidden'; // Use hidden inputs for data
		  formHighestQualification.name = 'highestQualification';      // Set the name of the input
		  formHighestQualification.value = educationDetails;   // Set the value of the input
		  form.appendChild(formHighestQualification);
		  
		  var formCourse = document.createElement('input');
		  formCourse.type = 'hidden'; // Use hidden inputs for data
		  formCourse.name = 'course';      // Set the name of the input
		  formCourse.value = course;   // Set the value of the input
		  form.appendChild(formCourse);
		  
		   var formSpecialization = document.createElement('input');
		  formSpecialization.type = 'hidden'; // Use hidden inputs for data
		  formSpecialization.name = 'specialization';      // Set the name of the input
		  formSpecialization.value = specialization;   // Set the value of the input
		  form.appendChild(formSpecialization);
		  
		  var formCourseType = document.createElement('input');
		  formCourseType.type = 'hidden'; // Use hidden inputs for data
		  formCourseType.name = 'courseType';      // Set the name of the input
		  formCourseType.value = courseType;   // Set the value of the input
		  form.appendChild(formCourseType);
		  
		  var formuniversity = document.createElement('input');
		  formuniversity.type = 'hidden'; // Use hidden inputs for data
		  formuniversity.name = 'institute';      // Set the name of the input
		  formuniversity.value = university;   // Set the value of the input
		  form.appendChild(formuniversity);
		  
		  var formgender = document.createElement('input');
		  formgender.type = 'hidden'; // Use hidden inputs for data
		  formgender.name = 'gender';      // Set the name of the input
		  formgender.value = gender;   // Set the value of the input
		  form.appendChild(formgender);
		  
		  var formReadyTolocate = document.createElement('input');
		  formReadyTolocate.type = 'hidden'; // Use hidden inputs for data
		  formReadyTolocate.name = 'readyToLocate';      // Set the name of the input
		  formReadyTolocate.value = isReadyToLocate;   // Set the value of the input
		  form.appendChild(formReadyTolocate);
		  
		document.body.appendChild(form);
		form.submit();
}

function callSearchCandidates(value) {
	var skills=value.savedSkills;
	var minExp=value.savedMinExp;
	var maxExp=value.savedMaxExp;
	var location=value.savedLocation;
	var minSalary=value.savedMinSalary;
	var maxSalary=value.savedMaxSalary;
	var company=value.savedCompany;
	var noticePeriod=value.savedNoticePeriod;
	var educationDetails=value.savedHighestQualification;
	var course=value.savedCourse;
	var specialization=value.savedSpecialization;
	var courseType=value.savedCourseType;
	var university=value.savedInstitute;
	var gender=value.savedGender;
	var isReadyToLocate=value.savedReadyToLocate;
	
	sessionStorage.setItem("saveSearchSkill",skills);
	sessionStorage.setItem("saveSearchMinExp",minExp);
	sessionStorage.setItem("saveSearchMaxExp",maxExp);
	sessionStorage.setItem("saveSearchLocation",location);
	sessionStorage.setItem("saveSearchMinSalary",minSalary);
	sessionStorage.setItem("saveSearchMaxSalary",maxSalary);
	sessionStorage.setItem("courseType",courseType);
	sessionStorage.setItem("saveSearchCompany",company);
	sessionStorage.setItem("saveSearchNoticePeriod",noticePeriod);
	sessionStorage.setItem("saveSearchHighestQualification",educationDetails);
	sessionStorage.setItem("saveSearchCourse",course);
	sessionStorage.setItem("saveSearchSpecialization",specialization);
	sessionStorage.setItem("saveSearchUniversity",university);
	sessionStorage.setItem("gender",gender);
	if(isReadyToLocate === "false")
	{
		sessionStorage.setItem("readytoLocate",isReadyToLocate);
		sessionStorage.setItem("isReadyToLocate","NO");
		
	}else
	{
		sessionStorage.setItem("readytoLocate",isReadyToLocate);
		sessionStorage.setItem("isReadyToLocate","YES");
	}
	sessionStorage.setItem("modifyClicked","clicked");
	
		var url = "searchCandidates";
		var form = document.createElement('form');
		form.method = 'POST'; // or 'POST', depending on your needs
		form.action = url; 
		document.body.appendChild(form);
		form.submit();
}
function updatesearch(id)
{
	var name="java1 devloper";
	isvalid=true;
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"modifydeletesearch",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
                id:id,
                foldername:name,
                type:"updatesavesearchdetail"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Sucessfully updated");
					/*$("#KYC-Compliance-details").modal("hide");*/
					setTimeout(function() {
    					window.location.reload(true); // Reload with cache bypass
					}, 2000); // 2000ms = 2 seconds
					$('.loader').hide();
				}else
				{
					showToast("info","please try again");
					/*$("#KYC-Compliance-details").modal("hide");*/
				}
				$('.loader').hide();
            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
               /* $("#KYC-Compliance-details").modal("hide");*/
                $('.loader').hide();
            }
		})
	}
}
function deletesearch(id)
{
	isvalid=true;
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"modifydeletesearch",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
                id:id,
                type:"deletesavesearchdetail"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Sucessfully deleted");
					/*$("#KYC-Compliance-details").modal("hide");*/
					setTimeout(function() {
    					window.location.reload(true); // Reload with cache bypass
				}, 2000); // 2000ms = 2 seconds
				$('.loader').hide();
				}else
				{
					showToast("info","please try again");
					/*$("#KYC-Compliance-details").modal("hide");*/
				}
				
				$('.loader').hide();
            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
               /* $("#KYC-Compliance-details").modal("hide");*/
                $('.loader').hide();
            }
		})
	}
}