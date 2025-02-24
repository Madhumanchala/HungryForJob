// checks the null and undefined and null and  of value
function checkvalidation(value)
{
	if(value === "" || value == undefined || value === "null" || value == null)
	{
		return true
	}else
	{
		return false
	}
}
function alpha(value) {
    return value.replace(/[^A-Za-z\s]/g, ''); // Remove all non-alphabet characters
}
// Name validation 
function checkname(input,id)
{
	input.value = alpha(input.value);
}
function validateEmail(email) {
    let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailPattern.test(email);
}
// check the email  validation
function checkemail(input,id)
{
	if(validateEmail(input.value))
	{
		input.value = input.value;
		$("#"+id).text("");
	}else
	{
		$("#"+id).text("Enter valid email address");
	}
}
function validatePhoneNumber(phone) {
    phone = phone.replace(/\D/g, ""); // Remove all non-numeric characters
	
    if (!/^[789]/.test(phone)) {
        phone = phone.substring(1); // Remove first digit if it's not 7, 8, or 9
    }
    
    return phone;
}
// only number validation 
function checkNumber(input,id)
{
	let checknumber=validatePhoneNumber(input.value);
	input.value=checknumber;
}
$(".toggle-password").click(function () {
        let input = $($(this).attr("data-target"));
        if (input.attr("type") === "password") {
            input.attr("type", "text");
            $(this).removeClass("bi-eye-slash-fill").addClass("bi-eye-fill");
        } else {
            input.attr("type", "password");
            $(this).removeClass("bi-eye-fill").addClass("bi-eye-slash-fill");
        }
});
function validatePassword(password) {
    let passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return passwordPattern.test(password);
}
function checkPassword(input, id) {
    if (validatePassword(input.value)) {
        $("#" + id).text(""); // Clear error message if valid
    } else {
        $("#" + id).text("Password must be at least 8 characters, include an uppercase letter, a lowercase letter, a number, and a special character.");
    }
}
function validateGST(gstin) {
    let gstPattern = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[Z]{1}[0-9A-Z]{1}$/;
    return gstPattern.test(gstin)
}
function checkgst(input,id)
{
	if(validateGST(input.value))
	{
		$("#"+id).text("");
	}else
	{
		$("#"+id).text("Invalid GST Number format.");
	}
}
function findroute(value)
{
	let form = document.createElement('form');
	form.method = 'POST'; 
	form.action = value;
	document.body.appendChild(form);
	form.submit(); 
}
function validateUTR(utr) {
    const utrPattern = /^[A-Za-z0-9]{16,22}$/; // UTR must be 16-22 alphanumeric characters
    return utrPattern.test(utr);
}
function checkutr(input,id)
{
	if(validateUTR(input.value))
	{
		$("#"+id).text("");
	}else
	{
		$("#"+id).text("enter the valid utr not");
		$("#"+id).show();
	}
}