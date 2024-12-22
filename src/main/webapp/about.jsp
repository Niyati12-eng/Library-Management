<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
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
            max-width: 800px;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
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

    <!-- About Content -->
    <div class="container">
        <h1>About Us</h1>
        <p>
            Welcome to the Library Management System! Our mission is to simplify library operations by providing
            an easy-to-use platform for managing books, tracking transactions, and offering seamless access
            to library resources.
        </p>
        <p>
            This application is designed to help librarians manage their collections and users keep track
            of the books they've borrowed. Whether you're a student, teacher, or avid reader, we aim to make
            your library experience enjoyable and efficient.
        </p>
    </div>
</body>
</html>