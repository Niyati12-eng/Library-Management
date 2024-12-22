<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Management System</title>
<style>
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to bottom right, #2c3e50, #3498db);
        color: #fff;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

   
    .navbar {
        width: 100%;
        background-color: #333;
        overflow: hidden;
        display: flex;
        justify-content: space-around;
        padding: 10px 0;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        padding: 14px 20px;
        display: block;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .navbar a:hover {
        background-color: #575757;
    }

    
    .container {
        background-color: #f9f9f9;
        color: #333;
        width: 90%;
        max-width: 800px;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        margin-top: 20px;
        text-align: center;
    }

    h2 {
        font-size: 1.8rem;
        margin-bottom: 10px;
        color: #3498db;
    }

    h1 {
        font-size: 1.5rem;
        margin-top: 30px;
        margin-bottom: 20px;
        color: #2c3e50;
    }

    form {
        margin-bottom: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        font-weight: bold;
        margin-bottom: 5px;
        text-align: left;
        width: 100%;
        max-width: 400px;
    }

    input, select, button {
        width: 100%;
        max-width: 400px;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        outline: none;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    button {
        background-color: #3498db;
        color: white;
        cursor: pointer;
    }

    button:hover {
        background-color: #2c3e50;
    }

    a {
        color: #3498db;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        margin-top: 20px;
        display: inline-block;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #2c3e50;
        text-decoration: underline;
    }

    .message {
        margin-top: 20px;
        padding: 15px;
        background-color: #27ae60;
        color: #fff;
        border-radius: 6px;
        font-size: 16px;
    }

    .error {
        background-color: #e74c3c;
    }
</style>
</head>
<body>
 <!-- Navigation Bar -->
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="contactus.jsp">Contact</a>
        <a href="viewBooks.jsp">View Books</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Welcome to the e-library</h2>
        <form action="login.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            <input type="submit" value="Login">
        </form>
        
        <h1>Manage Books</h1>

        <!-- Add Book Form -->
        <form method="post" action="bookActions.jsp">
            <input type="hidden" name="action" value="add">
            <input type="text" name="title" placeholder="Book Title" required>
            <input type="text" name="author" placeholder="Author Name" required>
            <select name="status" required>
                <option value="" disabled selected>Status</option>
                <option value="Available">Available</option>
                <option value="Checked Out">Checked Out</option>
            </select>
            <button type="submit">Add Book</button>
        </form>

        <!-- Delete Book Form -->
        <form method="post" action="bookActions.jsp">
            <input type="hidden" name="action" value="delete">
            <input type="number" name="book_id" placeholder="Book ID" required>
            <button type="submit">Delete Book</button>
        </form>

        <!-- Issue Book Form -->
        <form method="post" action="bookActions.jsp">
            <input type="hidden" name="action" value="issue">
            <input type="number" name="book_id" placeholder="Book ID" required>
            <input type="text" name="issued_to" placeholder="User Issuing the Book" required>
            <button type="submit">Issue Book</button>
        </form>

        <!-- Return Book Form -->
        <form method="post" action="bookActions.jsp">
            <input type="hidden" name="action" value="return">
            <input type="text" name="returned_by" placeholder="User returning the book" required>
            <input type="number" name="book_id" placeholder="Book ID" required>
            <button type="submit">Return Book</button>
        </form>
    </div>
</body>
</body>
</html>