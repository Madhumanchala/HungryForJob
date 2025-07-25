function viewDetails(id) {
	var form = document.createElement('form');

	form.method = 'POST';
	form.action = '/candidateViewDetails'; // Replace with the actual server endpoint URL

	// Optionally, create a hidden input to pass jobPostingId as a form parameter
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'id';
	input.value = id;
	form.appendChild(input);

	// Append the form to the document body
	document.body.appendChild(form);

	// Submit the form
	form.submit();
}
function jobpostingdetails(page) {


	let form = document.createElement('form');
	form.method = 'POST';
	form.action = "managejobpost";

	let paginationInput = document.createElement('input');
	paginationInput.type = 'hidden';
	paginationInput.name = 'paginationOffSet';
	paginationInput.value = page;
	form.appendChild(paginationInput);

	document.body.appendChild(form);
	form.submit();

}