<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us- Action</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #f9f9f9;
            color: #333;
            max-width: 600px;
            width: 90%;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h1 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        p {
            font-size: 1rem;
            line-height: 1.6;
            color: #555;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }
        a {
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
            display: inline-block;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Contact Us Submission</h1>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
            String resultMessage = "";

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/libraryDB", "root", "");

                // Insert contact form data into a table
                String query = "INSERT INTO contact_us (name, email, message, submitted_at) VALUES (?, ?, ?, NOW())";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, message);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    resultMessage = "<p class='success'>Thank you, " + name + "! Your message has been received. We'll get back to you soon.</p>";
                } else {
                    resultMessage = "<p class='error'>Oops! Something went wrong. Please try again later.</p>";
                }

                ps.close();
                conn.close();
            } catch (Exception e) {
                resultMessage = "<p class='error'>Error: " + e.getMessage() + "</p>";
            }
        %>
        <%= resultMessage %>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>