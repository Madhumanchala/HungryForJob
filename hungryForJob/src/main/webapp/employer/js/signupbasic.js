function checkFullname(element,id) {
    var name = element.value;
    element.value = name.replace(/[^A-Za-z\s]/g, '');
}
function checkMobileNumber(element,id) {
    var number = element.value;

    number = number.replace(/[^0-9]/g, '');

    if (number.length > 0 && !/^[6-9]/.test(number)) {
        number = ''; // Clear input if the first digit is invalid
    }else
    {
		$("#"+id).text("");
	}

    element.value = number;
}
function checkMailId(element) {
   var x = element.value;
   var atpos = x.indexOf("@");
   var dotpos = x.lastIndexOf(".");
   if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
	    document.getElementById("companyEmailId-span").innerHTML = "Please Enter valid email ID";
	    document.getElementById("companyEmailId-span").style.color = "Red";
	 }
	else
	{
		 document.getElementById("companyEmailId-span").innerHTML = "";
	    document.getElementById("companyEmailId-span").style.color = "Red";
	}                
}
function checkPassword(element,id) {
    var password = element.value.trim();

    // Regular expressions for password validation
    var minLength = /^.{8,}$/; // Minimum length of 8 characters
    var hasUpperCase = /[A-Z]/; // At least one uppercase letter
    var hasNumber = /[0-9]/; // At least one number
    var hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/; // At least one special character

    // Check all validation conditions
    if (!minLength.test(password)) {
        $("#"+id).text("Password must be at least 8 characters.");
    } else if (!hasUpperCase.test(password)) {
        $("#"+id).text("Password must contain at least one uppercase letter.");
    } else if (!hasNumber.test(password)) {
        // Optionally display message for number
        $("#"+id).text("Password must contain at least one number.");
    } else if (!hasSpecialChar.test(password)) {
        $("#"+id).text("Password must contain at least one special character.");
    } else {
        $("#"+id).text("");
    }
}
function Expireotp()
{
	var emailId=$('#otpEmail').text();
	$.ajax({
            url: '/expireOtp',  // Your backend endpoint to handle status update
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ email: emailId }),
            success: function(data, status, xhr) {
                if(status === "success")
                {
					console.log("sucess");
				}
            },
            error: function(xhr, status, error) {
                //ajaxindicatorstop(); // Hide loading indicator
                console.log("error",error);
            }
        });
        
}
