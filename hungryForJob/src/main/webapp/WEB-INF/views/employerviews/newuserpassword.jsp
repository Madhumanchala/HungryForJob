<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Hungry for Job</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>

<body>
 <%@include file="employerheader2.jsp"%>
 <%@include file="toaster.jsp"%>
 <div class="loader">
		<img src="employer/img/loader.gif">
	</div>
  <main id="main"> 
    <section class="section-inner login-bg">
      <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
         <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
            <div class="card-register">
                <div class="card-registerinner otp-section">
                  <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                      <h3>Change Password</h3>
					  <p>Strong passwords include numbers, letters, and punctuation marks.</p>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="newPassword" class="required">New Password </label>
                        <input type="password" class="form-control" id="newPassword" name="password" placeholder="Enter New Password" onkeyup="checkPassword(this,'newPasswordError')">
						 <i class="toggle-password bi bi-eye-slash-fill" data-target="#newPassword"></i>
                         <span class="errors" id="newPasswordError"></span>
                      </div>
                    </div>
					 <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label for="confirmPassword" class="required">Confirm Password  </label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Enter Confirm Password" onkeyup="checkPassword(this,'newPasswordError')">
						 <i class="toggle-password bi bi-eye-slash-fill" data-target="#confirmPassword"></i>
                        <span class="errors" id="confirmPasswordError"></span>
                      </div>
                    </div>	 
                    <div class="col-lg-12 text-center">
                      <button type="button" class="btns" onclick="changepassword()">Change password </button>
                    </div> 
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
	<%@include file="footer.jsp"%>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <script src="js/commonvalidation.js"></script>
</body>
<script>
function changepassword()
{
	var newpassword=$("#newPassword").val();
	var confirmpassword=$("#confirmPassword").val();
	var isvalid=true;
	if(checkvalidation(newpassword))
	{
		isvalid=false;
		showToast("info","please enter the new password")
		return 
	}else
	{
		if (newpassword.length < 8) {
	        showToast("info","Password must be at least 8 characters long.")
	        isvalid=false
	        return
	    } else if (!/[A-Z]/.test(newpassword)) {
	        showToast("info","Password must contain at least one uppercase letter (A-Z).")
	        isvalid=false
	        return
	    } else if (!/[a-z]/.test(newpassword)) {
	        showToast("info","Password must contain at least one lowercase letter (a-z).")
	        isvalid=false
	        return
	    } else if (!/\d/.test(newpassword)) {
	        showToast("info","Password must include at least one number (0-9).")
	        isvalid=false
	        return
	    } else if (!/[@$!%*?&]/.test(newpassword)) {
	        showToast("info","Password must include at least one special character (@, #, $, etc.)")
	        isvalid=false
	        return
	    }
		
	}
	if(checkvalidation(confirmpassword))
	{
		isvalid=false;
		showToast("info","please enter the confirm password")
		return 
	}
	if(confirmpassword !== newpassword)
	{
		isvalid=false;
		showToast("info","please enter the confirm and new password are not same")
		return 
	}
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"newpassword",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
				password:newpassword,
				type:"employernewpassword"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Change password Sucessfully");
					setTimeout(function() {
					    findroute("/searchCandidates");
					}, 1000);
				}
				else
				{
					showToast("info","please try again");
				}
				$('.loader').hide();
            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
                $('.loader').hide();
            }
		})
	}
}
$(document).ready(function() {
	$('.loader').hide();
});
function findroute(value)
{
	let url = value;
	let form = document.createElement('form');
	form.method = 'POST'; 
	form.action = url;
	document.body.appendChild(form);
	form.submit(); 
}
</script>
</html>