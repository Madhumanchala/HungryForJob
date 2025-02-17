<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <title>Active Company Details</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
            text-align: left;
        }

        th, td {
            padding: 8px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        td img {
            width: 80px;
            height: 80px;
            object-fit: contain;
        }

        /* Styling for the toggle switch */
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: 0.4s;
            border-radius: 34px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            border-radius: 50%;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: 0.4s;
        }

        input:checked + .slider {
            background-color: #4CAF50; /* Green */
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        input:not(:checked) + .slider {
            background-color: #f44336; /* Red */
        }

        /* Add responsiveness for small screens */
        @media screen and (max-width: 768px) {
            table {
                font-size: 12px;
            }

            td img {
                width: 50px;
                height: 50px;
            }
        }
    </style>
<!-- <script>
    function toggleStatus(gst_no, currentStatus) {
        // Send AJAX request to update the status
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/updatePlanStatus", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                if (response.data.success) {
                    // Update the button color and text based on new status
                    var button = document.getElementById("status-btn-" + gst_no);
                    if (currentStatus == 0) {
                        button.classList.remove('status-inactive');
                        button.classList.add('status-active');
                        button.textContent = "Active";
                    } else {
                        button.classList.remove('status-active');
                        button.classList.add('status-inactive');
                        button.textContent = "Inactive";
                    }
                } else {
                    alert("Failed to update status: " + response.data.message);
                }
            }
        };

        var data = JSON.stringify({ "gst_no": gst_no, "currentStatus": currentStatus.toString() });
        xhr.send(data);
    }
</script> -->

    <script>
    function toggleStatus1(gst_no, currentStatus) {
        // Toggle the current status
        var newStatus = currentStatus === 1 ? 0 : 1; // If 1, set to 0; if 0, set to 1

        // Send AJAX request to update the status
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/updatePlanStatus", true);
        xhr.setRequestHeader("Content-Type", "application/json");

        // Handle the response when the request is completed
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);

                // Check if the update was successful
                if (response.data && response.data.success) {
                    // Update the checkbox state based on the new status
                    var toggleSwitch = document.getElementById("toggle-switch-" + gst_no);
                    toggleSwitch.checked = (newStatus === 1); // Update the checkbox to the new status

                    // Optionally, you can update the UI based on new status
                } else {
                    showToast("error","Failed to update the status. Please try again.");
                }
            }
        };

        // Prepare the data to be sent
        var data = JSON.stringify({
            "gst_no": gst_no,
            "currentStatus": newStatus
        });

        // Send the AJAX request
        xhr.send(data);
    }
    
    function toggleStatus(gst_no, currentStatus) {
        //ajaxindicatorstart(); // Show loading indicator
		console.log('gst : ' , gst_no);
		console.log('currentStatus : ' , currentStatus);
        
        $.ajax({
            url: '/updatePlanStatus',  // Your backend endpoint to handle status update
            type: 'POST',
            data: {
                gst_no: gst_no,
                currentStatus: currentStatus
            },
            success: function(data, status, xhr) {
                //ajaxindicatorstop(); // Hide loading indicator

                // Check if the server response is in the expected format
                if (xhr.getResponseHeader("Content-Type").includes("application/json")) {
                    // Assuming the response is in JSON format
                    let response = JSON.parse(data);

                    if (response.errors.errorCode === "0000") {
                        // Successfully updated status, toggle button color
                        var button = document.getElementById("toggle-switch-" + gst_no);
                        if (currentStatus === 1) {
                            button.checked = false;  // Set the switch to inactive
                        } else {
                            button.checked = true;  // Set the switch to active
                        }
                    } else {
                        toastr.error("Error: " + response.errors.errorMessage);
                    }
                } else {
                    showToast("info","Unexpected response type. Please try again.");
                }
            },
            error: function(xhr, status, error) {
                //ajaxindicatorstop(); // Hide loading indicator
                toastr.error("Something went wrong. Please try again.");
            }
        });
    }

</script>

</head>
<body>
	<%@include file="toaster.jsp" %>
    <h1>Active Company Details</h1>

    <c:if test="${not empty CompanyDetails}">
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Logo</th>
                        <th>Company Name</th>
                        <th>Name</th>
                        <th>GST No</th>
                        <th>UTR No</th>
                        <th>Validity</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${CompanyDetails}" var="details">
                        <tr>
                            <td>
                                <c:if test="${not empty details.logo}">
                                    <img src="data:image/png;base64,${details.logo}" alt="Company Logo"/>
                                </c:if>
                            </td>
                            <td>${details.companyName}</td>
                            <td>${details.name}</td>
                            <td>${details.gst_no}</td>
                            <td>${details.utr_no}</td>
                            <td>${details.validity}</td>
                            <td>
                                <%-- <label class="switch">
                                    <input 
                                        type="checkbox" 
                                        id="toggle-switch-${details.gst_no}" 
                                        ${details.status == 1 ? 'checked' : ''} 
                                        onclick="toggleStatus(${details.gst_no}, ${details.status})">
                                    <span class="slider"></span>
                                </label> --%>
                                <label class="switch">
    <input 
        type="checkbox" 
        id="toggle-switch-${details.gst_no}" 
        ${details.status == 1 ? 'checked' : ''} 
        onclick="toggleStatus(${details.gst_no}, ${details.status})">
    <span class="slider"></span>
</label>
                                
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty CompanyDetails}">
        <p>No company details available.</p>
    </c:if>
</body>
</html>
