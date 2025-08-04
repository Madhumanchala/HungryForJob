document.addEventListener('DOMContentLoaded', function() {
	const modal = document.getElementById('addCandidate');

	modal.addEventListener('hide.bs.modal', function() {
		if (document.activeElement) {
			document.activeElement.blur();
		}
	});
});

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

function getSpecializationSession(id, value, specialValue) {
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
						$('#' + value).val(specialValue).trigger('change');
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

function getselectedskills() {
	const selectedElements = document.querySelectorAll('.selected-items  .selected-item');
	const selectedIds = Array.from(selectedElements).map(e1 => e1.getAttribute('data-value'));
	return selectedIds;
}

function getManadatryselectedskills() {
	const selectedElements = document.querySelectorAll('.selected-items  .selected-item .mandatory');
	const selectedIds = Array.from(selectedElements).map(e1 =>
		e1.closest('.selected-item').getAttribute('data-value'));
	return selectedIds;
}

function submitSearchCandidates() {


	checkspoints().then(isPointsSufficient => {
		if (isPointsSufficient) {

			/*var skills = $('#iTSkills').val();
			skills = skills.join(",");*/
			var skills = getselectedskills();
			skills = skills.join(",");
			var mandataryskills = getManadatryselectedskills();
			mandataryskills = mandataryskills.join(",");
			var minExp = document.getElementById("workExperienceMin").value;
			var maxExp = document.getElementById("workExperienceMax").value;
			var location = $('#jobLocation').val();
			location = location.join(",");
			var minSalary = document.getElementById("searchMinSalary").value;
			var maxSalary = document.getElementById("salaryFigureMax").value;
			var company = document.getElementById("company").value;
			/*var isNoticePeriod = document.getElementsByName("noticePeriod");*/
			var noticePeriod = null;
			let selectedValues = $("input[name='noticePeriod']:checked").map(function() {
				return this.value;
			}).get();
			if (selectedValues) {
				noticePeriod = selectedValues;
			}
			/*if (isNoticePeriod != null) {
				for (var i = 0; i < isNoticePeriod.length; i++) {
					if (isNoticePeriod[i].checked) {
						noticePeriod = isNoticePeriod[i].value;
						break;
					}
				}
			}*/
			var isEducationPeriod = document.getElementsByName("highestQualification");
			var educationDetails = null;
			var course = null;
			var specialization = null;
			var courseType = null;
			var university = null;
			if (isEducationPeriod != undefined) {
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
			if (isGender != undefined) {
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
			/*if (minExp == "") {
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
			}*/

			if (isvalid) {

				const selectedTexts = $('#iTSkills option:selected').map(function() {
					return $(this).text();
				}).get().join(', ');

				const selectedLocation = $('#jobLocation option:selected').map(function() {
					return $(this).text();
				}).get().join(', ');

				const minctcsearch = $('#searchMinSalary option:selected').text().replace('lacs', '').trim();
				const maxctcsearch = $('#salaryFigureMax option:selected').text();

				sessionStorage.setItem("keySkills", selectedTexts);
				sessionStorage.setItem("Experience", [minExp, maxExp].join("-") + " years");
				sessionStorage.setItem("Locations", selectedLocation);
				sessionStorage.setItem("minExp", minExp);
				sessionStorage.setItem("maxExp", maxExp);
				sessionStorage.setItem("CTC", minctcsearch + "-" + maxctcsearch);
				if (company != null) {
					sessionStorage.setItem("companyName", company);
				}
				if (noticePeriod != null) {
					sessionStorage.setItem("NoticePeriod", noticePeriod);
				}
				if (educationDetails != null) {
					sessionStorage.setItem("highestQualification", educationDetails);
				}
				if (course != null) {
					sessionStorage.setItem("course", course);
				}
				if (specialization != null) {
					sessionStorage.setItem("specialization", specialization);
				}
				if (courseType != null) {
					sessionStorage.setItem("courseType", courseType);
				}
				if (university != null) {
					sessionStorage.setItem("institute", university);
				}
				if (gender != null) {
					sessionStorage.setItem("gender", gender);
				}
				if (isReadyToLocate != null) {
					sessionStorage.setItem("readytoLocate", isReadyToLocate);
				}

				// save new search
				let saveSearchSkill = getselectedskills();
				sessionStorage.setItem("saveSearchSkill", saveSearchSkill);

				let saveSearchMinExp = $('#workExperienceMin').val()
				sessionStorage.setItem("saveSearchMinExp", saveSearchMinExp);

				let saveSearchMaxExp = $('#workExperienceMax').val()
				sessionStorage.setItem("saveSearchMaxExp", saveSearchMaxExp);

				let saveSearchLocation = $('#jobLocation').val();
				sessionStorage.setItem("saveSearchLocation", saveSearchLocation);

				let saveSearchMinSalary = $('#searchMinSalary').val();
				sessionStorage.setItem("saveSearchMinSalary", saveSearchMinSalary);

				let saveSearchMaxSalary = $('#salaryFigureMax').val();
				sessionStorage.setItem("saveSearchMaxSalary", saveSearchMaxSalary);

				let saveSearchCompany = $('#company').val();
				sessionStorage.setItem("saveSearchCompany", saveSearchCompany);

				let saveSearchNoticePeriod = noticePeriod;
				sessionStorage.setItem("saveSearchNoticePeriod", saveSearchNoticePeriod);

				let saveSearchHighestQualification = educationDetails;
				sessionStorage.setItem("saveSearchHighestQualification", saveSearchHighestQualification);

				let saveSearchCourse = course;
				sessionStorage.setItem("saveSearchCourse", saveSearchCourse);

				let saveSearchSpecialization = specialization;
				sessionStorage.setItem("saveSearchSpecialization", saveSearchSpecialization);

				let saveSearchCourseType = courseType;
				sessionStorage.setItem("saveSearchCourseType", saveSearchCourseType);

				let saveSearchUniversity = university;
				sessionStorage.setItem("saveSearchUniversity", saveSearchUniversity);

				let saveSearchGender = gender;
				sessionStorage.setItem("gender", saveSearchGender);

				let saveSearchIsReadyToLocate = isReadyToLocate;
				sessionStorage.setItem("isReadyToLocate", saveSearchIsReadyToLocate);

				var url = "resultSearchCandidates";

				var form = document.createElement('form');
				form.method = 'POST'; // or 'POST', depending on your needs
				form.action = url;

				var formSkills = document.createElement('input');
				formSkills.type = 'hidden'; // Use hidden inputs for data
				formSkills.name = 'skill';      // Set the name of the input
				formSkills.value = skills;   // Set the value of the input
				form.appendChild(formSkills);

				var formSkills = document.createElement('input');
				formSkills.type = 'hidden'; // Use hidden inputs for data
				formSkills.name = 'requiredSkills';      // Set the name of the input
				formSkills.value = mandataryskills;   // Set the value of the input
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
	});

}
function allChange(id) {
	$('#' + id).hide();
}
$(document).ready(function() {

	let isModifyClicked = sessionStorage.getItem("modifyClicked");
	if (isModifyClicked === "clicked") {
		let skillsValue = sessionStorage.getItem("saveSearchSkill");
		let skillsList = skillsValue ? skillsValue.split(",") : [];
		/*$('#iTSkills').val(skillsList).trigger('change');*/

		$(".dropdown1 div").each(function() {
			var value = $(this).text().trim();
			var valueId = $(this).data("value");
			var $selectedItems = $(".selected-items");
			var $dropdownItem = $(this);

			// Check if it's mandatory
			if (skillsList.includes(String(valueId))) {
				// Check if it's already added
				if ($selectedItems.find(".selected-item[data-value='" + valueId + "']").length === 0) {
					var html = '<div class="selected-item" data-value="' + valueId + '">'
						+ value
						+ '<i class="fa fa-star star"></i>'
						+ '<span class="remove">&times;</span>'
						+ '</div>';
					$selectedItems.append(html);
					$dropdownItem.addClass("active");
				}
			}
		});


		let minExpValue = sessionStorage.getItem("saveSearchMinExp");
		if (minExpValue === "null" || minExpValue == undefined || minExpValue == null) {
			$('#workExperienceMin').val("").trigger('change');
		} else {
			$('#workExperienceMin').val(minExpValue).trigger('change');
		}


		let maxExpValue = sessionStorage.getItem("saveSearchMaxExp");
		if (maxExpValue === "null" || maxExpValue == undefined || maxExpValue == null) {
			$('#workExperienceMax').val("").trigger('change');
		} else {
			$('#workExperienceMax').val(maxExpValue).trigger('change');
		}

		let locationvalue = sessionStorage.getItem("saveSearchLocation");
		if (locationvalue === "null" || locationvalue == undefined || locationvalue == null) {
			$("#jobLocation").val("").trigger('change');
		} else {
			let locationlist = locationvalue ? locationvalue.split(",") : [];
			$("#jobLocation").val(locationlist).trigger('change');
		}


		let minSalaryValue = sessionStorage.getItem("saveSearchMinSalary");
		if (minSalaryValue === "null" || minSalaryValue == undefined || minSalaryValue == null) {
			$('#searchMinSalary').val("").trigger('change');
		} else {
			$('#searchMinSalary').val(minSalaryValue).trigger('change');
		}


		let maxSalaryValue = sessionStorage.getItem("saveSearchMaxSalary");
		if (maxSalaryValue == null || maxSalaryValue == undefined === "null") {
			$('#salaryFigureMax').val("").trigger('change');
		} else {
			$('#salaryFigureMax').val(maxSalaryValue).trigger('change');
		}


		let companyValue = sessionStorage.getItem("saveSearchCompany");
		if (companyValue == null || companyValue === "null" || companyValue == undefined) {
			$('#company').val("").trigger('change');

		} else {
			$('#company').val(companyValue).trigger('change');
		}

		let noticeperiod = sessionStorage.getItem("saveSearchNoticePeriod");
		if (noticeperiod !== null && noticeperiod !== "null") {
			let noticevalues = noticeperiod.split(","); // Split in case of multiple values
			noticevalues.forEach(noticevalues => {
				$("input[name='noticePeriod'][value='" + noticevalues + "']").prop("checked", true);
			});
		}

		let highestQualificationValue = sessionStorage.getItem("saveSearchHighestQualification");
		if (highestQualificationValue !== null && highestQualificationValue !== "null") {
			$("input[name='highestQualification'][value='" + highestQualificationValue + "']").prop("checked", true);
		}

		let courseValue = sessionStorage.getItem("saveSearchCourse");
		let specializationValue = sessionStorage.getItem("saveSearchSpecialization");
		let universityValue = sessionStorage.getItem("saveSearchUniversity");

		if (highestQualificationValue === "degree") {
			$('#degreeCourses').show();
			$('#masterCourses').hide();
			$('#phdCourses').hide();
			if (courseValue == null || courseValue == - "null" || courseValue == undefined) {
				$('#course2').val("").trigger('change');
			} else {
				$('#course2').val(courseValue).trigger('change');
			}

			if (specializationValue == null || specializationValue === "null" || specializationValue == undefined) {
				getSpecializationSession(courseValue, 'specialization2', "");
			} else {
				getSpecializationSession(courseValue, 'specialization2', specializationValue);
			}
			$('#specialization2').trigger('change');
			let courseTypeValue = sessionStorage.getItem("saveSearchCourseType");
			if (courseTypeValue !== null || courseTypeValue !== "null") {
				$("input[name='courseType2'][value='" + courseTypeValue + "']").prop("checked", true);
			}
			if (universityValue == null || universityValue === "null" || universityValue == undefined) {
				$('#university2').val("").trigger('change');
			} else {
				$('#university2').val(universityValue).trigger('change');
			}

		}
		else if (highestQualificationValue === "master") {
			$('#masterCourses').show();
			$('#degreeCourses').hide();
			$('#phdCourses').hide();
			if (courseValue == null || courseValue === "null" || courseValue == undefined) {
				$('#course1').val("").trigger('change');
			} else {
				$('#course1').val(courseValue).trigger('change');
			}
			if (specializationValue == null || specializationValue === "null" || specializationValue == undefined) {
				getSpecializationSession(courseValue, 'specialization1', "");
			} else {
				getSpecializationSession(courseValue, 'specialization1', specializationValue);
			}
			$('#specialization1').trigger('change');
			let courseTypeValue = sessionStorage.getItem("saveSearchCourseType");
			if (courseTypeValue !== null || courseTypeValue !== "null") {
				$("input[name='courseType1'][value='" + courseTypeValue + "']").prop("checked", true);
			}
			if (universityValue == null || universityValue === "null" || universityValue == undefined) {
				$('#university1').val(universityValue).trigger('change');
			} else {
				$('#university1').val("").trigger('change');
			}

		}
		else if (highestQualificationValue === "phd") {
			$('#phdCourses').show();
			$('#masterCourses').hide();
			$('#degreeCourses').hide();
			if (courseValue == null || courseValue === "null" || courseValue == undefined) {
				$('#course3').val("").trigger('change');
			} else {
				$('#course3').val(courseValue).trigger('change');
			}
			if (specializationValue == null || specializationValue === "null" || specializationValue == undefined) {
				getSpecializationSession(courseValue, 'specialization3', "");
			} else {
				getSpecializationSession(courseValue, 'specialization3', specializationValue);
			}
			$('#specialization3').trigger('change');
			let courseTypeValue = sessionStorage.getItem("saveSearchCourseType");
			if (courseTypeValue !== null && courseTypeValue !== "null") {
				$("input[name='courseType3'][value='" + courseTypeValue + "']").prop("checked", true);
			}
			if (universityValue == null || universityValue === "null" || universityValue == undefined) {
				$('#university3').val("").trigger('change');
			} else {
				$('#university3').val(universityValue).trigger('change');
			}

		} else {
			$('#phdCourses').hide();
			$('#degreeCourses').hide();
			$('#masterCourses').hide();
		}

		let genderValue = sessionStorage.getItem("gender");
		if (genderValue !== "null" && genderValue !== null) {
			$("input[name='genderDiv'][value='" + genderValue + "']").prop("checked", true);
		}


		let readyTolocate = sessionStorage.getItem("isReadyToLocate");
		if (readyTolocate === 'YES') {
			$('#includeCandidates').prop('checked', true);
		} else {
			$("#includeCandidates").prop('checked', false);
		}
		sessionStorage.removeItem("modifyClicked");

	} else {
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


function checkspoints() {
	var deferred = $.Deferred();
	var isVisible = sessionStorage.getItem("isVisibleFlag").toString();

	if (isVisible !== '1') {

		$.ajax({
			url: "checkingpoints",
			type: 'post',
			contentType: 'application/json',
			success: function(response) {
				// Success callback
				console.log(response.data.userdetails);
				if (response.errors.errorCode === "0000") {
					let usedSearch = parseInt(response.data.userdetails.usedSearch, 10);
					let totalSearch = parseInt(response.data.userdetails.totalSearches, 10);

					if (usedSearch == totalSearch) {
						showToast("info", "please upgrade your plan");
						deferred.resolve(false);
						return false;
					} else {
						deferred.resolve(true);
						return true;

					}
				} else {
					console.log("error ocurred in service" + error)
					deferred.reject(false);
					return false;
				}
			},
			error: function(xhr, status, error) {
				// Error callback
				console.log("error ocurred" + error)
				deferred.reject(false);
				return false;
			}
		})
	} else {
		deferred.resolve(true);
	}

	return deferred.promise();
}

function search(email) {
	if (email) {
		const candidateEmail = document.getElementById('Industry').value;
		document.getElementById('email').value = candidateEmail;
		$.ajax({
			url: "/searchbyemail",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify({
				"email": email

			}),
			success: function(response) {
				console.log("Response received:", response);
				if (response.errors.errorMessage === 'true') {
					console.log(response);
					let userId = response.data.id;
					showToast("info", "Email already exists.");
					if (response.data.lastlogin) {
						document.getElementById('editProfile').style.display = "none";
						document.getElementById('addProfile').style.display = "none";
						document.getElementById('viewProfile').style.display = "block";
					} else {
						document.getElementById('viewProfile').style.display = "block";
						document.getElementById('addProfile').style.display = "none";
						document.getElementById('editProfile').style.display = "block";
					}

					$("#existingUserId").val(userId);
				} else {
					document.getElementById('viewProfile').style.display = "none";
					document.getElementById('editProfile').style.display = "none";
					document.getElementById('addProfile').style.display = "block";
				}
			},
			error: function(xhr, status, error) {
				console.log("error ========== " + error);
			}
		});
	} else {
		$("#Industry_error").text("Please Enter Email ID");
		$("#Industry_error").show();
	}
}


function fetchCandidateDetails() {
	document.getElementById('editProfile').style.display = "none";
	document.getElementById('viewProfile').style.display = "none";
	document.getElementById('addProfile').style.display = "none";
	document.getElementById('Industry').value = '';

	var id = document.getElementById('existingUserId').value;
	$.ajax({
		url: "/getCandidateDetails",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({
			candidateId: id
		}),
		success: function(response) {
			console.log(response);

			document.getElementById('fullName').value = response.data.signup.fullName;
			document.getElementById('mobileNumber').value = response.data.signup.mobileNumber;
			document.getElementById('currentCtc').value = response.data.careerDetails.currentCtc;
			document.getElementById('expectedCtc').value = response.data.careerDetails.expectedCtc;
			document.getElementById('existnoticePeriod').value = response.data.careerDetails.noticePeriod;
			document.getElementById('endyear').value = response.data.educationDetails.endYear;
			document.getElementById('currentLocation').value = response.data.careerDetails.city;

			const totalExp = response.data.careerDetails.totalExperience;

			if (totalExp) {
				const parts = totalExp.split(".");
				const years = parts[0];
				const months = parts[1] || "0";

				$('#edityearsExp').val(years).trigger('change');
				$('#editmonthsExp').val(months).trigger('change');
			}

			/*document.getElementById('currentOrganization').value = 
				response.data.employeelastWorkedCompany && 
				response.data.employeelastWorkedCompany.length > 0 && 
				response.data.employeelastWorkedCompany[0].companyName 
					? response.data.employeelastWorkedCompany[0].companyName 
					: '';*/
			const qualificationValue = response.data.educationDetails.qualificationtype;
			document.getElementById('highQualification').value = qualificationValue;

			var gender = response.data.signup.gender;
			if (gender.toUpperCase() === "MALE") {
				$("#editmale").prop('checked', true);

			} else {
				$("#editfemale").prop('checked', true);
			}

			var serviceNoticePeriod = response.data.careerDetails.serviceNoticePeriod;
			if (serviceNoticePeriod.toUpperCase() === "YES") {
				$("#editServingNoticePeriodYes").prop('checked', true);
			} else {
				$("#editServingNoticePeriodNo").prop('checked', true);
			}

			var offerInHand = response.data.careerDetails.offerInHand;
			if (offerInHand.toUpperCase() === "YES") {
				$("#editOfferInHandYes").prop('checked', true);
			} else {
				$("#editOfferInHandNo").prop('checked', true);
			}
			
			const locationString = response.data.viewPreferredLocation.map(location => String(location.name));
			const allCities = response.data.careerDetails.allCities;
			
			var preferredlocation = $('#preferredlocation');
			preferredlocation.empty();
			for (var i = 0; i < allCities.length; i++) {
				var isSelected = locationString.includes(allCities[i].name) ? ' selected' : '';
				preferredlocation.append('<option value="' + allCities[i].id + '"' + isSelected + '>' + allCities[i].name + '</option>');
			}
			$("#preferredlocation").select2({
				dropdownParent: $("#edituserdetails"),
				maximumSelectionLength: 5
			});
			$('#preferredlocation').trigger('change');


			// Jobs
			const job = response.data.jobPostingRole;
			const dropdownJobs = document.getElementById('applyJob');

			job.forEach(function(item) {
				const option = document.createElement('option');
				option.value = item.id;
				option.textContent = item.name;
				dropdownJobs.appendChild(option);
			});

			$("#applyJob").select2({
				dropdownParent: $("#edituserdetails")
			});
			$('#applyJob').trigger('change');
			
			
			const skillsString = response.data.skills.map(skill => String(skill.techName));
			const allSkills = response.data.jobPostingSkills;
			
			var selectedSkills = $('#addskills');
			selectedSkills.empty();
			for (var i = 0; i < allSkills.length; i++) {
				var isSelected = skillsString.includes(allSkills[i].name) ? ' selected' : '';
				selectedSkills.append('<option value="' + allSkills[i].id + '"' + isSelected + '>' + allSkills[i].name + '</option>');
			}
			$("#addskills").select2({
				dropdownParent: $("#edituserdetails"),
				maximumSelectionLength: 5
			});
			$('#addskills').trigger('change');


			// Qualification
			const qualification = response.data.jobPostingEducationQualification;
			const dropdownqualification = document.getElementById('highQualification');

			qualification.forEach(function(item) {
				const option = document.createElement('option');
				option.value = item.id;
				option.textContent = item.name;
				dropdownqualification.appendChild(option);
			});

			$("#highQualification").select2({
				dropdownParent: $("#edituserdetails")
			});

			// === Set selected qualification based on name ===
			const selectedQualificationName = response.data.educationDetails.qualificationtype;

			// Find the matching item by name and set it as selected
			const selectedQualification = qualification.find(q => q.name === selectedQualificationName);
			if (selectedQualification) {
				$('#highQualification').val(selectedQualification.id).trigger('change.select2');
			}
		},
		error: function(xhr, status, error) {
			console.log("error: " + error);
		}
	});
}

function recruiterUpdatesCandidate() {
	var isValid = true;
	var candidateId = document.getElementById('existingUserId').value;
	var preferredLocation = $('#preferredlocation').val();
	var addskills = $('#addskills').val();
	var currentCtc = $('#currentCtc').val();
	var expectedCtc = $('#expectedCtc').val();
	var qualification = $('#highQualification').val();
	var applyJob = $('#applyJob').val();
	var noticePeriod = $('#existnoticePeriod').val();
	var totalMonths = $('#editmonthsExp').val();
	var totalYears = $('#edityearsExp').val();
	var fullName = $('#fullName').val();
	var contactNumber = $('#mobileNumber').val();
	var passingYear = $('#endyear').val();
	var currentOrganization = $('#currentOrganization').val();
	var currentLocation = $('#currentLocation').val();
	var gender = $('input[name="gender"]:checked').val();
	var servingNoticePeriod = document.querySelector('input[name="editServingNoticePeriod"]:checked')?.value;
	var offerInHand = document.querySelector('input[name="editOfferInHand"]:checked')?.value;

	if (fullName == "") {
		$('#fullName_error').text("Enter Full Name").css({ "color": "red" });
		$('#fullName_error').show();
		isValid = false;
	}
	if (contactNumber == "") {
		$('#mobileNumber_error').text("Enter Contact Number").css({ "color": "red" });
		$('#mobileNumber_error').show();
		isValid = false;
	}
	if (currentLocation == "") {
		$('#currentLocation_error').text("Enter Current Location").css({ "color": "red" });
		$('#currentLocation_error').show();
		isValid = false;
	}
	if (gender == undefined) {
		$(".genderError").text("Field is required").css({ "color": "red" });
		$(".genderError").show();
		isvalid = false;
	}
	if ($('#edityearsExp').val() == "" || $('#edityearsExp').val() == null) {
		$('.edityearsExp_error').text('Please fill out this field').css("color", "red");
		$('edityearsExp_error').show();
		isValid = false;
	}
	if ($('#editmonthsExp').val() == "" || $('#editmonthsExp').val() == null) {
		$('.editmonthsExp_error').text('Please fill out this field').css("color", "red");
		$('.editmonthsExp_error').show();
		isValid = false;
	}
	if ($('#addskills').val() == "" || $('#addskills').val() == null) {
		$('.addskills_error').text('Please fill out this field').css({ "color": "red" });
		$('.addskills_error').show();
		isValid = false;
	}

	if (isValid) {
		$.ajax({
			url: "/recruiterUpdatesCandidate",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify({
				candidateId: candidateId,
				preferredLocation: preferredLocation,
				candidateSkills: addskills,
				currentCtc: currentCtc,
				expectedCtc: expectedCtc,
				qualification: qualification,
				serviceNoticePeriod: servingNoticePeriod,
				offerInHand: offerInHand,
				noticePeriod: noticePeriod,
				totalExperience: totalYears + "_" + totalMonths,
				fullName: fullName,
				contactNumber: contactNumber,
				passingYear: passingYear,
				gender: gender,
				id: applyJob,
				currentLocation: currentLocation,
				currentOrganization: currentOrganization
			}),
			success: function(response) {
				console.log(response);

				if (response.errors.errorCode === "0000") {
					showToast("success", "Updated Successfully!");
					setTimeout(function() {
						window.location.reload();
					}, 2000);

				} else {
					console.log("error ocurred in service" + error)
					deferred.reject(false);
					return false;
				}
			}
		});
	}
}

function recruiterAddsCandidate() {
	var isValid = true;
	var candidateId = document.getElementById('existingUserId').value;
	var candidateEmail = document.getElementById('addemail').value;
	var preferredLocation = $('#addpreferredlocation').val();
	var addskills = $('#addnewskills').val();
	var currentCtc = $('#addcurrentCtc').val();
	var expectedCtc = $('#addexpectedCtc').val();
	var qualification = $('#addhighestQualification').val();
	var applyJob = $('#addApplyJob').val();
	var noticePeriod = $('#addnoticePeriod').val();
	var currentLocation = $('#addCurrentLocation').val();
	var totalYears = $('#addyearsExp').val();
	var totalMonths = $('#addmonthsExp').val();
	var fullName = $('#addfullName').val();
	var contactNumber = $('#addmobileNumber').val();
	var passingYear = $('#addendyear').val();
	var addcurrentOrganization = $('#addcurrentOrganization').val();
	var gender = $('input[name="gender"]:checked').val();
	var servingNoticePeriod = document.querySelector('input[name="addServingNoticePeriod"]:checked')?.value;
	var offerInHand = document.querySelector('input[name="addOfferInHand"]:checked')?.value;
	
	if (fullName == "") {
		$('#addfullName_error').text("Enter Full Name").css({ "color": "red" });
		$('#addfullName_error').show();
		isValid = false;
	}
	if (contactNumber == "") {
		$('#addmobileNumber_error').text("Enter Contact Number").css({ "color": "red" });
		$('#addmobileNumber_error').show();
		isValid = false;
	}
	if (currentLocation == "") {
		$('#addCurrentLocation_error').text("Enter Current Location").css({ "color": "red" });
		$('#addCurrentLocation_error').show();
		isValid = false;
	}
	if (candidateEmail == "") {
		$('#addemail_error').text("Enter Email").css({ "color": "red" });
		$('#addemail_error').show();
		isValid = false;
	}
	if (gender == undefined) {
		$(".genderError").text("Field is required").css({ "color": "red" });
		$(".genderError").show();
		isValid = false;
	}
	if (totalYears == "" || totalYears == null) {
		$('.addyearsExp_error').text('Please fill out this field').css("color", "red");
		$('.addyearsExp_error').show();
		isValid = false;
	}
	if (totalMonths == "" || totalMonths == null) {
		$('.addmonthsExp_error').text('Please fill out this field').css("color", "red");
		$('.addmonthsExp_error').show();
		isValid = false;
	}
	if (addskills == "" || addskills == null) {
		$('.addnewskills_error').text('Please fill out this field').css({ "color": "red" });
		$('.addnewskills_error').show();
		isValid = false;
	}

	if (isValid) {
		$.ajax({
			url: "/recruiterAddsCandidate",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify({
				candidateId: candidateId,
				preferredLocation: preferredLocation,
				candidateSkills: addskills,
				currentCtc: currentCtc,
				expectedCtc: expectedCtc,
				qualification: qualification,
				serviceNoticePeriod: servingNoticePeriod,
				offerInHand: offerInHand,
				noticePeriod: noticePeriod,
				totalExperience: totalYears + "_" + totalMonths,
				fullName: fullName,
				contactNumber: contactNumber,
				passingYear: passingYear,
				gender: gender,
				candidateEmail: candidateEmail,
				currentLocation: currentLocation,
				id: applyJob,
				currentOrganization: addcurrentOrganization
			}),
			success: function(response) {
				console.log(response);

				if (response.errors.errorCode === "0000") {
					showToast("success", "Updated Successfully!");
					setTimeout(function() {
						window.location.reload();
					}, 2000);

				} else {
					console.log("error ocurred in service" + error)
					deferred.reject(false);
					return false;
				}
			}
		});
	}
}

function updateCv() {
	var formData = new FormData();
	var fileInput = document.getElementById("resume_doc");
	var file = fileInput.files[0];
	var id = document.getElementById('existingUserId').value;
	if (!file) {
		showToast("info", "Please select a file to upload.");
		return;
	}

	formData.append("resume_doc", file);
	formData.append("candidateId", id);

	$.ajax({
		url: "/uploadResume",
		type: "POST",
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			showToast("success", "Resume uploaded successfully!");
		},
		error: function(xhr, status, error) {
			console.log("Error uploading file: " + xhr.responseText);
			showToast("error", "Error occured");
		}
	});
}

function addCv() {
	var formData = new FormData();
	var fileInput = document.getElementById("addresume_doc");
	var file = fileInput.files[0];
	var id = document.getElementById('existingUserId').value;
	if (!file) {
		showToast("info", "Please select a file to upload.");
		return;
	}

	formData.append("resume_doc", file);
	formData.append("candidateId", id);

	$.ajax({
		url: "/uploadResume",
		type: "POST",
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			showToast("success", "Resume uploaded successfully!");
		},
		error: function(xhr, status, error) {
			console.log("Error uploading file: " + xhr.responseText);
			showToast("error", "Error occured");
		}
	});
}

function fetchFieldsForAdd() {
	document.getElementById('editProfile').style.display = "none";
	document.getElementById('viewProfile').style.display = "none";
	document.getElementById('addProfile').style.display = "none";
	document.getElementById('Industry').value = '';
	$.ajax({
		url: "/fetchFieldDetails",
		type: "POST",
		success: function(response) {
			console.log(response.data);

			// Skills Dropdown
			const skill = response.data.jobPostingSkills;
			const dropdownskill = document.getElementById('addnewskills');

			// Add new options
			skill.forEach(function(item) {
				const option = document.createElement('option');
				option.value = item.id;
				option.textContent = item.name;
				dropdownskill.appendChild(option);
			});
			$("#addnewskills").select2({
				dropdownParent: $("#adduserdetails"),
				maximumSelectionLength: 5
			});
			$('#addnewskills').trigger('change');


			//Qualification Dropdown
			const qual = response.data.jobPostingEducationQualification;
			const dropdownqual = document.getElementById('addhighestQualification');

			qual.forEach(function(item) {
				const option = document.createElement('option');
				option.value = item.id;
				option.textContent = item.name;
				dropdownqual.appendChild(option);
			});
			$("#addhighestQualification").select2({
				dropdownParent: $("#adduserdetails")
			});
			$('#addhighestQualification').trigger('change');


			//Location Dropdown
			const location = response.data.jobPostingLocation;
			const dropdownLocation = document.getElementById('addpreferredlocation');

			location.forEach(function(item) {
				const option = document.createElement('option');
				option.value = item.id;
				option.textContent = item.name;
				dropdownLocation.appendChild(option);
			});
			$("#addpreferredlocation").select2({
				dropdownParent: $("#adduserdetails"),
				maximumSelectionLength: 5
			});
			$('#addpreferredlocation').trigger('change');


			// Jobs
			const addJob = response.data.jobPostingRole;
			const dropdownAddJobs = document.getElementById('addApplyJob');

			addJob.forEach(function(item) {
				const option = document.createElement('option');
				option.value = item.id;
				option.textContent = item.name;
				dropdownAddJobs.appendChild(option);
			});

			$("#addApplyJob").select2({
				dropdownParent: $("#adduserdetails")
			});
			$('#addApplyJob').trigger('change');

		},
		error: function(xhr, status, error) {
			console.log("Error uploading file: " + xhr.responseText);
			showToast("error", "Error occured");
		}
	});
}

function viewCandidateProfile() {
	var candidateId = document.getElementById('existingUserId').value;
	//window.location.href = "/employerCandidateprofile";

	var form = $('<form>', {
		'action': '/employerCandidateprofile',
		'method': 'POST'
	});

	form.append($('<input>', {
		'type': 'hidden',
		'name': 'candidateId',
		'value': candidateId
	}));

	form.appendTo('body').submit();
}

function hideErrorByClass(id) {
	$("." + id).hide();
}