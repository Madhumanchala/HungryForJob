 $("#name").on("keyup", function() {
  var name = $(this).val();
  var regex = /^[a-zA-Z\s']*$/;
  if (!regex.test(name)) {
	$(this).val(name.replace(/[^a-zA-Z\s']/g, ''));
    $('.nameError').text("pecial characters other than ( - . ' , : ! & ( ) [ ] / * + @ | ^ ) are not allowed");
    $('.nameError').show();
    return false;
  } else {
    $('.nameError').hide();
  }
});
  
$("#contact").on("keyup", function () {
    var mobNum = $(this).val();

    // Remove any non-numeric characters and limit the input to 10 digits
    mobNum = mobNum.replace(/[^0-9]/g, '').substring(0, 10);
    $(this).val(mobNum);

    if (mobNum.length === 10) {
        if (parseInt(mobNum[0], 10) >= 6) {
            $(".contactError").hide();
        } else {
            $(".contactError").text("Mobile number must start with a digit 6 or greater.");
            $(".contactError").show();
            $('#contact').val(""); // Clear the input if the first digit is less than 6
        }
    } else {
        if (mobNum.length > 0 && parseInt(mobNum[0], 10) < 6) {
            $('#contact').val(""); // Clear the input if the first digit is less than 6
        }
        $(".contactError").text("Please enter your 10 digit Mobile Number");
        $(".contactError").show();
    }
});



  $("#password").keyup(function(){
	  $("#confirm_password").prop("disabled", false);
	  $(".passwordError").hide();
	  var password = $(this).val();
	// Define the regular expression pattern
	var passwordPattern = /^(?=.*[!@#$%^&*()_+|{}[\]:";'<>?,./])(?=.*\d)(?=.*[A-Z]).{8,}$/;

	// Check if the password matches the pattern
	if (!passwordPattern.test(password)) {
	    // Show error message or apply error styling
	    $(".password_error").html("<span style='color:red;font-weight:500;font-size:12px;line-height:12px;'>Password should be minimum 8 characters</span>");
	}else {
	    // Clear error message or reset error styling
	    $(".password_error").text("");
	}
	 }).blur(function() {
	    var password = $("#password").val();
	    var passwordPattern = /^(?=.*[!@#$%^&*()_+|{}[\]:";'<>?,./])(?=.*\d)(?=.*[A-Z]).{8,}$/;
	    if (!passwordPattern.test(password)) {
	    // Show error message or apply error styling
	    $(".password_error").html("<span style='color:red;font-weight:500;font-size:12px;line-height:12px;'>Password should be minimum 8 characters	</span>");
	    // Alternatively, you can apply error styling to the input field
	   /* $("#password").val("");*/
	    $("#confirm_password").prop("disabled", true);
	    // $(this).addClass("error");
	    }else {
	    // Clear error message or reset error styling
	    $(".password_error").text("");
	    $("#confirm_password").prop("disabled", false);
	    }
	});
  
	$("#confirm_password").keyup(function(){
		var password = $("#password").val();
		$(".confirmPasswordError").hide();
	    var confirm_password = $("#confirm_password").val();
	    if(password!=confirm_password){
	      $(".confirm_password_error").html("<span style='color:red;font-weight:500;font-size:12px;line-height:12px;'>Passwords does not match</span>");
	    }
	    else{
	      $(".confirm_password_error").html("");
	    }
	});
function validateForm()
{
	var isvalid=true;
	var name = $("#name").val();
    var email = $("#email").val();
    var contact = $("#contact").val();
    var password = $("#password").val();
    var confirm_password = $("#confirm_password").val();
    var workStatus = $("input[name='work_status']:checked").val();
    var gender = $("input[name='gender']:checked").val();
    var dateofBirth=$('#dateofBirth').val();
    var UserCaptchaCode = $("#UserCaptchaCode").val();
    // console.log("Name is "+name+" email is "+email+" contact is "+contact+" password "+password+" workStatus "+workStatus);
    
    if(name == "")
   	{
		$(".nameError").text("field is required");
     	 $(".nameError").show();
     	 isvalid=false;
	}
    if(contact == ""){
      $(".contactError").text("field is required");
      $(".contactError").show();
      isvalid= false;
    }
    else if(contact.length !== 10){
      $(".contactError").text("contact number should be 10 digit number");
      $(".contactError").show();
      isvalid= false;
    }
    
    if(password == ""){
      $(".passwordError").text("field is required");
      $(".passwordError").show();
      isvalid= false;
    }else if(!validatePassword(password))
    {
		isvalid=false;
	}
    if(confirm_password == ""){
      $(".confirmPasswordError").text("field is required");
      $(".confirmPasswordError").show();
      isvalid= false;
    }else if(password !== confirm_password)
    {
    	 $(".confirmPasswordError").text("Please enter the correct password");
    	 $(".confirmPasswordError").show();
         $(".confirmPasswordError").fadeOut(6000);
        isvalid= false;
    }
    
    if (workStatus == undefined) {
      $(".workStatusError").text("field is required");
      $(".workStatusError").show();
       isvalid= false;
    }
    
    if (gender == undefined) {
      $(".genderError").text("field is required");
      $(".genderError").show();
       isvalid= false;
    }

    if(UserCaptchaCode === ""){
      $("#WrongCaptchaError").text("field is required");
      isvalid= false;
    }
    
    if(dateofBirth === "")
    {
		 $(".dateofBirthError").text("field is required");
     	 $(".dateofBirthError").show();
     	 isvalid=false;
	}
	return isvalid;
}
 $("#resume_doc").change(function() {
	  var file = $(this)[0].files[0];
	  var fileType = file.type;
	  var fileSize = file.size;

	  if (fileType != "application/pdf" && fileType != "application/msword" && fileType != "application/vnd.openxmlformats-officedocument.wordprocessingml.document") {
	    showToast('info',"Only pdf, doc, and docx files are allowed.");
	    /*$(".errorfield").text("Only pdf, doc, and docx files are allowed.");*/
	    $(this).val("");
	    return false;
	  }

	  if (fileSize > 2097152) { // 2MB
	  	showToast('info',"File size must be less than 2MB.");
	    /*$('.errorfield').text("File size must be less than 2MB.");*/
	    $('.errorfield').show();
	    $(this).val("");
	    $('.errorfield').fadeOut(3000);
	    return false;	
	  }

	  $(".errorfield").text("");
	});