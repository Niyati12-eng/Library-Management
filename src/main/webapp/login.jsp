<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(to right, #2c3e50, #3498db);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-container {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        width: 350px;
    }
    h2 {
        text-align: center;
        color: #333333;
        margin-bottom: 20px;
    }
    label {
        font-size: 14px;
        color: #555555;
        margin-bottom: 5px;
        display: block;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        font-size: 14px;
    }
    input[type="submit"] {
        width: 100%;
        background: linear-gradient(90deg, #4CAF50, #66BB6A);
        color: white;
        padding: 12px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background: linear-gradient(90deg, #43A047, #388E3C);
    }
    .error {
        color: #d32f2f;
        font-size: 14px;
        text-align: center;
    }
</style>

</head>
<body>
 <div class="login-container">
        <h2>Login</h2>
        <form method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                if ("admin".equals(username) && "password123".equals(password)) {
                    session.setAttribute("username", username);
                    response.sendRedirect("viewBooks.jsp");
                } else {
                    out.println("<p class='error'>Invalid username or password</p>");
                }
            }
        %>
    </div>
</body>
</html>