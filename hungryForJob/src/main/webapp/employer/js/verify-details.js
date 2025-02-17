function saveplanDetails()
{
	let planId=sessionStorage.getItem("selectedPlanId");
	sessionStorage.removeItem("selectedPlanId");
	let companyId=companyId1;
	let gstNo=$('#GSTINnumber').val();
	let utrNo=$('#uTRNo').val();
	let utrDate=$('#uTRDate').val();
	let reversedDate = utrDate.split("-").reverse().join("-");
	let isvalid=true
	if(utrNo === "")
	{
		$('#utrNo_error').text("Enter the Below text");
		$('#utrNo_error').show();
		isvalid=false;
	}
	if(utrDate === "")
	{
		$('#uTRDate').text("Enter the Below text");
		$('#uTRDate').show();
		isvalid=false;
	}
	if(isvalid)
	{
			$.ajax({
			url:"/saveJobPlan",
			method:'POST',
			contentType: 'application/json',
			data:JSON.stringify({
				"planId":planId,
				"companyId":companyId,
				"gstNo":gstNo,
				"utrNo":utrNo,
				"utrDate":reversedDate
			}),
			success:function(response){
				if(response === "sucess")
				{
					$('#verifySubmit').modal('show');
					
				}else
				{
					showToast("error",response);
				}
				
			},
			error:function(response){
			showToast("error",response);
			console.log("error in response =="+e);
			}
		})
	}
	
}