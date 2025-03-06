$(document).on('click', '.addSkillSection', function() {
	if ($('.skillsContainer').length < 5) {
		$('.skillsContainer select').each(function() {
			if ($(this).data('select2')) {
				$(this).select2('destroy');
			}
		});
		var newSection = $('.skillsContainer').first().clone(); // Clone the first work section
		// newSection.find('input[type="text"], input[type="date"]').val(''); // Clear input values
		newSection.find('select').val(''); // Clear select value
		newSection.find('select').each(function() {
			var oldId = $(this).attr('id');
			var newId = oldId + '_' + ($('.skillsContainer').length + 1);
			$(this).attr('id', newId);
		});
		newSection.appendTo('#skillsContainerParent'); // Append the cloned section to the container
		fetchSkills(function(skills) {
			populateSkills(newSection, skills); // Populate the new section with skills
			newSection.find('select').select2();
			updateSkillButtons(); // Update the visibility of + and - buttons
		});

	}
	else {
		showToast("info","You can add a maximum of 5 skill sections");
	}
});

$(document).on('click', '.deleteSkillSection', function() {
	if ($('.skillsContainer').length > 1) {
		$(this).closest('.skillsContainer').remove(); // Remove the closest workContainer section
		updateSkillButtons(); // Update the visibility of + and - buttons
	}
});

function updateSkillButtons() {
	$('.skillsContainer').each(function(index) {
		if (index === $('.skillsContainer').length - 1) {
			$(this).find('.addSkillSection').show();
			$(this).find('.deleteSkillSection').show();
		} else {
			$(this).find('.addSkillSection').hide();
			$(this).find('.deleteSkillSection').show();
		}
	});
}

function currently_working_function() {
	if ($("#notice-period-yes").is(":checked")) {
		$(".notice_period").show();
		$(".last_working_date").show();
		$('#last_working_date').prop('disabled', true);
	}
	else {
		$(".notice_period").hide();
		$(".last_working_date").hide();
	}
}
$(".currently_working_class").click(function() {
	currently_working_function();
});
$(".wfh-class").click(function() {
	work_from_home();
});
$(".ready_to_relocate_class").click(function() {
	ready_to_relocate();
});
$(".offer_in_hand_class").click(function() {
	offer_in_hand();
});
function work_from_home() {
	if ($("#wfh-yes").is(":checked")) {
		$(".ready_to_relocate").hide();
		$(".pref_location").hide();
	}
	else {
		$(".ready_to_relocate").show();
		$(".pref_location").show();
	}
}
function ready_to_relocate() {
	if ($("#relocate-yes").is(":checked")) {
		$(".pref_location").hide();
		// $(".last_working_date").show();  
	}
	else {
		// $(".notice_period").show();
		$(".pref_location").show();
	}
}

function offer_in_hand() {
	if ($("#offer-yes").is(":checked")) {
		$(".offered_ctc").show();
		$(".joining_date").show();
	}
	else {
		// $(".notice_period").show();
		$(".offered_ctc").hide();
		$(".joining_date").hide();
	}
}
$("#notice_period").keyup(function() {
	$('#noticePeriodDaysError').hide();
	var notice_period = parseInt($("#notice_period").val(), 10);
	if(notice_period <= 90)
	{
		var today = new Date();
	var maxDate = new Date();
	maxDate.setDate(maxDate.getDate() + notice_period);
	$('#last_working_date').datepicker('destroy');
	$('#last_working_date').datepicker({
		format: 'dd-mm-yyyy',
		autoclose: true,
		startDate: today,
		endDate: maxDate
	});
	$('#last_working_date').prop('disabled', false);
	}else
	{
		$("#notice_period").val("");
		$('#last_working_date').prop('disabled', true);
	}
	
});
$("#offered_ctc").blur(function() {
	$('#offeredCtcError').hide();
	var offered_ctc = $(this).val();
	var regex = /^[1-9]\d{0,11}$/;

	if (!regex.test(offered_ctc)) {
		$(".offered_ctc_error").text('CTC must be a number between 1 and 999,999,999,999 without leading zeros.').show().fadeOut(4000);
		$(this).val(''); // Clear the input field if validation fails
	} else {
		$(".offered_ctc_error").text('');
	}
});
$('#joining_date').datepicker('destroy');
var today = new Date();
var maxDate = new Date();
maxDate.setMonth(maxDate.getMonth() + 6);
$('#joining_date').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true,
	startDate: today,
	endDate: maxDate
});

/*
$("#skillExp,#skillExpMonth").change(function() {
	var skillExp = $("#skillExp").val();
	var skillExpMonth = $("#skillExpMonth").val();
	var total_exp_years = $("#total_exp_years").val();
	var total_exp_months = $("#total_exp_months").val();

	if (((parseInt(skillExp) * 12) + (parseInt(skillExpMonth))) > ((parseInt(total_exp_years) * 12) + (parseInt(total_exp_months)))) {
		$(".skillExp_error").text("Relative experience can't be greater than total experience");
		$(".skillExp_error").show();
		$(".skillExp_error").fadeOut(4000);
		$("skillExp").val()
		$('#skillExpMonth').val("").trigger('change');
		return false;
	}
	if(skillExp == total_exp_years)
	{
		if(skillExpMonth > total_exp_months)
		{
			$('#skillExpMonth').val("").trigger('change');
			$(".skillExp_error").text("Relative experience can't be greater than total experience");
			return false;
		}
		
	}
});*/

$(document).on('change', '.skillExp, .skillExpMonth', function () {
        const container = $(this).closest('.skillsContainer'); // Get the parent skillsContainer
        const years = container.find('.skillExp').val(); // Get the value of the years dropdown
        const months = container.find('.skillExpMonth').val(); // Get the value of the months dropdown
        const total_exp_years = $("#total_exp_years").val();
		const total_exp_months = $("#total_exp_months").val();

        // Validate the experience
        if(((parseInt(years) * 12) + (parseInt(months))) > ((parseInt(total_exp_years) * 12) + (parseInt(total_exp_months))))
        {
			container.find('.skillset_error').text("Relative experience can't be greater than total experience").stop(true, true) 
                .fadeIn() // Show the error
                .delay(4000) // Wait for 3 seconds
                .fadeOut(); // Fade out the error
            container.find('.skillExp, .skillExpMonth').val('').trigger('change');;
               return false;
			
		}
    });

function populateSkills(section, skills) {
	var skillDropdown = section.find('select[name="additional_skills"]');
	skillDropdown.empty().append('<option value="">Select skill</option>');

	skills.forEach(function(skill) {
		skillDropdown.append('<option value="' + skill.id + '">' + skill.name + '</option>');
	});
}

var isValidPincode = true;
function workdetailsSubmit() {
	var selectedSkills = new Set();
	var isValid = true;
	var skillToSave = [];

	if (isValidPincode == false) {
		$('.pincode_error').text('It is invalid pincode').css("color", "red").show();
		isValid = false;
	}
	if ($('#pincode').val() == "" || $('#pincode').val() == null) {
		$('.pincode_error').text('please fill out this field').css("color", "red").show();
	}

	if ($('#current_ctc').val() == "" || $('#current_ctc').val() == null) {
		$('#current_ctc_error').text('please fill out this field').css("color", "red");
		$('#current_ctc_error').show();
		isValid = false;
	}
	$('#current_ctc').on('keydown', function(event) {
		$('#current_ctc_error').hide();
	});

	if ($('#expected_ctc').val() == "" || $('#expected_ctc').val() == null) {
		$('#expected_ctc_error').text('please fill out this field').css("color", "red");
		$('#expected_ctc_error').show();
		isValid = false;
	}
	$('#expected_ctc').on('keydown', function(event) {
		$('#expected_ctc_error').hide();
	});

	if (!$('input[name="wfh-option"]:checked').length) {
		$('#wfherror').text('please fill out this field').css("color", "red");
		$('#wfherror').show();
		isValid = false;
	}
	$('.wfh-class').on('change', function(event) {
		$('#wfherror').hide();
	});

	const selectedValueofwfh = $('input[name="wfh-option"]:checked').val();
	if (selectedValueofwfh === "NO") {
		if (!$('input[name="relocate-option"]:checked').length) {
			$('#relocateerror').text('please fill out this field').css("color", "red");
			$('#relocateerror').show();
			isValid = false;
		}
	}

	$('.ready_to_relocate_class').on('change', function(event) {
		$('#relocateerror').hide();
	});

	if ($('#current_location').val() == "" || $('#current_location').val() == null) {
		$('#current_location_error').text('please fill out this field').css("color", "red");
		$('#current_location_error').show();
		isValid = false;
	}
	$('#current_location').on('change', function(event) {
		$('#current_location_error').hide();
	});
	if ($('#total_exp_years').val() == "" || $('#total_exp_years').val() == null) {
		$('#total_exp_years_error').text('please fill out this field').css("color", "red");
		$('#total_exp_years_error').show();
		isValid = false;
	}
	$('#total_exp_years').on('keydown', function(event) {
		$('#total_exp_years_error').hide();
	});
	if ($('#total_exp_months').val() == "" || $('#total_exp_months').val() == null) {
		$('#total_exp_months_error').text('please fill out this field');
		$('#total_exp_months_error').show();
		isValid = false;
	}
	$('#total_exp_months').on('keydown', function(event) {
		$('#total_exp_months_error').hide();
	});
	const selectedValueofrelocate = $('input[name="relocate-option"]:checked').val();
	if (selectedValueofrelocate === "NO") {
		if ($('#pref_location').val() == "" || $('#pref_location').val() == null) {
			$('#pref_location_error').text('please fill out this field');
			$('#pref_location_error').show();
			isValid = false;
		}
	}

	if (!$('input[name="notice-period-option"]:checked').length) {
		$('#servingnNoticePeriodError').text('please fill out this field').css("color", "red");
		$('#servingnNoticePeriodError').show();
		isValid = false;
	}
	const selectedValueofnoticepriod = $('input[name="notice-period-option"]:checked').val();
	if (selectedValueofnoticepriod === "YES") {
		if ($('#notice_period').val() == "" || $('#notice_period').val() == null) {
			$('#noticePeriodDaysError').text('please fill out this field');
			$('#noticePeriodDaysError').show();
			isValid = false;
		}
		if ($('#last_working_date').val() == "" || $('#last_working_date').val() == null) {
			$('#lastWorkingDayError').text('please fill out this field');
			$('#lastWorkingDayError').show();
			isValid = false;
		}
	}
	$('#last_working_date').on('change', function(event) {
		$('#lastWorkingDayError').hide();
	});
	$('#last_working_date').on('change', function(event) {
		$('#lastWorkingDayError').hide();
	});
	$('.currently_working_class').on('change', function(event) {
		$('#servingnNoticePeriodError').hide();
	});

	if (!$('input[name="offer-option"]:checked').length) {
		$('#offerinhanderror').text('please fill out this field').css("color", "red");
		$('#offerinhanderror').show();
		isValid = false;
	}
	const selectedValueofofferinhand = $('input[name="offer-option"]:checked').val();
	if (selectedValueofofferinhand === "YES") {
		if ($("#offered_ctc").val() == "" || $("#offered_ctc").val() == null) {
			$('#offeredCtcError').text('please fill out this field').css("color", "red");
			$('#offeredCtcError').show();

		}
		if ($('#joining_date').val() == "" || $('#joining_date').val() == null) {
			$('#joindateError').text('please fill out this field').css("color", "red");
			$('#joindateError').show();

		}
	}





	$('.offer_in_hand_class').on('change', function(event) {
		$('#offerinhanderror').hide();
	});

	$('#pref_location').on('change', function(event) {
		$('#pref_location_error').hide();
	});
	$('#stateLocation').prop("disabled", false);
	if ($('#stateLocation').val() == "" || $('#stateLocation').val() == null) {
		$('#state_location_error').text('please fill out this field');
		$('#state_location_error').show();
		isValid = false;
	}
	$('#stateLocation').prop("disabled", true);
	$('.skillsContainer').each(function() {
		var skill = $(this).find('select[name="additional_skills"]').val();
		var parentContainer = $(this).closest('.skillsContainer');
		var skillExp = parentContainer.find('select[name="skillExp"]').val();
		var skillExpMonth = parentContainer.find('select[name="skillExpMonth"]').val();
		var selectedSkillName = parentContainer.find('select[name="additional_skills"] option:selected').text();

		if (selectedSkills.has(skill)) {
			showToast("info","The skill '" + selectedSkillName + "' has already been selected.");
			$(this).find('.skillset_error').text("This skill has already been selected.");
			$(this).find('.skillset_error').show();
			$(this).find('.skillset_error').fadeOut(4000);
			isValid = false;
			return false;
		}
		if (!skill || skill == "") {
			$(this).find('.skillset_error').text("Please select skillset");
			$(this).find('.skillset_error').show();
			$(this).find('.skillset_error').fadeOut(4000);
			isValid = false;
			return false;
		}
		if (!skillExp || skillExp == "") {
			$(this).find('.skillExp_error').text("Please select years");
			$(this).find('.skillExp_error').show();
			$(this).find('.skillExp_error').fadeOut(4000);
			isValid = false;
			return false;
		}
		if (skillExp == 0) {
			if (skillExpMonth == 0) {
				$(this).find('.skillExp_error').text("Experience should not be 0");
				$(this).find('.skillExp_error').show();
				$(this).find('.skillExp_error').fadeOut(4000);
				isValid = false;
				return false;
			}
		}

		if (skillExpMonth == 0) {
			if (skillExp == 0) {
				$(this).find('.skillExpMonth_error').text("Please select experience");
				$(this).find('.skillExpMonth_error').show();
				$(this).find('.skillExpMonth_error').fadeOut(4000);
				isValid = false;
				return false;
			}
		}

		if (!skillExpMonth || skillExpMonth == "") {
			$(this).find('.skillExpMonth_error').text("Please select months");
			$(this).find('.skillExpMonth_error').show();
			$(this).find('.skillExpMonth_error').fadeOut(4000);
			isValid = false;
			return false;
		}

		if (skillExp == "") {
			if (skillExpMonth == "") {
				$(this).find('.skillExp_error').text("Experience should not be 0");
				$(this).find('.skillExp_error').show();
				$(this).find('.skillExp_error').fadeOut(4000);
				isValid = false;
				return false;
			}
		}
		if (!isValid) {
			return false; // Exit the each() loop
		}
		if (isValid) {
			selectedSkills.add(skill); // Add skill to the Set
			skillToSave.push({
				skill: skill,
				skillExp: skillExp,
				skillExpMonth: skillExpMonth,
				selectedSkillName: selectedSkillName
			});
		}
	});

	if (isValid) {
		var current_ctc = $("#current_ctc").val();
		var expected_ctc = $("#expected_ctc").val();
		var pincode = $("#pincode").val();
		$('#stateLocation').prop("disabled", false);
		var state = $("#stateLocation").val();
		$('#stateLocation').prop("disabled", true);
		var current_location = $("#current_location").val();
		var preferred_location = $("#pref_location").val();
		var workfromhome = null;
		var readytolocate = null;
		var serving_notice_period = null;
		var offer_in_hand = null;
		if ($("#wfh-yes").is(":checked")) {
			workfromhome = "YES";
		} else {
			workfromhome = "NO";
		}
		if ($("#relocate-yes").is(":checked")) {
			readytolocate = "YES";
		} else {
			readytolocate = "NO";
		}
		if ($("#notice-period-yes").is(":checked")) {
			serving_notice_period = 'YES';
		} else {
			serving_notice_period = 'NO';
		}
		var notice_period = $("#notice_period").val();
		var last_working_date = $("#last_working_date").val();
		if ($("#offer-yes").is(":checked")) {
			offer_in_hand = 'YES';
		} else {
			offer_in_hand = 'NO';
		}
		var offered_ctc = $("#offered_ctc").val();
		var joining_date = $("#joining_date").val();
		var total_exp_years = $("#total_exp_years").val();
		var total_exp_months = $("#total_exp_months").val();
		var sessionData = document.getElementById("sessionData");
		var username =  sessionData.getAttribute("data-candidateid");
		$(".loader").css("display", "");
		$(".loader").show();
		$.ajax({
			url: "/candiateExperienceRegistered",
			method: 'POST',
			data: {
				"candidateId": username,
				"currentCtc": current_ctc,
				"expectedCtc": expected_ctc,
				"currentLocation": current_location,
				"workFromHome": workfromhome,
				"readyToRelocate": readytolocate,
				"preferredLocation": preferred_location,
				"serviceNoticePeriod": serving_notice_period,
				"noticePeriod": notice_period,
				"lastWorkingDate": last_working_date,
				"offerInHand": offer_in_hand,
				"offeredCtc": offered_ctc,
				"joiningDate": joining_date,
				"totalExperience": total_exp_years + "_" + total_exp_months,
				"keySkills": skillToSave,
				"pincode": pincode,
				"state": state
			},
			success: function(result) {
				 $(".loader").css("display", "block");
				$(".loader").hide();
				if (result.errorCode === "0000") {
					let url = "employmentDetails";
					let form = document.createElement('form');
					form.method = 'POST'; 
					form.action = url;
					document.body.appendChild(form);
					form.submit();
				} else {
					showToast("error","Failed in fetch");
				}
				console.log("result: ", result);
			},
			error: function(xhr, status, error) {
				$(".loader").css("display", "block");
				$(".loader").hide();
				console.log("Error: ", xhr.responseText);
				console.log("Error: ", error);
			}
		});
	}
}
$(document).ready(function() {
    // Initialize Select2 on all relevant dropdowns
   /*  $('#additional_skillsets').prop('disabled', true);
    $('#skillExp').prop('disabled', true);
    $('#skillExpMonth').prop('disabled', true); */
    $('#additional_skillsets').on('change', function() {
    	var selectedValue = $(this).val();
    	if($("#total_exp_years").val() == "")
    	{
    		$('#total_exp_years_error').text("Please select years");
    		$('#total_exp_years_error').show();
    		$('#additional_skillsets').val("").trigger('change');
    		$('#skillExp').val("")
    		$('#skillExpMonth').val("")
    	}else if($("#total_exp_months").val() == "" || $("#total_exp_years").val() == "")
    	{
    		$('#total_exp_years_error').hide();
    		$('#total_exp_months_error').text("Please select months");
    		$('#total_exp_months_error').show();
    		$('#additional_skillsets').val("").trigger('change');
    		$('#skillExp').val("");
    		$('#skillExpMonth').val("");
    	}
    	else
    	{
    		$('#total_exp_years_error').hide();
    		$('#total_exp_months_error').hide();
    	}
    	$('#skillExp').val("");
    	$('#skillExpMonth').val("");
    });
    
    
  
    $('.selet2Single').select2();
    $('#total_exp_years').on('change', function() {
        $('#total_exp_years_error').hide();
        console.log("Months: ", $('#total_exp_months').val());
        
        var yearsExp = $(this).val();
        var months = $('#total_exp_months').val();

        if (yearsExp > 0 && yearsExp !== "") {
            // Populate skillExp dropdown with years experience
            var skillExpDropdown = $('.skillExp');
            skillExpDropdown.empty().append('<option value="" class="experience">Select Year</option>');
            for (var i = 0; i <= yearsExp; i++) {
                skillExpDropdown.append('<option value="' + i + '">' + i +' Year'+ '</option>');
            }
            skillExpDropdown.select2('destroy').select2();

            // Populate skillExpMonth dropdown with months experience (0-12)
            var skillExpDropdown1 = $('.skillExpMonth');
            skillExpDropdown1.empty().append('<option value="" class="experience">Select Month</option>');
            for (var j = 0; j <= 11; j++) {
                skillExpDropdown1.append('<option value="' + j + '">' + j +' Month'+ '</option>');
            }
            skillExpDropdown1.select2('destroy').select2();

        } else if (months === "0" && yearsExp == 0) {
            // If both years and months are 0, show error
            $('#total_exp_years_error').text("Please enter a valid value.");
            $('#total_exp_years_error').show();
            $('#total_exp_years').val("").trigger('change');

        } else if (yearsExp == 0 && months !== "0") {
            // If years are 0 but months are not, handle months experience only
            var skillExpDropdown = $('.skillExp');
            skillExpDropdown.empty().append('<option value="" class="experience">Select Year</option>');
            for (var i = 0; i <= yearsExp; i++) {
                skillExpDropdown.append('<option value="' + i + '">' + i +' Year' + '</option>');
            }
            skillExpDropdown.select2('destroy').select2();
            
            // Populate skillExpMonth dropdown with months experience (0-12)
            var skillExpDropdown1 = $('.skillExpMonth');
            skillExpDropdown1.empty().append('<option value="" class="experience">Select Month</option>');
            for (var j = 0; j <=months ; j++) {
                skillExpDropdown1.append('<option value="' + j + '">' + j +' Month'+ '</option>');
            }
            skillExpDropdown1.select2('destroy').select2();
        }
    });

    $('#total_exp_months').on('change', function() {
    	$('#total_exp_months_error').hide();
    	var expMonths=$(this).val();
		var expYears=$('#total_exp_years').val();
		if(expYears == "0" && expMonths== "0")
		{
			$('#total_exp_months').val(""); 
			$('#total_exp_months_error').html("please enter the valid value");
    		$('#total_exp_months_error').show();
    		
		}
		else if(expYears !="0")
		{
			var selectedValue = $(this).val();
                var skillExpDropdown = $('.skillExpMonth');

                // Clear existing options
                skillExpDropdown.empty().append('<option value="" class="experience">Select Month</option>');

                // Populate new options based on the selected total experience years
                for (var i = 0; i <= 11; i++) {
                    skillExpDropdown.append('<option value="' + i + '">' + i +' Month'+ '</option>');
                }

                // Refresh the Select2 dropdown
                skillExpDropdown.select2('destroy').select2();
		
		}else if(expYears == "0" && expMonths !=="0")
		{
			var selectedValue = $(this).val();
                var skillExpDropdown = $('.skillExpMonth');

                // Clear existing options
                skillExpDropdown.empty().append('<option value="" class="experience">Select Month</option>');

                // Populate new options based on the selected total experience years
                for (var i = 0; i <= selectedValue; i++) {
                    skillExpDropdown.append('<option value="' + i + '">' + i +' Month'+'</option>');
                }

                // Refresh the Select2 dropdown
                skillExpDropdown.select2('destroy').select2();
		
		}
        
    });
});
$(document).ready(function() {
    $('#select2Single').select2();
    $('#current_location').attr('disabled', 'disabled');
});
$('#pincode').on('keyup', function() {
	$('.pincode_error').hide(); 
	var selectedId = $(this).val(); 
	 if (selectedId.length === 6) {
		 $('#state_location_error').hide();
		 fetchCities(selectedId);
		$('#current_location').removeAttr('disabled');
	 }else
	{
		 $('.pincode_error').text('Please enter a valid 6-digit pincode.').css("color","red").show();
	}
	 
});

function fetchCities(id)
{
	$.ajax({
	    url: "getPoastalCode",
	    method: "POST",
	    data: {
	        "pincode": id
	    },
	    success: function (response) {
	        console.log(response);
	        if (response[0] !== null) {
	            if (response[0].PostOffice !=null) {
	            	isValidPincode=true
	                var postOffices = response[0].PostOffice;
	                if (postOffices.length > 0) {					/*if (postOffices.length == 1) {*/
	                    $('#current_location').remove();
	                    $('#currentlocationModal').find('span').remove();
	                    $('#current_location').select2('destroy');
	                    $('#current_location1').remove();
	                    $('#current_location_error').remove();
	                    $('#stateLocation').prop("disabled", true);
	                    $("#stateLocation").val(postOffices[0].State);
	                    $('#currentlocationModal').show();

	                    // Create the input box dynamically
	                    var $input = $('<input>', {
	                        id: 'current_location',
	                        type: 'text',
	                        class: 'form-control',
	                        placeholder: 'Enter other city',
	                        disabled: true,
	                        value: postOffices[0].Region
	                    });
	                    $('#currentlocationModal .form-group').append($input);
	                    
	                    // Add the error span after the inp	ut
	                    var $errorSpan = $('<span>', {
	                        class: 'errorfield',
	                        id: 'current_location_error'
	                    });
	                    
	                    $('#currentlocationModal .form-group').append($errorSpan);
	                    $('#current_location').next(".select2-container").hide();
	                    $('#statelocationModal').show();
	                } else {
	                    $('#current_location').remove();
	                    $('#currentlocationModal').find('span').remove();
	                    $('#current_location_error').remove();
	                    $('#statelocationModal').show();
	                    $('#stateLocation').val(postOffices[0].State);
	                    $('#stateLocation').prop("disabled", true);

	                    // Create the select element dynamically
	                    var $select = $('<select>', {
	                        id: 'current_location',
	                        class: 'form-control selet2Single',
	                        css: { width: '100%' }
	                    });

	                    // Add a placeholder option
	                    $select.append('<option value="" disabled selected>Select a city</option>');

	                    // Dynamically populate the dropdown
	                    $.each(postOffices, function (index, postOffice) {
	                        $select.append($('<option>', {
	                            value: postOffice.Name,
	                            text: postOffice.Name
	                        }));
	                    });
						
	                    $('#currentlocationModal .form-group').append($select);

	                    // Initialize Select2 on the newly created select element
	                    $select.select2({
	                        placeholder: "Select a city", // Placeholder text
	                        allowClear: false // Allow clearing the selection
	                    });
						
	                    // Add the error span after the input
	                    var $errorSpan = $('<span>', {
	                        class: 'errorfield',
	                        id: 'current_location_error'
	                    });
	                    
	                    $('#currentlocationModal .form-group').append($errorSpan);
	                   
	                    
	                    // Optionally display the modal containing the dropdown
	                    $('#currentlocationModal').show();
	                }
	            }else
	            {
	            	$('.pincode_error').text('It is invalid pincode').css("color","red").show();
	            	isValidPincode=false
	            }
	        }else
	        {
	        	
	        	$('#statelocationModal').hide();
	        	$('#currentlocationModal').hide();
	        	$('#current_location').remove();
	        	isValidPincode=false
	        }	
	        	
	    },
	    error: function (response) {
	        console.log("error", response);
	    }
	});

}
$(document).ready(function() {
    $('#currentlocationModal').hide();
    $('#statelocationModal').hide();
});
$("#current_ctc").on("input", function () {
            let input = $(this).val();

            // Remove leading zeros and non-numeric characters
            input = input.replace(/^0+/, '');

            // Limit input to 8 digits
            if (input.length > 8) {
                input = input.substring(0, 8);
            }

            // Set the sanitized value back to the input field
            $(this).val(input);

            // Display an error message if the input exceeds 8 digits
            const errorField = $("#current_ctc_error");
            if (input.length === 0) {
                errorField.text("This field is required.");
            } else if (input.length > 8) {
                errorField.text("Only 8 digits are allowed.");
            } else {
                errorField.text(""); // Clear the error message
            }
    displayValueInWords(input);
});
$("#offered_ctc").on("input", function () {
            let input = $(this).val();

            // Remove leading zeros and non-numeric characters
            input = input.replace(/^0+/, '');

            // Limit input to 8 digits
            if (input.length > 8) {
                input = input.substring(0, 8);
            }

            // Set the sanitized value back to the input field
            $(this).val(input);

            // Display an error message if the input exceeds 8 digits
            const errorField = $("#current_ctc_error");
            if (input.length === 0) {
                errorField.text("This field is required.");
            } else if (input.length > 8) {
                errorField.text("Only 8 digits are allowed.");
            } else {
                errorField.text(""); // Clear the error message
            }
    displayValueInWords2(input);
});
/*$('#expected_ctc').on('input', function(event) {
    var value = $('#expected_ctc').val();
    displayValueInWords1(value);
});*/
$("#expected_ctc").on("input", function () {
            let input = $(this).val();

            // Remove leading zeros and non-numeric characters
            input = input.replace(/^0+/, '');

            // Limit input to 8 digits
            if (input.length > 8) {
                input = input.substring(0, 8);
            }

            // Set the sanitized value back to the input field
            $(this).val(input);

            // Display an error message if the input exceeds 8 digits
            const errorField = $("#expected_ctc_error");
            if (input.length === 0) {
                errorField.text("This field is required.");
            } else if (input.length > 8) {
                errorField.text("Only 8 digits are allowed.");
            } else {
                errorField.text(""); // Clear the error message
            }
        displayValueInWords1(input);
});
function numberToWordsIndianCurrency(number) {
		    const ones = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"];
		    const teens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"];
		    const tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
		    const scales = ["", "Thousand", "Lakh", "Crore"]; // Indian scales

		    if (number === 0) return "Zero Rupees";

		    let words = "";

		    function getHundreds(num) {
		        let result = "";
		        if (num > 99) {
		            result += ones[Math.floor(num / 100)] + " Hundred ";
		            num %= 100;
		        }
		        if (num > 19) {
		            result += tens[Math.floor(num / 10)] + " ";
		            num %= 10;
		        } else if (num >= 10) {
		            result += teens[num - 10] + " ";
		            return result;
		        }
		        result += ones[num] + " ";
		        return result;
		    }

		    // Process the number in Indian scales: Crore, Lakh, Thousand, Hundred, etc.
		    if (number >= 10000000000) { // For Lakh Crores
		        let lakhCrorePart = Math.floor(number / 10000000000);
		        words += getHundreds(lakhCrorePart) + "Lakh Crore ";
		        number %= 10000000000;
		    }
		    if (number >= 10000000) { // For Crores
		        let crorePart = Math.floor(number / 10000000);
		        words += getHundreds(crorePart) + "Crore ";
		        number %= 10000000;
		    }
		    if (number >= 100000) { // For Lakhs
		        let lakhPart = Math.floor(number / 100000);
		        words += getHundreds(lakhPart) + "Lakh ";
		        number %= 100000;
		    }
		    if (number >= 1000) { // For Thousands
		        let thousandPart = Math.floor(number / 1000);
		        words += getHundreds(thousandPart) + "Thousand ";
		        number %= 1000;
		    }
		    if (number > 0) { // For Hundreds and below
		        words += getHundreds(number);
		    }

		    return words.trim() + " 	Rupees"; // Append "Rupees" at the end
		}
		
		function displayValueInWords(inputElement) {
	    const words = inputElement ? numberToWordsIndianCurrency(inputElement) : '';
	    $('#inRuppes').text(words).css('color','blue');
	}
function displayValueInWords1(inputElement) {
	    const words = inputElement ? numberToWordsIndianCurrency(inputElement) : '';
	    $('#expectedCtcRuppes').text(words).css('color','blue');
	}
function displayValueInWords2(inputElement) {
	    const words = inputElement ? numberToWordsIndianCurrency(inputElement) : '';
	    $('#offerCtc').text(words).css('color','blue');
	}
