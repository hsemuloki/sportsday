<%@page contentType="text/html" import="java.sql.*" %>
<html>
<body>
    <h1>Registration JSP Page</h1>
    <%
    String uname = request.getParameter("txtName");
    String pass1 = request.getParameter("txtPass1");
    String pass2 = request.getParameter("txtPass2");

    if (pass1.equals(pass2)) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exampledb", "root", "1618");
            PreparedStatement stmt = Con.prepareStatement("insert into sports values(?,?)");
            stmt.setString(1, uname);
            stmt.setString(2, pass1);
            int row = stmt.executeUpdate();
            if (row == 1) {
    %>
    <script>
        alert("Registration Successful");
        window.location.href = "success.html"; // Redirect after success
    </script>
    <%
            } else {
    %>
    <script>
        alert("Registration FAILED!!!!");
        window.location.href = "registration.html"; // Redirect back to registration
    </script>
    <%
            }
        } catch (Exception e) {
    %>
    <script>
        alert("Error: <%= e.getMessage() %>");
        window.location.href = "registration.html"; // Redirect back to registration
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert("Password Mismatch");
        window.location.href = "registration.html"; // Redirect back to registration
    </script>
    <%
    }
    %>
</body>
</html>
