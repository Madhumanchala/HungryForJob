const salaryOptions = [
	{ value: "50000", label: "50,000" },
	{ value: "60000", label: "60,000" },
	{ value: "70000", label: "70,000" },
	{ value: "80000", label: "80,000" },
	{ value: "90000", label: "90,000" },
	{ value: "100000", label: "1 lac" },
	{ value: "125000", label: "1.25 lacs" },
	{ value: "150000", label: "1.5 lacs" },
	{ value: "175000", label: "1.75 lacs" },
	{ value: "200000", label: "2 lacs" },
	{ value: "225000", label: "2.25 lacs" },
	{ value: "250000", label: "2.5 lacs" },
	{ value: "275000", label: "2.75 lacs" },
	{ value: "300000", label: "3 lacs" },
	{ value: "325000", label: "3.25 lacs" },
	{ value: "350000", label: "3.5 lacs" },
	{ value: "375000", label: "3.75 lacs" },
	{ value: "400000", label: "4 lacs" },
	{ value: "425000", label: "4.25 lacs" },
	{ value: "450000", label: "4.5 lacs" },
	{ value: "475000", label: "4.75 lacs" },
	{ value: "500000", label: "5 lacs" },
	{ value: "550000", label: "5.5 lacs" },
	{ value: "600000", label: "6 lacs" },
	{ value: "650000", label: "6.5 lacs" },
	{ value: "700000", label: "7 lacs" },
	{ value: "750000", label: "7.5 lacs" },
	{ value: "800000", label: "8 lacs" },
	{ value: "850000", label: "8.5 lacs" },
	{ value: "900000", label: "9 lacs" },
	{ value: "950000", label: "9.5 lacs" },
	{ value: "1000000", label: "10 lacs" },
	{ value: "1100000", label: "11 lacs" },
	{ value: "1200000", label: "12 lacs" },
	{ value: "1300000", label: "13 lacs" },
	{ value: "1400000", label: "14 lacs" },
	{ value: "1500000", label: "15 lacs" },
	{ value: "1600000", label: "16 lacs" },
	{ value: "1700000", label: "17 lacs" },
	{ value: "1800000", label: "18 lacs" },
	{ value: "1900000", label: "19 lacs" },
	{ value: "2000000", label: "20 lacs" },
	{ value: "2250000", label: "22.5 lacs" },
	{ value: "2500000", label: "25 lacs" },
	{ value: "2750000", label: "27.5 lacs" },
	{ value: "3000000", label: "30 lacs" },
	{ value: "3250000", label: "32.5 lacs" },
	{ value: "3500000", label: "35 lacs" },
	{ value: "3750000", label: "37.5 lacs" },
	{ value: "4000000", label: "40 lacs" },
	{ value: "4500000", label: "45 lacs" },
	{ value: "5000000", label: "50 lacs" },
	{ value: "5500000", label: "55 lacs" },
	{ value: "6000000", label: "60 lacs" },
	{ value: "6500000", label: "65 lacs" },
	{ value: "7000000", label: "70 lacs" },
	{ value: "7500000", label: "75 lacs" },
	{ value: "8000000", label: "80 lacs" },
	{ value: "8500000", label: "85 lacs" },
	{ value: "9000000", label: "90 lacs" },
	{ value: "9500000", label: "95 lacs" },
	{ value: "10000000", label: "1 cr" }
];

function savejobPost() {

	var isValid = true;
	var selectedValue = "";
	var jobTypeRadios = document.getElementsByName('jobtype');
	for (const radio of jobTypeRadios) {
		if (radio.checked) {
			selectedValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var employmentType = document.getElementsByName('employmentType');
	var employmentTypeValue = "";
	for (const radio of employmentType) {
		if (radio.checked) {
			employmentTypeValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var workModeValue = "";
	var workMode = document.getElementsByName('workMode');
	for (const radio of workMode) {
		if (radio.checked) {
			workModeValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var salaryTypeValue = "";
	var salaryType = document.getElementsByName('salaryType');
	for (const radio of salaryType) {
		if (radio.checked) {
			salaryTypeValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var jobTittle = $('#Jobtitle').val();
	var keySkills = $('#keySkills').val();
	var minExp = $('#workExperienceMin').val();
	var maxExp = $('#workExperienceMax').val();
	var salaryMinfigure = $('#salaryFigureMin').val();
	var salaryMaxfigure = $('#salaryFigureMax').val();
	var jobLocation = $('#jobLocation').val();
	var industry = $('#Industry').val();
	var department = $('#department').val();
	var role = $("#role").val();
	var referenceCode = $('#refercode').val();
	var noOfVacancy = $('#numberVacancies').val();
	var educationQualification = $('#educationalQualification').val();
	var jobDescription = $('#jobDescription').val();
	console.log("jobDescription" + jobDescription);
	var walkInDetails = "";
	var hideSalaryDetails = "";
	/*var isChecked = $('#walkin').is(':checked'); // Returns true if checked, false if not*/
	var isChecked = false;
	var isCheckedHideSalary = $('#hideSalary1').is(':checked');
	var educationQualification = $('#educationalQualification').val();
	var selectedDateRange = $("#WalkStartDate").val();
	var startDate = "";
	var endDate = "";
	var timinig = "";
	var contactPerson = "";
	var mobileNumber = "";
	var venue = "";
	var googleMap = "";

	var companyName = $('#companyName').val();
	var aboutCompany = $('#aboutCompany').val();
	var telephone = $('#Telephone').val();
	var companyAddress = $('#companyAddress').text();
	var emailId = $('#emailId').val();


	if (isChecked) {
		walkInDetails = "1";

		const dates = selectedDateRange.split(" - ");
		startDate = dates[0]; // First part is the start date
		endDate = dates[1];   // Second part is the end date
		timinig = $('#WalkinTiming').val();
		contactPerson = $('#contactPerson').val();
		mobileNumber = $('#contactNumber').val();
		venue = $('#Venue').val();
		googleMap = $('#googleMaps').val()

		if (startDate == "") {
			$('#WalkStartDate_error').text("field is required").css({ "color": "red" });
			$('#WalkStartDate_error').show();
			isValid = false;
		}

		if (endDate == "") {
			$('#WalkStartDate_error').text("field is required").css({ "color": "red" });
			$('#WalkStartDate_error').show();
			isValid = false;
		}

		if (timinig == "") {
			$('#WalkinTiming_error').text("field is required").css({ "color": "red" });
			$('#WalkinTiming_error').show();
			isValid = false;
		}

		if (contactPerson == "") {
			$('#contactPerson_error').text("field is required").css({ "color": "red" });
			$('#contactPerson_error').show();
			isValid = false;
		}

		if (mobileNumber == "") {
			$('#contactNumber_error').text("field is required").css({ "color": "red" });
			$('#contactNumber_error').show();
			isValid = false;
		} else {
			if (mobileNumber.length !== 10) {
				$('#contactNumber_error').text("Enter valid mobile number ").css({ "color": "red" });
				$('#contactNumber_error').show();
				isValid = false;
			}
		}

		if (venue == " ") {
			$('#Venue_error').text("field is required").css({ "color": "red" });
			$('#Venue_error').show();
			isValid = false;
		}

		if (googleMap == "") {
			$('#googleMaps_error').text("field is required").css({ "color": "red" });
			$('#googleMaps_error').show();
			isValid = false;
		}

	} else {
		walkInDetails = "0";
	}
	if (isCheckedHideSalary) {
		hideSalaryDetails = "1";
	} else {
		hideSalaryDetails = "0";
	}




	if (selectedValue == "") {
		$('#jobType_error').text("field is required").css({ "color": "red" });
		$('#jobType_error').show();
		isValid = false;
	}
	if (jobTittle == "") {
		$('#jobTittle_error').text('field is required').css({ "color": "red" });
		$('#jobTittle_error').show();
		isValid = false;
	}
	if (employmentTypeValue == "") {
		$('#employmentType_error').text('field is required').css({ "color": "red" });
		$('#employmentType_error').show();
		isValid = false;
	}
	if (workModeValue == "") {
		$('#workMode_error').text('field is required').css({ "color": "red" });
		$('#workMode_error').show();
		isValid = false;
	}
	if (keySkills == "") {
		$('#keySkills_error').text('field is required').css({ "color": "red" });
		$('#keySkills_error').show();
		isValid = false;
	}
	if (salaryTypeValue == "") {
		$('#salaryType_error').text('field is required').css({ "color": "red" });
		$('#salaryType_error').show();
		isValid = false;
	}
	if (minExp == "") {
		$('#workExperienceMin_error').text('field is required').css({ "color": "red" });
		$('#workExperienceMin_error').show();
		isValid = false;
	}
	if (maxExp == "") {
		$('#workExperienceMax_error').text('field is required').css({ "color": "red" });
		$('#workExperienceMax_error').show();
		isValid = false;
	}
	if (salaryTypeValue == "") {
		$('#jobTittle_error').text('field is required').css({ "color": "red" });
		$('#jobType_error').show();
		isValid = false;
	}

	if (salaryMinfigure == "") {
		$('#minsalary_error').text('field is required').css({ "color": "red" });
		$('#minsalary_error').show();
		isValid = false;
	}

	if (salaryMaxfigure == "") {
		$('#maxsalary_error').text('field is required').css({ "color": "red" });
		$('#maxsalary_error').show();
		isValid = false;
	}

	if (jobLocation == "") {
		$('#location_error').text('field is required').css({ "color": "red" });
		$('#location_error').show();
		isValid = false;
	}

	if (department == "") {
		$('#department_error').text('field is required').css({ "color": "red" });
		$('#department_error').show();
		isValid = false;
	}

	if (role == "") {
		$('#role_error').text('field is required').css({ "color": "red" });
		$('#role_error').show();
		isValid = false;
	}

	if (noOfVacancy == "") {
		$('#noOfVacancy_error').text('field is required').css({ "color": "red" });
		$('#noOfVacancy_error').show();
		isValid = false;
	}

	if (educationQualification == "") {
		$('#jobTittle_error').text('field is required').css({ "color": "red" });
		$('#jobType_error').show();
		isValid = false;
	}

	if (jobDescription == "") {
		$('#jobDescription_error').text('field is required').css({ "color": "red" });
		$('#jobDescription_error').show();
		isValid = false;
	}
	if (industry == "") {
		$('#industry_error').text('field is required').css({ "color": "red" });
		$('#industry_error').show();
		isValid = false;
	}
	if (educationQualification == "") {
		$('#educationalQualification_error').text('field is required').css({ "color": "red" });
		$('#educationalQualification_error').show();
		isValid = false;
	}

	if (companyName == "") {
		$('#companyName_error').text('field is required').css({ "color": "red" });
		$('#companyName_error').show();
		isValid = false;
	}

	if (aboutCompany == " ") {
		$('#aboutCompany_error').text('field is required').css({ "color": "red" });
		$('#aboutCompany_error').show();
		isValid = false;
	}

	if (companyAddress == "") {
		/*$('#aboutCompany_error').text('field is required').css({ "color": "red" });
		$('#aboutCompany_error').show();
		isValid = false;*/
	}

	if (telephone == "") {
		$('#Telephone_error').text('field is required').css({ "color": "red" });
		$('#Telephone_error').show();
		isValid = false;
	} else {
		if (!/^\d{10}$/.test(telephone)) {
			$('#Telephone_error').show().text("Please enter a valid 10-digit number.");
			$('#Telephone_error').show();
			isValid = false;
		}
	}

	if (emailId == "") {
		$('#emailId_error').text('field is required').css({ "color": "red" });
		$('#emailId_error').show();
		isValid = false;
	} else {
		if (!validateEmail(emailId)) {
			$('#emailId_error').text('please enter valid email').css({ "color": "red" });
			$('#emailId_error').show();
			isValid = false;
		}
	}
	var statusjob = $("#jobpoststatus").val();
	if (isValid) {
		$.ajax({
			url: '/saveJobPost',  // Replace with your actual API endpoint
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				companyId: companyId,
				userId: userId,
				jobType: selectedValue,
				jobTittle: jobTittle,
				employmentType: employmentTypeValue,
				workMode: workModeValue,
				keySkills: keySkills,
				minExp: minExp,
				maxExp: maxExp,
				salaryType: salaryTypeValue,
				salaryFigureMin: salaryMinfigure,
				salaryFigureMax: salaryMaxfigure,
				hideSalaryDetails: hideSalaryDetails,
				jobLocation: jobLocation,
				companyIndustry: industry,
				departmentId: department,
				roleName: role,
				reference: referenceCode,
				noOfVacancy: noOfVacancy,
				educationQualification: educationQualification,
				jobDescription: jobDescription,
				walkInDrive: walkInDetails,

				startDate: startDate,
				endDate: endDate,
				time: timinig,
				contactPerson: contactPerson,
				contactNumber: mobileNumber,
				venue: venue,
				googleMapUrl: googleMap,


				companyName: companyName,
				aboutCompany: aboutCompany,
				companyAddress: companyAddress,
				telephoneNumber: telephone,
				emailId: emailId,
				status: statusjob,
			}),
			success: function(response) {
				console.log('Job posted successfully:', response);
				if (response == "success") {
					showToast("success", "Sucessfully Saved");
					setTimeout(function() {
						$(".loader").hide();
						$(".loader").css("display", "block");
						location.reload();
					}, 1000);
					var form = document.createElement('form');

					form.method = 'POST';
					form.action = '/managejobpost';

					// Append the form to the document body
					document.body.appendChild(form);

					// Submit the form
					form.submit();

				} else {
					showToast("info", "please try again");
					setTimeout(function() {
						$(".loader").hide();
						$(".loader").css("display", "block");
						location.reload();
					}, 1000);
				}

				// Add success handling logic here
			},
			error: function(xhr, status, error) {
				console.log('Error:', error);
				showToast("error", "Error Ocuured");
				// Add error handling logic here
			}
		});
	}


}

function updatejobPost(id) {

	var isValid = true;
	var selectedValue = "";
	var jobTypeRadios = document.getElementsByName('jobtype');
	for (const radio of jobTypeRadios) {
		if (radio.checked) {
			selectedValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var employmentType = document.getElementsByName('employmentType');
	var employmentTypeValue = "";
	for (const radio of employmentType) {
		if (radio.checked) {
			employmentTypeValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var workModeValue = "";
	var workMode = document.getElementsByName('workMode');
	for (const radio of workMode) {
		if (radio.checked) {
			workModeValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var salaryTypeValue = "";
	var salaryType = document.getElementsByName('salaryType');
	for (const radio of salaryType) {
		if (radio.checked) {
			salaryTypeValue = radio.value; // Get the value of the checked radio
			break;
		}
	}

	var jobTittle = $('#Jobtitle').val();
	var keySkills = $('#keySkills').val();
	var minExp = $('#workExperienceMin').val();
	var maxExp = $('#workExperienceMax').val();
	var salaryMinfigure = $('#salaryFigureMin').val();
	var salaryMaxfigure = $('#salaryFigureMax').val();
	var jobLocation = $('#jobLocation').val();
	var industry = $('#Industry').val();
	var department = $('#department').val();
	var role = $("#role").val();
	var referenceCode = $('#refercode').val();
	var noOfVacancy = $('#numberVacancies').val();
	var educationQualification = $('#educationalQualification').val();
	var jobDescription = $('#jobDescription').val();
	var walkInDetails = "";
	var hideSalaryDetails = "";
	/*var isChecked = $('#walkin').is(':checked'); // Returns true if checked, false if not*/
	var isChecked = false;
	var isCheckedHideSalary = $('#hideSalary1').is(':checked');
	var educationQualification = $('#educationalQualification').val();
	var selectedDateRange = $("#WalkStartDate").val();
	var startDate = "";
	var endDate = "";
	var timinig = "";
	var contactPerson = "";
	var mobileNumber = "";
	var venue = "";
	var googleMap = "";

	var companyName = $('#companyName').val();
	var aboutCompany = $('#aboutCompany').val();
	var telephone = $('#Telephone').val();
	var companyAddress = $('#companyAddress').text();
	var emailId = $('#emailId').val();


	if (isChecked) {
		walkInDetails = "1";

		const dates = selectedDateRange.split(" - ");
		startDate = dates[0]; // First part is the start date
		endDate = dates[1];   // Second part is the end date
		timinig = $('#WalkinTiming').val();
		contactPerson = $('#contactPerson').val();
		mobileNumber = $('#contactNumber').val();
		venue = $('#Venue').val();
		googleMap = $('#googleMaps').val()

		if (startDate == "") {
			$('#WalkStartDate_error').text("field is required").css({ "color": "red" });
			$('#WalkStartDate_error').show();
			isValid = false;
		}

		if (endDate == "") {
			$('#WalkStartDate_error').text("field is required").css({ "color": "red" });
			$('#WalkStartDate_error').show();
			isValid = false;
		}

		if (timinig == "") {
			$('#WalkinTiming_error').text("field is required").css({ "color": "red" });
			$('#WalkinTiming_error').show();
			isValid = false;
		}

		if (contactPerson == "") {
			$('#contactPerson_error').text("field is required").css({ "color": "red" });
			$('#contactPerson_error').show();
			isValid = false;
		}

		if (mobileNumber == "") {
			$('#contactNumber_error').text("field is required").css({ "color": "red" });
			$('#contactNumber_error').show();
			isValid = false;
		}

		if (venue == " ") {
			$('#Venue_error').text("field is required").css({ "color": "red" });
			$('#Venue_error').show();
			isValid = false;
		}

		if (googleMap == "") {
			$('#googleMaps_error').text("field is required").css({ "color": "red" });
			$('#googleMaps_error').show();
			isValid = false;
		}

	} else {
		walkInDetails = "0";
	}
	if (isCheckedHideSalary) {
		hideSalaryDetails = "1";
	} else {
		hideSalaryDetails = "0";
	}




	if (selectedValue == "") {
		$('#jobType_error').text("field is required").css({ "color": "red" });
		$('#jobType_error').show();
		isValid = false;
	}
	if (jobTittle == "") {
		$('#jobTittle_error').text('field is required').css({ "color": "red" });
		$('#jobTittle_error').show();
		isValid = false;
	}
	if (employmentTypeValue == "") {
		$('#employmentType_error').text('field is required').css({ "color": "red" });
		$('#employmentType_error').show();
		isValid = false;
	}
	if (workModeValue == "") {
		$('#workMode_error').text('field is required').css({ "color": "red" });
		$('#workMode_error').show();
		isValid = false;
	}
	if (keySkills == "") {
		$('#keySkills_error').text('field is required').css({ "color": "red" });
		$('#keySkills_error').show();
		isValid = false;
	}
	if (salaryTypeValue == "") {
		$('#salaryType_error').text('field is required').css({ "color": "red" });
		$('#salaryType_error').show();
		isValid = false;
	}
	if (minExp == "") {
		$('#workExperienceMin_error').text('field is required').css({ "color": "red" });
		$('#workExperienceMin_error').show();
		isValid = false;
	}
	if (maxExp == "") {
		$('#workExperienceMax_error').text('field is required').css({ "color": "red" });
		$('#workExperienceMax_error').show();
		isValid = false;
	}
	if (salaryTypeValue == "") {
		$('#jobTittle_error').text('field is required').css({ "color": "red" });
		$('#jobType_error').show();
		isValid = false;
	}

	if (salaryMinfigure == "") {
		$('#minsalary_error').text('field is required').css({ "color": "red" });
		$('#minsalary_error').show();
		isValid = false;
	}

	if (salaryMaxfigure == "") {
		$('#maxsalary_error').text('field is required').css({ "color": "red" });
		$('#maxsalary_error').show();
		isValid = false;
	}

	if (jobLocation == "") {
		$('#location_error').text('field is required').css({ "color": "red" });
		$('#location_error').show();
		isValid = false;
	}

	if (department == "") {
		$('#department_error').text('field is required').css({ "color": "red" });
		$('#department_error').show();
		isValid = false;
	}

	if (role == "") {
		$('#role_error').text('field is required').css({ "color": "red" });
		$('#role_error').show();
		isValid = false;
	}

	if (noOfVacancy == "") {
		$('#noOfVacancy_error').text('field is required').css({ "color": "red" });
		$('#noOfVacancy_error').show();
		isValid = false;
	}

	if (educationQualification == "") {
		$('#jobTittle_error').text('field is required').css({ "color": "red" });
		$('#jobType_error').show();
		isValid = false;
	}

	if (jobDescription == "") {
		$('#jobDescription_error').text('field is required').css({ "color": "red" });
		$('#jobDescription_error').show();
		isValid = false;
	}
	if (industry == "") {
		$('#industry_error').text('field is required').css({ "color": "red" });
		$('#industry_error').show();
		isValid = false;
	}
	if (educationQualification == "") {
		$('#educationalQualification_error').text('field is required').css({ "color": "red" });
		$('#educationalQualification_error').show();
		isValid = false;
	}

	if (companyName == "") {
		$('#companyName_error').text('field is required').css({ "color": "red" });
		$('#companyName_error').show();
		isValid = false;
	}

	if (aboutCompany == " ") {
		$('#aboutCompany_error').text('field is required').css({ "color": "red" });
		$('#aboutCompany_error').show();
		isValid = false;
	}

	if (companyAddress == "") {
		/*$('#aboutCompany_error').text('field is required').css({ "color": "red" });
		$('#aboutCompany_error').show();
		isValid = false;*/
	}

	if (telephone == "") {
		$('#Telephone_error').text('field is required').css({ "color": "red" });
		$('#Telephone_error').show();
		isValid = false;
	} else {
		if (!/^\d{10}$/.test(telephone)) {
			$('#Telephone_error').show().text("Please enter a valid 10-digit number.");
			$('#Telephone_error').show();
			isValid = false;
		}
	}

	if (emailId == "") {
		$('#emailId_error').text('field is required').css({ "color": "red" });
		$('#emailId_error').show();
		isValid = false;
	}
	var statusjob = $("#jobpoststatus").val();
	if (isValid) {
		$.ajax({
			url: '/updatejobpost',  // Replace with your actual API endpoint
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				id: id,
				companyId: companyId,
				userId: userId,
				jobType: selectedValue,
				jobTittle: jobTittle,
				employmentType: employmentTypeValue,
				workMode: workModeValue,
				keySkills: keySkills,
				minExp: minExp,
				maxExp: maxExp,
				salaryType: salaryTypeValue,
				salaryFigureMin: salaryMinfigure,
				salaryFigureMax: salaryMaxfigure,
				hideSalaryDetails: hideSalaryDetails,
				jobLocation: jobLocation,
				companyIndustry: industry,
				departmentId: department,
				roleName: role,
				reference: referenceCode,
				noOfVacancy: noOfVacancy,
				educationQualification: educationQualification,
				jobDescription: jobDescription,
				walkInDrive: walkInDetails,

				startDate: startDate,
				endDate: endDate,
				time: timinig,
				contactPerson: contactPerson,
				contactNumber: mobileNumber,
				venue: venue,
				googleMapUrl: googleMap,


				companyName: companyName,
				aboutCompany: aboutCompany,
				companyAddress: companyAddress,
				telephoneNumber: telephone,
				emailId: emailId,
				status: statusjob,
			}),
			success: function(response) {
				console.log('Job posted successfully:', response);
				if (response == "success") {
					showToast("success", "updated Sucessfully ");
				} else {
					showToast("info", "please try again");
				}

				// Add success handling logic here
			},
			error: function(xhr, status, error) {
				console.log('Error:', error);
				showToast("error", "Error Ocuured");
				// Add error handling logic here
			}
		});
	}


}


function allChange(id) {
	$('#' + id).hide();
	/*if (id == "keySkills_error") {
		changeSkillFramework();
	}*/
}


$(document).ready(function() {
	// Generate options for 1 to 30 years of experience
	let options = '<option value="" selected>Min</option>'; // Include the placeholder option
	for (let i = 0; i <= 25; i++) {
		options += `<option value="${i}">${i} yr${i > 1 ? 's' : ''}</option>`;
	}

	// Populate the select element
	$('#workExperienceMin').html(options);

	// Initialize Select2
	$('.selet2Single').select2({
		placeholder: "Select Minimum Experience",
		allowClear: true
	});

	$('#workExperienceMax').prop('disabled', true);
	$('#salaryFigureMax').prop('disabled', true);
	$("#fixedshow1").hide();
	$("#fixedIncentiveshow1").hide();
	$("#rangeshow1").show();
	$("#includeWalk").hide();
	var companyName = $('#companyName').val();
	$('#reviewCompanyName').text(companyName)

});

function maxexpchange(id) {
	$('#workExperienceMax').prop('disabled', false);
	$('#' + id).hide();
	var mimExp = $('#workExperienceMin').val();

	let options = '<option value="" selected>Max</option>'; // Include the placeholder option
	for (let i = mimExp; i <= 25; i++) {
		if (i != "") {
			options += `<option value="${i}">${i} yr${i > 1 ? 's' : ''}</option>`;
		}
	}
	// Populate the select element
	$('#workExperienceMax').html(options);

	// Initialize Select2
	$('.selet2Single').select2({
		allowClear: false
	});

	$('#minexp').text(mimExp);
	$('#dash').text("-");
	if (mimExp) {
		$('.jd-preview-main').show();
		$('#maxexp').text("");
	} else {
		$('#maxexp').text("");
		$('#dash').text("");
		jobDetailsValidation();
	}


}
function maxSalary() {
	$('#minsalary_error').hide();
	$('#salaryFigureMax').prop('disabled', false);
	var minsal = parseInt($("#salaryFigureMin").val(), 10);

	var textMinSal = $('#salaryFigureMin option:selected').text();

	//$('#minsal').text(textMinSal);
	if (textMinSal === "Min Salary") {
		$('#minsal').text("");
		$('#dashSal').text("");
	} else {
		$('#minsal').text(textMinSal);
		$('#dashSal').text("-");
	}



	// Create the salary options dropdown dynamically using the salaryOptions array
	let options = '<option value="" selected>Max Salary</option>'; // Placeholder option

	salaryOptions.forEach(option => {
		if (parseInt(option.value, 10) > minsal) {
			options += `<option value="${option.value}">${option.label}</option>`;
		}
	});

	// Populate the select element with the salary options
	$("#salaryFigureMax").html(options);

	// Initialize Select2 for the salary dropdown
	$('.select2Single').select2({
		allowClear: false
	});
	if (textMinSal != "Min Salary") {

		$('#maxsal').text("");
		$('.jd-preview-main').show();
	} else {
		$('#maxsal').text("");
		jobDetailsValidation();
	}
}

$('#jobLocation').on('change', function() {
	$('#location_error').hide(); // Hide the error message
	var selectedOptions = $(this).find('option:selected');
	var idValue = $('#jobLocation').val();
	const newItem = [];
	var textValues = idValue.map(function(item) {
		newItem.push($('#jobLocation option[value="' + item + '"]').text()); // Fetches text for each value
	});
	const result = newItem.join(", ");

	if (selectedOptions.length < 4) {
		// Disable further selections if more than 3 are selected
		if (selectedOptions.length == 3) {
			$(this).find('option:not(:selected)').prop('disabled', true);
		} else {
			$(this).find('option:not(:selected)').prop('disabled', false);
		}

	} else {
		// Enable all options if selections are less than or equal to 3
		$(this).find('option:not(:selected)').prop('disabled', true);
	}
	$('#reviewLocation').text(result);

	if (result) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}


});

function allSalarytypeChange(errorId, id) {
	$('#' + errorId).hide();
	/*if(id == "fixedshow")
	{
		$('#fixedshow1').show();
		$('#rangeshow1').hide();
		$('#fixedIncentiveshow1').hide();
		
	}
	if(id == "rangeshow")
	{
		$('#fixedshow1').hide();
		$('#rangeshow1').show();
		$('#fixedIncentiveshow1').hide();
	}
	if(id == "fixedIncentiveshow")
	{
		$('#fixedshow1').hide();
		$('#rangeshow1').hide();
		$('#fixedIncentiveshow1').show();
	}*/
}
function changeSkillFramework() {
	var ids = $('#keySkills').val();
	var id = "0";
	if (ids.length > 0) {
		id = ids[ids.length - 1];
	} else {
		id = "0";
	}
	if (id.includes("-")) {
		console.log("empty");
	} else {
		$.ajax({
			url: '/fetchSkillsFramework',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				id: id,
				type: "skills"
			}),
			success: function(response) {
				console.log("Success:", response);
				var role = response.data.jobPostingSkillsFramework;
				var optionExists = $('#keySkills option[value="' + id + "-" + role.id + '"]').length > 0;
				role.forEach(function(role) {
					$('#keySkills').append(new Option(role.name, id + "-" + role.id));
				});
				// Perform actions with the response data if needed
			},
			error: function(xhr, status, error) {
				console.error("Error:", error);
				// Handle the error here
			}
		});

	}

}

function allJobChangeTittle() {
	const jobTittle = $('#Jobtitle').val();
	document.getElementById('jobTittleHeading').textContent = jobTittle;
	$('#jobTittle_error').hide();
	if (jobTittle) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function allChangeIndustry() {
	$('#industry_error').hide();
	const readIndustry = $('#Industry option:selected').text();
	$('#revireIndustry').text(readIndustry);
}
function allChangeMaxExp() {
	$('#workExperienceMax_error').hide();
	const maxExp = $('#workExperienceMax').val();
	$('#maxexp').text(maxExp + " " + "Years");
	if (maxExp) {
		$('.jd-preview-main').show();
	} else {
		$('#maxexp').text('');
		jobDetailsValidation();
	}
}
function allMaxSalaryChange() {
	$('#maxsalary_error').hide();
	var sal = $("#salaryFigureMax option:selected").text();
	$("#maxsal").text(sal + " " + "LPA");
}
function allChangeVacancy() {
	$('#noOfVacancy_error').hide();
	var vacancy = $('#numberVacancies').val();
	$('#noOfPostition').text(vacancy + " " + "Position");

	if (vacancy) {
		$('.jd-preview-main').show();
	} else {
		$('#noOfPostition').text(""); // Clear the Position text
		jobDetailsValidation();
	}
}
function allChangeAddSkills(value) {
	var newvalue = [];
	allChange(value);
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

$('input[name="WalkStartDate"]').on('change', function() {
	const selectedDateRange = $(this).val();
	const dates = selectedDateRange.split(" - ");
	const startDate = dates[0];
	const endDate = dates[1];
	$(".walkInterview").text("Walk-in interview:" + " " + startDate + " " + "-" + " " + endDate + ". Job will not be visible to candidates after the end date.")
	// You can perform any action with the selected date range here
	console.log('Selected date range:', selectedDateRange);
	// Example: you can trigger an AJAX call or update another part of the UI
});
function changeWalkIn() {
	var isChecked = $('#walkin').is(':checked');
	if (isChecked) {
		$("#includeWalk").show();

	} else {
		$("#includeWalk").hide();
	}
}
/*function jobdescriptiOnChange()
{
	alert("called");	
}*/
function changeCompanyName() {
	$('#companyName_error').hide();
	var companyName = $('#companyName').val();
	$('#reviewCompanyName').text(companyName);

	if (companyName) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function changeTelephone() {
	$('#Telephone_error').hide();
	var reviewTelephone = $('#Telephone').val();
	$('#reviewMobileNuumber').text(reviewTelephone);

	if (reviewTelephone) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}

}
function changeEmailId() {
	$('#emailId_error').hide();
	var reviewemailId = $('#emailId').val();
	$('#reviewMailId').text(reviewemailId);
	if (reviewemailId) {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function allchangedescription(event) {
	var jobDescription = $(event).html();
	$('#descriptionjobDetails').html(jobDescription);

	if (jobDescription != "<br>") {
		$('.jd-preview-main').show();
	} else {
		jobDetailsValidation();
	}
}
function removeHTMLTags(text) {
	return text.replace(/<[^>]*>/g, '');
}
function fetchedallchangedescription(id) {
	var jobDescription = $("#" + id).html();
	let value = removeHTMLTags(jobDescription);
	$('#descriptionjobDetails').html(value);
}
function changejobrole(id) {
	allChange(id);
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
			$('#role').empty();
			$('#role').append(new Option("Select", ""));
			role.forEach(function(role) {
				$('#role').append(new Option(role.name, role.id));
			});
			// Perform actions with the response data if needed
		},
		error: function(xhr, status, error) {
			console.error("Error:", error);
			// Handle the error here
		}
	});
}

function selectedchangejobrole(id, value) {
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
			$('#role').empty();
			$('#role').append(new Option("Select", ""));

			role.forEach(function(roleItem) {
				var option = new Option(roleItem.name, roleItem.id);
				if (roleItem.id == value) {
					option.selected = true;
				}
				$('#role').append(option);
			});

			// Trigger change event in case you need to handle it elsewhere
			$('#role').trigger('change');
		},
		error: function(xhr, status, error) {
			console.error("Error:", error);
		}
	});
}

function jobDetailsValidation() {
	const jobTittleHeading = $('#jobTittleHeading').text().trim();
	const reviewMobileNuumber = $('#reviewMobileNuumber').text().trim();
	const reviewMailId = $('#reviewMailId').text().trim();
	//const reviewCompanyName = $('#reviewCompanyName').text().trim();
	const descriptionjobDetails = $('#descriptionjobDetails').text().trim();
	const noOfPostition = $('#noOfPostition').text().trim();
	const reviewLocation = $('#reviewLocation').text().trim();
	const minexp = $('#minexp').text().trim();
	const maxexp = $('#maxexp').text().trim();
	const minsal = $('#minsal').text().trim();
	const maxsal = $('#maxsal').text().trim();

	const keySkillsElement = document.querySelector('.keySkillsDetails li');
	const keySkills = keySkillsElement ? keySkillsElement.textContent.trim() : "";

	// Now validate
	if (
		jobTittleHeading === "" &&
		reviewMobileNuumber === "" &&
		reviewMailId === "" &&
		//	reviewCompanyName === "" &&
		descriptionjobDetails === "" &&
		noOfPostition === "" &&
		reviewLocation === "" &&
		keySkills === "" &&
		minexp === "" &&
		maxexp === "" &&
		minsal === "" &&
		maxsal === ""
	) {
		$('.jd-preview-main').hide();
	}
}


/*$('#jobDescription').on('keydown', function(event) {
		// Call your custom function here
		allchangedescription(event);
	});*/