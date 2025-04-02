function viewDetails(id)
{
	 	var form = document.createElement('form');
        
        form.method = 'POST';
        form.action = '/candidateViewDetails'; // Replace with the actual server endpoint URL

        // Optionally, create a hidden input to pass jobPostingId as a form parameter
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'id';
        input.value = id;
        form.appendChild(input);
        
         var input = document.createElement('input');
        input.type = 'text';
        input.name = 'candidateId';
        input.value = candidateId;
        form.appendChild(input);

        // Append the form to the document body
        document.body.appendChild(form);

        // Submit the form
        form.submit();
}

function appliedJob(id)
{
	$("#appliedJob").removeAttr("onclick");
	$.ajax({
		url:"appliedJobs",
		method:"POST",
		data:{
			"id":id
		},
		success:function(response)
		{
			if(response.errorCode === "0000")
			{
				$("#applyJob").html('Applied').css({"background-color": "#38a50e","color":"#002a54"});
				 showToast('success',"Successfully Job is applied");
			}else
			{
				$("#appliedJob").attr("onclick","appliedJob("+id+")");
				showToast('info',"Job is not applied, please try again");
				console.log("error in saving data ",response);
			}
		},
		error:function(response)
		{
			$("#appliedJob").attr("onclick","appliedJob("+id+")");
			console.log("error",response);
		}
	});
}