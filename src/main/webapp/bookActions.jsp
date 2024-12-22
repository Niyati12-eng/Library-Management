<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Books</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to bottom right, #2c3e50, #3498db);
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
        width: 90%;
        max-width: 600px;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    h1 {
        font-size: 1.8rem;
        color: #2c3e50;
    }
    .message {
        padding: 10px;
        border-radius: 8px;
        font-size: 16px;
        margin-bottom: 20px;
    }
    .success {
        background-color: #d4edda;
        color: #155724;
    }
    .error {
        background-color: #f8d7da;
        color: #721c24;
    }
    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: #3498db;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Book Actions</h1>
        <%
            String action = request.getParameter("action");
            String message = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/libraryDB", "root", "");

                if ("add".equals(action)) {
                    String title = request.getParameter("title");
                    String author = request.getParameter("author");
                    String status = request.getParameter("status");
                    String query = "INSERT INTO books (title, author, status) VALUES (?, ?, ?)";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, title);
                    ps.setString(2, author);
                    ps.setString(3, status);
                    ps.executeUpdate();
                    message = "Book added successfully!";
                    ps.close();

                } else if ("delete".equals(action)) {
                    int bookId = Integer.parseInt(request.getParameter("book_id"));
                    String query = "DELETE FROM books WHERE book_id = ?";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setInt(1, bookId);
                    ps.executeUpdate();
                    message = "Book deleted successfully!";
                    ps.close();

                } else if ("issue".equals(action)) {
                    int bookId = Integer.parseInt(request.getParameter("book_id"));
                    String issuedTo = request.getParameter("issued_to");
                    String updateBookQuery = "UPDATE books SET status = 'Checked Out' WHERE book_id = ?";
                    String transactionQuery = "INSERT INTO transactions (book_id, issued_to) VALUES (?, ?)";
                    
                    PreparedStatement ps = conn.prepareStatement(updateBookQuery);
                    ps.setInt(1, bookId);
                    ps.executeUpdate();
                    
                    ps = conn.prepareStatement(transactionQuery);
                    ps.setInt(1, bookId);
                    ps.setString(2, issuedTo);
                    ps.executeUpdate();
                    message = "Book issued successfully!";
                    ps.close();

                } else if ("return".equals(action)) {
                    int bookId = Integer.parseInt(request.getParameter("book_id"));
                    String returnedBy = request.getParameter("returned_by");
                    String updateBookQuery = "UPDATE books SET status = 'Available' WHERE book_id = ?";
                    String updateTransactionQuery = "UPDATE transactions SET return_date = CURRENT_TIMESTAMP, returned_by = ? WHERE book_id = ? AND return_date IS NULL";
                    
                    PreparedStatement ps = conn.prepareStatement(updateBookQuery);
                    ps.setInt(1, bookId);
                    ps.executeUpdate();
                    
                    ps = conn.prepareStatement(updateTransactionQuery);
                    ps.setString(1, returnedBy);
                    ps.setInt(2, bookId);
                    ps.executeUpdate();
                    message = "Book returned successfully!";
                    ps.close();
                }

                conn.close();
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            }
        %>
        <div class="message <%= message.startsWith("Error") ? "error" : "success" %>">
            <%= message %>
        </div>
        <a href="viewBooks.jsp">Back to View Books</a>
    </div>
 </body>
</html>