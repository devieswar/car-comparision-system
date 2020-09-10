<html>
<body>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String emailid=request.getParameter("emailid");
String password=request.getParameter("password");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "");
String sql = "CREATE DATABASE if not exists test";Statement s1=con.createStatement();
s1.executeUpdate(sql);
Statement s2=con.createStatement();
s2.executeUpdate("use test");
Statement stmt=con.createStatement();
stmt.executeUpdate("create table if not exists names(firstname varchar(50),lastname
varchar(50),username varchar(50) primary key,emailid varchar(50),password varchar(15))");
PreparedStatement pstatement = null;
String queryString = "INSERT INTO names(firstname,lastname,username,emailid,password)
VALUES (?, ?, ? ,? , ?)";
pstatement = con.prepareStatement(queryString);
pstatement.setString(1, firstname);
pstatement.setString(2, lastname);
pstatement.setString(3, username);
pstatement.setString(4, emailid);
pstatement.setString(5, password);
int result = pstatement.executeUpdate();
if(result!=0){
out.println("Data is successfully inserted!");
}
else {
out.println("try again");}
}
catch(Exception e)
{
out.println(e);
}
%>
<a href ="http://localhost:8080/538/comparision.html">Back To Home</a><br/><br/>
</body>
</html>
