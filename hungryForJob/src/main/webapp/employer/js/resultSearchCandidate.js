function isPhoneNumber(candidateId, phoneNumber, viewPhonenumber) {
	if (phoneNumber == "name") {
		clickDeductprofile("phoneNumber", candidateId, phoneNumber, viewPhonenumber);
	} else {
		if ($('#'+phoneNumber).is(':visible')) {
			$('#'+viewPhonenumber).text("View phone number");
			$('#'+phoneNumber).hide();
		} else {
			clickDeduct("phoneNumber", candidateId,phoneNumber, viewPhonenumber);
		}
	}

}
let skills = sessionStorage.getItem('saveSearchSkill');
let minExp = sessionStorage.getItem('saveSearchMinExp');
let maxExp = sessionStorage.getItem("saveSearchMaxExp");
let location1 = sessionStorage.getItem("saveSearchLocation");
let minSalary = sessionStorage.getItem("saveSearchMinSalary");
if(minSalary == null || minSalary == undefined || minSalary === "null" || minSalary === "")
{
	minSalary=null;
}
let maxSalary = sessionStorage.getItem("saveSearchMaxSalary");
if(maxSalary == null || maxSalary == undefined || maxSalary === "null" || maxSalary === "")
{
	maxSalary=null;
}
let company = sessionStorage.getItem("saveSearchCompany");
if(company == null || company == undefined || company === "null" || company === "")
{
	company=null;
}
let noticePeriod = sessionStorage.getItem("saveSearchNoticePeriod");
if(noticePeriod == null || noticePeriod == undefined || noticePeriod === "null")
{
	noticePeriod=null;
}
let highestQualification = sessionStorage.getItem("saveSearchHighestQualification");
if(highestQualification == null || highestQualification == undefined || highestQualification === "null")
{
	highestQualification=null;
}
let course = sessionStorage.getItem("saveSearchCourse");
if(course == null || course == undefined || course === "null")
{
	course=null;
}
let specialization = sessionStorage.getItem("saveSearchSpecialization");
if(specialization == null || specialization == undefined || specialization === "null")
{
	specialization=null;
}
let courseType = sessionStorage.getItem("saveSearchCourseType");
if(courseType == null || courseType == undefined || courseType === "null")
{
	courseType=null;
}
let university = sessionStorage.getItem("saveSearchUniversity");
if(university == null || university == undefined || university === "null")
{
	university=null;
}
let gender = sessionStorage.getItem("gender");
if(gender == null || gender == undefined || gender === "null")
{
	gender=null;
}
let isReadyToLocate = sessionStorage.getItem("isReadyToLocate");
function saveSearch() {
	$('.loader').show();
	$.ajax({
		url: "/saveSearch",
		type: "POST",
		contentType: 'application/json',
		data: JSON.stringify({
			"companyId":companyId,
			"userId": userId,
			"skill": skills,
			"minExp": minExp,
			"maxExp": maxExp,
			"location": location1,
			"minSal": minSalary,
			"maxSal": maxSalary,
			"company": company,
			"noticePeriod": noticePeriod,
			"highestQualification": highestQualification,
			"course": course,
			"specialization": specialization,
			"courseType": courseType,
			"institute": university,
			"gender": gender,
			"readyToLocate": isReadyToLocate
		}),
		success: function(response) {
			$('.loader').hide();
			console.log('save Search successfully:', response);
			if (response.errors.errorCode == "0000") {
				showToast("success","saved sucessfully");
			} else {
				showToast("info","please try again");
			}

			// Add success handling logic here
		},
		error: function(xhr, status, error) {
			$('.loader').hide();
			console.log('Error:', error);
			showToast("error","Error Ocuured");
			// Add error handling logic here
		}

	})
}
function modifySearch() {
	sessionStorage.setItem("modifyClicked", "clicked");

	 	var form = document.createElement('form');
        
        form.method = 'POST';
        form.action = '/searchCandidates'; 

        // Append the form to the document body
        document.body.appendChild(form);

        // Submit the form
        form.submit();

}
function NewSearch()
{
	sessionStorage.removeItem("modifyClicked");

	 	var form = document.createElement('form');
        
        form.method = 'POST';
        form.action = '/searchCandidates'; 

        // Append the form to the document body
        document.body.appendChild(form);

        // Submit the form
        form.submit();
}
let submitId = null;
function handleClick(id) {
	submitId = id;
	$('#addToModal').modal('show');
}
function isCreateOrExisting() {
	let value = $('#isSubmit').text();
	let folderName = $('#createnewfolder').val();
	if (value == 'Create') {
		$.ajax({
			url: "/createFolder",
			type: "POST",
			contentType: 'application/json',
			data: JSON.stringify({
				"companyId": companyId,
				"userId": userId,
				"folderName": folderName
			}),
			success: function(response) {
				$('.loader').hide();
				if (response.errors.errorCode == "0000") {
					showToast("success","Created Sucessfully");
					fetchFolderDetails();
				} else {
					showToast("info","please try again");
				}
				$('#addToModal').modal('hide');
			},
			error: function(xhr, status, error) {
				console.log("error ========== " + error);
				showToast("error","Error Ocuured");
				$('#addToModal').modal('hide');
			}
		})
	}
	if (value == 'Submit') {
		let folderId = $('#addExistingfolder').val();
		let isSumitted = true;
		if (folderId == null) {
			isSumitted = false;
			showToast("info","anything is missing please try again later");
		}
		if (submitId == null) {
			isSumitted = false;
			showToast("info","anything is missing please try again later");
		}
		if (isSumitted) {
			$.ajax({
				url: "/addExistingFolder",
				type: "POST",
				contentType: 'application/json',
				data: JSON.stringify({
					"companyId": companyId,
					"userId": userId,
					"folderId": folderId,
					"candidateId": submitId

				}),
				success: function(response) {
					$('.loader').hide();
					if (response.errors.errorCode == "0000") {
						showToast("success","Added Successfull");
					} else {
						showToast("info","please try again");
					}
					$('#addToModal').modal('hide');
				},
				error: function(xhr, status, error) {
					console.log("error ========== " + error);
					showToast("error","Error Ocuured");
					$('#addToModal').modal('hide');
				}
			})
		}

	}
}
function fetchFolderDetails() {
	$.ajax({
		url: "/fetchFolderDetails",
		type: "POST",
		contentType: 'application/json',
		data: JSON.stringify({
			"companyId": companyId,
			"userId": userId
		}),
		success: function(response) {
			var data = response.data.folderDetails
			$('.loader').hide();
			if (response.errors.errorCode == "0000") {
				$('#addExistingfolder').empty();
				data.forEach(function(folder) {
					$('#addExistingfolder').append(
						$('<option></option>').val(folder.id).text(folder.folderName));
				});
			} else {
				console.log("fetched failed");
			}
			$('#addToModal').modal('hide');
		},
		error: function(xhr, status, error) {
			console.log("error ========== " + error);
			showToast("error","Error Ocuured");
			$('#addToModal').modal('hide');
		}
	})
}
$(document).ready(function() {
	fetchFolderDetails()
});
function clickDeduct(type, candidateId,phonenumber,viewphonenumber) {
	$.ajax({
		url: "/clickDeduct",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({
			"companyId": companyId,
			"userId": userId,
			"type": type,
			"candidateId": candidateId
		}),
		success: function(response) {
			if (response.errors.errorCode == "0000") {
				$('#'+viewphonenumber).text("Hide phone number");
				$('#'+phonenumber).show();
			} else {
				$('#'+viewphonenumber).text("View phone number");
			}
		},
		error: function(xhr, status, error) {
			console.log("error ========== " + error);
		}
	})
}

function clickDeductprofile(type, candidateId,phonenumber,viewphonenumber) {
	$.ajax({
		url: "/clickDeduct",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({
			"companyId": companyId,
			"userId": userId,
			"type": type,
			"candidateId": candidateId
		}),
		success: function(response) {
			if (response.errors.errorCode == "0000") {
				console.warn('in side');
				
				
				var form = $('<form>', {
				               'action': '/employerCandidateprofile',
				               'method': 'POST'
				           });
						   
						   form.append($('<input>', {
						       'type': 'hidden',
						       'name': 'candidateId',  // Name of the field you want to send
						       'value': candidateId  // Value you want to pass
						   }));

				           form.appendTo('body').submit(); 
				
			} else {
				
			}
		},
		error: function(xhr, status, error) {
			console.log("error ========== " + error);
		}
	})
}

function search(email) {
    	console.warn("Button click", email);
    	$.ajax({
    		url: "/searchbyemail",
    		type: "POST",
    		contentType: "application/json",
    		data: JSON.stringify({
    			"email": email
    			
    		}),
    		success: function(response) {
    			console.log("Response received:", response);  // Log the response to verify it
    			if (response === 'User Found') {  // Trim to remove any leading/trailing spaces
    				console.warn('inside if condition');
    				var form = document.createElement("form");
				    form.method = "POST";  
				    form.action = "/searchCandidates";  

				   /*  form.appendChild(emailInput); */  

				    document.body.appendChild(form);
				    form.submit(); 
    			} else  if (response === 'No User Found'){
					showToast("info","No user found or some condition did not match.");
    				/*window.location.href = "/portalRegister?email="+data;*/
    				var form = document.createElement("form");
    				    form.method = "POST";  
    				    form.action = "/empportalRegister";  
    				    var emailInput = document.createElement("input");
    				    emailInput.type = "hidden";
    				    emailInput.name = "email";  
    				    emailInput.value = email	;  

    				    form.appendChild(emailInput);  

    				    document.body.appendChild(form);
    				    form.submit(); 
    			}
    		},
    		error: function(xhr, status, error) {
    			console.log("error ========== " + error);
    		}
    	});
    }

// ###################### filters validation #########################
function filtersValidation()
{
	var skillsList = skills.split(","); 
	$('#iTSkills').val(skillsList).trigger('change');
	$('#filterMinExp').val(minExp).trigger('change');
	$('#filterMaxExp').val(maxExp).trigger('change');
	var filterlocation = location1.split(","); 
	$('#filterLocation').val(filterlocation).trigger('change');
	$('#filtersearchMinSalary').val(minSalary).trigger('change');
	$('#filtersalaryFigureMax').val(maxSalary).trigger('change');
	if(gender !== null || gender !== "null")
	{
		$("input[name='workmode'][value='" + gender + "']").prop("checked", true);
	}
	let highestqualification=sessionStorage.getItem("highestQualification");
	let filtercourse=sessionStorage.getItem("course");
	let filterspecialization=sessionStorage.getItem("specialization");
	let filtercourseType=sessionStorage.getItem("courseType");
	let filterinstitute=sessionStorage.getItem("institute");
	if(highestqualification !== null && highestqualification !=="null")
	{
		$("input[name='highestqualification'][value='"+highestqualification+"']").prop('checked',true);
		$('#specializationAccordian').show();
		$('#courseAccordian').show();
		$("#courseTypeAccordian").show();
		$('#universityAccordian').show(); 
	}else
	{
		$('#courseAccordian').hide();
		$('#specializationAccordian').hide();
		$("#courseTypeAccordian").hide();
		$('#universityAccordian').hide(); 
	}
	if(filtercourse !== null && filtercourse !== "null")
	{
		onChangeHighestQualification().then(() => {
			$("select[name='coursename']").val(filtercourse).trigger('change');
			
		});	
		
	}else
	{
		onChangeHighestQualification();
	}
	if(filterspecialization !== null && filterspecialization !=="null")
	{
		onChangeHighestQualification().then(() => {
			$("select[name='coursename']").val(filtercourse).trigger('change');
			
			if (filterspecialization !== null && filterspecialization !== "null") {
           		 return getSpecialization();  
        	}
		}).then(() => {
        // This part only runs after getSpecialization() resolves
        $("select[name='specializationname']").val(filterspecialization).trigger('change');
    }).catch((error) => {
        console.error("Error:", error);
    });
		
	}else
	{
		getSpecialization();
	}
	if(filtercourseType !== null && filtercourseType !== "null")
	{
		$("input[name='courseType'][value='"+filtercourseType+"']").prop('checked',true);
	}
	if(filterinstitute !== null && filterinstitute !== "null")
	{
		$("select[name='institutename']").val(filterinstitute).trigger('change');
	}
	
	var lastactive = sessionStorage.getItem("lastactive");

	if (!lastactive) { // This covers null, undefined, and empty string
	    $("select[name='lastactivein']").val("").trigger('change');
	} else {
	    $("select[name='activein']").val(lastactive).trigger('change');
	}

}
function submitSearchCandidate()
{
	var filterskills=$('#iTSkills').val();
	var filterminexp=$('#filterMinExp').val();
	var filtermaxexp=$('#filterMaxExp').val();
	var filterlocation=$('#filterLocation').val();
	var filterminsal=$('#filtersearchMinSalary').val();
	var filtermaxsal=$('#filtersalaryFigureMax').val();
	var filtergender=$("input[name='workmode']:checked").val();
	var filtercompany=$("select[name='company'] option:selected").val();
	var filternoticePeriod=$("input[name='noticePeriod']:checked").val();
	var filterhighestqualification=$("input[name='highestqualification']:checked").val();
	var filtercourse=$("select[name='coursename'] option:selected").val();
	var filterspecialization=$("select[name='specializationname'] option:selected").val();
	var filercoursetype=$("input[name='courseType']:checked").val(); 
	var filteruniversity=$("select[name='institutename'] option:selected").val();
	var filterActiveIn=$("#activein").val();
	
	var readyToLocate=sessionStorage.getItem("readytoLocate");
	
	if(filterskills == null || filterskills === "null" ||  filterskills == undefined || filterskills === "")
	{
		filterskills=null;
	}
	if(filterminexp == null || filterminexp === "null" || filterminexp == undefined || filterminexp === "")
	{
		filterminexp=null;
	}
	if(filtermaxexp == null || filtermaxexp === "null" || filtermaxexp == undefined || filtermaxexp === "")
	{
		filtermaxexp=null;
	}
	if(filterlocation == null || filterlocation === "null" || filterlocation == undefined || filterlocation === "")
	{
		filterlocation=null;
	}
	if(filterminsal == null || filterminsal === "null" || filterminsal == undefined || filterminsal === "")
	{
		filterminsal=null;
	}
	if(filtergender == null || filtergender === "null" || filtergender == undefined || filtergender === "")
	{
		filtergender=null;
	}
	if(filtercompany == null || filtercompany === "null" || filtercompany == undefined ||  filtercompany === "")
	{
		filtercompany=null;
	}
	if(filternoticePeriod == null || filternoticePeriod === "null" || filternoticePeriod == undefined || filternoticePeriod === "")
	{
		filternoticePeriod=null;
	}
	if(filterhighestqualification == null || filterhighestqualification === "null" || filterhighestqualification == undefined || filterhighestqualification === "")
	{
		filterhighestqualification=null;
	}
	if(filtercourse == null || filtercourse === "null" || filtercourse == undefined || filtercourse === "")
	{
		filtercourse=null;
	}
	if(filterspecialization == null || filterspecialization === "null" || filterspecialization == undefined || filterspecialization === "")
	{
		filterspecialization=null;
	}
	if(filteruniversity == null || filercoursetype === "null" || filercoursetype == undefined || filercoursetype === "")
	{
		filteruniversity=null;
	}
	if(filercoursetype == null || filercoursetype === "null" || filercoursetype == undefined || filercoursetype === "")
	{
		filercoursetype=null;
	}
	var form = document.createElement('form');
	
	// view details
	const selectedTexts = $('#iTSkills option:selected').map(function() {
        return $(this).text();
    }).get().join(', ');
	sessionStorage.setItem("keySkills",selectedTexts)
	sessionStorage.setItem("Experience",[filterminexp,filtermaxexp].join("-")+" years");
	sessionStorage.setItem("CTC",filterminsal+"-"+filtermaxsal);
	var filterLocationSession = $('#filterLocation option:selected').map(function() {
    return $(this).text();
	}).get().join(', '); 
	sessionStorage.setItem("Locations",filterLocationSession);
	if(filterhighestqualification !== null && filterhighestqualification !== undefined)
	{
		sessionStorage.setItem("highestQualification",filterhighestqualification);
	}
	if(filternoticePeriod !== null && filternoticePeriod !== undefined)
	{
		sessionStorage.setItem("NoticePeriod",filternoticePeriod);
	}
	if(filtergender !== null && filtergender !== undefined)
	{
		sessionStorage.setItem("gender",filtergender);
		
	}
	if(filteruniversity !== null && filteruniversity !== undefined)
	{
		sessionStorage.setItem("institute",filteruniversity);
	}
	if(filercoursetype !== null && filercoursetype !== undefined)
	{
		sessionStorage.setItem("courseType",filercoursetype);
	}
	if(filterspecialization !== null && filterspecialization !== undefined)
	{
		sessionStorage.setItem("specialization",filterspecialization);
		
	}
	if(filtercourse !== null && filtercourse !== undefined)
	{
		sessionStorage.setItem("course",filtercourse);
	}
	
	
	// save search
	sessionStorage.setItem("saveSearchSkill",filterskills);
	sessionStorage.setItem("saveSearchMinExp",filterminexp);
	sessionStorage.setItem("saveSearchMaxExp",filtermaxexp);
	var locationString = filterlocation ? filterlocation.join(",") : "";
	sessionStorage.setItem("saveSearchLocation",locationString);
	sessionStorage.setItem("saveSearchMinSalary",filterminsal);
	sessionStorage.setItem("saveSearchMaxSalary",filtermaxsal);
	sessionStorage.setItem("gender",filtergender);
	sessionStorage.setItem("saveSearchCompany",filtercompany);
	sessionStorage.setItem("saveSearchNoticePeriod",filternoticePeriod);
	sessionStorage.setItem("saveSearchHighestQualification",filterhighestqualification);
	sessionStorage.setItem("saveSearchCourse",filtercourse);
	sessionStorage.setItem("saveSearchSpecialization",filterspecialization);
	sessionStorage.setItem("saveSearchCourseType",filercoursetype);
	sessionStorage.setItem("saveSearchUniversity",filteruniversity);
    
    
    form.method = 'POST';
    form.action = '/resultSearchCandidates'; 

    var input1 = document.createElement('input');
 	input1.type = 'hidden';
    input1.name = 'skill';
    input1.value = filterskills;
    form.appendChild(input1);
   
    var input2 = document.createElement('input');
 	input2.type = 'hidden';
    input2.name = 'minExp';
    input2.value = filterminexp;
    form.appendChild(input2);
   
    var input3 = document.createElement('input');
 	input3.type = 'hidden';
    input3.name = 'maxExp';
    input3.value = filtermaxexp;
    form.appendChild(input3);
   
    var input3 = document.createElement('input');
 	input3.type = 'hidden';
    input3.name = 'location';
    input3.value = filterlocation;
    form.appendChild(input3);
    
    var input4= document.createElement('input');
 	input4.type = 'hidden';
    input4.name = 'minSal';
    input4.value = filterminsal;
    form.appendChild(input4);
    
    var input5= document.createElement('input');
 	input5.type = 'hidden';
    input5.name = 'maxSal';
    input5.value = filtermaxsal;
    form.appendChild(input5);
    
    
		var input8=document.createElement("input");
    	input8.type='hidden';
    	input8.name='company';
    	input8.value=filtercompany;
    	form.appendChild(input8);
	
    
    
		var input9=document.createElement("input");
		input9.type='hidden';
		input9.name='noticePeriod';
		input9.value=filternoticePeriod;
		form.appendChild(input9);
	
	
	
		var input10=document.createElement("input");
		input10.type='hidden';
		input10.name='highestQualification';
		input10.value=filterhighestqualification;
		form.appendChild(input10);
	
	
	
		var input11=document.createElement("input");
		input11.type='hidden';
		input11.name='course';
		input11.value=filtercourse;
		form.appendChild(input11);
	
	
	
		var input12=document.createElement('input');
		input12.type='hidden';
		input12.name='specialization';
		input12.value=filterspecialization;
		form.appendChild(input12);
	
	
	
		var input13=document.createElement('input');
		input13.type='hidden';
		input13.name='courseType';
		input13.value=filercoursetype;
		form.appendChild(input13);
	
	

		var input14=document.createElement('input');
		input14.type='hidden';
		input14.name='institute';
		input14.value=filteruniversity;
		form.appendChild(input14);
	
   	
		  var input15=document.createElement('input');
		  input15.type='hidden';
		  input15.name='gender';
		  input15.value=filtergender; 
		  form.appendChild(input15);
	
	
	
		var input16=document.createElement('input');
		input16.type='hidden';
		input16.name='readyToLocate';
		input16.value=readyToLocate;
		form.appendChild(input16);
		
		if(filterActiveIn !== null && filterActiveIn !== "null" && filterActiveIn !== undefined && filterActiveIn !== "")
		{
			var input17=document.createElement('input');
			input17.type='hidden';
			input17.name='activein'
			input17.value=filterActiveIn
			sessionStorage.setItem("lastactive",filterActiveIn);
			form.appendChild(input17);
		}else
		{
			sessionStorage.removeItem("lastactive");
		}
		
	
	
    document.body.appendChild(form);

    form.submit();
}
function onChangeHighestQualification()
{
	var deferred = $.Deferred(); 
	var highestqualifcation=$("input[name='highestqualification']:checked").val();
	var id=null;
	if(highestqualifcation === "phd")
	{
		id="69"
	}
	if(highestqualifcation === "degree")
	{
		id="71"
	}
	if(highestqualifcation === "master")
	{
		id="70"
	}
	if(id != null)
	{
		$.ajax({
			url: "getCourseDetails",
			method: "POST",
			data: {
				"id": id,
				"flag": 1
			},
			success: function(response) {
				if (response.errors.errorCode == "0000") {
					$('#courseAccordian').show();
					if (response.data.course !== null) {
						if (Array.isArray(response.data.course)) {
							var data = response.data.course
							$('#course').empty();
							$('#course').append(
									$('<option></option>').val("").text("Select"));
							$('#specialization').empty();
							$('#specialization').append(
									$('<option></option>').val("").text("Select"));
							data.forEach(function(course) {
								if ($('#course option[value="' + course.id + '"]').length === 0) {
									$('#course').append(
									$('<option></option>').val(course.id).text(course.name));
								}
							});
							 deferred.resolve(); // Resolve the Promise when done
						} else {
							console.error("Unexpected response format:", response);
							 deferred.reject("Unexpected response format");
						}
					}
				} else {
					console.log("response errorcode", response.errors.errorCode, "error message", response.errors.errorMessage);
					deferred.reject("No courses found");
				}
			},
			error: function(xhr, status, error) {
				console.error("An error occurred while fetching course details:", error);
				console.error("Status:", status);
				console.error("Response:", xhr.responseText);
				 deferred.reject(error);
			}
		}); 
	}
	return deferred.promise();
}
function getSpecialization(){
	
	var deferred = $.Deferred();
	var id=$("select[name='coursename'] option:selected").val(); 
	value="specialization";
	$.ajax({
		url: "getCourseDetails",
		method: "POST",
		data: {
			"id": id,
			"flag": 2
		},
		success: function(response) {
			if (response.errors.errorCode == "0000") {
				$('#specializationAccordian').show();
				$("#courseTypeAccordian").show();	
				if (response.data.specialization !== null) {
					if (Array.isArray(response.data.specialization)) {
						var data = response.data.specialization
						$('#' + value).empty();
						$('#' + value).append(
							$('<option></option>').val("").text("Select"));
						data.forEach(function(course) {
							$('#' + value).append(
								$('<option></option>').val(course.id).text(course.name)
							);
						});
						deferred.resolve();
					} else {
						console.error("Unexpected response format:", response);
						$('#errorContainer').text("Unexpected response format.");
						deferred.reject("unexpected response format");
					}
				}
			} else {
				console.log("response errorcode", response.errors.errorCode, "error message", response.errors.errorMessage);
				deferred.reject(response.errors.errorCode);
			}
		},
		error: function(xhr, status, error) {
			console.error("An error occurred while fetching course details:", error);
			console.error("Status:", status);
			console.error("Response:", xhr.responseText);
			deferred.reject(error);
		}
	})
return deferred.promise();
}

function getcoursetypestatus()
{
	$('#universityAccordian').show(); 
}
