function postInternship(flag, id) {

	var jobType = "";
	var jobTittle = "";
	var employmentType = "";
	var workModeType = "";
	var internDescription = "";
	var perksAndBenefits = "";
	var educationQualification = "";
	var keySkills = "";
	var internLocation = "";
	var internDuration = "";
	var internStart = "";
	var internStartDate = "";
	var internStartWithin = "";
	var lastDateToApply = "";
	var booleanInternship = "";
	var stipendIntern = "";
	var internIndustry = "";
	var internDepartment = "";
	var internRole = "";
	var internReferenceCode = "";
	var noOfVacancy = "";
	var internCompanyName = "";
	var internAboutCompany = "";
	var internCompanyAddress = "";
	var internTelephone = "";
	var internEmailId = "";
	var internReadyToReLocate = "false";
	var isValid = true;

	jobType = $('#internship').val();
	jobTittle = $('#Jobtitle').val();
	var statusjob = $("#jobpoststatus").val();

	var employmentTypeCheck = document.getElementsByName("employmentType");
	for (const radio of employmentTypeCheck) {
		if (radio.checked) {
			employmentType = radio.value;
			break;
		}
	}

	var workModeCheck = document.getElementsByName("workMode");
	for (const radio of workModeCheck) {
		if (radio.checked) {
			workModeType = radio.value;
			break;
		}
	}

	internDescription = document.getElementById("internDescription").value;
	internDescription = internDescription.replace(/<[^>]*>/g, '');
	perksAndBenefits = $('#perksbenefits').val();
	educationQualification = $('#educationalQualification').val();
	keySkills = $('#keySkills').val();
	internLocation = $('#internshipLocation').val();
	internDuration = $('#internshipduration').val();
	var internStartCheck = document.getElementsByName('internCheck');
	for (const radio of internStartCheck) {
		if (radio.checked) {
			internStart = radio.value;
		}
	}
	internStartDate = $('#specifystartdate').val();
	var internStartWithinCheck = document.getElementsByName('startwithin');
	for (const radio of internStartWithinCheck) {
		if (radio.checked) {
			internStartWithin = radio.value;
		}
	}
	lastDateToApply = $('#lastdate').val();
	var internshipYesNoCheck = document.getElementsByName('internshipYesNo');
	for (const radio of internshipYesNoCheck) {
		if (radio.checked) {
			booleanInternship = radio.value;
		}
	}

	stipendIntern = $('#internSalary').val();
	internIndustry = $('#Industry').val();
	internDepartment = $('#department').val();
	internRole = $('#internRole').val();
	internReferenceCode = $('#referencecode').val();
	noOfVacancy = $('#numberVacancies').val();
	internCompanyName = $('#companyName').val();
	/*internAboutCompany = $('#aboutCompany').val();
	internAboutCompany = internAboutCompany.replace(/<[^>]*>/g, '');
	internCompanyAddress = $('#internCompanyAddress').text();
	internTelephone = $('#Telephone').val();*/
	internEmailId = $('#emailId').val();
	internReadyToReLocate = $('#includeCandidates').is(':checked');
	var operatedby = $('#operatedby').val();

	if (jobTittle == "") {
		$('#internJobTittle').text("Field is required");
		$('#internJobTittle').show();
		isValid = false;
	}

	if (employmentType == "") {
		$('#internEmployementType').text("Field is required");
		$('#internEmployementType').show();
		isValid = false;
	}

	if (workModeType == "") {
		$('#internModeType').text("Field is required");
		$('#internModeType').show();
		isValid = false;
	}

	if (internDescription == "") {
		$('#error_internDescription').text("Field is required");
		$('#error_internDescription').show();
		isValid = false;
	}

	if (perksAndBenefits == "") {
		$('#internPerksAndBenefits_error').text("Field is required");
		$('#internPerksAndBenefits_error').show();
		isValid = false;
	}
	if (educationQualification == "") {
		$('#internEducationQualification').text("Field is required");
		$('#internEducationQualification').show();
		isValid = false;
	}
	if (keySkills == "") {
		$('#internKeySkills').text("Field is required");
		$('#internKeySkills').show();
		isValid = false;
	}
	if (internLocation == "") {
		$('#internLocation').text("Field is required");
		$('#internLocation').show();
		isValid = false;
	}
	if (internDuration == "") {
		$('#internDuration').text("Field is required");
		$('#internDuration').show();
		isValid = false;
	}

	if (internStart == "") {
		$('#internStart').text("Field is required");
		$('#internStart').show();
		isValid = false;
	}
	else {
		if (internStart == "SpecificDate") {
			if (internStartDate == "") {
				$('#internStartDate').text("Field is required");
				$('#internStartDate').show();
				isValid = false;
			}
		} else {
			if (internStartWithin == "") {
				$('#internStartWithIn_error').text("Field is required");
				$('#internStartWithIn_error').show();
				isValid = false;
			}
		}
	}

	if (lastDateToApply == "") {
		$('#internLastDate').text("Field is required");
		$('#internLastDate').show();
		isValid = false;
	}
	if (booleanInternship == "") {
		$('#internStipend_error').text("Field is required");
		$('#internStipend_error').show();
		isValid = false;
	} else {
		if (booleanInternship == "YES") {
			if (stipendIntern == "") {
				$('#internMinSalary').text("Field is required");
				$('#internMinSalary').show();
				isValid = false;
			}
		}

	}

	if (internIndustry == "") {
		$('#internIndustry').text("Field is required");
		$('#internIndustry').show();
		isValid = false;
	}
	if (internDepartment == "") {
		$('#internDepartment').text("Field is required");
		$('#internDepartment').show();
		isValid = false;
	}
	if (internRole == "") {
		$('#internRole_error').text("Field is required");
		$('#internRole_error').show();
		isValid = false;
	}
	if (internReferenceCode == "") {
		$('#internReferenceCode_error').text("Field is required");
		$('#internReferenceCode_error').show();
		isValid = false;
	}
	if (noOfVacancy == "") {
		$('#internOfVacancy').text("Field is required");
		$('#internOfVacancy').show();
		isValid = false;
	}
	/*if (internCompanyName == "") {
		$('#InternCompanyDetails').text("Field is required");
		$('#InternCompanyDetails').show();
		isValid = false;
	}
	if (internAboutCompany == "") {
		$('#InternAboutCompany').text("Field is required");
		$('#InternAboutCompany').show();
		isValid = false;
	}
	if (internTelephone == "") {
		$('#InternTelephone').text("Field is required");
		$('#InternTelephone').show();
		isValid = false;
	}
	if (internEmailId == "") {
		$('#InternEmailId').text("Field is required");
		$('#InternEmailId').show();
		isValid = false;

	} else {
		if (!validateEmail(internEmailId)) {
			$('#InternEmailId').text('Please Enter Valid Email').css({ "color": "red" });
			$('#InternEmailId').show();
			isValid = false;
		}
	}*/

	if (isValid) {
		$.ajax({
			url: '/saveJobPostInternship',  // Replace with your actual API endpoint
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				id: id,
				companyId: companyId,
				userId: userId,
				internjobType: jobType,
				internJobTittle: jobTittle,
				internEmploymentType: employmentType,
				internWorkMode: workModeType,
				internDescription: internDescription,
				internPerksAndBenefits: perksAndBenefits,
				internEducationQualification: educationQualification,
				internKeySkills: keySkills,
				internLocation: internLocation,
				internDuration: internDuration,
				internStart: internStart,
				internStartDateApply: internStartDate,
				internWillStartWithin: internStartWithin,
				internLastDateApply: lastDateToApply,
				internStipendConfirm: booleanInternship,
				internStipendMoney: stipendIntern,
				internIndustry: internIndustry,
				internDepartment: internDepartment,
				internRole: internRole,
				internReferenceCode: internReferenceCode,
				internVacancy: noOfVacancy,
				internCompanyName: internCompanyName,
				internAboutCompany: internAboutCompany,
				internCompanyAddress: internCompanyAddress,
				internTelephone: internTelephone,
				internEmailId: internEmailId,
				internReadyToReLocate: internReadyToReLocate,
				flag: flag,
				status: statusjob,
				operatedBy: operatedby,
			}),
			success: function(response) {
				console.log('Job internship  successfully:', response);
				if (response == "success") {
					showToast("success", "Sucessfully Saved");
					//					window.location = 'employerviews/managejobpost';

					var form = document.createElement('form');

					form.method = 'POST';
					form.action = '/managejobpost';

					// Append the form to the document body
					document.body.appendChild(form);

					// Submit the form
					form.submit();

				} else {
					showToast("info", "Failed");
				}

				// Add success handling logic here
			},
			error: function(xhr, status, error) {
				console.log('Error:', error);
				showToast("error", "failed");
				// Add error handling logic here
			}
		});
	}



}
function hideModal(id) {
	$('#' + id).hide();
}
function changeinternshipStartDate(id) {
	hideModal(id);
	var value = $('#internshipStart').is(':checked');
	if (value) {
		$('#startDateSpecify').show();
		$('#willStartWithin').hide();
	}
	else {
		$('#startDateSpecify').hide();
		$('#willStartWithin').show();
	}
}
function OnOffStipend(id) {
	hideModal(id);
	var value = $('#internshipYes').is(':checked');
	if (value) {
		$('#stipendOnOff').show();
		$('#internBetterResponse').hide();
	} else {
		$('#stipendOnOff').hide();
		$('#internBetterResponse').show();
	}
}
function internTittleModal(id, value) {
	hideModal(id);
	$('#internTittle').text(value);

	if (value) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}

}
function internIndustryModal(id, value) {
	hideModal(id);
	$('#internSubTittle').text(value);

	if (value) {
		$('.jd-preview-main').show();
	}
}
function internLocationModal(id) {
	hideModal(id);
	var idValue = $('#internshipLocation').val();
	const newItem = [];
	var textValues = idValue.map(function(item) {
		newItem.push($('#internshipLocation option[value="' + item + '"]').text()); // Fetches text for each value
	});
	const result = newItem.join(", ");
	$('#internLocationDisplay').text(result);

	if (result) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}


}
function internEmployModal(id, value) {
	hideModal(id);
	if (value == "FULLTIME") {
		$('#internEmploymentType').text("Full Time");
	} else {
		$('#internEmploymentType').text("Part Time");
	}
}
function internWorkModal(id, value) {
	hideModal(id);
	if (value == "HYBRID") {
		$('#internWorkModeType').text("Hybrid");
	} else if (value == "INOFFICE") {
		$('#internWorkModeType').text("In Office");
	} else {
		$('#internWorkModeType').text("Remote");
	}
}
function internCompanyModal(id, value) {
	hideModal(id);
	$('#interCompanyName').text(value);
}
function internEmailIdModal(id, value) {
	hideModal(id);
	$('#internEmailId').text(value);

	if (value) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function internTelephoneModal(id, value) {
	hideModal(id);
	$('#internMobileNumber').text(value);
	var internTelephone = $('#Telephone').val();
	if (/^[6-9]/.test(internTelephone)) {
		$('#Telephone').text(value);
	}
	
	if (value) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function internKeySkills(id) {
	hideModal(id);
	var newvalue = [];
	var selectedSkills = $('#keySkills').val();

	var skillsId = selectedSkills.map(function(item) {
		var text = $('#keySkills option[value="' + item + '"]').text();
		newvalue.push(text);
	});

	$('.keySkillsDetails ul').empty();
	newvalue.forEach(function(skill) {
		$('.keySkillsDetails ul').append('<li>' + skill + '</li>');
	});

	if (newvalue.length > 0) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function internChangeDescriptionModal(id, value) {
	var jobDescription = $(value).text();
	hideModal(id);
	$('#internJobDescriptionDetails').text(jobDescription);

	if (jobDescription) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function changehideModalRole(id) {
	hideModal(id);
	var id = $('#department').val();
	$.ajax({
		url: '/getRole',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify({
			id: id,
			type: "role"
		}),
		success: function(response) {
			var role = response.data.jobPostingSkillsFramework;
			$('#internRole').empty();
			$('#internRole').append(new Option("Select", ""));
			role.forEach(function(role) {
				$('#internRole').append(new Option(role.name, role.id));
			});
			// Perform actions with the response data if needed
		},
		error: function(xhr, status, error) {
			console.error("Error:", error);
			// Handle the error here
		}
	});
}


function jobDetailsValidation() {
	const internTittle = $('#internTittle').text().trim();
	const internSubTittle = $('#internSubTittle').text().trim();
	const internJobDescriptionDetails = $('#internJobDescriptionDetails').text().trim();
	const internLocationDisplay = $('#internLocationDisplay').text().trim();
	const internMobileNumber = $('#internMobileNumber').text().trim();
	const internEmailId = $('#internEmailId').text().trim();

	const keySkillsElement = document.querySelector('.keySkillsDetails li');
	const keySkills = keySkillsElement ? keySkillsElement.textContent.trim() : "";


	// Now validate
	if (internTittle === "" &&
		internSubTittle === "" &&
		internJobDescriptionDetails === "" &&
		keySkills === "" &&
		internLocationDisplay === "" &&
		internMobileNumber === "" &&
		internEmailId === ""
	) {
		$('.jd-preview-main').hide();
	}
}

function validateMobileNumber(input) {
    input.value = input.value.replace(/\D/g, '');

    // Allow only if it starts with 9, 8, 7, or 6
    if (input.value.length > 0 && !/^[6-9]/.test(input.value)) {
      input.value = '';
      $('#editMobileNo_error').text('Mobile number must start with 6, 7, 8, or 9');
    }else{
		 $('#editMobileNo_error').text('');
	}
  }

  function validateEmail(email) {
      let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return emailPattern.test(email);
  }
  
  function submitForm() {
  	$("#addClient").modal('hide');
  	document.getElementById("clientNameError").innerText = "";
  	
  	// Get input values
  	const name = document.getElementById("clientName").value.trim();
  	
  	if (name === "") {
  		document.getElementById("clientNameError").innerText = "Client Name is required.";
  		return false;
  	}
  	
  	const formData = {
  		name : $("#clientName").val(),
  		flag : 'insert'
  	};
	document.getElementById("clientName").value = "";
  	
  	$.ajax({
  		url : "addClient", // Change this to your actual controller/URL
  		type : "POST",
  		contentType : "application/json",
  		data : JSON.stringify(formData),
  		success : function(response) {
  			if (response.errors.errorCode === "0000") {
  				/*showToast("success", "Sucessfully Saved");
  				setTimeout(function() {
  					$(".loader").hide();
  					$(".loader").css("display", "block");
  					location.reload();
  				}, 1000);*/
				
				showToast("success", "Sucessfully Saved");
				setTimeout(function() {
					$('#companyName').empty();
					
					// Optionally add a placeholder
			        $('#companyName').append(
			            $('<option>', {
			                value: '',
			                text: 'Select'
			            })
			        );

			        // Loop through the response.data array and append options
			        response.data.forEach(function(company) {
			            $('#companyName').append(
			                $('<option>', {
			                    value: company.name, // or another unique id if you have one
			                    text: company.name
			                })
			            );
			        });
				}, 1000);
				
  			} else if (response.errors.errorCode === "1001") {
  				showToast("info", "Client already exists.");
  				setTimeout(function() {
  					$(".loader").hide();
  					$(".loader").css("display", "block");
  					location.reload();
  				}, 1000);
  			} else {
  				showToast("error", "Please Try again later!!");
  				setTimeout(function() {
  					$(".loader").hide();
  					$(".loader").css("display", "block");
  					location.reload();
  				}, 1000);
  			}
  		},
  		error : function(xhr) {
  			showToast("error", "Please Try again later!!");
  			setTimeout(function() {
  				$(".loader").hide();
  				$(".loader").css("display", "block");
  				location.reload();
  			}, 1000);
  		}
  	});
  }