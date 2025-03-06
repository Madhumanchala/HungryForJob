function createusers()
{
	let fullname=$("#firstname").val();
	var emailId=$("#emailId").val();
	var mobilenumber=$("#contactno").val();
	/*var roleName=$("#role").val();*/
	var roleName="Recruiter";
	var isvalid=true;
	if(checkvalidation(fullname))
	{
		isvalid=false;
		showToast("info","please enter full name ");
		return 
	}
	if(checkvalidation(emailId))
	{
		isvalid=false
		showToast("info","please enter  email id ");
		return 
	}else
	{
		if(!validateEmail(emailId))
		{
			isvalid=false
			showToast("info","please enter valid email id ");
			return
		}
	}
	if(checkvalidation(mobilenumber))
	{
		isvalid=false;
		showToast("info","please enter mobile no ");
		return 
	}else
	{
		if(mobilenumber.length < 10)
		{
			isvalid=false;
			showToast("info","please enter valid phone number");
			return
		}
	}
	if(checkvalidation(roleName))
	{
		isvalid=false
		showToast("info","please select the role");
		return
	}
	
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"createuser",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
                userName: fullname,
                emailId: emailId,
                roleName:roleName,
                mobileNo:mobilenumber,
                type:'createusers'
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","created a user successfully");
					setTimeout(function() {
    					window.location.reload(true); // Reload with cache bypass
				}, 2000); // 2000ms = 2 seconds
				}else if(response.errors.errorCode === "1010")
				{
					showToast("info",response.errors.errorMessage);
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
function appendusers(username,emailid,mobileno,id)
{
	$("#editfirstname").val(username);
	$("#editemailId").val(emailid);
	$("#editcontactno").val(mobileno);
	$("#updatebutton").attr("onclick","updateusers('"+id+"')")
}
function updateusers(id)
{
	let fullname=$("#editfirstname").val();
	var emailId=$("#editemailId").val();
	var mobilenumber=$("#editcontactno").val();
	var isvalid=true;
	if(checkvalidation(fullname))
	{
		isvalid=false;
		showToast("info","please enter full name ");
		return 
	}
	if(checkvalidation(emailId))
	{
		isvalid=false
		showToast("info","please enter  email id ");
		return 
	}else
	{
		if(!validateEmail(emailId))
		{
			isvalid=false
			showToast("info","please enter valid email id ");
			return
		}
	}
	if(checkvalidation(mobilenumber))
	{
		isvalid=false;
		showToast("info","please enter mobile no ");
		return 
	}else
	{
		if(mobilenumber.length < 10)
		{
			isvalid=false;
			showToast("info","please enter valid phone number");
			return
		}
	}
	
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"createuser",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
				id:id,
                userName: fullname,
                emailId: emailId,
                mobileNo:mobilenumber,
                type:"updateusers"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","updated  successfully");
					setTimeout(function() {
    					window.location.reload(true); // Reload with cache bypass
					}, 2000); // 2000ms = 2 seconds
				}else if(response.errors.errorCode === "1010")
				{
					showToast("info","Email is Already Existed");
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
function deleteusers(id)
{
	
	var isvalid=true;
	if(checkvalidation(id))
	{
		isvalid=false;
		 showToast("info","Any thing is missing or please try again");
	}
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"createuser",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
				id:id,
                type:"deleteusers"
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Deleted  successfully");
					setTimeout(function() {
    					window.location.reload(true); // Reload with cache bypass
				}, 2000); // 2000ms = 2 seconds
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