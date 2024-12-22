<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
   <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        .heading {
            text-align: center;
            margin-bottom: 20px;
        }
        .heading h1 {
            font-size: 2.5rem;
            margin: 10px 0;
        }
        .heading h2 {
            font-size: 1.5rem;
            margin: 5px 0;
            color: #eeeeee;
        }
        .container {
            background-color: #f9f9f9;
            color: #333;
            max-width: 1000px;
            width: 90%;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #3498db;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
        }
        .btn:hover {
            background-color: #2c3e50;
        }
    </style>
</head>
<body>
  <!-- Heading Section -->
    <div class="heading">
        <h1>Library Management System</h1>
        <h2>View Books and Transactions</h2>
    </div>

    <!-- Table Section -->
    <div class="container">
        <h2>Books and Transaction Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Status</th>
                    <th>Issued To</th>
                    <th>Issued At</th>
                    <th>Returned By</th>
                    <th>Return Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/libraryDB", "root", "");
                        String query = "SELECT b.book_id, b.title, b.author, b.status, t.issued_to, t.issued_at, t.returned_by, t.return_date " +
                                       "FROM books b LEFT JOIN transactions t ON b.book_id = t.book_id ORDER BY t.issued_at DESC";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("book_id") %></td>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("author") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td><%= rs.getString("issued_to") != null ? rs.getString("issued_to") : "N/A" %></td>
                    <td><%= rs.getTimestamp("issued_at") != null ? rs.getTimestamp("issued_at").toString() : "N/A" %></td>
                    <td><%= rs.getString("returned_by") != null ? rs.getString("returned_by") : "N/A" %></td>
                    <td><%= rs.getTimestamp("return_date") != null ? rs.getTimestamp("return_date").toString() : "N/A" %></td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>

        <!-- Buttons Section -->
        <a href="index.jsp" class="btn">Back to Home</a>
        <a href="exportToExcel.jsp" class="btn">Export to Excel</a>
    </div>

</body>
</html>