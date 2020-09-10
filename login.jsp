<!DOCTYPE html>
<html>
<title>Camparision</title>
<style>
input[type="text"] {width: 35%;
padding: 10px 15px;
margin: 8px 0;
box-sizing: border-box;
}
.registerbtn {
background-color: #808080;
color: white;
padding: 20px 20px;
margin: 8px 0;
border: none;
cursor: pointer;
width: 10%;
opacity: 0.9;
}
</style>
<body style="text-align:center;background-color:black">
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "");
String sql = "CREATE DATABASE if not exists test";
Statement s1=con.createStatement();
s1.executeUpdate(sql);
Statement s2=con.createStatement();
s2.executeUpdate("use test");
Statement stmt=con.createStatement();
//stmt.executeUpdate("create table if not exists names(username varchar(30),password
varchar(15))");
PreparedStatement pstatement = null;
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from names where username='"+username+"'");
if(rs.next())
{
if(rs.getString(2).equals(password)){
out.println("welcome "+username+":");
}
else {
out.println("try again");}
}
}
catch(Exception e)
{
out.println(e);
}
%>
<img src="http://localhost:8080/img/black.jpg" style="width:50%">
<form action="http://localhost:8080/538/test.jsp" method="post">
<div class="car1" style="width: 50%; height: 50%; background-color: black; float:left">
<h1 style="color:#808080;">Car 1</h1>
<label for="carname"><b style="color:#808080;">Car Name</b></label>
<input type = "text" list = "carname1" name="carname1">
<datalist id="carname1"style="visibility:visible">
<option value="BMW">BMW</option>
<option value="Ford">Ford</option>
<option value="Jaguar">Jaguar</option>
<option value="TATA">TATA</option>
<option value="Nissan">Nissan</option>
<option value="Ferrari">Ferrari</option>
</datalist>
<br>
<br>
<label for="modelname"><b style="color:#808080;">Model Name</b></label>
<input type = "text" list = "modelname1" name="modelname1">
<datalist id="modelname1">
<optgroup label="BMW">
<option label="BMW">X1</option>
<option label="BMW">X3</option>
<option label="BMW">X4</option>
<option label="BMW">3Series</option>
<option label="BMW">3SeriesGT</option>
<option label="BMW">5Series</option>
</optgroup>
<optgroup label="Ford">
<option label="Ford">Ecosport</option><option label="Ford">Mustang</option>
<option label="Ford">Endeavour</option>
<option label="Ford">Figo</option>
<option label="Ford">Aspire</option>
</optgroup>
<optgroup label="Jaguar">
<option label="Jaguar">XJ</option>
<option label="Jaguar">XE</option>
<option label="Jaguar">F-TYPE</option>
</optgroup>
<optgroup label="TATA">
<option label="TATA">Nexon</option>
<option label="TATA">Tiago</option>
<option label="TATA">Bolt</option>
</optgroup>
<optgroup label="Nissan">
<option label="Nissan">Kicks</option>
<option label="Nissan">Micra</option>
<option label="Nissan">GT-R</option>
</optgroup>
<optgroup label="Ferrari">
<option label="Ferrari">812Superfast</option>
<option label="Ferrari">Portofino</option>
<option label="Ferrari">GTC4lusso</option>
</optgroup >
</datalist>
<br>
</div>
<div class="car2" style="width: 50%; height: 50%; background-color: black; float:right">
<h1 style="color:#808080;">Car 2</h1>
<label for="carname"><b style="color:#808080;">Car Name</b></label>
<input type="text" list ="carname2"name="carname2">
<datalist id="carname2"style="visibility:visible">
<option value="BMW">BMW</option>
<option value="Ford">Ford</option>
<option value="Jaguar">Jaguar</option>
<option value="TATA">TATA</option>
<option value="Nissan">Nissan</option>
<option value="Ferrari">Ferrari</option>
</datalist>
<br>
<br>
<label for="modelname"><b style="color:#808080;">Model Name</b></label><input type = "text" list = "modelname2" name="modelname2">
<datalist id="modelname2">
<optgroup label="BMW">
<option label="BMW">X1</option>
<option label="BMW">X3</option>
<option label="BMW">X4</option>
<option label="BMW">3Series</option>
<option label="BMW">3SeriesGT</option>
<option label="BMW">5Series</option>
</optgroup>
<optgroup label="Ford">
<option label="Ford">Ecosport</option>
<option label="Ford">Mustang</option>
<option label="Ford">Endeavour</option>
<option label="Ford">Figo</option>
<option label="Ford">Aspire</option>
</optgroup>
<optgroup label="Jaguar">
<option label="Jaguar">XJ</option>
<option label="Jaguar">XE</option>
<option label="Jaguar">F-TYPE</option>
</optgroup>
<optgroup label="TATA">
<option label="TATA">Nexon</option>
<option label="TATA">Tiago</option>
<option label="TATA">Bolt</option>
</optgroup>
<optgroup label="Nissan">
<option label="Nissan">Kicks</option>
<option label="Nissan">Micra</option>
<option label="Nissan">GT-R</option>
</optgroup>
<optgroup label="Ferrari">
<option label="Ferrari">812Superfast</option>
<option label="Ferrari">Portofino</option>
<option label="Ferrari">GTC4lusso</option>
</optgroup >
</datalist>
<br>
</div>
<button type="submit"class="registerbtn">Compare</button></body>
</html>
