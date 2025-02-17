function getSpecialization(id, value) {
	$.ajax({
		url: "getCourseDetails",
		method: "POST",
		data: {
			"id": id,
			"flag": 2
		},
		success: function(response) {
			$('.specialization_div').show();
			if (response.errors.errorCode == "0000") {
				if (response.data.specialization !== null) {
					if (Array.isArray(response.data.specialization)) {
						var data = response.data.specialization
						$('#' + value).empty();
						$('#' + value).append(
							$('<option></option>').val("").text("Select"));
						data.forEach(function(course) {
							$('#' + value).append(
								$('<option></option>').val(course.id).text(course.name)
							);
						});
					} else {
						console.error("Unexpected response format:", response);
						$('#errorContainer').text("Unexpected response format.");
					}
				}
			} else {
				console.log("response errorcode", response.errors.errorCode, "error message", response.errors.errorMessage);
			}
		},
		error: function(xhr, status, error) {
			console.error("An error occurred while fetching course details:", error);
			console.error("Status:", status);
			console.error("Response:", xhr.responseText);
		}
	})
}

function getSpecializationSession(id, value,specialValue) {
	$.ajax({
		url: "getCourseDetails",
		method: "POST",
		data: {
			"id": id,
			"flag": 2
		},
		success: function(response) {
			$('.specialization_div').show();
			if (response.errors.errorCode == "0000") {
				if (response.data.specialization !== null) {
					if (Array.isArray(response.data.specialization)) {
						var data = response.data.specialization
						$('#' + value).empty();
						$('#' + value).append(
							$('<option></option>').val("").text("Select"));
						data.forEach(function(course) {
							$('#' + value).append(
								$('<option></option>').val(course.id).text(course.name)
							);
						});
						$('#'+value).val(specialValue).trigger('change');
					} else {
						console.error("Unexpected response format:", response);
						$('#errorContainer').text("Unexpected response format.");
					}
				}
			} else {
				console.log("response errorcode", response.errors.errorCode, "error message", response.errors.errorMessage);
			}
		},
		error: function(xhr, status, error) {
			console.error("An error occurred while fetching course details:", error);
			console.error("Status:", status);
			console.error("Response:", xhr.responseText);
		}
	})
}

function changeEducation(id) {
	if (id == "phd") {
		$('#phdCourses').show();
		$('#degreeCourses').hide();
		$('#masterCourses').hide();
	} else if (id == "master") {
		$('#phdCourses').hide();
		$('#degreeCourses').hide();
		$('#masterCourses').show();

	} else if (id == "degree") {
		$('#phdCourses').hide();
		$('#degreeCourses').show();
		$('#masterCourses').hide();

	} else {
		console.log("error in event");
	}
}

function submitSearchCandidates() {
	var skills = $('#iTSkills').val();
	skills = skills.join(",");
	var minExp = document.getElementById("workExperienceMin").value;
	var maxExp = document.getElementById("workExperienceMax").value;
	var location = $('#jobLocation').val();
	location = location.join(",");
	var minSalary = document.getElementById("searchMinSalary").value;
	var maxSalary = document.getElementById("salaryFigureMax").value;
	var company = document.getElementById("company").value;
	var isNoticePeriod = document.getElementsByName("noticePeriod");
	var noticePeriod = null;
	if (isNoticePeriod != null) {
		for (var i = 0; i < isNoticePeriod.length; i++) {
			if (isNoticePeriod[i].checked) {
				noticePeriod = isNoticePeriod[i].value;
				break;
			}
		}
	}
	var isEducationPeriod = document.getElementsByName("highestQualification");
	var educationDetails = null;
	var course = null;
	var specialization = null;
	var courseType = null;
	var university = null;
	if(isEducationPeriod != undefined)
	{
			for (var i = 0; i < isEducationPeriod.length; i++) {
		if (isEducationPeriod[i].checked) {
			educationDetails = isEducationPeriod[i].value;

			if (educationDetails == "degree") {
				course = document.getElementById("course2").value;
				specialization = document.getElementById("specialization2").value;
				var isCourseType = document.getElementsByName("courseType2");
				for (var i = 0; i < isCourseType.length; i++) {
					if (isCourseType[i].checked) {
						courseType = isCourseType[i].value;
					}
				}
				university = document.getElementById("university2").value;

			} else if (educationDetails == "master") {
				course = document.getElementById("course1").value;
				specialization = document.getElementById("specialization1").value;
				var isCourseType = document.getElementsByName("courseType1");
				for (var i = 0; i < isCourseType.length; i++) {
					if (isCourseType[i].checked) {
						courseType = isCourseType[i].value;
					}
				}
				university = document.getElementById("university1").value;


			} else if (educationDetails == "phd") {
				course = document.getElementById("course3").value;
				specialization = document.getElementById("specialization3").value;
				var isCourseType = document.getElementsByName("courseType3");
				for (var i = 0; i < isCourseType.length; i++) {
					if (isCourseType[i].checked) {
						courseType = isCourseType[i].value;
					}
				}
				university = document.getElementById("university3").value;

			} else {
				console.log("education period is called");
			}
		}
	}
	}

	var isGender = document.getElementsByName("genderDiv");
	var gender = null;
	if(isGender != undefined)
	{
		for (var i = 0; i < isGender.length; i++) {
		if (isGender[i].checked) {
			gender = isGender[i].value;
		}
	}
	}
	var isReadyToLocate = "NO";
	var isReadyToLocate = document.getElementById("includeCandidates").checked;
		if (isReadyToLocate) {
			isReadyToLocate = "YES";
		};
	
	var isvalid = true;
	if (skills == "") {
		$('#skills_error').text("Enter the field");
		$('#skills_error').show();
		isvalid = false;
	}
	if (minExp == "") {
		$('#minExp_error').text("Enter the field");
		$('#minExp_error').show();
		isvalid = false;
	}
	if (maxExp == "") {
		$('#maxExp_error').text("Enter the field");
		$('#maxExp_error').show();
		isvalid = false;
	}
	if (location == "") {
		$('#location_error').text("Enter the field");
		$('#location_error').show();
		isvalid = false;
	}
	
	if (isvalid) {
		
		const selectedTexts = $('#iTSkills option:selected').map(function() {
        return $(this).text();
    }).get().join(', ');
    
    const selectedLocation = $('#jobLocation option:selected').map(function() {
        return $(this).text();
    }).get().join(', ');
    
    	const minctcsearch=$('#searchMinSalary option:selected').text().replace('lacs','').trim();
    	const maxctcsearch=$('#salaryFigureMax option:selected').text();
    
		sessionStorage.setItem("keySkills",selectedTexts);
		sessionStorage.setItem("Experience",[minExp,maxExp].join("-")+" years");
		sessionStorage.setItem("Locations",selectedLocation);
		sessionStorage.setItem("minExp",minExp);
		sessionStorage.setItem("maxExp",maxExp);
		sessionStorage.setItem("CTC",minctcsearch+"-"+maxctcsearch);
		if(company != null)
		{
			sessionStorage.setItem("companyName",company);
		}
		if(noticePeriod != null)
		{
			sessionStorage.setItem("NoticePeriod",noticePeriod);
		}
		if(educationDetails != null)
		{
			sessionStorage.setItem("highestQualification",educationDetails);
		}	
		if(course != null)
		{
			sessionStorage.setItem("course",course);
		}
		if(specialization != null)
		{
			sessionStorage.setItem("specialization",specialization);
		}
		if(courseType != null)
		{
			sessionStorage.setItem("courseType",courseType);
		}
		if(university != null)
		{
			sessionStorage.setItem("institute",university);
		}
		if(gender != null)
		{
			sessionStorage.setItem("gender",gender);
		}
		if(isReadyToLocate!=null)
		{
			sessionStorage.setItem("readytoLocate",isReadyToLocate);
		}
		
		// save new search
		let saveSearchSkill=$('#iTSkills').val();
		sessionStorage.setItem("saveSearchSkill",saveSearchSkill);
		
		let saveSearchMinExp= $('#workExperienceMin').val()
		sessionStorage.setItem("saveSearchMinExp",saveSearchMinExp);
		
		let saveSearchMaxExp = $('#workExperienceMax').val()
		sessionStorage.setItem("saveSearchMaxExp",saveSearchMaxExp);
		
		let saveSearchLocation = $('#jobLocation').val();
		sessionStorage.setItem("saveSearchLocation",saveSearchLocation);
		
		let saveSearchMinSalary = $('#searchMinSalary').val();
		sessionStorage.setItem("saveSearchMinSalary",saveSearchMinSalary);
		
		let saveSearchMaxSalary=$('#salaryFigureMax').val();
		sessionStorage.setItem("saveSearchMaxSalary",saveSearchMaxSalary);
		
		let saveSearchCompany= $('#company').val();
		sessionStorage.setItem("saveSearchCompany",saveSearchCompany);
		
		let saveSearchNoticePeriod=noticePeriod;
		sessionStorage.setItem("saveSearchNoticePeriod",saveSearchNoticePeriod);
		
		let saveSearchHighestQualification=educationDetails;
		sessionStorage.setItem("saveSearchHighestQualification",saveSearchHighestQualification);
		
		let saveSearchCourse=course;
		sessionStorage.setItem("saveSearchCourse",saveSearchCourse);
		
		let saveSearchSpecialization=specialization;
		sessionStorage.setItem("saveSearchSpecialization",saveSearchSpecialization);
		
		let saveSearchCourseType=courseType;
		sessionStorage.setItem("saveSearchCourseType",saveSearchCourseType);
		
		let saveSearchUniversity=university;
		sessionStorage.setItem("saveSearchUniversity",saveSearchUniversity);
		
		let saveSearchGender=gender;
		sessionStorage.setItem("gender",saveSearchGender);
		
		let saveSearchIsReadyToLocate=isReadyToLocate;
		sessionStorage.setItem("isReadyToLocate",saveSearchIsReadyToLocate);
		
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

}
function allChange(id) {
	$('#' + id).hide();
}
$(document).ready(function() {
	
	let isModifyClicked=sessionStorage.getItem("modifyClicked");
	if(isModifyClicked === "clicked")
	{
	  let skillsValue=sessionStorage.getItem("saveSearchSkill");
	  let skillsList=skillsValue?skillsValue.split(","):[];
	  $('#iTSkills').val(skillsList).trigger('change');

	  let minExpValue=sessionStorage.getItem("saveSearchMinExp");
	  if(minExpValue === "null" || minExpValue == undefined || minExpValue == null)
	  {
		  $('#workExperienceMin').val("").trigger('change');
	  }else
	  {
		  $('#workExperienceMin').val(minExpValue).trigger('change');
	  }
	  
	  
	  let maxExpValue=sessionStorage.getItem("saveSearchMaxExp");
	  if(maxExpValue === "null" || maxExpValue == undefined || maxExpValue == null)
	  {
		  $('#workExperienceMax').val("").trigger('change');
	  }else
	  {
		  $('#workExperienceMax').val(maxExpValue).trigger('change');
	  }
	  
	  let locationvalue=sessionStorage.getItem("saveSearchLocation");
	  if(locationvalue === "null" || locationvalue == undefined || locationvalue==null)
	  {
		  $("#jobLocation").val("").trigger('change');
	  }else
	  {
		   let locationlist=locationvalue?locationvalue.split(","):[];
	  	$("#jobLocation").val(locationlist).trigger('change');
	  }
	 
	  
	  let minSalaryValue=sessionStorage.getItem("saveSearchMinSalary");
	  if(minSalaryValue === "null" || minSalaryValue == undefined || minSalaryValue == null)
	  {
		    $('#searchMinSalary').val("").trigger('change');
	  }else
	  {
		    $('#searchMinSalary').val(minSalaryValue).trigger('change');
	  }
	
	  
	  let maxSalaryValue=sessionStorage.getItem("saveSearchMaxSalary");
	  if(maxSalaryValue == null || maxSalaryValue == undefined === "null")
	  {
		  $('#salaryFigureMax').val("").trigger('change');
	  }else
	  {
		   $('#salaryFigureMax').val(maxSalaryValue).trigger('change');
	  }
	 
	  
	  let companyValue=sessionStorage.getItem("saveSearchCompany");
	  if(companyValue == null || companyValue === "null" || companyValue == undefined)
	  {
		  $('#company').val("").trigger('change');
		  
	  }else
	  {
		  $('#company').val(companyValue).trigger('change');
	  }
	  
	  let noticeperiod=sessionStorage.getItem("saveSearchNoticePeriod");
	  if(noticeperiod !== null && noticeperiod !== "null")
	  {
		  	  $("input[name='noticePeriod'][value='" + noticeperiod + "']").prop("checked",true);
	  }
	  
	  let highestQualificationValue=sessionStorage.getItem("saveSearchHighestQualification");
	  if(highestQualificationValue !== null && highestQualificationValue !== "null")
	  {
		  	  $("input[name='highestQualification'][value='"+highestQualificationValue+"']").prop("checked",true);
	  }
	  
	  let courseValue=sessionStorage.getItem("saveSearchCourse");
	  let specializationValue=sessionStorage.getItem("saveSearchSpecialization");
	  let universityValue=sessionStorage.getItem("saveSearchUniversity");
	  
	  if(highestQualificationValue === "degree")
	  {
		  $('#degreeCourses').show();
		   $('#masterCourses').hide();
		    $('#phdCourses').hide();
		   if(courseValue == null || courseValue ==- "null" ||  courseValue == undefined)
	  		{
		  		$('#course2').val("").trigger('change');
	  		}else
	  		{
		 		 $('#course2').val(courseValue).trigger('change');
		 	}
		 
		  if(specializationValue == null || specializationValue === "null" || specializationValue == undefined)
		  {
			   getSpecializationSession(courseValue,'specialization2',"");
		  }else
		  {
			  getSpecializationSession(courseValue,'specialization2',specializationValue);
		  }
		  $('#specialization2').trigger('change');
		  let courseTypeValue=sessionStorage.getItem("saveSearchCourseType");
		  if(courseTypeValue !== null || courseTypeValue !== "null")
		  {
			   $("input[name='courseType2'][value='"+courseTypeValue+"']").prop("checked",true);
		  }
		  if(universityValue == null || universityValue === "null" || universityValue == undefined)
		  {
			  $('#university2').val("").trigger('change');
		  }else
		  {
			   $('#university2').val(universityValue).trigger('change');
		  }

	  }
	  else if(highestQualificationValue === "master")
	  {
		  $('#masterCourses').show();
		   $('#degreeCourses').hide();
		   $('#phdCourses').hide();
		   if(courseValue == null || courseValue === "null" ||  courseValue == undefined)
	  		{
				$('#course1').val("").trigger('change');
			}else
			{
				 $('#course1').val(courseValue).trigger('change');
			}
			if(specializationValue == null || specializationValue === "null" || specializationValue == undefined)
			{
				getSpecializationSession(courseValue,'specialization1',"");
			}else
			{
				getSpecializationSession(courseValue,'specialization1',specializationValue);
			}
		  $('#specialization1').trigger('change');
		  let courseTypeValue=sessionStorage.getItem("saveSearchCourseType");
		  if(courseTypeValue !== null || courseTypeValue !== "null")
		  {
		   		$("input[name='courseType1'][value='"+courseTypeValue+"']").prop("checked",true);
		   }
		   if(universityValue == null || universityValue === "null" || universityValue == undefined)
		   {
			    $('#university1').val(universityValue).trigger('change');
		   }else
		   {
			    $('#university1').val("").trigger('change');
		   }
		 
	  }
	  else if(highestQualificationValue === "phd")
	  {
		  $('#phdCourses').show();
		  $('#masterCourses').hide();
		   $('#degreeCourses').hide();
		   if(courseValue == null || courseValue === "null" || courseValue == undefined)
		   {
			    $('#course3').val("").trigger('change');
		   }else
		   {
			   $('#course3').val(courseValue).trigger('change');
		   }
		 	if(specializationValue == null || specializationValue === "null" || specializationValue == undefined)
		 	{
				 getSpecializationSession(courseValue,'specialization3',"");
			}else
			{
				getSpecializationSession(courseValue,'specialization3',specializationValue);
			}
		  $('#specialization3').trigger('change');
		  let courseTypeValue=sessionStorage.getItem("saveSearchCourseType");
		  if(courseTypeValue !== null && courseTypeValue !== "null")
		  {
			   $("input[name='courseType3'][value='"+courseTypeValue+"']").prop("checked",true);
		  }
		  if(universityValue == null || universityValue === "null" || universityValue == undefined)
		  {
			  $('#university3').val("").trigger('change');
		  }else
		  {
			   $('#university3').val(universityValue).trigger('change');
		  }
		  
	  }else
	  {
		  	$('#phdCourses').hide();
			$('#degreeCourses').hide();
			$('#masterCourses').hide();
	  }
	  
	  let genderValue = sessionStorage.getItem("gender");
	  if (genderValue !== "null" && genderValue !== null) 
	  {
    	$("input[name='genderDiv'][value='" + genderValue + "']").prop("checked", true);
	  }

	  
	  let readyTolocate=sessionStorage.getItem("isReadyToLocate");
	  if(readyTolocate === 'YES')
		{
			$('#includeCandidates').prop('checked',true);
		}
	  sessionStorage.removeItem("modifyClicked");
	  
	}else
	{
		$('#phdCourses').hide();
		$('#degreeCourses').hide();
		$('#masterCourses').hide();
		sessionStorage.removeItem("modifyClicked");
	}
	sessionStorage.removeItem("modifyClicked");
	sessionStorage.removeItem("readytoLocate");
	sessionStorage.removeItem("gender");
	sessionStorage.removeItem("institute");
	sessionStorage.removeItem("courseType");
	sessionStorage.removeItem("specialization");
	sessionStorage.removeItem("course");
	sessionStorage.removeItem("highestQualification");
	sessionStorage.removeItem("NoticePeriod");
	sessionStorage.removeItem("companyName");
	sessionStorage.removeItem("CTC");
	sessionStorage.removeItem("saveSearchSkill");
	sessionStorage.removeItem("saveSearchMinExp");
	sessionStorage.removeItem("saveSearchMaxExp");
	sessionStorage.removeItem("saveSearchLocation");
	sessionStorage.removeItem("saveSearchMinSalary");
	sessionStorage.removeItem("saveSearchMaxSalary");
	sessionStorage.removeItem("saveSearchCompany");
	sessionStorage.removeItem("saveSearchNoticePeriod");
	sessionStorage.removeItem("saveSearchHighestQualification");
	sessionStorage.removeItem("saveSearchCourse");
	sessionStorage.removeItem("saveSearchSpecialization");
	sessionStorage.removeItem("saveSearchCourseType");
	sessionStorage.removeItem("saveSearchUniversity");
	sessionStorage.removeItem("isReadyToLocate");
});