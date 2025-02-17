function getCourse(id) {
$(".degree_error").hide();
	if (id == 72 || id == 73 || id == 74) {
				$("#course").val("").trigger('change');
		 		$("#specialization").val("").trigger('change');
		 		$("#course_type").val("").trigger('change');
		 		$("#course_start_date").val("").trigger('change');
			    $("#course_end_date").val("").trigger('change');
				$("#uni").val("").trigger('change');
		 		$("#new_university").val(" ");
		 		$("#grading").val("").trigger('change');
		$('.courses_div').hide();
		$('.specialization_div').hide();
		$('.course_type_div').hide();
		$('.course_start_date').hide();
		$('.marksInput').hide();
		$('.course_end_date').hide();
		$('.uni_input').hide();
		$('.add_new_university').hide();
		$('.grading_system_input').hide();
		
		if (id === "72" || id === "73") {
			$('.marksInput').show();
			$('.course_end_date').show();
			if (id === "72") {
				$('#yearType').text("Enter the Passing Year");
				$('#markslabel').text("Enter the 12th(%)")
				$('#marks').val("");
			}
			if (id === "73") {
				$('#yearType').text("Enter the Passing Year");
				$('#markslabel').text("Enter the 10th(%)")
				$('#marks').val("");
			}
		} 
	}
	else {
		$.ajax({
			url: "getCourseDetails",
			method: "POST",
			data: {
				"id": id,
				"flag": 1
			},
			success: function(response) {
				$('.courses_div').show();
				$('.marksInput').hide();
				$('.course_end_date').hide();
				if (response.errors.errorCode == "0000") {
					if (response.data.course !== null) {
						if (Array.isArray(response.data.course)) {
							var data = response.data.course
							$('#course').empty();
							$('#course').append(
									$('<option></option>').val("").text("Select"));
							$('#specialization').empty();
							$('#specialization').append(
									$('<option></option>').val("").text("Select"));
							data.forEach(function(course) {
								if ($('#course option[value="' + course.id + '"]').length === 0) {
									$('#course').append(
									$('<option></option>').val(course.id).text(course.name));
								}
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
		});
	}

}

function getSpecialization(id) {
	$(".course_error").hide();
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
						$('#specialization').empty();
							$('#specialization').append(
									$('<option></option>').val("").text("Select"));
						data.forEach(function(course) {
							$('#specialization').append(
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

function getcourseType() {
	$(".specialization_error").hide();
	$('.course_type_div').show();
}
function getCourseStartYear() {
	$(".course_type_error").hide();
	$('#yearType').text("Course End Year");
	$('.course_start_date').show();
}
$('#course_start_date').on('change', function() {
   $(".course_start_date_error").hide();
   $(".course_end_date").show();
});
$('#course_end_date').on('change', function() {
   $(".course_end_date_error").hide();
   const qualificationValue=$("#degree").val();
   if(qualificationValue == 72 || qualificationValue == 73 || qualificationValue == 74){
	    $('.uni_input').hide();
   }else
   {
	   $('.uni_input').show();
   }
  
});
$(document).ready(function() {
	$(".selet2Single").select2({});
});
function getGradingSystem(value) {
	$(".uni_error").hide();
	if (value === "not_in_list") {
		$('.add_new_university').show();
		$('.grading_system_input').show();
	} else {
		$('.add_new_university').hide();
		$('.grading_system_input').show();
	}
}
function getScaling(id) {
	$(".marks_error").hide();
	$(".grading_system_error").hide();
	const qualificationValue=$("#degree").val();
	if(id == 78)
	{
		$('.marksInput').show();
		$('#markslabel').text("Enter the Scale of 10");
		$('#marks').val(" ");
		
	}else if(id == 79)
	{
		$('.marksInput').show();
		$('#markslabel').text("Enter the Scale of 4");
		$('#marks').val(" ");
		
	}else if(id == 80)
	{
		$('.marksInput').show();
		$('#markslabel').text("Enter the Percentage");
		$('#marks').val(" ");
		
	}else if(qualificationValue == 72)
	{
		$('.marksInput').show();
	}else if(qualificationValue == 73)
	{
		$('.marksInput').show();
	}
	else
	{
		$('.marksInput').hide();
		$('#marks').val(" ");
	}
		
}
$('#marks').on('keyup', function() {
	$(".marks_error").hide();
	const gradingValue = $("#grading").val();
	const qualificationValue=$("#degree").val();
	const value=parseInt($("#marks").val());
	var editGrade = document.getElementById('marks');
	if(gradingValue == 78)
	{
		if (value > 0 && value <= 10) {
			editGrade.value = value;
		} else if (value == NaN) {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 10").css("color", "red");
			$(".marks_error").show();
		} else {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 10").css("color", "red");
			$(".marks_error").show();
		}
		
	}else if(gradingValue == 79)
	{
		if (value > 0 && value <= 4) {
			editGrade.value = value;
		} else if (value == NaN) {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 4").css("color", "red");
			$(".marks_error").show();
		} else {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 4").css("color", "red");
			$(".marks_error").show();
		}
		
	}else if(gradingValue == 80)
	{
		if (value > 0 && value <= 100) {
			editGrade.value = value;
		} else if (value == NaN) {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 100").css("color", "red");
			$(".marks_error").show();
		} else {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 100").css("color", "red");
			$(".marks_error").show();
		}
	}else if(qualificationValue == 72)
	{
		if (value > 0 && value <= 100) {
			editGrade.value = value;
		} else if (value == NaN) {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 100").css("color", "red");
			$(".marks_error").show();
		} else {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 100").css("color", "red");
			$(".marks_error").show();
		}
		
	}else if(qualificationValue == 73)
	{
		if (value > 0 && value <= 100) {
			editGrade.value = value;
		} else if (value == NaN) {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 100").css("color", "red");
			$(".marks_error").show();
		} else {
			editGrade.value = "";
			$(".marks_error").text("please enter between 1 to 100").css("color", "red");
			$(".marks_error").show();
		}
	}
});
function saveEducationDetails() {
	console.log('in SaveEducation');
	var highestQualification = $("#degree").val();
	var marks=null;
	var course=null;
	var specialization=null;
	var courseType=null;
	var courseStartDate=null;
	var courseEndDate=null;
	var university=null;
	var newUniversity=null;
	var gradingSystem=null;
	var isValid = true;
	if (highestQualification == 72) {
		$("#course").val("").trigger('change');
		 $("#specialization").val("").trigger('change');
		 $("#course_type").val("").trigger('change');
		 $("#course_start_date").val("").trigger('change');
		 $("#uni").val("").trigger('change');
		 $("#new_university").val(" ");
		 $("#grading").val("").trigger('change');
		 $('.courses_div').hide();
		 $('.specialization_div').hide();
		 $('.course_type_div').hide();
		$('.course_start_date').hide();
		$('.course_end_date').show();
		$('.uni_input').hide();
		$('.add_new_university').hide();
		$('.grading_system_input').hide();
		$('.marksInput').show();
		marks = $("#marks").val();
		courseEndDate=$("#course_end_date").val();
		$('#yearType').text("Enter the Passing Year");
		if (courseEndDate == "" || courseEndDate == null) {
			isValid = false;
			$(".course_end_date_error").text("This field is required").css("color", "red");
			$(".course_end_date_error").show();
		}
		if (marks == "" || marks == null || marks == " ") {
			isValid = false;
			$(".marks_error").text("This field is required").css("color", "red");
			$(".marks_error").show();
		}
		
	}
	else if (highestQualification == 73) {
		console.log("10 called");
		 $("#course").val("").trigger('change');
		 $("#specialization").val("").trigger('change');
		 $("#course_type").val("").trigger('change');
		 $("#course_start_date").val("").trigger('change');
		 $("#uni").val("").trigger('change');
		 $("#new_university").val(" ");
		 $("#grading").val("").trigger('change');
		 $('.courses_div').hide();   
		 $('.specialization_div').hide();
		 $('.course_type_div').hide();
		$('.course_start_date').hide();
		$('.course_end_date').show();
		$('.uni_input').hide();
		$('.add_new_university').hide();
		$('.grading_system_input').hide();
		$('.marksInput').show();
		 marks = $("#marks").val();
		courseEndDate=$("#course_end_date").val();
		$('#yearType').text("Enter the Passing Year");
		if (courseEndDate === "" || courseEndDate == null) {
			isValid = false;
			$(".course_end_date_error").text("This field is required").css("color", "red");
			$(".course_end_date_error").show();
		}
		if (marks == "" || marks == null || marks == " ") {
			isValid = false;
			$(".marks_error").text("This field is required").css("color", "red");
			$(".marks_error").show();
		}
	} else if (highestQualification == 74) {
		isValid = true;
		gradingSystem = $("#grading").val();
		 $("#course").val("").trigger('change');
		 $("#specialization").val("").trigger('change');
		 $("#course_type").val("").trigger('change');
		 $("#course_start_date").val("").trigger('change');
		 $("#course_end_date").val("").trigger('change');
		 $("#uni").val("").trigger('change');
		 $("#new_university").val(" ");
		 $("#passing_year").val("").trigger('change');
		 $("#marks").val("");
		 $('.courses_div').hide();   
		 $('.specialization_div').hide();
		 $('.course_type_div').hide();
		$('.course_start_date').hide();
		$('.course_end_date').hide();
		$('.uni_input').hide();
		$('.add_new_university').hide();
		$('.grading_system_input').hide();
		$('.marksInput').hide();
	}
	else {
		console.log('ELSE');
		 course = $("#course").val();
		 specialization = $("#specialization").val();
		 courseType = $("#course_type").val();
		 courseStartDate = $("#course_start_date").val();
		 courseEndDate = $("#course_end_date").val();
		 university = $("#uni").val();
		 newUniversity = $("#new_university").val();
		 gradingSystem = $("#grading").val();
		 marks = $("#marks").val();
		if (highestQualification == "" || highestQualification == null) {
			isValid = false;
			$(".degree_error").text("This field is required").css("color", "red");
			$(".degree_error").show();
			return
		} else if (course == "" || course == null) {
			isValid = false;
			$(".course_error").text("This field is required").css("color", "red");
			$(".course_error").show();
			return
			
		} else if (specialization == "" || specialization == null) {
			isValid = false;
			$(".specialization_error").text("This field is required").css("color", "red");
			$(".specialization_error").show();
			return
			
		} else if (courseType == "" || courseType == null) {
			isValid = false;
			$(".course_type_error").text("This field is required").css("color", "red");
			$(".course_type_error").show();
			return
			
		} else if (courseStartDate == "" || courseStartDate == null) {
			isValid = false;
			$(".course_start_date_error").text("This field is required").css("color", "red");
			$(".course_start_date_error").show();
			return
			
		} else if (courseEndDate == "" || courseEndDate == null) {
			isValid = false;
			$(".course_end_date_error").text("This field is required").css("color", "red");
			$(".course_end_date_error").show();
			return
			
		} else if (courseEndDate < courseStartDate) {
			isValid = false;
			$(".course_end_date_error").text("invalid").css("color", "red");
			$(".course_end_date_error").show();
			$("#course_end_date").val("");
			return
			
		} else if (university == "" || university == null) {
			isValid = false;
			$(".uni_error").text("This field is required").css("color", "red");
			$(".uni_error").show();
			return
			
		}
		else if (university == "not_in_list") {
			if (newUniversity == null || newUniversity == "") {
				isValid = false;
				$(".add_newuniversity_error").text("This field is required").css("color", "red");
				$(".add_newuniversity_error").show();
				return
				
			} else {
				if (gradingSystem == null || gradingSystem == "") {
					isValid = false;
					$(".grading_system_error").text("This field is required").css("color", "red");
					$(".grading_system_error").show();
					return
				}
				else if (gradingSystem !== null || gradingSystem !== "") {
					if (gradingSystem !== "81" && gradingSystem !== "82") {
						if (marks == "" || marks == null || marks == " ") {
							isValid = false;
							$(".marks").text("This field is required").css("color", "red");
							$(".marks").show();
							return
						}
					}
				}
			}
		} else if (gradingSystem == null || gradingSystem == "") {
			isValid = false;
			$(".grading_system_error").text("This field is required").css("color", "red");
			$(".grading_system_error").show();
			return
		}
		else if (gradingSystem !== null || gradingSystem !== "") {
			if (gradingSystem !== "81" && gradingSystem !== "82") {
				if (marks == "" || marks == null || marks == " ") {
					isValid = false;
					$(".marks").text("This field is required").css("color", "red");
					$(".marks").show();
					return
				}
			}

		} else {
			isValid = true
		}
	}

	if (isValid) {
		$.ajax({
			url:"saveEducationDetails",
			method:"POST",
			data:{
				"educationDetails":{
					"candidateId":document.getElementById('candidateId').value,
					"highestQualification":highestQualification,
					"marks":marks,
					"course":course,
					"specialization":specialization,
					"courseType":courseType,
					"courseStartDate":courseStartDate,
					"courseEndDate":courseEndDate,
					"university":university,
					"newUniversity":newUniversity,
					"gradingSystem":gradingSystem
				}
			},
			success:function(response)
			{
				if(response.errorCode == "0000")
				{
					let url = "lastStep";
					let form = document.createElement('form');
					form.method = 'POST'; 
					form.action = url;
					document.body.appendChild(form);
					form.submit();
				}else
				{
					console.log("error in repsonse");
				}
				
			},
			error:function(response)
			{
				console.log("error reponse",response);
			}
		})
	}
}