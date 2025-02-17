function removeCountryCode(mobileNumber) {
    return mobileNumber.replace(/^\+91[-\s]?/, '');
}
function validateUsername(username) 
{
    const usernamePattern = /^[a-zA-Z ]{3,}$/;
    return usernamePattern.test(username.trim());
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
	let emailForComunication=$("#companyProfile_EmailforCommunuication").text();
	let mobileNumber=$("#companyProfile_MobileNumber").text();
	
	$("#editUserName").val(userName);
	$("#editEmailForComunuication").val(emailForComunication);
	$("#editMobileNumber").val(removeCountryCode(mobileNumber));
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
	}
	if(test(mobileNumber))
	{
		$("#editMobileNo_error").text("Enter the field");
		$("#editMobileNo_error").show();
		isvalid=false;
	}
	
	if(isvalid)
	{
		$.ajax({
			url:"editCompanyProfileDetails",
			type:'post',
			contentType: 'application/json',
		})
	}
	
}