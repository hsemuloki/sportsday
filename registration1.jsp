<%@ page contentType="text/html" import="java.sql.*" %>
<html>
<body>
    <h1>Delete User JSP Page</h1>
    <%
    String uname = request.getParameter("txtName");
    String pass1 = request.getParameter("txtPass1");
    

    if (pass1.equals(pass1)) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a connection to the database
            Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exampledb", "root", "1618");

            // SQL query to delete a row where the username and password match
            PreparedStatement stmt = Con.prepareStatement("DELETE FROM sports WHERE username = ? AND password = ?");

            // Set the parameters for the prepared statement
            stmt.setString(1, uname);
            stmt.setString(2, pass1);

            // Execute the delete query
            int row = stmt.executeUpdate();

            if (row > 0) {
                // If the deletion was successful
                out.println("User " + uname + " successfully deleted.");
            } else {
                // If no row was affected (user not found)
                out.println("Deletion failed. No user found with the provided credentials.");
            }
        } catch (Exception e) {
            // Catch any exceptions and print the error message
            out.println("Error: " + e.getMessage());
        }
    } else {
        // If passwords do not match, show an error
        out.println("<h1>Password Mismatch</h1>");
    }
    %>
</body>
</html>
