var flag2 = flag;
function saveLastDetails() {
	var formData = new FormData();
	var fileInput = document.getElementById('candidate_cv');
	var description = document.getElementById('resume_headline').value;
	var isValid = true;

	if (description == null || description == "") {
		isValid = false;
		$(".resumeheadline_error").text("This field is required").css("color", "red");
		$(".resumeheadline_error").show();
		$(".resumeheadline_error").fadeOut(3000);
		return isValid;
	}
	if (flag == 0) {
		if (fileInput.files.length === 0) {
			isValid = false;
			$(".resume_error").text("This field is required").css("color", "red");
			$(".resume_error").show();
			$(".resume_error").fadeOut(3000);
			return isValid;
		}
	}
	// Add the form fields to FormData
	if (isValid) {
		$(".loader").show();
		$(".loader").css("display", ""); 
		formData.append("resumeheadline", description);
		formData.append("resume_doc", fileInput.files[0]);
		formData.append("flag", flag);
		$.ajax({
			url: '/saveLastStep',  // Controller URL
			type: 'POST',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,  // Important for file upload
			contentType: false,  // Important for file upload
			cache: false,
			success: function(response) {
				var sessionRole = document.getElementById('sessionRole').value;
				console.log('Session value is ',sessionRole);
				    if (response.errorCode == "0000") {
				        if (sessionRole === 'recuriter') {
				          	 setTimeout(function () {
								   $(".loader").hide();
								   $(".loader").css("display", "block");
       								window.location.href="/employerlogin";
      						}, 1000);
      						 showToast('success',"Successfully saved details");
				            
				            /*let url = "/";
				            let form = document.createElement('form');
				            form.method = 'POST';
				            form.action = url;
				            document.body.appendChild(form);
				            form.submit();*/
				        } else {
							setTimeout(function () {
       								window.location.href="/login";
       								 $(".loader").hide();
      						}, 2000);
      						 showToast('success',"Successfully saved details");
							 
				           /* let url = "candidateDashboard";
				            let form = document.createElement('form');
				            form.method = 'POST';
				            form.action = url;
				            document.body.appendChild(form);
				            form.submit();*/
				        }
				    }else {
					console.log("failed in response");
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("Error uploading file: " + textStatus);
			}
		});
	}
}
$("#candidate_cv").change(function() {
	var file = $(this)[0].files[0];
	var fileType = file.type;
	var fileSize = file.size;

	if (fileType != "application/pdf" && fileType != "application/msword" && fileType != "application/vnd.openxmlformats-officedocument.wordprocessingml.document") {
		showToast('info',"Only pdf, doc, and docx files are allowed.");
		/*$(".resume_error").text("Only pdf, doc, and docx files are allowed.");*/
		$(this).val("");
		return false;
	}

	if (fileSize > 2097152) { // 2MB
		 showToast('info',"File size must be less than 2MB.");
		/*$('.resume_error').text("File size must be less than 2MB.");*/
		$('.resume_error').show();
		$(this).val("");
		$('.resume_error').fadeOut(3000);
		return false;
	}

	$(".resume_error").text("");
});