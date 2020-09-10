<html>
<style>
.registerbtn {
background-color: #808080;
color: white;
padding: 6px 20px;
margin: 18px 0;
border: none;
cursor: pointer;
width: 5%;
opacity: 0.9;
}
input[type=text] {
width: 15%;
padding: 10px 15px;
margin: 8px 0;
box-sizing: border-box;
}
input[type=number] {
width: 15%;
padding: 10px 15px;
margin: 8px 0;
box-sizing: border-box;
}
input[type=file] {
width: 14%;
padding: 10px 15px;
margin: 8px 0;
box-sizing: border-box;
}
.registerbtn:hover {
opacity: 1;
}
</style>
<body style="text-align:center;background-color:black">
<img src="http://localhost:8080/img/retro.jpg" style="width:50%">
<form action="http://localhost:8080/538/cars.jsp" method="post"><div class="imag">
<label for="carpicture"><b style="color:#808080;">Car Picture</b></label>
<input type="file" name="carpicture" accept="image/*">
<br>
<br>
<label for="carname"><b style="color:#808080;">Car name</b></label>
<input type="text" placeholder="Enter Car name" name="carname" required>
<br>
<br>
<label for="modelname"><b style="color:#808080;">Model name</b></label>
<input type="text" placeholder="Enter Model name" name="modelname" required>
<br>
<br>
<label for="cost"><b style="color:#808080;">cost</b></label>
<input type="text" placeholder="Enter cost in rupees" name="cost" required>
<br>
<br>
<label for="Noofseats"><b style="color:#808080;">No.of seats</b></label>
<input type="number" placeholder="Enter No.of seats" name="Noofseats" min="1"
max="10"required>
<br>
<br>
<label for="enginetype"><b style="color:#808080;">Engine Type</b></label>
<input type="text" placeholder="Enter Engine Type" name="enginetype" required>
<br>
<br>
<label for="fueltype"><b style="color:#808080;">Fuel Type</b></label>
<input type="text" placeholder="Enter Fuel Type" name="fueltype" required>
<br>
<br>
<label for="fuelcapacity"><b style="color:#808080;">Fuel Capacity</b></label>
<input type="text" placeholder="Enter Fuel Capacity" name="fuelcapacity" required>
<br>
<br>
<label for="gearbox"><b style="color:#808080;">Gear Box</b></label>
<input type="number" placeholder="Enter Gear Box" name="gearbox" min="1" max="8"
required>
<br>
<br>
<label for="topspeed"><b style="color:#808080;">Top Speed</b></label>
<input type="text" placeholder="Enter Top Speed in Kmph" name="topspeed"
required>
<br><br>
<label for="mileage"><b style="color:#808080;">Mileage</b></label>
<input type="text" placeholder="Enter Mileage in Kmpl" name="mileage" required>
<br>
<br>
<label for="tyretype"><b style="color:#808080;">Tyre Type</b></label>
<input type="text" placeholder="Enter Tyre Type" name="tyretype" required>
<br>
<br>
<label for="lighting"><b style="color:#808080;">Lighting Type</b></label>
<input type="text" placeholder="Enter Lighting Type" name="lighting" required>
<br>
<br>
<label for="airbags"><b style="color:#808080;">Air Bags</b></label>
<input type="text" placeholder="Air Bags" name="airbags" required>
<br>
<br>
<label for="ventilatedseating"><b style="color:#808080;">Ventilated
Seating</b></label>
<input type="radio" name="ventilatedseating" value="yes" ><b
style="color:#808080;">Yes</b>
<input type="radio" name="ventilatedseating" value="no" ><b
style="color:#808080;">No</b>
<br>
<br>
<label for="antenna"><b style="color:#808080;">Antenna</b></label>
<input type="radio" name="antenna" value="yes"><b style="color:#808080;">Yes</b>
<input type="radio" name="antenna" value="no"><b style="color:#808080;">No</b>
<br>
<br>
<label for="ac"><b style="color:#808080;">AC</b></label>
<input type="radio" name="ac" value="yes"><b style="color:#808080;">Yes</b>
<input type="radio" name="ac" value="no"><b style="color:#808080;">No</b>
<br>
<br>
<label for="gps"><b style="color:#808080;">GPS</b></label>
<input type="radio" name="gps" value="yes"><b style="color:#808080;">Yes</b>
<input type="radio" name="gps" value="no"><b style="color:#808080;">No</b>
<br>
<br>
<label for="camera"><b style="color:#808080;">360 View Camera</b></label>
<input type="radio" name="camera" value="yes"><b style="color:#808080;">Yes</b>
<input type="radio" name="camera" value="no"><b style="color:#808080;">No</b><br>
<br>
<button type="submit"class="registerbtn">Register</button>
<button type="reset" class="registerbtn">Cancel</button>
</div>
</form>
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
stmt.executeUpdate("create table if not exists admin(username varchar(30),password
varchar(15))");
PreparedStatement pstatement = null;
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from admin where username='"+username+"'");
if(rs.next())
{
if(rs.getString(2).equals(password))
{
out.println("welcome "+username+":");
}
else {
out.println("try again");}
}
}
catch(Exception e){
out.println(e);
}
%>
<a href ="http://localhost:8080/538/comparision.html"style="color:#808080;">Back To
Home</a><br/><br/>
</body>
</html>
