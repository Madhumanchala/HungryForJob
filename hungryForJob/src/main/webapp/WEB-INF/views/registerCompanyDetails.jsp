<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <title>Business Users Details</title>

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


</head>
<body>
    <h1>Register Company Details</h1>

    <c:if test="${not empty registerCompanyDetails}">
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>companyName</th>
                        <th>UserName</th>
                        <th>industry</th>
                        <th>companyEmailId</th>
                        <th>mobileNo</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${registerCompanyDetails}" var="details">
                        <tr>
                            <%-- <td>
                                <c:if test="${not empty details.logo}">
                                    <img src="data:image/png;base64,${details.logo}" alt="Company Logo"/>
                                </c:if>
                            </td> --%>
                            <td>${details.companyName}</td>
                            <td>${details.name}</td>
                            <td>${details.industry}</td>
                            <td>${details.companyEmailId}</td>
                            <td>${details.mobileNo}</td>
                           </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty registerCompanyDetails}">
        <p>No company details available.</p>
    </c:if>
</body>
</html>
