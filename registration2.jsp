<%@page contentType="text/html" import="java.sql.*" %>
<html><body>
<h1>Registration JSP Page</h1>
<%
String uname=request.getParameter("txtName");
String pass1=request.getParameter("txtPass1");
String pass2=request.getParameter("txtPass2");

if(pass1.equals(pass2))
{
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection
Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exampledb", "root", "1618");
PreparedStatement stmt=Con.prepareStatement("insert into students values(?,?)");
stmt.setString(1,uname);
stmt.setString(2,pass1);
int row=stmt.executeUpdate();
if(row==1)
{
out.println("Registration Successful");}
else
{
out.println("Registration FAILED!!!!");
%>
<jsp:include page="registration.html"></jsp:include>
<%
}
}catch(Exception e){out.println(e);}
}
else
{
out.println("<h1>Password Mismatch</h1>");
%>
<jsp:include page="registration.html"></jsp:include>
<% }
%>
</body>
</html>