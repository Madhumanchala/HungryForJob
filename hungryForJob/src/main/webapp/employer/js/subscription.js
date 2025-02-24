function statusplan(type)
{
	let form = document.createElement('form');
	form.method = 'POST'; 
	form.action = 'mysubscription';
	
	let input=document.createElement('input');
	input.type='hidden';
	input.name='type';
	input.value=type
	form.appendChild(input);
	
	document.body.appendChild(form);
	
	form.submit(); 
}
function addgstnumber()
{
	let gst=$("#gstnumber").val();
	var isvalid=true;
	if(checkvalidation(gst))
	{
		isvalid=false;
		showToast("info","enter the gst number");
	}else
	{
		if(!validateGST(gst))
		{
			showToast("info","enter the valid gst number");
			isvalid=false;
		}else
		{
			if(gst.length<15)
			{
				showToast("info","enter the valid gst number");
				isvalid=false;
			}
			
		}
		
	}
	if(isvalid)
	{
		$(".loader").show();
		$.ajax({
			url:"updategstnumber",
			type:'post',
			contentType: 'application/json',
			data: JSON.stringify({
                gstno:gst,
            }),
            success: function(response) {
                // Success callback
                if(response.errors.errorCode === "0000")
                {
					showToast("success","Sucessfully updated");
					$("#gstin-add").modal("hide");
				}else
				{
					showToast("info","please try again");
					$("#gstin-add").modal("hide");
				}
				setTimeout(function() {
    					window.location.reload(true); // Reload with cache bypass
				}, 2000); // 2000ms = 2 seconds
				$('.loader').hide();
            },
            error: function(xhr, status, error) {
                // Error callback
                console.log("error ocurred"+error)
                showToast("error","failed to update");
                $("#gstin-add").modal("hide");
                $('.loader').hide();
            }
		})
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
function plandetails(id,url)
{
	let form = document.createElement('form');
	form.method = 'POST'; 
	form.action = url;
	
	let input=document.createElement('input');
	input.type='hidden';
	input.name='planId';
	input.value=id
	form.appendChild(input);
	
	
	document.body.appendChild(form);
	
	form.submit(); 
}