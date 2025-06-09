function removeCountryCode(mobileNumber) {
    return mobileNumber.replace(/^\+91[-\s]*/g, '');
}
function validateUsername(username) 
{
    const usernamePattern = /^[a-zA-Z ]{3,}$/;
    return usernamePattern.test(username.trim());
}
function validateNumber(input) {
    let numberPattern = /^[0-9]+$/; // Matches only digits (no decimal points, spaces, or symbols)
    return numberPattern.test(input);
}
function validateEmail(email) {
    let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailPattern.test(email);
}
function removeNonNumeric(input) {
    // Remove anything that is not a digit (0-9)
    let cleanInput = input.replace(/\D/g, ''); // \D matches any non-digit character
    return cleanInput;
}
function test(value)
{
	if(value === "" || value == undefined || value === "null" || value == null)
	{
		return true
	}else
	{
		return false
	}
}
function companyProfileDetails()
{
	let userName=$("#companyProfile_Name").text();
	let emailForComunication=$("#companyProfile_EmailforCommunuication").text().trim();
	let mobileNumber=$("#companyProfile_MobileNumber").text().trim();
	
	$("#editUserName").val(userName);
	$("#editEmailForComunuication").val(emailForComunication);
	$("#editMobileNumber").val(removeCountryCode(mobileNumber));
}
function EditcompanyDetails()
{
	let industryType=$("#editindustrytype").text();
	let phoneNumber=$("#phonenumbertype").text();
	
	let matchingValue = $("#industryDetails option").filter(function() {
        return $(this).text().trim() === industryType;
    }).val();

    if (matchingValue) {
        $("#industryDetails").val(matchingValue).trigger("change"); // Set the value and trigger change event for Select2
    }
    
    $("#editphonenumber").val(phoneNumber);
	
}
function updatCompanyProfile()
{
	var userName=$("#editUserName").val();
	var emailForCommunication=$("#editEmailForComunuication").val();
	var mobileNumber = $("#editMobileNumber").val();
	var isvalid=true;
	
	
	if(test(userName))
	{
		$("#editUserName_error").text("Enter the field");
		$("#editUserName_error").show();
		isvalid=false;
	}
	if(test(emailForCommunication))
	{
		$("#editEmailCommunication_error").text("Enter the field");
		$("#editEmailCommunication_error").show();
		isvalid=false;
	}else
	{
		if(!validateEmail(emailForCommunication))
		{
			$("#editEmailCommunication_error").text("Enter the correct email address");
			$("#editEmailCommunication_error").show();
			isvalid=false;
		}
	}
	if(test(mobileNumber))
	{
		$("#editMobileNo_error").text("Enter the field");
		$("#editMobileNo_error").show();
		isvalid=false;
	}else
	{
		if(mobileNumber.length !== 10)
		{
			$("#editMobileNo_error").text("Enter the valid mobile number");
			$("#editMobileNo_error").show();
			isvalid=false;
		}else
		{
			$("#editMobileNo_error").hide();
		}
	}
	
	if(isvalid)
	{
		$.ajax({
			url:"editCompanyDashboard",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
                name: userName,
                emailId: emailForCommunication,
                mobileNo: mobileNumber,
                type:"updateCompanyProfile"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success",response.errors.errorMessage);
					$("#Company-Profile-edit").modal("hide");
				}else if(response.errors.errorCode === "1100")
				{
					showToast("info","Already Existed Email");
				}
				else
				{
					showToast("info","please try again");
					$("#Company-Profile-edit").modal("hide");
				}
				setTimeout(function() {
    window.location.reload(true); // Reload with cache bypass
}, 2000); // 2000ms = 2 seconds

            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
                $("#Company-Profile-edit").modal("hide");
            }
		})
	}
	
}
function updatecompanydetails()
{
	let industrytype=$("#industryDetails option:selected").text();
	let phonenumber =$("#editphonenumber").val();
	let isvalid=true;
	if(test(industrytype))
	{
		$("#editindustrytype_error").text("Enter the field");
		$("#editindustrytype_error").show();
		isvalid=false;
	}else
	{
		$("#editindustrytype_error").hide();
	}
	if(industrytype === "Select")
	{
		$("#editindustrytype_error").text("Enter the field");
		$("#editindustrytype_error").show();
		isvalid=false;
	}else
	{
		$("#editindustrytype_error").hide();
	}
	if(test(phonenumber))
	{
		$("#editphonenumber_error").text("Enter the valid phone number");
		$("#editphonenumber_error").show();
		isvalid=false;
	}else
	{
		if(phonenumber.length !== 10)
		{
			$("#editphonenumber_error").text("Enter the field");
			$("#editphonenumber_error").show();
			isvalid=false;
		}else
		{
			$("#editphonenumber_error").hide();
		}
	}
	if(isvalid)
	{
		$.ajax({
			url:"editCompanyDashboard",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
                industry: industrytype,
                mobileNo: phonenumber,
                type:"updatecompanydetails"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Sucessfully updated");
					$("#Company-details-edit").modal("hide");
				}else
				{
					showToast("info","please try again");
					$("#Company-details-edit").modal("hide");
				}
				setTimeout(function() {
    window.location.reload(true); // Reload with cache bypass
}, 2000); // 2000ms = 2 seconds
            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
                $("#Company-Profile-edit").modal("hide");
            }
		})
	}
	
}
function fetchCities(id) {
	$(".loader").show();
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
    						dropdownParent: $('#KYC-Compliance-details')
	                    });
	                    
	                    $('#personaldetailsModal').on('scroll', function () {
                            $select.select2({
                                dropdownParent: $(this).parent(),
                                placeholder: 'Select city'
                            });
                        });
                        let city=$("#kyccity").text();
                        $('#editstate').val(postOffices[0].State);
                        $('#current_location').val(city).trigger('change'); ;
                        
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
		$('.loader').hide();
		},
		error: function(response) {
			console.log("error", response);
			$('.loader').hide();
		}	
	});
}
function kycdetailsdetails()
{
	let address= $("#kycaddress").text();
	let gstnumber=$("#kycgstnumber").text();
	let pincode=$("#kycpincode").text();
	fetchCities(pincode);
	$("#editaddress").val(address);
	$("#editgst").val(gstnumber);
	$("#editpincode").val(pincode);
}
function editpincodechange()
{
	let pincodevalue =$("#editpincode").val();
	if(validateNumber(pincodevalue))
	{
		if(pincodevalue.length==6)
		{
			fetchCities(pincodevalue);
		}else
		{
			showToast("info","please Enter the number upto 6 ");
		}	
	}else
	{
		$("#editpincode").val(removeNonNumeric(pincodevalue));
		showToast("info","please Enter the number only");
	}
	
}
function updatekycdetails()
{
	let address=$("#editaddress").val();
	let state=$("#editstate").val();
	let city=$("#current_location").val();
	let pincode=$("#editpincode").val();
	let gstno=$("#editgst").val();
	let isvalid=true;
	
	if(test(address))
	{
		$("#editaddress_error").text("Enter the address");
		$("#editaddress_error").show();
	}else
	{
		$("#editaddress_error").hide();
	}
	if(test(pincode))
	{
		$("#editpincode_error").text("Enter the pincode");
		$("#editpincode_error").show();
	}else
	{
		$("#editpincode_error").hide();
	}
	if(test(gstno))
	{
		$("#editgst_error").text("Enter the gst");
		$("#editgst_error").show();
	}else
	{
		if(gstno.length !== 15)
		{
			$("#editgst_error").text("Enter the valid gst number");
			$("#editgst_error").show();
			isvalid=false;
		}else
		{
			$("#editgst_error").hide();
		}
	}
	if(!validateGST(gstno))
	{
		$("#editgst_error").text("Enter the valid gst");
		$("#editgst_error").show();
		isvalid=false;
	}
	else
	{
		$("#editgst_error").hide();
	}
	if(test(city))
	{
		$("#editcity_error").text("Enter the city");
		$("#editcity_error").show();
	}else
	{
		$("#editcity_error").text("Enter the city");
		$("#editcity_error").hide();
	}
	validpincode(pincode).then((message)=>{
				if(message)
				{
					$("#editpincode_error").text("Enter the valid pincode");
					$("#editpincode_error").show();
					isvalid=false;
				}else
				{
					if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"editCompanyDashboard",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
                address: address,
                state: state,
                city:city,
                pincode:pincode,
                gstno:gstno,
                type:"updatekycdetails"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Sucessfully updated");
					$("#KYC-Compliance-details").modal("hide");
				}else
				{
					showToast("info","please try again");
					$("#KYC-Compliance-details").modal("hide");
				}
				setTimeout(function() {
    					window.location.reload(true); // Reload with cache bypass
				}, 2000); // 2000ms = 2 seconds
				$('.loader').hide();
            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
                $("#KYC-Compliance-details").modal("hide");
                $('.loader').hide();
            }
		})
	}
				}
		});
	
} 