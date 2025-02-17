$(document).on('click', '.addSection', function() {
	    if ($('.workContainer').length < 5) {
	      $('.workContainer select').each(function() {
	            if ($(this).data('select2')) {
	                $(this).select2('destroy');
	            }
	        });
	      var newSection = $('.workContainer').first().clone(); // Clone the first work section
	      
	      newSection.find('input[type="text"], input[type="date"]').val(''); // Clear input values
	      newSection.find('select').val(''); // Clear select value
	      newSection.find('select').each(function() {
	          var oldId = $(this).attr('id');
	          var newId = oldId + '_' + ($('.workContainer').length + 1);
	          $(this).attr('id', newId);
	      });
	      newSection.appendTo('#workContainerParent'); // Append the cloned section to the container
	      $('.workContainer select').select2();
	      updateButtons(); // Update the visibility of + and - buttons
	    }
	    else{
	      $(".maximum_skills_error").text("You can add upto 5 skills");
	      $(".maximum_skills_error").show();
	      $(".maximum_skills_error").fadeOut(4000);
	      return false;
	    }
	   nextContainer.call(this);
});

/*$(document).on('click', '.addSection', function() {
	if ($('.workContainer').length < 5) {
		var value = $('.workContainer').length;
		var startYear = $('.jobEndYear' + value).val();
		var uniqueId = $('.workContainer').length + 1;
		// Create a new section element manually
		var newSection = $('<div class="workContainer row">').append(
			$('<div class="col-lg-6 col-md-6 col-sm-12">').append(
				$('<div class="form-group">').append(
					$('<label>').attr('for', 'jobtitle').addClass('form-label required').text('Your Job title'),
					$('<input>').attr({ type: 'text', name: 'Job_Title', class: 'form-control', placeholder: 'Enter Job title', maxlength: '80', required: true })
				),
				$('<span>').addClass('job_title_error').css('color', 'red')
			),
			$('<div class="col-lg-6 col-md-6 col-sm-12">').append(
				$('<div class="form-group">').append(
					$('<label>').attr('for', 'jobcompany').addClass('form-label required').text('Company Name'),
					$('<select>').attr({ id: 'jobCompany' + uniqueId, name: 'job_company', class: 'form-control', required: true, onchange: "companyChange(this.value)" })
						.append($('<option>').val('').text('Select Company')) // Default option
				),
				$('<span>').addClass('job_company_error').css('color', 'red')
			),
			$('<div class="col-lg-3 col-md-3 col-sm-6">').append(
				$('<div class="form-group">').append(
					$('<label>').attr('for', 'jobStartYear').addClass('form-label required').text('Start Year'),
					$('<select>').attr({ class: 'selet2Single form-control jobStartYear', name: 'jobStartYear', id: 'jobStartYear_' + uniqueId, required: true }).append(
						$('<option>').attr('value', '').text('Select').prop('disabled', true).prop('selected', true),
						(function() {
							var options = [];
							var currentYear = new Date().getFullYear();
							for (var year = startYear; year <= currentYear; year++) {
								options.push($('<option>').attr('value', year).text(year));
							}
							return options;
						})()
					)
				),
				$('<span>').addClass('start_year_error errorfield')
			),
			$('<div class="col-lg-3 col-md-3 col-sm-6">').append(
				$('<div class="form-group">').append(
					$('<label>').attr('for', 'jobStartMonth').addClass('form-label required').text('Month'),
					$('<select>').attr({ class: 'selet2Single form-control', name: 'jobStartMonth', required: true }).append(
						$('<option>').attr('value', '').text('Select').prop('disabled', true).prop('selected', true),
						$('<option>').attr('value', 'January').text('January'),
						$('<option>').attr('value', 'February').text('February'),
						$('<option>').attr('value', 'March').text('March'),
						$('<option>').attr('value', 'April').text('April'),
						$('<option>').attr('value', 'May').text('May'),
						$('<option>').attr('value', 'June').text('June'),
						$('<option>').attr('value', 'July').text('July'),
						$('<option>').attr('value', 'August').text('August'),
						$('<option>').attr('value', 'September').text('September'),
						$('<option>').attr('value', 'October').text('October'),
						$('<option>').attr('value', 'November').text('Novemeber'),
						$('<option>').attr('value', 'December').text('December')
					)
				),
				$('<span>').addClass('start_month_error errorfield')
			),
			$('<div class="col-lg-3 col-md-3 col-sm-6">').append(
				$('<div class="form-group">').append(
					$('<label>').attr('for', 'jobEndYear').addClass('form-label required').text('Till Year'),
					$('<select>').attr({ class: 'selet2Single form-control jobEndYear' + uniqueId, name: 'jobEndYear', id: 'jobEndYear' + uniqueId, onchange: "validButton('jobStartYear_" + (uniqueId + 1) + "','jobEndYear" + uniqueId + "','jobEndYear_" + (uniqueId + 1) + "')", required: true }).append(
						$('<option>').attr('value', '').text('Select').prop('disabled', true).prop('selected', true),
						(function() {
							var options = [];
							var currentYear = new Date().getFullYear();
							for (var year = startYear; year <= currentYear; year++) {
								options.push($('<option>').attr('value', year).text(year));
							}
							return options;
						})()
					)
				),
				$('<span>').addClass('end_year_error errorfield').css('color', 'red')
			),
			$('<div class="col-lg-3 col-md-3 col-sm-6">').append(
				$('<div class="form-group">').append(
					$('<label>').attr('for', 'jobEndMonth').addClass('form-label required').text('Month'),
					$('<select>').attr({ class: 'selet2Single form-control', name: 'jobEndMonth', required: true }).append(
						$('<option>').attr('value', '').text('Select').prop('disabled', true).prop('selected', true),
						$('<option>').attr('value', 'January').text('January'),
						$('<option>').attr('value', 'February').text('February'),
						$('<option>').attr('value', 'March').text('March'),
						$('<option>').attr('value', 'April').text('April'),
						$('<option>').attr('value', 'May').text('May'),
						$('<option>').attr('value', 'June').text('June'),
						$('<option>').attr('value', 'July').text('July'),
						$('<option>').attr('value', 'August').text('August'),
						$('<option>').attr('value', 'September').text('September'),
						$('<option>').attr('value', 'October').text('October'),
						$('<option>').attr('value', 'November').text('Novemeber'),
						$('<option>').attr('value', 'December').text('December')
					)
				),
				$('<span>').addClass('end_month_error errorfield')
			),
			$('<div class="col-lg-12 col-md-6 col-sm-6">').append(
				$('<button>').attr({ type: 'button', class: 'btn btn-primary btn-md addSection' }).text('+'),
				$('<button>').attr({ type: 'button', class: 'btn btn-danger btn-md deleteSection' }).text('-')
			)
		);
		fetchDetailsCompanys('jobCompany' + uniqueId, null);
		// Append the new section to the container
		newSection.appendTo('#workContainerParent');
		$('.workContainer select').select2();  // Initialize select2 for newly added select elements
		updateButtons(); // Update the visibility of + and - buttons
	}
	else {
		$(".maximum_skills_error").text("You can add up to 5 Experience");
		$(".maximum_skills_error").show().fadeOut(4000);
		return false;
	}
});*/

// Remove section
$(document).on('click', '.deleteSection', function() {
	if ($('.workContainer').length > 1) {
		$(this).closest('.workContainer').remove(); // Remove the closest workContainer section
		updateButtons(); // Update the visibility of + and - buttons
	}
});


// Remove section
$(document).on('click', '.deleteSection', function() {
	if ($('.workContainer').length > 1) {
		$(this).closest('.workContainer').remove(); // Remove the closest workContainer section
		updateButtons(); // Update the visibility of + and - buttons
	}
});

function updateButtons() {
	// Hide all add buttons initially
	$('.addSection').hide();
	// Show delete buttons on all except the last one
	$('.deleteSection').show();
	// Show the add button on the last section and hide its delete button
	$('.workContainer').last().find('.addSection').show();
	if ($('.workContainer').length === 1) {
		$('.workContainer').last().find('.deleteSection').hide();
	}
}

$('.datepicker').datepicker({
	format: 'yy-mm-dd',
	autoclose: true,
});
$(document).ready(function() {
	$(".selet2Single").select2({});
});
var dataToSave = [];
$("#employmentRegisterSubmit").click(function() {
	var isValid = true;

	$('.workContainer').each(function(index) {
		var containerId = $(this).attr('id'); // Dynamically get the container ID
		var jobTitle = $(this).find('input[name="Job_Title"]').val();
		var company = $(this).find('select[name="job_company"]').val();
		var jobStartYear = $(this).find('select[name="jobStartYear"]').val();
		var jobStartMonth = $(this).find('select[name="jobStartMonth"]').val();
		var jobEndYear = $(this).find('select[name="jobEndYear"]').val();
		var jobEndMonth = $(this).find('select[name="jobEndMonth"]').val();
		var currentworking = $(this).find('input[name="currentlywork"]').prop('checked');

		if (jobTitle == "") {
			$(this).find(".job_title_error").text("Job title should not be empty");
			$(this).find(".job_title_error").show();
			$(this).find(".job_title_error").fadeOut(4000);
			$(this).find('input[name="Job_Title"]').val("").focus();
			isValid = false;
		}

		if (company == "") {
			$(this).find(".job_company_error").text("Company Name should not be empty");
			$(this).find(".job_company_error").show();
			$(this).find(".job_company_error").fadeOut(4000);
			$(this).find('input[name="job_company"]').val("").focus();
			isValid = false;
		}

		if (!jobStartYear) {
			$(this).find(".start_year_error").text("Please select Year");
			$(this).find(".start_year_error").show();
			$(this).find(".start_year_error").fadeOut(4000);
			isValid = false;
		}

		if(!currentworking)
		{
			if (!jobEndYear) {
			$(this).find(".end_year_error").text("Please select Year");
			$(this).find(".end_year_error").show();
			$(this).find(".end_year_error").fadeOut(4000);
			isValid = false;

		}
			
		}
		

		if (!jobStartMonth) {
			$(this).find(".start_month_error").text("Please select month name");
			$(this).find(".start_month_error").show();
			$(this).find(".start_month_error").fadeOut(4000);
			isValid = false;

		}
		
		if(!currentworking)
		{
			if (!jobEndMonth) {
			$(this).find(".end_month_error").text("Please select month name");
			$(this).find(".end_month_error").show();
			$(this).find(".end_month_error").fadeOut(4000);
			isValid = false;

			}
		}
		

		const monthValues = {
			"January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6,
			"July": 7, "August": 8, "September": 9, "October": 10, "November": 11, "December": 12
		};

		/*if (jobEndYear && jobStartYear >= jobEndYear) {
			$(this).find(".end_year_error").text("Start year cannot be greater than end year").show().fadeOut(4000);
			isValid = false;

		}*/ /*else if (jobStartYear == jobEndYear) {
			if (monthValues[jobStartMonth] > monthValues[jobEndMonth]) {
				$(this).find(".end_month_error").text("Start month cannot be greater than end month when the years are the same").show().fadeOut(4000);
				console.log("Clearing jobEndMonth");
				$(this).find("#jobEndMonth").val('').focus(); // Clear the end month field
				isValid = false;

			}
		}*/
		var work_status = work_status;
		// Push data to array

	});
	if (isValid) {
		$('.workContainer').each(function(index) {
			var jobTitle = $(this).find('input[name="Job_Title"]').val();
			var company = $(this).find('select[name="job_company"]').val();
			var jobStartYear = $(this).find('select[name="jobStartYear"]').val();
			var jobStartMonth = $(this).find('select[name="jobStartMonth"]').val();
			var jobEndYear = $(this).find('select[name="jobEndYear"]').val();
			var jobEndMonth = $(this).find('select[name="jobEndMonth"]').val();
			var currentworking = $(this).find('input[name="currentlywork"]').prop('checked');
			dataToSave.push({
				jobTittle: jobTitle,
				companyName: company,
				startYear: jobStartYear,
				startMonth: jobStartMonth,
				lastYear: jobEndYear,
				lastMonth: jobEndMonth,
				currentlyWorking:currentworking
			});
		});

		var sessionData = document.getElementById("sessionData");
		var username = sessionData.getAttribute("data-candidateid");
		$(".loader").show();
		$.ajax({
			url: "saveEmployeementDetails", // Replace with your server-side script URL
			method: 'POST',
			data: {
				"candidateId": username,
				"jobExperience": dataToSave
			},
			success: function(response) {
				$(".loader").hide();
				$(".loader").css("display", "block");
				if (response.errorCode === "0000") {
					let url = "education";
					let form = document.createElement('form');
					form.method = 'POST';
					form.action = url;
					document.body.appendChild(form);
					form.submit();
				}
				else {
					showToast("info","Failed in response");
				}
			},
			error: function(xhr, status, error) {
				// Handle error
				$(".loader").hide();
				console.error('Error saving data:', error);
			}
		});
	}
});
function companyChange(selectElement) {
    let selectedValue = $(selectElement).val(); // Get the selected value from the element

    if (selectedValue == "others") {
        // Open the modal
        $('#otherAddModal').modal('show');
        
        // Reset the select element's value to an empty string and trigger change
        $(selectElement).val("").trigger("change");
    } else {
        // Hide the modal if the value is not "others"
        $('#otherAddModal').modal('hide');
    }
}
function fetchDetailsCompany() {
	$.ajax({
		url: "/companyFetchDetails",
		method: 'POST',
		success: function(response) {
			var data = response.data.fetchCompany
			$('#jobcompany').empty();
			$('#jobcompany').append(
				$('<option></option>').val("").text("Select"));
			data.forEach(function(company) {
				$(".loader").hide();
				$('#jobcompany').append(
					$('<option></option>').val(company.id).text(company.name));

			});
			$('#jobcompany').append(
				$('<option></option>').val("others").text("others"));
		},
		error: function(xhr, status, error) {
			console.log("======= company error");
		}
	});
}
function companyMasterSave() {
	let newCompanyName = $("#NewcompanyName").val();
	$.ajax({
		url: "/addNewCompany",
		method: 'POST',
		contentType: 'application/json',
		data: JSON.stringify({
			"newCompany": newCompanyName
		}),
		success: function(response) {
			$('#otherAddModal').modal('hide');
			showToast("success",response.errors.errorMessage);
			fetchDetailsCompanys();
			$(".loader").hide();
		},
		error: function(xhr, status, error) {
			$('#otherAddModal').modal('hide');
			console.log("======= company error");
		}
	});
}

function fetchDetailsCompanys() {
    var options = [];
    $.ajax({
        url: "/companyFetchDetails",
        method: 'POST',
        success: function(response) {
            var data = response.data.fetchCompany;
            // Build the array of options first, using objects
            data.forEach(function(company) {
                options.push({
                    id: company.id,
                    name: company.name
                });
            });

            // Now append the options to each .job_company select element
            $('.workContainer').each(function(index) {
                const selectElement = $(this).find('select[name="job_company"]');
                const selectedCompany = selectElement.val();

                // Empty the select element before appending options
                selectElement.empty();

                // Add a default "Select" option if needed
                selectElement.append($('<option></option>').val("").text("Select"));

                // Append the options from the data
                options.forEach(function(option) {
                    selectElement.append(
                        $('<option></option>').val(option.id).text(option.name)
                    );
                });
				
				 selectElement.append($('<option></option>').val("others").text("others"));
                // Set the selected value if it's already present in the dropdown
                if (selectedCompany) {
                    selectElement.val(selectedCompany).trigger('change');
                }
            });
        },
        error: function(xhr, status, error) {
            console.log("======= company error"+error);
        }
    });
    $(".loader").hide();
}


$(document).ready(function() {
	fetchDetailsCompany();
	$('#addSection').hide();
});
/*function validButton(id, startYearId, valueId) {
	if (valueId === "1") {
		$('#addSection').show();
	}
	else {
		if ($("#" + id).length > 0) {
			$("#" + id).empty();
			$("#" + valueId).empty();
			var currentYear = new Date().getFullYear();
			var startYearId = $('#' + startYearId).val();
			$("#" + id).append(new Option("Select", ""));
			$("#" + valueId).append(new Option("Select", ""));
			for (var year = startYearId; year <= currentYear; year++) {
				var newOption = new Option(year, year);
				$("#" + id).append(newOption);
				$("#" + valueId).append(newOption);
			}
		}
	}

}*/
const months = {
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
    12: "December"
};
const reversedMonths = Object.fromEntries(
    Object.entries(months).map(([key, value]) => [value, Number(key)])
);
function updatestartyear(element)
{
	var workContainer = $(element).closest('.workContainer');
	var prevContainer = workContainer.prev('.workContainer');
	const currentdate = new Date();
	const currentMonth = currentdate.getMonth() + 1;
	var currentYear = new Date().getFullYear();
	const currentYearString = currentYear.toString();
		var jobStartYearDropdown = workContainer.find(".jobStartYear");
		var jobStartMonthDropdown = workContainer.find(".jobStartMonth");
		var jobEndMonthDropdown = workContainer.find('.jobEndMonth');
		var jobEndYearDropdown = workContainer.find('.jobEndYear');
	var addsection=workContainer.find('.addSection');
	addsection.show();
	if(prevContainer.length)
	{
		var preventEndyear=prevContainer.find(".jobEndYear");
		var preventEndmonth=prevContainer.find(".jobEndMonth");
		var jobEndYearDropdown = workContainer.find('.jobEndYear');
		var selectedStartYear = jobStartYearDropdown.val(); 
		const Endyear=preventEndyear.val();
		const EndMonth=preventEndmonth.val();
		if(selectedStartYear === currentYearString)
		{
			var addsection=workContainer.find('.addSection');
			addsection.hide();
			workContainer.nextAll('.workContainer').remove();
			var jobStartMonthDropdown=workContainer.find('.jobStartMonth');
			var jobStartYearDropdown=workContainer.find('.jobStartYear');
			var jobEndYearDropdown=workContainer.find('.jobEndYear');
			var jobEndMonthDropdown=workContainer.find('.jobEndMonth');
			jobEndYearDropdown.empty();
			jobStartMonthDropdown.empty();
			jobEndMonthDropdown.empty();
			jobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndYearDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=1;year<=currentMonth;year++)
			{
				jobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			for(var year=selectedStartYear;year<=currentYear;year++)
			{
				jobEndYearDropdown.append('<option value="'+year+'">'+ year + '</option');
			}
			
		}else if(Endyear === selectedStartYear)
		{
			var jobStartMonthDropdown=workContainer.find('.jobStartMonth');
			var jobStartYearDropdown=workContainer.find('.jobStartYear');
			var jobEndYearDropdown=workContainer.find('.jobEndYear');
			var jobEndMonthDropdown=workContainer.find('.jobEndMonth');
			jobEndYearDropdown.empty();
			jobStartMonthDropdown.empty();
			jobEndMonthDropdown.empty();
			jobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndYearDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=reversedMonths[EndMonth];year<=12;year++)
			{
				jobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			for(var year=Endyear;year<=currentYear;year++)
			{
				jobEndYearDropdown.append('<option value="'+year+'">'+ year + '</option');
			}
		}
		else
		{
			var jobStartMonthDropdown=workContainer.find('.jobStartMonth');
			var jobStartYearDropdown=workContainer.find('.jobStartYear');
			var jobEndYearDropdown=workContainer.find('.jobEndYear');
			var jobEndMonthDropdown=workContainer.find('.jobEndMonth');
			jobEndYearDropdown.empty();
			jobStartMonthDropdown.empty();
			jobEndMonthDropdown.empty();
			jobEndYearDropdown.append('<option value="">' + 'Select' + '</option>');
			jobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=1;year<=12;year++)
			{
				jobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			for(var year=selectedStartYear;year<=currentYear;year++)
			{
				jobEndYearDropdown.append('<option value="'+year+'">'+ year + '</option');
			}
		}
	}else
	{
		var selectedStartYear = jobStartYearDropdown.val(); 
		var selectedStartMonth=jobStartMonthDropdown.val();
		var selectedEndYear=jobEndYearDropdown.val();
		var selectedEndMonth=jobEndMonthDropdown.val();
		
		if(currentYearString === selectedStartYear)
		{
			var addsection=workContainer.find('.addSection');
			addsection.hide();
			workContainer.nextAll('.workContainer').remove();
			jobStartMonthDropdown.empty();
			jobEndMonthDropdown.empty();
			jobEndYearDropdown.empty();
			jobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndYearDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=1;year<=currentMonth;year++)
			{
				jobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			for(var year=selectedStartYear;year<=currentYear;year++)
			{
				jobEndYearDropdown.append('<option value="'+year+'">' + year + '</option>');
			}
		}else
		{
			jobStartMonthDropdown.empty();
			jobEndMonthDropdown.empty();
			jobEndYearDropdown.empty();
			jobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			jobEndYearDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=1;year<=12;year++)
			{
				jobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			for(var year=selectedStartYear;year<=currentYear;year++)
			{
				jobEndYearDropdown.append('<option value="'+year+'">' + year + '</option>');
			}
		}
	}
}

function updatejobEndYear(element)
{
	var workContainer = $(element).closest('.workContainer');
	var nextContainer = workContainer.next('.workContainer');
	var prevContainer = workContainer.prev('.workContainer');
	var currentYear = new Date().getFullYear();
	const currentYearString = currentYear.toString();
	const currentdate = new Date();
	const currentMonth = currentdate.getMonth() + 1;
	var addsection=workContainer.find('.addSection');
	addsection.show();
	
	if(nextContainer.length)
	{
		var jobEndYearDropdown = workContainer.find('.jobEndYear');
		var jobEndMonthDropdown =workContainer.find('.jobEndMonth');
		var jobStartYearDropdown = workContainer.find('.jobStartYear');
		var prevjobEndyear=prevContainer.find('.jobEndYear');
		var prevEndYear=prevjobEndyear.val();
		
		const endyear=jobEndYearDropdown.val();
		const startyear=jobStartYearDropdown.val();
		const endmonth=jobEndMonthDropdown.val();
		
		if(endyear === currentYearString)
		{
			var addsection=workContainer.find('.addSection');
			addsection.hide();
			workContainer.nextAll('.workContainer').remove();
			var nextjobStartYearDropdown=nextContainer.find('.jobStartYear');
			var nextJobStartMonthDropdown=nextContainer.find('.jobStartMonth');
			var nextjobEndYearDropdown = nextContainer.find('.jobEndYear');
			var nextJobEndMonthDropdown=nextContainer.find('.jobEndMonth');
			
			jobEndMonthDropdown.empty();
			nextjobStartYearDropdown.empty();
			nextjobEndYearDropdown.empty();
			nextJobStartMonthDropdown.empty();
			nextJobEndMonthDropdown.empty();
			nextjobStartYearDropdown.append('<option value="">' + 'Select' + '</option>')
			nextjobEndYearDropdown.append('<option value="">' + 'Select' + '</option>')
			nextJobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>')
			nextJobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>')
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=startyear;year<=currentYear;year++)
			{
				nextjobStartYearDropdown.append('<option value="'+year+'">' + year + '</option>');
				nextjobEndYearDropdown.append('<option value="'+year+'">' + year + '</option>');
			}
			
			for(var year=1;year<=currentMonth;year++)
			{
				nextJobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>')
				nexrJobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			
		}else if(endyear === prevEndYear)
		{
			var nextjobStartYearDropdown=nextContainer.find('.jobStartYear');
			var nextJobStartMonthDropdown=nextContainer.find('.jobStartMonth');
			var nextjobEndYearDropdown = nextContainer.find('.jobEndYear');
			var nexrJobEndMonthDropdown=nextContainer.find('.jobEndMonth');
			
			jobEndMonthDropdown.empty();
			nextjobStartYearDropdown.empty();
			nextjobEndYearDropdown.empty();
			nextJobStartMonthDropdown.empty();
			nexrJobEndMonthDropdown.empty();
			nextjobStartYearDropdown.append('<option value="">' + 'Select' + '</option>')
			nextjobEndYearDropdown.append('<option value="">' + 'Select' + '</option>')
			nextJobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>')
			nexrJobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>')
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=startyear;year<=currentYear;year++)
			{
				nextjobStartYearDropdown.append('<option value="'+year+'">' + year + '</option>');
				nextjobEndYearDropdown.append('<option value="'+year+'">' + year + '</option>');
			}
			
			for(var year=reversedMonths[endmonth];year<=12;year++)
			{
				nextJobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>')
				nexrJobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			
		}else
		{
			var nextjobStartYearDropdown=nextContainer.find('.jobStartYear');
			var nextJobStartMonthDropdown=nextContainer.find('.jobStartMonth');
			var nextjobEndYearDropdown = nextContainer.find('.jobEndYear');
			var nextJobEndMonthDropdown=nextContainer.find('.jobEndMonth');
			
			jobEndMonthDropdown.empty();
			nextjobStartYearDropdown.empty();
			nextjobEndYearDropdown.empty();
			nextJobStartMonthDropdown.empty();
			nextJobEndMonthDropdown.empty();
			nextjobStartYearDropdown.append('<option value="">' + 'Select' + '</option>')
			nextjobEndYearDropdown.append('<option value="">' + 'Select' + '</option>')
			nextJobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>')
			nextJobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>')
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>');
			for(var year=endyear;year<=currentYear;year++)
			{
				nextjobStartYearDropdown.append('<option value="'+year+'">' + year + '</option>');
				nextjobEndYearDropdown.append('<option value="'+year+'">' + year + '</option>');
			}
			
			for(var year=1;year<=12;year++)
			{
				nextJobStartMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>')
				nextJobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
		}
		
	}else
	{
		// code for the month validation
		var jobEndYearDropdown = workContainer.find('.jobEndYear');
		var jobEndMonthDropdown=workContainer.find('.jobEndMonth');
		var jobStartYearDropdown = workContainer.find('.jobStartYear');
		var jobStartMonthDropdown=workContainer.find(".jobStartMonth");
		var selectedEndYear = jobEndYearDropdown.val();
		var selectedStartYear=jobStartYearDropdown.val();
		var selectedStartMonth=jobStartMonthDropdown.val();
		
		jobEndMonthDropdown.empty();
		jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>')
		if(selectedEndYear === currentYearString)
		{
			var addsection=workContainer.find('.addSection');
			addsection.hide();
			workContainer.nextAll('.workContainer').remove();
			for(var year=1;year<=currentMonth;year++)
			{
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
		}else if(selectedStartYear === selectedEndYear)
		{
			for(var year=reversedMonths[selectedStartMonth];year<=12;year++)
			{
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
		}
		else
		{
			for(var year=1;year<=12;year++)
			{
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
		}
	}
	
}
function nextContainer()
{
	var workContainer = $(this).closest('.workContainer');
	var nextContainer = workContainer.next('.workContainer');
	var currentYear = new Date().getFullYear();
	const currentYearString = currentYear.toString();
	const currentdate = new Date();
	const currentMonth = currentdate.getMonth() + 1;
	
	var jobEndYearDropdown = workContainer.find('.jobEndYear');
	var jobEndMonthDropdown = workContainer.find('.jobEndMonth');
	var selectedEndMonth=jobEndMonthDropdown.val();
	var selectedEndYear = jobEndYearDropdown.val(); 
	
	var nextjobStartYearDropdown = nextContainer.find('.jobStartYear');
	var nextjobEndYearDropdown = nextContainer.find('.jobEndYear');
	var nextjobStartMonthDropdown=nextContainer.find('.jobStartMonth');
	var nextjobEndMonthDropdown=nextContainer.find('.jobEndMonth');
	
	
	nextjobStartYearDropdown.empty();
	nextjobEndYearDropdown.empty();
	nextjobStartMonthDropdown.empty();
	nextjobEndMonthDropdown.empty();
	nextjobStartYearDropdown.append('<option value="">' + 'Select' + '</option>')
	nextjobEndYearDropdown.append('<option value="">' + 'Select' + '</option>')
	nextjobStartMonthDropdown.append('<option value="">' + 'Select' + '</option>')
	nextjobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>')
	
	if(selectedEndYear === currentYearString && months[currentMonth] === selectedEndMonth)
	{
		
		for (var year =selectedEndYear;year<=currentYear;year++) {
		nextjobStartYearDropdown.append('<option value="' + year + '">' + year + '</option>')
		nextjobEndYearDropdown.append('<option value="' + year + '">' + year + '</option>')
		}
		for(var j=1;j<=currentMonth;j++)
		{
			nextjobStartMonthDropdown.append('<option value="' + months[j] + '">' + months[j] + '</option>')
			nextjobEndMonthDropdown.append('<option value="' + months[j] + '">' + months[j] + '</option>')
		}
	}else
	{
		if(selectedEndYear!=null && selectedEndMonth!=null)
		{
			for (var year = selectedEndYear; year <= currentYear; year++) {
				nextjobStartYearDropdown.append('<option value="' + year + '">' + year + '</option>')
				nextjobEndYearDropdown.append('<option value="' + year + '">' + year + '</option>')
			}
		}
		
	}
	
	
}
function updateCurrentlyWorking(element)
{
	var workContainer = $(element).closest('.workContainer');
	const jobEndYear = workContainer.find('.endyeardiv');
    const jobEndMonth = workContainer.find('.endmonthdiv');
    const jobEndYearBlank=workContainer.find('.jobEndYear');
    const jobEndMonthBlank=workContainer.find('.jobEndMonth');
    const addsection=workContainer.find(".addSection");
	
	if ($(element).prop('checked')) {
		jobEndYearBlank.val("").trigger('change');
		jobEndMonthBlank.val("").trigger('change');
        jobEndMonth.hide();
        jobEndYear.hide();
        addsection.hide();
    } else {
		 jobEndYear.show();
        jobEndMonth.show();
         addsection.show();
    }
     workContainer.nextAll('.workContainer').remove();
	
}
/*function updateStartMonth(element)
{
	var workContainer = $(element).closest('.workContainer');
	var previousContainer = workContainer.prev('.workContainer');
	if(previousContainer.length)
	{
		console.log("previous year called");
		var jobStartYearDropdown = previousContainer.find('.jobStartYear');
		var jobEndYearDropdown = previousContainer.find('.jobEndYear');
		var startyear = jobStartYearDropdown.val(); 
		var endyear = jobEndYearDropdown.val(); 
	}
	
}*/
/*function updateEndMonth(element)
{
	var workContainer = $(element).closest('.workContainer');
	var previousContainer = workContainer.prev('.workContainer');
	if(previousContainer.length)
	{
		console.log("called");
	}else
	{
		var jobStartYearDropdown = workContainer.find('.jobStartYear');
		var jobEndYearDropdown = workContainer.find('.jobEndYear');
		var jobStartMonthDropdown=workContainer.find('.jobStartMonth');
		var startmonth=jobStartMonthDropdown.val();
		var jobEndMonthDropdown=workContainer.find('.jobEndMonth');
		jobEndMonthDropdown.empty();
		var startyear = jobStartYearDropdown.val(); 
		var endyear = jobEndYearDropdown.val(); 
		if(startyear === endyear)
		{
			const value =reversedMonths[startmonth];
			jobEndMonth.empty();
			jobEndMonthDropdown.append('<option value="">' + 'Select' + '</option>')
			for(var year=value+1;year<=12;year++)
			{
				jobEndMonthDropdown.append('<option value="' + months[year] + '">' + months[year] + '</option>');
			}
			
		}
	}
}*/