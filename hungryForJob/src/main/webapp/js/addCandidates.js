function geteducationDetailsByid(id) {
	$.ajax({
		url: "getEducationDetails",
		method: "POST",
		data: {
			"id": id,
			"candidateId":candidateId
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
			console.log(response);
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
					console.log("error in repsonse");
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
	var personalDetails = {
		"name": name,
		"mobileno": mobileno,
		"workStatus": workStatus
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
					showToast("success","Updated Sucessfully");
					location.reload();
				} else {
					console.log("error in repsonse");
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
		"lastMonth": endMonth
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
				showToast("error","Error Ocuured");
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
					console.log("error in repsonse");
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
				showToast("error","Error Ocuured");
			}
		})
	}

}
function getEditemploymentdetails(id, companyName, jobTittle, startYear, startMonth, endYear, endMonth) {
	var currentYear = new Date().getFullYear();
	$('#editcompanyName').val(companyName);
	$('#editjobTitle').val(jobTittle);
	$('#editstartYear').empty();
	$('#editendYear').empty();
	$('#editstartMonth').empty();
	$('#editendMonth').empty();
	$('#editstartYear').append(
		$('<option></option>').val("").text("Select"));
	$('#editendYear').append(
		$('<option></option>').val("").text("Select"));
	for (var year = 1970; year <= currentYear; year++) {
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
function updateEmploymentDetails(id) {
	var companyName = $('#editcompanyName').val();
	var jobTittle = $('#editjobTitle').val();
	var startYear = $('#editstartYear').val();
	var startMonth = $('#editstartMonth').val();
	var endYear = $('#editendYear').val();
	var endMonth = $('#editendMonth').val();
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
			"id": id
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
					console.log("error in repsonse");
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
function getCarrerDetails()
{
	var edtcurrentCtc=$("#currentctcfetch").text()
	$("#editCurrentCtc").val(edtcurrentCtc);
	var editExpectedCtc=$("#expectedctcFetch").text();
	$("#editExpectedCtc").val(editExpectedCtc);
	var editTotalExp=document.getElementById('totalExpfetch').textContent;
	console.log("total exp",editTotalExp);
	$('#editNoticePeriod').val(years);
	var editServingNoticePeriod=$("#serviceNoticePeriodFetch").text();
	var editNoticePeriod=$("#noticePeriodFetch").text();
	var editreadyTolocate=$("#readyTolocateFetch").text();
	var editofferInHand=$("#offerInHandFetch").text();
	var editofferCtc=$("#offerCtcFetch").text();
	var editworkfromHome=$("#workFromHomeFetch").text();
	var editstate=$("#stateFetch").text();
	var editlocation=$("#cityLocation").text();
	var editResumeHeadline=$("#resmeHeadlineFetch").text();
}
function updateCareerDetails()
{
	var isValid=true;
	var currentCtc="300000";
	var ExpectedCtc="500000";
	var totalMonths="4";
	var totalYears="5";
	var servingNoticePeriod="YES";
	var noticePeriod="30";
	var lastWorkingDate="19-08-2001"
	var offerInHand="YES";
	var offerCtc="200000";
	var joiningDate="19-08-2001"
	var WorkfromHome="YES";
	var readyToRelocate="YES";
	var preferedLocation=[10,11,12,13,14];
	var pincode="11087";
	var state="maharshstra";
	var currentlocation="bhiwandi";
	var resumeHeadline="testing purpose";
	if (isValid) {
		$.ajax({
			url: "updateCarrerDetails",
			method: "POST",
			data: {
				"currentCtc": currentCtc,
				"expectedCtc":ExpectedCtc,
				"totalExperience":totalYears+"_"+totalMonths,
				"serviceNoticePeriod":servingNoticePeriod,
				"noticePeriod":noticePeriod,
				"lastWorkingDate":lastWorkingDate,
				"offerInHand":offerInHand,
				"offeredCtc":offerCtc,
				"joiningDate":joiningDate,
				"readyToRelocate":readyToRelocate,
				"workFromHome":WorkfromHome,
				"preferredLocation":preferedLocation,
				"pincode":pincode,
				"state":state,
				"currentLocation":currentlocation,
				"resumeheadline":resumeHeadline,
				"Type": "updateEmploymentDetails",
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
				showToast("error","Error Ocuured");
			}

		})
	}	
}
function downloadResume()
{
	
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
	    $('.errorfield').text("File size must be less than 2MB.");
	    $('.errorfield').show();
	    $(this).val("");
	    $('.errorfield').fadeOut(3000);
	    return false;	
	  }

	  $(".errorfield").text("");
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
			showToast("error","Error uploading file: ");
        }
    });
}