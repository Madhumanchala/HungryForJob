<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .error-container {
            text-align: center;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 600px;
            width: 100%;
        }

        .error-container h1 {
            font-size: 5em;
            color: #e74c3c;
            margin-bottom: 20px;
        }

        .error-container p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        .error-container .details {
            font-size: 1em;
            color: #555;
            margin-bottom: 30px;
        }

        .error-container .details span {
            font-weight: bold;
        }

        .error-container a {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .error-container a:hover {
            background-color: #2980b9;
        }

        .error-container .icon {
            font-size: 80px;
            margin-bottom: 20px;
            color: #e74c3c;
        }

        footer {
            position: absolute;
            bottom: 10px;
            width: 100%;
            text-align: center;
            color: #777;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="icon">❌</div>
        <h1>Error</h1>
        <p>Oops, something went wrong!</p>
      </div>
        <%-- <div class="details">
            <p><span>Error Message:</span> <%= exception.getMessage() %></p>
            <p><span>Error Details:</span> <%= exception.getCause() != null ? exception.getCause().toString() : "No additional details available" %></p>
        </div>
        <a href="index.jsp">Go back to the homepage</a>
    </div>

    <footer>
        <p>&copy; 2025 Your Company | All Rights Reserved</p>
    </footer> --%>
</body>
</html>
