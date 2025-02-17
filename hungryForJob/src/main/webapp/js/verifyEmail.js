 function checkValidation() {
	  var statusvalidation = ValidateEmail();
	  if(statusvalidation)
	  {
		  existedEmail(function(status) {
		        var input = document.getElementById("emailInput").value;
		        localStorage.setItem("emailId",input);
		        var errorElement = document.getElementById("emailExistsError");
		        if (status === "0000" && statusvalidation) {
		        	var captcha = document.getElementById('captachaById');
		        	var EmailId = document.getElementById('EmailIDDiv');
		        	var verifyemail = document.getElementById('verifyemail');
		        	var otpInputContainer = document.getElementById('otpInputContainer');
		        	captcha.style.display = 'none';
		        	verifyemail.style.display='none';
		        	EmailId.style.display='none';
		        	otpInputContainer.style.display='block';
		        	showToast('success','Sucessfully Sent Otp to Your Email')
		        	/*toastr.success("Sucessfully Sent Otp to Your Email");*/
		        	$('#messageContainer').html('OTP sent to <span style="font-weight: bold;">' + input + '</span>');
		        } else if(status === "1010"){
		            $('#emailExistsError').fadeIn('fast').delay(4000).fadeOut('slow');
		            $('#emailInput').val(" ");
		             CreateCaptcha();
		        }else if(status === "1100")
		        {
		        	showToast('error','Mail Exception');
		        	 CreateCaptcha();
		        }else
		        {
		        	showToast('error','Failure')
		        	 CreateCaptcha();
		        }
		    }); 
	  }
	    
	}

	function ValidateEmail() {
	    var input = document.getElementById("emailInput");
	    var errorElement = document.getElementById("emailError");
	    var validRegex = /^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])$/;

	    if (input.value.match(validRegex)) {
	        errorElement.style.display = 'none';
	        return true;
	    } else {
	        errorElement.style.display = 'block';
	        input.value = '';
	        input.focus();
	        return false;
	    }
	}

	function existedEmail(callback) {
	    var input = document.getElementById("emailInput").value;

	    $.ajax({
	        url: "/ExistedEmail",
	        method: 'POST',
	        data: {
	            emailInput: input
	        },
	        success: function(result) {
	            callback(result.errorCode);
	        },
	        error: function(xhr, status, error) {
	            console.log("Error: ", xhr.responseText);
	            showToast('error','Exception in mail');
	            callback("1111"); // Default to "false" in case of error
	        }
	    });
	}
	function verifyOtp() {
	    var input = document.getElementById("emailInput").value;
	    var otp = document.getElementById("otpInput").value;
		
	    $.ajax({
	        url: "/ValidateOtp",
	        method: 'POST',
	        data: {
	            emailInput: input,
	            otpInput:otp
	        },
	        success: function(result) {
	            console.log("result: ", result);
	            const decodedString = decodeURIComponent(result.body);
	            const statuscode = decodedString.replace(/^"|"$/g, ""); // Remove the surrounding quotes
	            if (result.errorCode === "0000") {
					showToast('success','Sucessfully Verified');
	            	setTimeout(function() {
						let url = "portalRegister";
						let form = document.createElement('form');
						form.method = 'POST'; // or 'POST', depending on your needs
						form.action = url;
						document.body.appendChild(form);
						form.submit();
	                }, 5000);
	            }else if(result.errorCode === "1010")
	            {
	            	showToast('info','Otp is Expire');
	            }else if(result.errorCode === "1111")
	            {
	            	showToast('info','please Try Again to Send Otp');
	            }else
	            {
	            	showToast('error','Failure');
	            	 CreateCaptcha();
	            }
	        },
	        error: function(xhr, status, error) {
	            console.log("Error: ", xhr.responseText);
	            console.log("error :",error);
	            showToast('error','An error occurred in validate otp');
	        }
	    });
	}
	$('#resendOtp').on('click', function() {
	    var $this = $(this);
	    $this.css('color', 'green'); // Change to green on click
	    setTimeout(function() {
	    	changeColor();
	    }, 1000); // Timeout in milliseconds
	    
	});
	function changeColor()
	{
		document.getElementById('resendOtp').style.color = 'blue';
	}