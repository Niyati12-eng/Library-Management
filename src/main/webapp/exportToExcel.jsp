<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Export to Excel</title>
</head>
<body>
<%
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename=LibraryBooks.xls");
    PrintWriter out1 = response.getWriter();
%>
 <table border="1">
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
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/libraryDB", "root", "");
                        String query = "SELECT b.book_id, b.title, b.author, b.status, t.issued_to, t.issued_at, t.returned_by, t.return_date " +
                                       "FROM books b LEFT JOIN transactions t ON b.book_id = t.book_id " +
                                       "ORDER BY t.issued_at DESC";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("book_id") + "</td>");
                            out.println("<td>" + rs.getString("title") + "</td>");
                            out.println("<td>" + rs.getString("author") + "</td>");
                            out.println("<td>" + rs.getString("status") + "</td>");
                            out.println("<td>" + (rs.getString("issued_to") != null ? rs.getString("issued_to") : "N/A") + "</td>");
                            out.println("<td>" + (rs.getTimestamp("issued_at") != null ? rs.getTimestamp("issued_at").toString() : "N/A") + "</td>");
                            out.println("<td>" + (rs.getString("returned_by") != null ? rs.getString("returned_by") : "N/A") + "</td>");
                            out.println("<td>" + (rs.getTimestamp("return_date") != null ? rs.getTimestamp("return_date").toString() : "N/A") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
</body>
</html>