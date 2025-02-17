function updateSelection(filterdays,id)
{
	var form = document.createElement('form');
        
        form.method = 'POST';
        form.action = '/managefolders'; // Replace with the actual server endpoint URL

        // Optionally, create a hidden input to pass jobPostingId as a form parameter
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'days';
        input.value = filterdays;
        form.appendChild(input);

        // Append the form to the document body
        document.body.appendChild(form);

        // Submit the form
        form.submit();
        sessionStorage.setItem("filterdays",id);
}
function handleFolderClick(id)
{
		var form = document.createElement('form');
        
        form.method = 'POST';
        form.action = '/candidatefolderdetails'; // Replace with the actual server endpoint URL

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
        sessionStorage.setItem("filterdays",id);
}
var folderid=null;
function handledelete(id)
{
	$.ajax({
			url: "/DeleteFolder",
			type: "POST",
			contentType: 'application/json',
			data: JSON.stringify({
				"companyId": companyId,
				"userId": userId,
				"folderId": id,
			}),
			success: function(response) {
				if (response.errors.errorCode == "0000") {
					showToast("success","Deleted Sucessfully");
					window.location.reload();
				} else {
					showToast("info","please try again");
				}
				$('#editFolderModal').modal('hide');
			},
			error: function(xhr, status, error) {
				console.log("error ========== " + error);
				showToast("error","Error Ocuured");
				$('#editFolderModal').modal('hide');
			}
		})
}
function handleedit(name,id)
{
	$('#editFolderModal').modal('show');
	$('#salesforceDeveloper').val(name);
	folderid=id;
}
function handlesubmitfolderName()
{
	var isvalid=true;
	var foldername=$('#salesforceDeveloper').val();
	if(folderid == "")
	{
		showToast("info","folderid is missing please try again!! ");
		isvalid=false;
	}
	if(foldername == "")
	{
		showToast("info","foldername is missing please try again");
		isvalid=false;
	}
	if(isvalid)
	{
		$.ajax({
			url: "/createFolder",
			type: "POST",
			contentType: 'application/json',
			data: JSON.stringify({
				"companyId": companyId,
				"userId": userId,
				"folderId": folderid,
				"folderName":foldername
			}),
			success: function(response) {
				if (response.errors.errorCode == "0000") {
					showToast("success","Updated Sucessfully");
					window.location.reload();
				} else {
					showToast("info","failed sucessfully");
				}
				$('#editFolderModal').modal('hide');
			},
			error: function(xhr, status, error) {
				console.log("error ========== " + error);
				showToast("error","Error Occurred");
				$('#editFolderModal').modal('hide');
			}
		})
	}
	
}
function createfolder()
{
	var isValid=true;
	var foldername=$('#folderName').val();
	if(foldername == "")
	{
		isvalid=false;
		showToast("info","please try again anything is missing");
	}
	if(isValid)
	{
		$.ajax({
			url: "/createFolder",
			type: "POST",
			contentType: 'application/json',
			data: JSON.stringify({
				"companyId": companyId,
				"userId": userId,
				"folderName": foldername
			}),
			success: function(response) {
				$('.loader').hide();
				if (response.errors.errorCode == "0000") {
					showToast("success","Created Sucessfully");
					window.location.reload();
				} else {
					showToast("info","please try again");
				}
				$('#createFolderModal').modal('hide');
			},
			error: function(xhr, status, error) {
				console.log("error ========== " + error);
				showToast("error","Error Ocuured");
				$('#createFolderModal').modal('hide');
			}
		})
	}
}