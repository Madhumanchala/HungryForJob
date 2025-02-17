var companyId=companyId;
var userId=userId;
function isPhoneNumber(candidateId, phoneNumber, viewPhonenumber) {
	if (phoneNumber == "name") {
		clickDeductprofile("phoneNumber", candidateId, phoneNumber, viewPhonenumber);
	} else {
		if ($('#'+phoneNumber).is(':visible')) {
			$('#'+viewPhonenumber).text("View phone number");
			$('#'+phoneNumber).hide();
		} else {
			clickDeduct("phoneNumber", candidateId,phoneNumber, viewPhonenumber);
		}
	}

}

function clickDeduct(type, candidateId,phonenumber,viewphonenumber) {
	$.ajax({
		url: "/clickDeduct",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({
			"companyId": companyId,
			"userId": userId,
			"type": type,
			"candidateId": candidateId
		}),
		success: function(response) {
			if (response.errors.errorCode == "0000") {
				$('#'+viewphonenumber).text("Hide phone number");
				$('#'+phonenumber).show();
			} else {
				$('#'+viewphonenumber).text("View phone number");
			}
		},
		error: function(xhr, status, error) {
			console.log("error ========== " + error);
		}
	})
}
function clickDeductprofile(type, candidateId,phonenumber,viewphonenumber) {
	$.ajax({
		url: "/clickDeduct",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({
			"companyId": companyId,
			"userId": userId,
			"type": type,
			"candidateId": candidateId
		}),
		success: function(response) {
			if (response.errors.errorCode == "0000") {
				console.warn('in side');
				
				
				var form = $('<form>', {
				               'action': '/employerCandidateprofile',
				               'method': 'POST'
				           });
						   
						   form.append($('<input>', {
						       'type': 'hidden',
						       'name': 'candidateId',  // Name of the field you want to send
						       'value': candidateId  // Value you want to pass
						   }));

				           form.appendTo('body').submit(); 
				
			} else {
				
			}
		},
		error: function(xhr, status, error) {
			console.log("error ========== " + error);
		}
	})
}