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