<%@ page contentType="text/html" import="java.sql.*" %>
<html>
<body>
<h1></h1>
<%
    String uname = request.getParameter("txtName");
    String pass = request.getParameter("txtPass");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exampledb", "root", "1618");

        String query = "SELECT password FROM sports WHERE username = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, uname);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String storedPassword = rs.getString("password");
            if (pass.equals(storedPassword)) {
                out.println("");
                %>
                <jsp:include page="carrom.html"></jsp:include>
                <%
            } else {
                out.println("<h1>Password does not match!!!!!</h1>");
                %>
                <jsp:include page="index.html"></jsp:include>
                <%
            }
        } else {
            out.println("<h1>User does not exist!!!!!</h1>");
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
