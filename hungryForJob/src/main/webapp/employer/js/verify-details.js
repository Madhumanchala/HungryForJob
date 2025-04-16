function saveplanDetails()
{
	let planId=sessionStorage.getItem("selectedPlanId");
	sessionStorage.removeItem("selectedPlanId");
	let companyId=companyId1;
	let gstNo=$('#GSTINnumber').val();
	let utrNo=$('#uTRNo').val();
	let utrDate=$('#uTRDate').val();
	let reversedDate = utrDate.split("-").reverse().join("-");
	let contactname=$("#contactName").val();
	let mobileno=$("#mobileNo").val();
	let companyname=$("#companyName").val();
	let emailId=$("#emailId").val();
	var planName = document.querySelector("#planname").firstChild.nodeValue.trim();
	let plantotalPrice=$("#totalprice").text().trim();
	let planprice = $("#planpricedetail").text().trim();
	let planuseraccess = $("#planuseraccess").text().replace("User","").trim();
	let planjobposting = $("#planjobposting").text().replace("Postings","").trim();
	let plansearches = $("#plansearches").text().trim();
	let planvalidity = $("#planvalidity").text().trim();
	let plancvviews = $("#plancvviews").text().trim();
	
	let isvalid=true
	if(checkvalidation(planId))
	{
		if(checkvalidation(selectedPlaned))
		{
			showToast("info","error occured any value is missing");
			isvalid=false;
			return
		}else
		{
			planId=selectedPlaned;
			$("#redirectvalue").attr("href","#");
			$("#redirectvalue").attr("onclick","findroute('/mysubscription')");
			$("#redirectvalue").text("Back to Subscription page");
		}
		
	}
	if(checkvalidation(utrNo))
	{
		$('#utrNo_error').text("Enter the Below text");
		$('#utrNo_error').show();
		isvalid=false;
	}
	if(checkvalidation(utrDate))
	{
		$('#utrDate_error').text("Enter the Below text");
		$('#utrDate_error').show();
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
				"utrDate":reversedDate,
				"contactname":contactname,
				"mobileno":mobileno,
				"emailId":emailId, 
				"companyname":companyname,
				"planName":planName,
				"planTotalAmount":plantotalPrice,
				"planPrice":planprice,
				"planUserAccess":planuseraccess,
				"planJobPosting":planjobposting,
				"planSearches":plansearches,
				"planValidity":planvalidity,
				"planCvViews":plancvviews
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