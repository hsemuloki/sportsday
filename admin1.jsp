<%@ page contentType="text/html" import="java.sql.*" %>
<html>
<body>

<%
    String uname = request.getParameter("txtName");
    String pass = request.getParameter("txtPass");
    String newUname = request.getParameter("newName");
    String newPass = request.getParameter("newPass");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exampledb", "root", "1618");

        // Check if the username and password exist in the database
        String selectQuery = "SELECT * FROM admin WHERE username = ? AND password = ?";
        pstmt = con.prepareStatement(selectQuery);
        pstmt.setString(1, uname);
        pstmt.setString(2, pass);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Update the username and password
            String updateQuery = "UPDATE admin SET username = ?, password = ? WHERE username = ?";
            pstmt = con.prepareStatement(updateQuery);
            pstmt.setString(1, newUname);
            pstmt.setString(2, newPass);
            pstmt.setString(3, uname);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<h1>Username and password updated successfully!</h1>");
                %>
                <jsp:include page="admin.html"></jsp:include>
                <%
            } else {
                out.println("<h1>Failed to update username and password.</h1>");
                %>
                <jsp:include page="registration.html"></jsp:include>
                <%
            }
        } else {
            out.println("<h1>Invalid current username or password.</h1>");
            %>
            <jsp:include page="index.html"></jsp:include>
            <%
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>An error occurred: " + e.getMessage() + "</h1>");
        %>
        <jsp:include page="index.html"></jsp:include>
        <%
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
