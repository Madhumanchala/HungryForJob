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
        
         var input1 = document.createElement('input');
        input1.type = 'text';
        input1.name = 'viewdetailflag';
        input1.value = "0";
        form.appendChild(input1);

        // Append the form to the document body
        document.body.appendChild(form);

        // Submit the form
        form.submit();
}
function jobpostingdetails(page)
{
        
		let jobTittle = $('#selectTittle').val();
		let experience = $('#selectexp').val();
		let locationValue = $('#selectLocation').val();
		let locationArray = []; // Initialize an empty array
		locationArray.push(locationValue); // Push the value into the array
		var isvalid=true;
		if(jobTittle === "")
		{
			isvalid=false;
			$('#error_field').text("please Enter job tittle");
			$('#error_field').show();
		}
		if(isvalid)
		{
		    
			let form = document.createElement('form');
			form.method = 'POST';
			form.action = "candidateDashboard";

			// Add input fields for the selected values
			let jobTitleInput = document.createElement('input');
			jobTitleInput.type = 'hidden';
			jobTitleInput.name = 'jobTitle';
			jobTitleInput.value = jobTittle;
			form.appendChild(jobTitleInput);

			let experienceInput = document.createElement('input');
			experienceInput.type = 'hidden';
			experienceInput.name = 'experience';
			experienceInput.value = experience;
			form.appendChild(experienceInput);

			let locationInput = document.createElement('input');
			locationInput.type = 'hidden';
			locationInput.name = 'location';
			locationInput.value = locationArray;
			form.appendChild(locationInput);
			
			let paginationInput = document.createElement('input');
			paginationInput.type = 'hidden';
			paginationInput.name = 'paginationOffSet';
			paginationInput.value = page;
			form.appendChild(paginationInput);

			document.body.appendChild(form);
			form.submit();
		}
		
	
}