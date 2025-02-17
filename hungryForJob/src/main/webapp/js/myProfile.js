function geteducationDetailsByid(id) {
	$.ajax({
		url: "getEducationDetails",
		method: "POST",
		data: {
			"id": id,
			"candidateId": candidateId
		},
		success: function(response) {
			if (qualificationsType == "12th" || qualificationsType == "10th") {
				$('#editCourseModal').hide();
				$('#specializationModal').hide();
				$('#courseTypeModal').hide();
				$('#courseStartYearModal').hide();
				$('#courseEndYearModal').show();
				$('#yearType').text("Enter Passing Year");
				$('#instituteModal').hide();
				$('#gradingSystemModal').hide();
				$('#newInstituteModal').hide();
				$('#marksLabel').text(qualificationsType);
			} else if (qualificationsType == "Below 10th") {
				$('#editCourseModal').hide();
				$('#specializationModal').hide();
				$('#courseTypeModal').hide();
				$('#courseStartYearModal').hide();
				$('#courseEndYearModal').hide();
				$('#instituteModal').hide();
				$('#gradingSystemModal').hide();
				$('#editGradeModal').hide();
				$('#newInstituteModal').hide();
				/*$('#qualificationTypeModal').hide();*/
			} else {
				/*$('#qualificationTypeModal').hide();*/
				$('#yearType').text('Course End Year');
				$('#newInstituteModal').hide();
			}
			if (response.data.highestQualification !== null) {
				if (Array.isArray(response.data.highestQualification)) {
					var data = response.data.highestQualification
					$('#editQualification').empty();
					$('#editQualification').append(
						$('<option></option>').val("").text("Select"));
					data.forEach(function(course) {
						$('#editQualification').append(
							$('<option></option>').val(course.id).text(course.name));
					});
					if (response.data.qualificationId) {
						$('#editQualification').val(response.data.qualificationId);
					}
				} else {
					console.error("Unexpected response format:", response);
					$('#errorContainer').text("Unexpected response format.");
				}
			}

			if (response.data.course !== null) {
				if (Array.isArray(response.data.course)) {
					var data = response.data.course
					$('#editcourse').empty();
					$('#editcourse').append(
						$('<option></option>').val("").text("Select"));
					data.forEach(function(course) {
						$('#editcourse').append(
							$('<option></option>').val(course.id).text(course.name));
					});
					$('#editcourse').val(response.data.courseId);
				} else {
					console.error("Unexpected response format:", response);
					$('#errorContainer').text("Unexpected response format.");
				}

			}

			if (response.data.specialization !== null) {
				if (Array.isArray(response.data.specialization)) {
					var data = response.data.specialization
					$('#editspecialization').empty();
					$('#editspecialization').append(
						$('<option></option>').val("").text("Select"));
					data.forEach(function(course) {
						$('#editspecialization').append(
							$('<option></option>').val(course.id).text(course.name));
					});
					$('#editspecialization').val(response.data.specializationId);
				} else {
					console.error("Unexpected response format:", response);
					$('#errorContainer').text("Unexpected response format.");
				}

			}

			if (response.data.courseType !== null) {
				if (Array.isArray(response.data.courseType)) {
					var data = response.data.courseType
					$('#editcoursetype').empty();
					$('#editcoursetype').append(
						$('<option></option>').val("").text("Select"));
					data.forEach(function(course) {
						$('#editcoursetype').append(
							$('<option></option>').val(course.id).text(course.name));
					});
					$('#editcoursetype').val(response.data.courseTypeId);
				} else {
					console.error("Unexpected response format:", response);
					$('#errorContainer').text("Unexpected response format.");
				}

			}


			if (response.data.institute !== null) {
				if (Array.isArray(response.data.institute)) {
					var data = response.data.institute
					$('#editInstitute').empty();
					$('#editInstitute').append(
						$('<option></option>').val("").text("Select"));
					$('#editInstitute').append(
						$('<option></option>').val("others").text("Others"));
					data.forEach(function(course) {
						$('#editInstitute').append(
							$('<option></option>').val(course.id).text(course.name));
					});
					$('#editInstitute').val(response.data.instituteId);
				} else {
					console.error("Unexpected response format:", response);
					$('#errorContainer').text("Unexpected response format.");
				}

			}

			if (response.data.gradingSystem !== null) {
				if (Array.isArray(response.data.gradingSystem)) {
					var data = response.data.gradingSystem
					$('#editgradingsystem').empty();
					$('#editgradingsystem').append(
						$('<option></option>').val("").text("Select"));
					data.forEach(function(course) {
						$('#editgradingsystem').append(
							$('<option></option>').val(course.id).text(course.name));
					});
					$('#editgradingsystem').val(response.data.gradingSystemId);
				} else {
					console.error("Unexpected response format:", response);
					$('#errorContainer').text("Unexpected response format.");
				}

			}
			$('#marksLabel').text("Enter Score");
			$('#editgrade').val(marks);
			var currentYear = new Date().getFullYear();
			var startyear = $('#courseStartYear').text();
			$('#CourseStartYear').empty();
			$('#CourseStartYear').append(
				$('<option></option>').val("").text("Select"));
			$('#CourseEndYear').empty();
			$('#CourseEndYear').append(
				$('<option></option>').val("").text("Select"));
			for (var year = 1970; year <= currentYear; year++) {
				$('#CourseStartYear').append(
					$('<option></option>').val(year).text(year));
				$('#CourseEndYear').append(
					$('<option></option>').val(year).text(year));
			}
			$('#CourseStartYear').val(startyear);
			$('#CourseEndYear').val(endyear);

		},
		error: function(xhr, status, error) {
			console.error("An error occurred while fetching course details:", error);
			console.error("Status:", status);
			console.error("Response:", xhr.responseText);
		}
	});
}

$('#editQualification').on('change', function() {
	var qualificationType = $('#editQualification').val();
	$(".editQualification_error").hide();
	getCourseDetails(qualificationType);
	if (qualificationType == 72 || qualificationType == 73) { // Condition based on selected value
		$('#newInstituteModal').hide();
		/*$('#qualificationTypeModal').show();*/
		if (qualificationType == 72) {
			$('#marksLabel').text('12th Percentage');
			$('#courseEndYearModal').show();
			$('#yearType').text("Enter Passing Year");
		} else if (qualificationType == 73) {
			$('#marksLabel').text('10th Percentage');
			$('#courseEndYearModal').show();
			$('#yearType').text("Enter Passing Year");
		} else {
			$('#yearType').text("Course End Year");
		}
		$('#editCourseModal').hide();
		$('#specializationModal').hide();
		$('#courseTypeModal').hide();
		$('#courseStartYearModal').hide();
		$('#instituteModal').hide();
		$('#gradingSystemModal').hide();
		$('#newInstituteModal').hide();
		$("#editgrade").val("").trigger("change");
		$("#editgradingsystem").val("").trigger("change");
		$("#editInstitute").val("").trigger("change");
		$("#CourseEndYear").val("").trigger("change");
		$("#CourseStartYear").val("").trigger("change");
		$("#editcoursetype").val("").trigger("change");
		$("#editspecialization").val("").trigger("change");
		$("#editcourse").val("").trigger("change");

	} else if (qualificationType == 74) {
		$('#newInstituteModal').hide();
		$("#editgradingsystem").val("").trigger("change");
		$("#editInstitute").val("").trigger("change");
		$("#CourseEndYear").val("").trigger("change");
		$("#CourseStartYear").val("").trigger("change");
		$("#editcoursetype").val("").trigger("change");
		$("#editspecialization").val("").trigger("change");
		$("#editcourse").val("").trigger("change");
		$("#editgrade").val("");
		$('#editCourseModal').hide();
		$('#specializationModal').hide();
		$('#courseTypeModal').hide();
		$('#courseStartYearModal').hide();
		$('#courseEndYearModal').hide();
		$('#instituteModal').hide();
		$('#gradingSystemModal').hide();
		$('#editGradeModal').hide();
		$('#newInstituteModal').hide();

		/*$('#qualificationTypeModal').hide();*/

	} else {
		$('#editCourseModal').show();
		$('#specializationModal').show();
		$('#courseTypeModal').show();
		$('#courseStartYearModal').show();
		$('#courseEndYearModal').show();
		$('#instituteModal').show();
		$('#gradingSystemModal').show();
		$('#editGradeModal').show();
		$('#yearType').text("Course End Year");
		$('#marksLabel').text('Enter the Score');
		$("#editgrade").val("").trigger("change");
		$("#editgradingsystem").val("").trigger("change");
		$("#editInstitute").val("").trigger("change");
		$("#CourseEndYear").val("").trigger("change");
		$("#CourseStartYear").val("").trigger("change");
		$("#editcoursetype").val("").trigger("change");
		$("#editspecialization").val("").trigger("change");
		$("#editcourse").val("").trigger("change");
		$('#newInstituteModal').hide();
		/*	$('#qualificationTypeModal').hide();*/
	}

});
$('#editcourse').on('change', function() {
	$(".editcourse_error").hide();
	getSpecialization($(this).val());
});
$('#editspecialization').on('change', function() {
	$(".editspecialization_error").hide();
});
$('#editcoursetype').on('change', function() {
	$(".editcoursetype_error").hide();
});
$('#CourseStartYear').on('change', function() {
	$(".CourseStartYear_error").hide();
});
$('#CourseEndYear').on('change', function() {
	$(".CourseEndYear_error").hide();
});
$('#editInstitute').on('change', function() {
	var insititute = $("#editInstitute").val();
	$(".editInstitute_error").hide();
	if (insititute === "others") {
		$('#newInstituteModal').show();
	} else {
		$('#newInstituteModal').hide();
	}
});
$('#editgradingsystem').on('change', function() {
	$(".editgradingsystem_error").hide();
});
function getCourseDetails(id) {
	$.ajax({
		url: "getCourseDetails",
		method: "POST",
		data: {
			"id": id,
			"flag": 1
		},
		success: function(response) {
			if (response.errors.errorCode == "0000") {
				if (response.data.course !== null) {
					if (Array.isArray(response.data.course)) {
						var data = response.data.course
						$('#editcourse').empty();
						$('#editcourse').append(
							$('<option></option>').val("").text("Select"));
						data.forEach(function(course) {
							if ($('#editcourse option[value="' + course.id + '"]').length === 0) {
								$('#editcourse').append(
									$('<option></option>').val(course.id).text(course.name));
							}
						});
					} else {
						console.error("Unexpected response format:", response);
						$('#errorContainer').text("Unexpected response format.");
					}
				} else {
					$('#editcourse').empty();
					$('#editcourse').append(
						$('<option></option>').val("").text("Select"));
					$('#editcourse').val("");
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
	});
}
function getSpecialization(id) {
	$.ajax({
		url: "getCourseDetails",
		method: "POST",
		data: {
			"id": id,
			"flag": 2
		},
		success: function(response) {
			if (response.errors.errorCode == "0000") {
				if (response.data.specialization !== null) {
					if (Array.isArray(response.data.specialization)) {
						var data = response.data.specialization
						$('#editspecialization').empty();
						$('#editspecialization').append(
							$('<option></option>').val("").text("Select"));
						data.forEach(function(course) {
							$('#editspecialization').append(
								$('<option></option>').val(course.id).text(course.name)
							);
						});
					} else {
						console.error("Unexpected response format:", response);
						$('#errorContainer').text("Unexpected response format.");
					}
				} else {
					$('#editspecialization').empty();
					$('#editspecialization').append(
						$('<option></option>').val("").text("Select"));
					$('#editspecialization').val("");
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
$('#editgradingsystem').on('change', function() {
	$("#editgrade").val(" ");
	if ($(this).val() == 81 || $(this).val() == 82) {
		$('#editGradeModal').hide();
	} else {
		$('#editGradeModal').show();
	}
});


function updateEducationDetails() {
	var highestQualification = $("#editQualification").val();
	var course = $("#editcourse").val();
	var specialization = $("#editspecialization").val();
	var courseType = $("#editcoursetype").val();
	var courseStartYear = $("#CourseStartYear").val();
	var courseEndYear = $("#CourseEndYear").val();
	var institute = $("#editInstitute").val();
	var gradingSystem = $("#editgradingsystem").val();
	var grade = $("#editgrade").val();
	var marks = $("#qualificationtype").val();
	var newInstitute = $("#newInstitute").val();
	var isValid = true;
	var EducationDetails = null;
	if (highestQualification == "") {
		$(".editQualification_error").text("This field is required").css("color", "red");
		$(".editQualification_error").show();
		isValid = false;
		if (course == "") {
			$(".editcourse_error").text("This field is required").css("color", "red");
			$(".editcourse_error").show();
			isValid = false;
		}
		if (specialization == "") {
			$(".editspecialization_error").text("This field is required").css("color", "red");
			$(".editspecialization_error").show();
			isValid = false;
		}
		if (courseType == "") {
			$(".editcoursetype_error").text("This field is required").css("color", "red");
			$(".editcoursetype_error").show();
			isValid = false;
		}
		if (courseStartYear == "") {
			$(".CourseStartYear_error").text("This field is required").css("color", "red");
			$(".CourseStartYear_error").show();
			isValid = false;
		}
		if (courseEndYear == "") {
			$(".CourseEndYear_error").text("This field is required").css("color", "red");
			$(".CourseEndYear_error").show();
			isValid = false;
		}
		if (parseInt(courseStartYear) > parseInt(courseEndYear)) {
			$(".CourseEndYear_error").text("Invalid Value").css("color", "red");
			$(".CourseEndYear_error").show();
			isValid = false;
		}
		if (institute == "") {
			$(".editInstitute_error").text("This field is required").css("color", "red");
			$(".editInstitute_error").show();
			isValid = false;
		}
		if (gradingSystem == "") {
			$(".editgradingsystem_error").text("This field is required").css("color", "red");
			$(".editgradingsystem_error").show();
			isValid = false;
		}
		if (grade == "") {
			$(".editgrade_error").text("This field is required").css("color", "red");
			$(".editgrade_error").show();
			isValid = false;
		}

	}
	if (highestQualification == 72 || highestQualification == 73) {
		if (marks == "") {
			$(".qualificationtype_error").text("This field is required").css("color", "red");
			$(".qualificationtype_error").show();
			isValid = false;
		}
		if (courseEndYear == "") {
			$(".CourseEndYear_error").text("This field is required").css("color", "red");
			$(".CourseEndYear_error").show();
			isValid = false;
		}
	} else if (highestQualification == 74) {
		isValid = true;
	} else {
		if (course == "") {
			$(".editcourse_error").text("This field is required").css("color", "red");
			$(".editcourse_error").show();
			isValid = false;
		}
		if (specialization == "") {
			$(".editspecialization_error").text("This field is required").css("color", "red");
			$(".editspecialization_error").show();
			isValid = false;
		}
		if (courseType == "") {
			$(".editcoursetype_error").text("This field is required").css("color", "red");
			$(".editcoursetype_error").show();
			isValid = false;
		}
		if (courseStartYear == "") {
			$(".CourseStartYear_error").text("This field is required").css("color", "red");
			$(".CourseStartYear_error").show();
			isValid = false;
		}
		if (courseEndYear == "") {
			$(".CourseEndYear_error").text("This field is required").css("color", "red");
			$(".CourseEndYear_error").show();
			isValid = false;
		}
		if (parseInt(courseStartYear) > parseInt(courseEndYear)) {
			$(".CourseEndYear_error").text("Invalid Value").css("color", "red");
			$(".CourseEndYear_error").show();
			isValid = false;
		}
		if (institute == "") {
			$(".editInstitute_error").text("This field is required").css("color", "red");
			$(".editInstitute_error").show();
			isValid = false;
		}
		if (institute == "others") {
			if (newInstitute == "") {
				$(".newInstitute_error").text("This field is required").css("color", "red");
				$(".newInstitute_error").show();
				isValid = false;
			}
		}
		if (gradingSystem == "") {
			$(".editgradingsystem_error").text("This field is required").css("color", "red");
			$(".editgradingsystem_error").show();
			isValid = false;
		}
		if (grade == "") {
			$(".editgrade_error").text("This field is required").css("color", "red");
			$(".editgrade_error").show();
			isValid = false;
		}
	}
	if (highestQualification == 72) {
		EducationDetails = {
			"highestQualification": highestQualification,
			"score": grade,
			"courseEndYear": courseEndYear
		}

	} else if (highestQualification == 74) {
		EducationDetails = {
			"highestQualification": highestQualification,
		}
	} else if (highestQualification == 73) {
		EducationDetails = {
			"highestQualification": highestQualification,
			"score": grade,
			"courseEndYear": courseEndYear
		}

	} else {
		EducationDetails = {
			"highestQualification": highestQualification,
			"course": course,
			"specialization": specialization,
			"courseType": courseType,
			"courseStartYear": courseStartYear,
			"courseEndYear": courseEndYear,
			"institute": institute,
			"gradingSystem": gradingSystem,
			"score": grade,
			"newUniversity": newInstitute
		}
	}
	if (isValid) {
		$.ajax({
			url: "updateCandidateDetails",
			method: "POST",
			data: {
				"educationDetails": EducationDetails,
				"type": "education"
			},
			success: function(response) {
				if (response.errorCode == "0000") {
					showToast("success","Updated Sucessfully");
					location.reload();
				} else {
					showToast("info","please try again");
				}
			},
			error: function(response) {
				console.log("error reponse", response);
				showToast("error","Error Ocuured");
			}
		})
	}

}
$('#editgrade').on('keyup', function() {
	$(".editgrade_error").hide();
	const questionStatus = $("#editgradingsystem").val();
	const qualification = $("#editQualification").val();
	const value = $("#editgrade").val();
	const value1 = parseInt(value)
	var editGrade = document.getElementById('editgrade');
	if (questionStatus == 78) {

		if (value1 > 0 && value1 <= 10) {
			editGrade.value = value1;
		} else if (value1 == NaN) {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 10").css("color", "red");
			$(".editgrade_error").show();
		} else {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 10").css("color", "red");
			$(".editgrade_error").show();
		}
	} else if (questionStatus == 79) {
		if (value1 > 0 && value <= 4) {
			editGrade.value = value1;
		} else if (value1 == NaN) {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 4").css("color", "red");
			$(".editgrade_error").show();
		} else {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 4").css("color", "red");
			$(".editgrade_error").show();
		}
	} else if (questionStatus == 80) {
		if (value1 >= 1 && value1 <= 100) {
			editGrade.value = value1;
		} else if (value1 == NaN) {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 100").css("color", "red");
			$(".editgrade_error").show();
		} else {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 100").css("color", "red");
			$(".editgrade_error").show();
		}
	} else if (qualification == 72) {
		if (value1 >= 1 && value1 <= 100) {
			editGrade.value = value1;
		} else if (value1 == NaN) {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 100").css("color", "red");
			$(".editgrade_error").show();
		} else {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 100").css("color", "red");
			$(".editgrade_error").show();
		}
	} else if (qualification == 73) {
		if (value1 >= 1 && value1 <= 100) {
			editGrade.value = value1;
		} else if (value1 == NaN) {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 100").css("color", "red");
			$(".editgrade_error").show();
		} else {
			editGrade.value = "";
			$(".editgrade_error").text("please enter between 1 to 100").css("color", "red");
			$(".editgrade_error").show();
		}
	}
});
$('#newInstitute').on('keyup', function() {
	$(".newInstitute_error").hide();
});
function getPersonalDetails() {
	var name = $('#peronalNames').text();
	var email = $('#personalEmailInputs').text();
	let cleanedEmail = email.replace(/\s+/g, '');
	var mobileno = $('#personalMobileNos').text();
	var workStatus = $('#personalWorkStatus').text();
	fetchCities(pincode);
	$('#editpincode').val(pincode);

	$('#Name').val(name);
	document.getElementById('emailAddress').value = cleanedEmail;
	$('#mobileNo').val(mobileno);
	if ($('#experienced').val() === workStatus) {
		$('#experienced').prop('checked', true);
		$('#experienced').prop('disabled', true);
		$('#fresher').prop('disabled', true);
	} else {
		$('#experienced').prop('disabled', false);
		$('#fresher').prop('disabled', false);
		$('#fresher').prop('checked', true);
	}
}
function updatePersonalDetails() {
	var name = $('#Name').val();
	var mobileno = $('#mobileNo').val();
	var workStatusElements = document.getElementsByName("work_status");
	var workStatus = null;
	for (var i = 0; i < workStatusElements.length; i++) {
		if (workStatusElements[i].checked) {
			workStatus = workStatusElements[i].value;
			break; // Exit the loop once the checked value is found
		}
	}
	var pincode =  $('#editpincode').val();
	var state = $('#editstate').val();
	var currentlocation = $('#current_location').val();
	
	var isvalid = true;
	if (name == "") {
		isvalid = false
		$(".name_error").text("Please Enter the Field").css("color", "red");
		$(".name_error").show();
	}
	if (mobileno == "") {
		isvalid = false
		$(".mobileno_error").text("Please Enter the Field").css("color", "red");
		$(".mobileno_error").show();
	}
	if (workStatus == "" || workStatus == null) {
		isvalid = false
		$(".workStatus_error").text("Please Enter the Field").css("color", "red");
		$(".workStatus_error").show();
	}
	if(pincode == "")
	{
		isvalid=false
		$(".editpincode_error").text("Please Enter the fiels").css("color","red");
		$(".editpincode_error").show();
	}
	if(state == "")
	{
		isvalid=false
		$('.editstate_error').text("Please Enter the fiels").css("color","red");
		$(".editstate_error").show();
	}
	if(currentlocation == "")
	{
		isvalid=false
		$('.editcurrentlocation_error').text("Please Enter the fiels").css("color","red");
		$(".editstate_error").show();
	}
	var personalDetails = {
		"name": name,
		"mobileno": mobileno,
		"workStatus": workStatus,
		"pincode":pincode,
		"state":state,
		"currentlocation":currentlocation
	}
	if (isvalid) {
		$.ajax({
			url: "updateCandidateDetails",
			method: "POST",
			data: {
				"educationDetails": personalDetails,
				"type": "personalDetails"
			},
			success: function(response) {
				if (response.errorCode == "0000") {
					showToast("info","Updated Sucessfully");
					location.reload();
				} else {
					console.log("error in repsonse");
					showToast("info","please try again");

				}
			},
			error: function(response) {
				console.log("error reponse", response);
				showToast("error","error occurred");
			}
		})
	}

}
$('#Name').on('keyup', function() {
	$(".name_error").hide();
});
document.getElementById('mobileNo').addEventListener('keydown', function(event) {
	const mobileInput = this.value;
	const isDigit = (event.key >= '0' && event.key <= '9');
	const isControlKey = ['Backspace', 'ArrowLeft', 'ArrowRight', 'Tab'].includes(event.key);

	if (!isDigit && !isControlKey) {
		event.preventDefault();
		$(".mobileno_error").text("Please Enter the Number").css("color", "red");
		$(".mobileno_error").show();
		$(".mobileno_error").fadeOut(2000);
	} else if (mobileInput.length >= 10 && isDigit) {
		event.preventDefault();
		$(".mobileno_error").text("Mobile number can only contain up to 10 digits").css("color", "red");
		$(".mobileno_error").show();
		$(".mobileno_error").fadeOut(2000);
	} else {
		$(".mobileno_error").hide();
	}
});
function addEmployeement() {
	var companyName = $('#companyName').val();
	var jobTittle = $('#jobTitle').val();
	var startYear = $('#startYear').val();
	var startMonth = $('#startMonth').val();
	var endYear = $('#endYear').val();
	var endMonth = $('#endMonth').val();
	var isChecked = $('#currentlywork').prop('checked');
	var isValid = true;
	var monthMap = {
		"January": 1,
		"February": 2,
		"March": 3,
		"April": 4,
		"May": 5,
		"June": 6,
		"July": 7,
		"August": 8,
		"September": 9,
		"October": 10,
		"November": 11,
		"December": 12
	};
	if (companyName == "") {
		$('.companyName_error').text("Please Enter the field").css("color", "red");
		$('.companyName_error').show();
		isValid = false;
	}
	if (jobTittle == "") {
		$('.jobTitle_error').text("Please Enter the field").css("color", "red");
		$('.jobTitle_error').show();
		isValid = false;
	}
	if (startYear == "" || startYear == null) {
		$('.startYear_error').text("Please Enter the field").css("color", "red");
		$('.startYear_error').show();
		isValid = false;
	}
	if (startMonth == "" || startMonth == null) {
		$('.startMonth_error').text("Please Enter the field").css("color", "red");
		$('.startMonth_error').show();
		isValid = false;
	}
	if(!isChecked)
	{
		if (endYear == "" || endYear == null) {
			$('.endYear_error').text("Please Enter the field").css("color", "red");
			$('.endYear_error').show();
			isValid = false;
		}
		if (endMonth == "" || endMonth == null) {
			$('.endMonth_error').text("Please Enter the field").css("color", "red");
			$('.endMonth_error').show();
			isValid = false;
		}
	}else
	{
		endMonth="";
		endMonth="";
	}
	
	if (parseInt(startYear) == parseInt(endYear)) {
		if (monthMap[startMonth] > monthMap[endMonth]) {
			$('.endMonth_error').text("Please Enter the Valid field").css("color", "red");
			$('.endMonth_error').show();
			isValid = false;
		}
	}
	$('#companyName').on('keyup', function() {
		$('.companyName_error').hide();
	});
	$('#jobTitle').on('keyup', function() {
		$('.jobTitle_error').hide();
	});
	$('#startYear').on('change', function() {
		$('.startYear_error').hide();
	});
	$('#startMonth').on('change', function() {
		$('.startMonth_error').hide();
	});
	$('#endYear').on('change', function() {
		$('.endYear_error').hide();
	});
	$('#endMonth').on('change', function() {
		$('.endMonth_error').hide();
	});
	var employeementDetails = [{
		"companyName": companyName,
		"jobTittle": jobTittle,
		"startYear": startYear,
		"lastYear": endYear,
		"startMonth": startMonth,
		"lastMonth": endMonth,
		"currentlyWorking":isChecked
	}];
	if (isValid) {
		$.ajax({
			url: "updateCandidateDetails",
			method: "POST",
			data: {
				"jobExperience": employeementDetails,
				"type": "jobExperience"
			},
			success: function(response) {
				if (response.errorCode == "0000") {
					showToast("success","Updated Sucessfully");
					location.reload();
				} else {
					console.log("error in repsonse");
					showToast("info","please try again");
				}
			},
			error: function(response) {
				console.log("error reponse", response);
				showToast("error","Error occured");
			}
		});
	}
}

function getTechnologyDetails() {
	$.ajax({
		url: "getTechnologyDetails",
		method: "POST",
		success: function(response) {
			if (Array.isArray(response.data.skills)) {
				var data = response.data.skills
				$('#addskills').empty();
				$('#addskills').append(
					$('<option></option>').val("").text("Select"));
				data.forEach(function(course) {
					$('#addskills').append(
						$('<option></option>').val(course.id).text(course.name));
				});
				$('#addskills').val("");
			} else {
				console.error("Unexpected response format:", response);
				$('#errorContainer').text("Unexpected response format.");
			}
			let splitArray = exp.split(".");
			var years = parseInt(splitArray[0]);
			console.log(splitArray);
			for (var year = 0; year <= years; year++) {
				$('#addexperienceYears').append(
					$('<option></option>').val(year).text(year));
			}
		},
		error: function(response) {
			console.log("error reponse", response);
		}
	});
}
$('#addexperienceYears').on('change', function() {
	$('.addexperienceYears_error').hide();
	var value = parseInt($('#addexperienceYears').val());
	let splitArray = exp.split(".");
	var years = parseInt(splitArray[0]);
	var months = parseInt(splitArray[1]);
	$('#addexperienceMonth').empty();
	if (value == years) {
		for (var year = 0; year <= months; year++) {
			$('#addexperienceMonth').append(
				$('<option></option>').val(year).text(year));
		}
	} else {
		for (var year = 0; year <= 11; year++) {
			$('#addexperienceMonth').append(
				$('<option></option>').val(year).text(year));
		}
	}

});
$('#addexperienceMonth').on('change', function() {
	$('.addexperienceMonth_error').hide();
});
$('#addskills').on('change', function() {
	$('.addskills_error').hide();
});
function addSkills() {
	var techid = parseInt($('#addskills').val());
	var techName = $('#addskills option:selected').text();
	var years = $('#addexperienceYears').val();
	var months = $('#addexperienceMonth').val();
	var isValid = true;
	if (techid == "" || techid == null) {
		$('.addskills_error').text("Please Enter the field").css("color", "red");
		$('.addskills_error').show();
		isValid = false;
	} else {
		if (ids.includes(techName)) {
			$('.addskills_error').text("It is already Existed").css("color", "red");
			$('.addskills_error').show();
			isValid = false;
		}
	}
	if (years == "" || years == null) {
		$('.addexperienceYears_error').text("Please Enter the field").css("color", "red");
		$('.addexperienceYears_error').show();
		isValid = false;
	}
	if (months == "" || months == null) {
		$('.addexperienceMonth_error').text("Please Enter the field").css("color", "red");
		$('.addexperienceMonth_error').show();
		isValid = false;
	}
	var skills = [{
		"techid": techid,
		"years": years,
		"months": months
	}];
	if (isValid) {
		$.ajax({
			url: "updateCandidateDetails",
			method: "POST",
			data: {
				"keySkills": skills,
				"Type": "addSkills"
			}, success: function(response) {
				if (response.errorCode == "0000") {
					showToast("success","Updated Sucessfully");
					location.reload();
				} else {
					showToast("info","please try again");
					console.log("error in repsonse");
				}
			},
			error: function(response) {
				console.log("error reponse", response);
				showToast("error","Error ocurred");
			}
		})
	}
}
function editSkillsDetails(id, experience, name) {
	var ids = null;;
	$.ajax({
		url: "getTechnologyDetails",
		method: "POST",
		success: function(response) {
			if (Array.isArray(response.data.skills)) {
				var data = response.data.skills
				$('#editSkills').empty();
				$('#editSkills').append(
					$('<option></option>').val("").text("Select"));
				data.forEach(function(course) {
					if (name === course.name) {
						ids = course.id;
					}
					$('#editSkills').append(
						$('<option></option>').val(course.id).text(course.name));
				});
				$('#editSkills').val(ids);
			} else {
				console.error("Unexpected response format:", response);
				$('#errorContainer').text("Unexpected response format.");
			}
			let splitArray = experience.split(".");
			let realTotalexp = exp.split(".");
			var realYears = parseInt(realTotalexp[0]);
			var realMonths = parseInt(realTotalexp[1]);
			var years = parseInt(splitArray[0]);
			var months = parseInt(splitArray[1]);
			$('#editexperienceYears').empty();
			$('#editexperienceMonths').empty();
			if (realYears == years) {
				for (var year = 0; year <= realYears; year++) {
					$('#editexperienceYears').append(
						$('<option></option>').val(year).text(year));
				}
				for (var year = 0; year <= realMonths; year++) {
					$('#editexperienceMonths').append(
						$('<option></option>').val(year).text(year));
				}
			} else {
				for (var year = 0; year <= 40; year++) {
					$('#editexperienceYears').append(
						$('<option></option>').val(year).text(year));
				}
				for (var year = 0; year <= 11; year++) {
					$('#editexperienceMonths').append(
						$('<option></option>').val(year).text(year));
				}
			}
			$('#editexperienceYears').val(years);
			$('#editexperienceMonths').val(months);
		},
		error: function(response) {
			console.log("error reponse", response);
		}
	});
	$('#editskillsbutton').attr('onclick', 'updateSkills(' + id + ', \'' + name + '\')');

}
$('#editSkills').on('change', function() {
	$('.editSkills_error').hide();
});
$('#editexperienceMonths').on('change', function() {
	$('.editexperienceMonths_error').hide();
});
$('#editexperienceYears').on('change', function() {
	$('.editexperienceYears_error').hide();
	var value = parseInt($('#editexperienceYears').val());
	let realTotalexp = exp.split(".");
	var realYears = parseInt(realTotalexp[0]);
	var realMonths = parseInt(realTotalexp[1]);
	$('#editexperienceMonths').empty();
	if (value == realYears) {
		for (var year = 0; year <= realMonths; year++) {
			$('#editexperienceMonths').append(
				$('<option></option>').val(year).text(year));
		}
	} else {
		for (var year = 0; year <= 11; year++) {
			$('#editexperienceMonths').append(
				$('<option></option>').val(year).text(year));
		}
	}
});
function updateSkills(id, name) {
	var techId = $('#editSkills').val();
	var techName = $('#editSkills option:selected').text();
	var years = $('#editexperienceYears').val();
	var months = $('#editexperienceMonths').val();
	var isValid = true;

	if (techId == "" || techId == null) {
		$('.editSkills_error').text("Please Enter the field").css("color", "red");
		$('.editSkills_error').show();
		isValid = false;
	} else {
		if (name !== techName) {
			if (ids.includes(techName)) {
				$('.editSkills_error').text("It is already Existed").css("color", "red");
				$('.editSkills_error').show();
				isValid = false;
			}
		}
	}
	if (years == "" || years == null) {
		$('.editexperienceYears_error').text("Please Enter the field").css("color", "red");
		$('.editexperienceYears_error').show();
		isValid = false;
	} else {
		if (years == 0 && months == 0) {
			$('.editexperienceYears_error').text("Please Enter the field").css("color", "red");
			$('.editexperienceYears_error').show();
			isValid = false;
		}

	}
	if (months == "" || months == null) {
		$('.editexperienceMonths_error').text("Please Enter the field").css("color", "red");
		$('.editexperienceMonths_error').show();
		isValid = false;
	} else {
		if (months == 0 && years == 0) {
			$('.editexperienceMonths_error').text("Please Enter the field").css("color", "red");
			$('.editexperienceMonths_error').show();
			isValid = false;
		}
	}
	var skills = [{
		"id": id,
		"techId": techId,
		"years": years,
		"months": months
	}];
	if (isValid) {
		$.ajax({
			url: "updateCandidateDetails",
			method: "POST",
			data: {
				"keySkills": skills,
				"Type": "UpdateSkills"
			}, success: function(response) {
				if (response.errorCode == "0000") {
					
					showToast("success","Updated Sucessfully");
					location.reload();
				} else {
					console.log("error in repsonse");
					showToast("info","please try again");
					
				}
			},
			error: function(response) {
				console.log("error reponse", response);
				showToast("error","error occured");
			}
		})
	}

}
function getEditemploymentdetails(id, companyName, jobTittle, startYear, startMonth, endYear, endMonth) {
	var currentYear = new Date().getFullYear();
	editcompanyName(companyName);
	$('#editjobTitle').val(jobTittle);
	$('#editstartYear').empty();
	$('#editendYear').empty();
	$('#editstartMonth').empty();
	$('#editendMonth').empty();
	$('#editstartYear').append(
		$('<option></option>').val("").text("Select"));
	$('#editendYear').append(
		$('<option></option>').val("").text("Select"));
	for (var year = Totalyearsession; year <= currentYear; year++) {
		$('#editstartYear').append(
			$('<option></option>').val(year).text(year));
	}
	for (var year = startYear; year <= currentYear; year++) {
		$('#editendYear').append(
			$('<option></option>').val(year).text(year));
	}
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	months.forEach(function(month) {
		$('#editstartMonth').append('<option value="' + month + '">' + month + '</option>');
		$('#editendMonth').append('<option value="' + month + '">' + month + '</option>');
	});
	$('#editstartYear').val(startYear);
	$('#editstartMonth').val(startMonth);
	$('#editendYear').val(endYear);
	$('#editendMonth').val(endMonth);
	$('#editemploymentsbutton').attr('onclick', 'updateEmploymentDetails(' + id + ')');
}
function getEditemploymentdetailsPresent(id, companyName, jobTittle, startYear, startMonth) {
	var currentYear = new Date().getFullYear();
	editcompanyName(companyName);
	$('#editjobTitle').val(jobTittle);
	$('#editstartYear').empty();
	$('#editendYear').empty();
	$('#editstartMonth').empty();
	$('#editendMonth').empty();
	$('#editstartYear').append(
		$('<option></option>').val("").text("Select"));
	$('#editendYear').append(
		$('<option></option>').val("").text("Select"));
	$('#editendMonth').append(
		$('<option></option>').val("").text("Select"));
	$('#editstartMonth').append(
		$('<option></option>').val("").text("Select"));
	for (var year = Totalyearsession; year <= currentYear; year++) {
		$('#editstartYear').append(
			$('<option></option>').val(year).text(year));
	}
	for (var year = startYear; year <= currentYear; year++) {
		$('#editendYear').append(
			$('<option></option>').val(year).text(year));
	}
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	months.forEach(function(month) {
		$('#editstartMonth').append('<option value="' + month + '">' + month + '</option>');
		$('#editendMonth').append('<option value="' + month + '">' + month + '</option>');
	});
	$('#editstartYear').val(startYear);
	$('#editstartMonth').val(startMonth);
	$('#currentlyworkhide').prop('checked', true);
	/*$('#editendYear').val(endYear);
	$('#editendMonth').val(endMonth);*/
	$('#employmentdetailshide').hide();
	$('#editemploymentsbutton').attr('onclick', 'updateEmploymentDetails(' + id + ')');
}
function addEndyearEndMonth()
{
	var isChecked = $('#currentlyworkhide').prop('checked');
	if (isChecked) {
    	$('#employmentdetailshide').hide();
	} else {
    	$('#employmentdetailshide').show();
	}
}
function updateEmploymentDetails(id) {
	var companyName = $('#editcompanyName').val();
	var jobTittle = $('#editjobTitle').val();
	var startYear = $('#editstartYear').val();
	var startMonth = $('#editstartMonth').val();
	var endYear = $('#editendYear').val();
	var endMonth = $('#editendMonth').val();
	var isChecked = $('#currentlyworkhide').prop('checked');
	var monthMap = {
		"January": 1,
		"February": 2,
		"March": 3,
		"April": 4,
		"May": 5,
		"June": 6,
		"July": 7,
		"August": 8,
		"September": 9,
		"October": 10,
		"November": 11,
		"December": 12
	};
	var isValid = true;

	if (companyName == "" || companyName == null) {
		$('.editcompanyName_error').text("Please Enter the field").css("color", "red");
		$('.editcompanyName_error').show();
		isValid = false
	}
	if (jobTittle == "" || jobTittle == null) {
		$('.editjobTitle_error').text("Please Enter the field").css("color", "red");
		$('.editjobTitle_error').show();
		isValid = false
	}
	if (startYear == "" || startYear == null) {
		$('.editstartYear_error').text("Please Enter the field").css("color", "red");
		$('.editstartYear_error').show();
		isValid = false
	}
	if (startMonth == "" || startMonth == null) {
		$('.editstartMonth_error').text("Please Enter the field").css("color", "red");
		$('.editstartMonth_error').show();
		isValid = false
	}
	if(!isChecked)
	{
		if (endYear == "" || endYear == null) {
			$('.editendYear_error').text("Please Enter the field").css("color", "red");
			$('.editendYear_error').show();
			isValid = false
		}
		if (endMonth == "" || endMonth == null) {
			$('.editendMonth_error').text("Please Enter the field").css("color", "red");
			$('.editendMonth_error').show();
			isValid = false
		}
	}else
	{
		endMonth="";
		endYear="";
	}
	
	if (startYear !== "" && endYear !== "") {
		if (startYear == endYear) {
			if (monthMap[startMonth] > monthMap[endMonth]) {
				$('.editendMonth_error').text("Please Enter the valid field").css("color", "red");
				$('.editendMonth_error').show();
				isValid = false
			}
		}

	}
	var details = [
		{
			"companyName": companyName,
			"jobTitle": jobTittle,
			"startYear": startYear,
			"startMonth": startMonth,
			"endYear": endYear,
			"endMonth": endMonth,
			"id": id,
			"workingstatus":isChecked
		}
	]
	if (isValid) {
		$.ajax({
			url: "updateCandidateDetails",
			method: "POST",
			data: {
				"jobExperience": details,
				"Type": "updateEmploymentDetails"
			}, success: function(response) {
				if (response.errorCode == "0000") {
					showToast("success","Updated Sucessfully");
					location.reload();
				} else {
					showToast("info","please try again");
					console.log("error in repsonse");
				}
			},
			error: function(response) {
				console.log("error reponse", response);
				showToast("error","Error occured");
			}

		})
	}
}
$('#editcompanyName').on('keydown', function() {
	$('.editcompanyName_error').hide();
});
$('#editjobTitle').on('keydown', function() {
	$('.editjobTitle_error').hide();
});
$('#editstartYear').on('change', function() {
	$('.startYear_error').hide();
	var currentYear = new Date().getFullYear();
	var startYear = $('#editstartYear').val();
	$('#editendYear').empty()
	$('#editendYear').append(
		$('<option></option>').val("").text("Select"));
	for (var year = startYear; year <= currentYear; year++) {
		$('#editendYear').append(
			$('<option></option>').val(year).text(year));
	}
});
$('#editstartMonth').on('change', function() {
	$('.startMonth_error').hide();
});
$('#editendYear').on('change', function() {
	$('.endYear_error').hide();
});
$('#editendMonth').on('change', function() {
	$('.editendMonth_error').hide();
});
function getCarrerDetails() {
	var edtcurrentCtc = $("#currentctcfetch").text()
	$("#editCurrentCtc").val(edtcurrentCtc);
	var editExpectedCtc = $("#expectedctcFetch").text();
	$("#editExpectedCtc").val(editExpectedCtc);
	var editTotalExp = document.getElementById('totalExpfetch').textContent;
	let parts = editTotalExp.split(".");
	let year = parts[0];
	let months = parts[1].replace(/\s+/g, "");
	months = months.replace("yrs", "");
	var experienceyears = $('#edityearsExp');
	experienceyears.empty();
	experienceyears.append('<option value="" class="experience">Select Years</option>');
	for (var i = 0; i <= 40; i++) {
		experienceyears.append('<option value="' + i + '">' + i + '</option>');
	}
	var experiencemonths = $('#editmonthsExp');
	experiencemonths.empty();
	experiencemonths.append('<option value="" class="experience">Select Years</option>');
	for (var i = 0; i <= 11; i++) {
		experiencemonths.append('<option value="' + i + '">' + i + '</option>');
	}
	$('#edityearsExp').val(parseInt(year, 10));
	$('#editmonthsExp').val(parseInt(months, 10));

	var editServingNoticePeriod = $("#serviceNoticePeriodFetch").text();
	if (editServingNoticePeriod .toUpperCase()=== "YES") {
		$("#editServingNoticePeriodYes").prop('checked', true);
		$('#hideShowLastWorkingDate').show();
		$('#hideShowNoticePeriod').show();

	} else {
		$("#editServingNoticePeriodNo").prop('checked', true);
		$('#hideShowLastWorkingDate').hide();
		$('#hideShowNoticePeriod').hide();
	}
	var lastworkingDate1 = lastworkingDate;
	let formattedDate = lastworkingDate1.split("-").reverse().join("-");
	$('#editlastworkingDate').val(formattedDate).prop('disabled', true);
	var editNoticePeriod = $("#noticePeriodFetch").text();
	$('#editNoticePeriod').val(editNoticePeriod);
	/*fetchCities(pincode);
	$('#editpincode').val(pincode);*/
	var editreadyTolocate = $("#readyTolocateFetch").text();
	if (editreadyTolocate.toUpperCase() == "YES") {
		$('#editRelocateYes').prop('checked', true);
		$('#showHidePerferedLocation').hide();
	} else {
		$('#showHidePerferedLocation').show();
		$('#editRelocateNo').prop('checked', true);
	}
	var editofferInHand = $("#offerInHandFetch").text();
	if (editofferInHand.toUpperCase() == "YES") {
		$('#editOfferInHandYes').prop('checked', true);
		$('#showHideJoiningDate').show();
		$('#showHideOfferCtc').show();
	} else {
		$('#showHideJoiningDate').hide();
		$('#showHideOfferCtc').hide();
		$('#editOfferInHandNo').prop('checked', true);
	}
	var editofferCtc = $("#offerCtcFetch").text();
	$('#editOfferCtc').val(editofferCtc);
	var editworkfromHome = $("#workFromHomeFetch").text();
	if (editworkfromHome.toUpperCase() == "YES") {
		$('#showHidePerferedLocation').hide();
		$('#showHideReadyToLocate').hide();
		$('#editWorkfromhomeYes').prop('checked', true);
	} else {
		$('#showHidePerferedLocation').show();
		$('#showHideReadyToLocate').show();
		$('#editWorkfromhomeNo').prop('checked', true);
	}
	const locationString = $('#preferedlocation').text(); // Get the text content
	const locationArray = locationString.split(',').map(location => location.trim()); // Trim spaces
	console.log(locationArray);

	var preferredlocation = $('#editpreferredlocation');
	preferredlocation.empty();
	for (var i = 0; i < allCities.length; i++) {
		var isSelected = locationArray.includes(allCities[i].name) ? ' selected' : '';
		preferredlocation.append('<option value="' + allCities[i].id + '"' + isSelected + '>' + allCities[i].name + '</option>');
	}
	var editResumeHeadline = $("#resmeHeadlineFetch").text();
	$('#resumeHeadline').val(editResumeHeadline);
	$("#editjoiningDate").val(carrerJoiningDate);

}
function convertDate(inputDate) {
    let parts = inputDate.split('-');  // Split by '-'
    let formattedDate = `${parts[2]}-${parts[1]}-${parts[0]}`;  // Rearrange to 'yyyy-MM-dd'
    return formattedDate;
}
function updateCareerDetails() {
	var isValid = true;
	var currentCtc = $('#editCurrentCtc').val();
	var ExpectedCtc = $('#editExpectedCtc').val();
	var totalMonths = $('#editmonthsExp').val();
	var totalYears= $('#edityearsExp').val();
	var servingNoticePeriod = document.querySelector('input[name="editServingNoticePeriod"]:checked')?.value;
	var noticePeriod = $('#editNoticePeriod').val();
	var lastWorkingDate = $('#editlastworkingDate').val();
	var formattedDate = lastWorkingDate.split("-").reverse().join("-");
	var lastWorkingDate=formattedDate;
	var offerInHand = document.querySelector('input[name="editOfferInHand"]:checked')?.value;;
	var offerCtc = $('#editOfferCtc').val();
	var joiningDate = $('#editjoiningDate').val();
	joiningDate=convertDate(joiningDate);
	var WorkfromHome = document.querySelector('input[name="editWorkfromhome"]:checked')?.value;
	var readyToRelocate = document.querySelector('input[name="editRelocate"]:checked')?.value;
	var preferedLocation = $('#editpreferredlocation').val();
	/*var pincode =  $('#editpincode').val();
	var state = $('#editstate').val();
	var currentlocation = $('#current_location').val();*/
	var resumeHeadline = $('#resumeHeadline').val();
	if(WorkfromHome.toUpperCase()=="YES")
	{
		readyToRelocate="";
		preferedLocation="";
	}
	if(readyToRelocate.toUpperCase()=="YES")
	{
		preferedLocation="";
	}
	if(servingNoticePeriod.toUpperCase() == "NO")
	{
		lastWorkingDate="";
		noticePeriod="";
	}
	if(offerInHand.toUpperCase() == "NO")
	{
		joiningDate="";
		offerCtc="";
	}
	if(currentCtc == "")
	{
		$('.editCurrentCtc_error').text("Enter the field below");
		isValid=false;
	}
	if(ExpectedCtc == "")
	{
		$('.editExpectedCtc_error').text("Enter the field below");
		isValid=false;
	}
	if(totalYears == "")
	{
		$('.edityearsExp_error').text("Enter the field below")
		isValid=false;	
	}
	if(totalMonths == "")
	{
		$('.editmonthsExp_error').text("Enter the field below")
		isValid=false;	
	}
	if(servingNoticePeriod == "")
	{
		$('.editServingNoticePeriod_error').text("Enter the field below");
		isValid=false;
	}else 
	{
		if(servingNoticePeriod.toUpperCase() == "YES")
		{
			if(noticePeriod == "")
			{
				$('.editNoticePeriod_error').text("Enter the field below");
				isValid=false;
			}
			if(lastWorkingDate == "")
			{
				$('.editlastworkingDate_error').text("Enter the field below");
				isValid=false;
			}
		}
	}
	if(offerInHand.toUpperCase() == "YES")
	{
		if(joiningDate == "")
		{
			$('.editjoiningDate_error').text("Enter the field below");
			isValid=false;
		}
		if(offerCtc == "")
		{
			$('.editOfferCtc_error').text("Enter the field below");
			isValid=false;
		}
	}
	console.log(readyToRelocate.toUpperCase());
	/*carrerDetails={
		"currentCtc":currentCtc,
				"expectedCtc":ExpectedCtc,
				"totalExperience":totalYears + "_" + totalMonths,
				"serviceNoticePeriod": servingNoticePeriod.toUpperCase(),
				"noticePeriod":noticePeriod,
				"lastWorkingDate":lastWorkingDate,
				"offerInHand":offerInHand.toUpperCase(),
				"offeredCtc":offerCtc,
				"joiningDate":joiningDate,
				"workFromHome":WorkfromHome.toUpperCase(),
				"readyToRelocate":readyToRelocate.toUpperCase(),
				"preferredLocation":preferedLocation,
				"pincode": pincode,
				"state": state,
				"currentLocation": currentlocation,
				"resumeheadline": resumeHeadline,
				"Type": "updateEmploymentDetails"
	}*/
	/*console.log(carrerDetails);*/
	if (isValid) {
		$.ajax({
			url: "updateCarrerDetails",
			method: "POST",
			data: {
				"currentCtc":currentCtc,
				"expectedCtc":ExpectedCtc,
				"totalExperience":totalYears + "_" + totalMonths,
				"serviceNoticePeriod": servingNoticePeriod,
				"noticePeriod":noticePeriod,
				"lastWorkingDate":lastWorkingDate,
				"offerInHand":offerInHand,
				"offeredCtc":offerCtc,
				"joiningDate":joiningDate,
				"workFromHome":WorkfromHome,
				"readyToRelocate":readyToRelocate,
				"preferredLocation":preferedLocation,
				/*"pincode": pincode,
				"state": state,
				"currentLocation": currentlocation,*/
				"resumeheadline": resumeHeadline,
				"Type": "updateEmploymentDetails"
			}, success: function(response) {
				if (response.errorCode == "0000") {
					showToast("success","Updated Sucessfully");
				} else {
					console.log("error in repsonse");
					showToast("info","please try again");
				}
			},
			error: function(response) {
				console.log("error reponse", response);
				showToast("error","Error occured");
			}

		})
	}
}
function downloadResume() {

	var url = "downloadResume";
	var form = document.createElement('form');
	form.method = 'GET'; // or 'POST', depending on your needs
	form.action = url;

	document.body.appendChild(form);
	form.submit();
}
$("#resume_doc").change(function() {
	var file = $(this)[0].files[0];
	var fileType = file.type;
	var fileSize = file.size;

	if (fileType != "application/pdf" && fileType != "application/msword" && fileType != "application/vnd.openxmlformats-officedocument.wordprocessingml.document") {
		showToast("info","Only pdf, doc, and docx files are allowed");
		$(this).val("");
		return false;
	}

	if (fileSize > 2097152) { // 2MB
		$('.resume_error').text("File size must be less than 2MB.");
		$('.resume_error').show();
		$(this).val("");
		$('.resume_error').fadeOut(3000);
		return false;
	}

	$(".resume_error").text("");
});
function updateCv() {
	var formData = new FormData();
	var fileInput = document.getElementById("resume_doc");
	var file = fileInput.files[0];

	if (!file) {
		showToast("info","Please select a file to upload.");
		return;
	}

	formData.append("resume_doc", file);

	$.ajax({
		url: "/uploadResume", // Change the URL to your endpoint
		type: "POST",
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			showToast("success","Resume uploaded successfully!");
		},
		error: function(xhr, status, error) {
			console.log("Error uploading file: " + xhr.responseText);
			showToast("error","Error occured");
		}
	});
}
function fetchCities(id) {
	$.ajax({
		url: "getPoastalCode",
		method: "POST",
		data: {
			"pincode": id
		},
		success: function(response) {
			console.log(response);
			if (response[0] !== null) {
				if (response[0].PostOffice != null) {
					isValidPincode = true
					var postOffices = response[0].PostOffice;
					if (postOffices.length == 1) {
						$('#current_location').remove();
						 $('#currentlocationModal').find('span').remove();
						$('#current_location').select2('destroy');
						var $input = $('<input>', {
							id: 'current_location',
							type: 'text',
							class: 'form-control',
							placeholder: 'Enter other city',
							disabled: true,
							value: postOffices[0].Name
						});
						$('#currentlocationModal .form-group').append($input);

						// Add the error span after the input
						var $errorSpan = $('<span>', {
							class: 'errorfield',
							id: 'current_location_error'
						});

						$('#editstate').val(postOffices[0].State);

					}else
					{
						$('#current_location').remove();
						$('#current_location').select2('destroy');
						
						var $select = $('<select>', {
	                        id: 'current_location',
	                        class: 'form-control selet2Single',
	                        css: { width: '100%' }
	                    });
	                    
	                     // Add a placeholder option
	                    $select.append('<option value="" selected>Select a city</option>');

	                    // Dynamically populate the dropdown
	                    $.each(postOffices, function (index, postOffice) {
	                        $select.append($('<option>', {
	                            value: postOffice.Name,
	                            text: postOffice.Name
	                        }));
	                    });
						
	                    $('#currentlocationModal .form-group').append($select);
	                    
	                    $select.select2({ 
							placeholder: 'Select a city',
    						dropdownParent: $('#personaldetailsModal')
	                    });
	                    
	                    $('#personaldetailsModal').on('scroll', function () {
                            $select.select2({
                                dropdownParent: $(this).parent(),
                                placeholder: 'Select city'
                            });
                        });
                        
                        $('#editstate').val(postOffices[0].State);
                        $('#current_location').val(currentLocationsValue).trigger('change'); ;
                        
					}

				} 
				else {
					$('.pincode_error').text('It is invalid pincode').css("color", "red").show();
					isValidPincode = false
				}
			} else {

				$('#statelocationModal').hide();
				$('#currentlocationModal').hide();
				$('#current_location').remove();
				isValidPincode = false
			}

		},
		error: function(response) {
			console.log("error", response);
		}
	});

}
$('#editpincode').on('keyup', function() {
	var selectedId = $(this).val();
	if (selectedId.length === 6) {
		fetchCities(selectedId);
		$('#current_location').removeAttr('disabled');
	} else {
		$('#editpincode_error').text('Please enter a valid 6-digit pincode.').css("color", "red").show();
	}

});
document.querySelectorAll('input[name="editServingNoticePeriod"]').forEach
	(radio => {
		radio.addEventListener('change', function() {
			if (this.value === "Yes") {
				$('#hideShowLastWorkingDate').show();
				$('#hideShowNoticePeriod').show();
			} else {
				$('#hideShowLastWorkingDate').hide();
				$('#hideShowNoticePeriod').hide();
			}
		})
	})
document.querySelectorAll('input[name="editWorkfromhome"]').forEach
	(radio => {
		radio.addEventListener('change', function() {
			if (this.value === "Yes") {
				$('#showHidePerferedLocation').hide();
				$('#showHideReadyToLocate').hide();
			} else {
				$('#showHidePerferedLocation').show();
				$('#showHideReadyToLocate').show();
			}
		})
	})
document.querySelectorAll('input[name="editRelocate"]').forEach
	(radio => {
		radio.addEventListener('change', function() {
			if (this.value === "Yes") {
				$('#showHidePerferedLocation').hide();
			} else {
				$('#showHidePerferedLocation').show();
			}
		})
	})
document.querySelectorAll('input[name="editOfferInHand"]').forEach
	(radio => {
		radio.addEventListener('change', function() {
			if (this.value === "Yes") {
				$('#showHideJoiningDate').show();
				$('#showHideOfferCtc').show();
			} else {
				$('#showHideJoiningDate').hide();
				$('#showHideOfferCtc').hide();
			}
		})
	})
function removeDisableLastWorkDate() {
	$('#editlastworkingDate').prop('disabled', false);
	$("#editLastWorkingDate").datepicker("destroy");
	let days = $('#editNoticePeriod').val();
	const startDates = new Date();
	startDates.setDate(startDates.getDate() + days);
		$("#editLastWorkingDate").datepicker({
			dateFormat: "yy-mm-dd", // Adjust the format as needed
			minDate: 0,            // Disable all past dates
			changeMonth: true,     // Allow month selection
			changeYear: true       // Allow year selection
		});
}
function getCompanyName()
{
	$('#companyName').empty();
				$('#companyName').append(
					$('<option></option>').val("").text("Select"));
				masterCompany.forEach(function(course) {
					$('#companyName').append(
						$('<option></option>').val(course.id).text(course.name));
				});
	 if(isworkstatus === "true")
	 {
		 $("#addemploymentdetailcurrentlyadded").hide();
	 }else
	 {
		 $("#addemploymentdetailcurrentlyadded").show();
	 }
	
}
function editcompanyName(name)
{
	const company = masterCompany.find(item => item.name === name);
	 const $editCompanyName = $('#editcompanyName');
	 $('#editcompanyName').find('span').remove();
	$('#editcompanyName').empty();
				$('#editcompanyName').append(
					$('<option></option>').val("").text("Select"));
				masterCompany.forEach(function(course) {
					 const $option = $('<option></option>') .val(course.id).text(course.name);
					 if(course.id === company.id)
					 {
						  $option.attr('selected', 'selected');
					 }
					  $editCompanyName.append($option);
				});
		 $editCompanyName.val(company.id.toString()).trigger('change');
}
var monthMap = {
		"January": 1,
		"February": 2,
		"March": 3,
		"April": 4,
		"May": 5,
		"June": 6,
		"July": 7,
		"August": 8,
		"September": 9,
		"October": 10,
		"November": 11,
		"December": 12
};
var revermonth = {
		1: "January",
		2: "February",
		3: "March",
		4: "April",
		5: "May",
		6: "June",
		7: "July",
		8: "August",
		9: "September",
		10: "October",
		11: "November",
		12:"December"
};
function updatemonth(value)
{
	const currentDate = new Date();
	const currentYear = currentDate.getFullYear();
	const currentMonth = currentDate.getMonth() + 1;
	const currentYearString = currentYear.toString();
	$('#endYear').empty();
	$('#endMonth').empty();
	$('#endYear').append($('<option></option>').val("").text("Select"));
	$('#endMonth').append($('<option></option>').val("").text("Select"));
	if(value !== currentYearString)
	{
		for(let i=value;i<=currentYear;i++)
		{
			$('#endYear').append($('<option></option>').val(i).text(i));
		}
	}
	
	if(value === currentYearString)
	{
		$('#startMonth').empty();
		$('#startMonth').append($('<option></option>').val("").text("Select"));
		for(let i=1;i<=currentMonth;i++)
		{
			$('#startMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
		}
	}else
	{
		for(let i=1;i<=12;i++)
		{
			$('#startMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
		}
	}
}
function updateEndMonth(value)
{
	const currentdate = new Date();
	const currentMonth = currentdate.getMonth() + 1;
	const startmonth=$('#startMonth').val();
	const startYear=$('#startYear').val();
	const startmonthvalue=monthMap[startmonth];
	const currentYear = currentdate.getFullYear();
	const currentYearString = currentYear.toString();
	if(value === currentYearString)
	{
		if(startmonth === revermonth[currentMonth])
		{
			$('#endMonth').empty();
			$('#endMonth').append($('<option></option>').val("").text("Select"));
		}else
		{
			if(value === currentYearString)
			{
				$('#endMonth').empty();
				$('#endMonth').append($('<option></option>').val("").text("Select"));
				for(let i=1;i<=currentMonth;i++)
				{
					$('#endMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
				}	
				
			}else
			{
				$('#endMonth').empty();
				$('#endMonth').append($('<option></option>').val("").text("Select"));
				for(let i=startmonthvalue;i<=currentMonth;i++)
				{
					$('#endMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
				}	
				
			}
			
		}
	}else
	{
		if(value === startYear)
		{
				$('#endMonth').empty();
			$('#endMonth').append($('<option></option>').val("").text("Select"));
			for(let i=startmonthvalue+1;i<=12;i++)
			{
				$('#endMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
			}	
		}else
		{
			$('#endMonth').empty();
			$('#endMonth').append($('<option></option>').val("").text("Select"));
			for(let i=1;i<=12;i++)	
			{
				$('#endMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
			}	
		}
		
	}
}
function editstartYear(value)
{
	const currentDate = new Date();
	const currentYear = currentDate.getFullYear();
	const currentMonth = currentDate.getMonth() + 1;
	const currentYearString = currentYear.toString();
	$('#editendYear').empty();
	$('#editendMonth').empty();
	$('#editendYear').append($('<option></option>').val("").text("Select"));
	$('#editendMonth').append($('<option></option>').val("").text("Select"));
	if(value !== currentYearString)
	{
		for(let i=value;i<=currentYear;i++)
		{
			$('#editendYear').append($('<option></option>').val(i).text(i));
		}
	}
	
	if(value === currentYearString)
	{
		$('#editstartMonth').empty();
		$('#editstartMonth').append($('<option></option>').val("").text("Select"));
		for(let i=1;i<=currentMonth;i++)
		{
			$('#editstartMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
		}
	}else
	{
		for(let i=1;i<=12;i++)
		{
			$('#editstartMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
		}
	}
}
function editEndYear(value)
{
	const currentdate = new Date();
	const currentMonth = currentdate.getMonth() + 1;
	const startmonth=$('#editstartMonth').val();
	const startYear=$('#editstartYear').val();
	const startmonthvalue=monthMap[startmonth];
	const currentYear = currentdate.getFullYear();
	const currentYearString = currentYear.toString();
	if(value === currentYearString)
	{
		if(startmonth === revermonth[currentMonth])
		{
			$('#editendMonth').empty();
			$('#editendMonth').append($('<option></option>').val("").text("Select"));
		}else
		{
			if(value === currentYearString)
			{
				$('#editendMonth').empty();
				$('#editendMonth').append($('<option></option>').val("").text("Select"));
				for(let i=1;i<=currentMonth;i++)
				{
					$('#editendMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
				}	
				
			}else
			{
				$('#editendMonth').empty();
				$('#editendMonth').append($('<option></option>').val("").text("Select"));
				for(let i=startmonthvalue;i<=currentMonth;i++)
				{
					$('#editendMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
				}	
				
			}
			
		}
	}else
	{
		if(value === startYear)
		{
				$('#editendMonth').empty();
			$('#editendMonth').append($('<option></option>').val("").text("Select"));
			for(let i=startmonthvalue+1;i<=12;i++)
			{
				$('#editendMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
			}	
		}else
		{
			$('#editendMonth').empty();
			$('#editendMonth').append($('<option></option>').val("").text("Select"));
			for(let i=1;i<=12;i++)	
			{
				$('#editendMonth').append($('<option></option>').val(revermonth[i]).text(revermonth[i]));
			}	
		}
		
	}
}
function updatecurrentworkings()
{
	var isChecked = $('#currentlywork').prop('checked');
	if (isChecked) {
    	$('#addemploymentdetailshide').hide();
	} else {
    	$('#addemploymentdetailshide').show();
	}
}