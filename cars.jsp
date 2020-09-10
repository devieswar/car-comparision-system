<html>
<body>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
String carpicture=request.getParameter("carpicture");
String carname=request.getParameter("carname");
String modelname=request.getParameter("modelname");
String cost=request.getParameter("cost");
String Noofseats=request.getParameter("Noofseats");
String enginetype=request.getParameter("enginetype");
String fueltype=request.getParameter("fueltype");
String fuelcapacity=request.getParameter("fuelcapacity");
String gearbox=request.getParameter("gearbox");
String topspeed=request.getParameter("topspeed");
String mileage=request.getParameter("mileage");
String tyretype=request.getParameter("tyretype");
String lighting=request.getParameter("lighting");
String airbags=request.getParameter("airbags");
String ventilatedseating=request.getParameter("ventilatedseating");
String antenna=request.getParameter("antenna");
String ac=request.getParameter("ac");
String gps=request.getParameter("gps");String camera=request.getParameter("camera");
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
//stmt.executeUpdate("create table cars(carpicture blob,carname varchar(200),modelname
varchar(200),cost varchar(100),Noofseats int(50),enginetype varchar(200),fueltype
varchar(200),gearbox int(50),topspeed varchar(200),tyretype varchar(200),lighting
varchar(200),ventilatedseating varchar(200),antenna varchar(200),ac varchar(200),PRIMARY
KEY(carname,modelname))");
PreparedStatement pstatement = null;
String queryString = "INSERT INTO
cars(carpicture,carname,modelname,cost,Noofseats,enginetype,fueltype,fuelcapacity,gearbox,t
opspeed,mileage,tyretype,lighting,airbags,ventilatedseating,antenna,ac,gps,camera) VALUES
(?, ?, ? ,? , ? , ?, ?, ? ,? , ?,?,?,?,?,?,?,?,?,?)";
pstatement = con.prepareStatement(queryString);
pstatement.setString(1, carpicture);
pstatement.setString(2, carname);
pstatement.setString(3, modelname);
pstatement.setString(4, cost);
pstatement.setString(5, Noofseats);
pstatement.setString(6, enginetype);
pstatement.setString(7, fueltype);
pstatement.setString(8, fuelcapacity);
pstatement.setString(9, gearbox);
pstatement.setString(10, topspeed);
pstatement.setString(11, mileage);
pstatement.setString(12, tyretype);
pstatement.setString(13, lighting);
pstatement.setString(14, airbags);
pstatement.setString(15, ventilatedseating);
pstatement.setString(16,antenna);
pstatement.setString(17,ac);
pstatement.setString(18, gps);pstatement.setString(19, camera);
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
<a href ="http://localhost:8080/538/adminlogin.jsp">Back To Home</a><br/><br/>
</body>
</html>
