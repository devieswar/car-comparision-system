<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<style>
td{
color:white;
}
.registerbtn {
background-color: black;
color: white;
padding: 10px 10px;
margin: 8px 0;
border: none;cursor: pointer;
width: 10%;
opacity: 0.9;
}
</style>
<body style="background-color:gray">
<table border="1">
<tr>
<td>carpicture</td>
<td>carname</td>
<td>modelname</td>
<td>cost</td>
<td>Noofseats</td>
<td>enginetype</td>
<td>fueltype</td>
<td>fuelcapacity</td>
<td>gearbox</td>
<td>topspeed</td>
<td>mileage</td>
<td>tyretype</td>
<td>lighting</td>
<td>airbags</td>
<td>ventilatedseating</td>
<td>antenna</td>
<td>ac</td>
<td>gps</td>
<td>camera</td>
</tr>
<%
String car1=request.getParameter("carname1");
String model1=request.getParameter("modelname1");
String car2=request.getParameter("carname2");
String model2=request.getParameter("modelname2");
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from cars where carname='"+car1+"' and modelname='"+model1+"' union
select * from cars where carname='"+car2+"' and modelname='"+model2+"' ";resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><img src=http://localhost:8080/img/<%=resultSet.getString("carpicture") %> width="250"
height="250"/></td>
<td><%=resultSet.getString("carname") %></td>
<td><%=resultSet.getString("modelname") %></td>
<td><%=resultSet.getString("cost") %></td>
<td><%=resultSet.getString("Noofseats") %></td>
<td><%=resultSet.getString("enginetype") %></td>
<td><%=resultSet.getString("fueltype") %></td>
<td><%=resultSet.getString("fuelcapacity") %></td>
<td><%=resultSet.getString("gearbox") %></td>
<td><%=resultSet.getString("topspeed") %></td>
<td><%=resultSet.getString("mileage") %></td>
<td><%=resultSet.getString("tyretype") %></td>
<td><%=resultSet.getString("lighting") %></td>
<td><%=resultSet.getString("airbags") %></td>
<td><%=resultSet.getString("ventilatedseating") %></td>
<td><%=resultSet.getString("antenna") %></td>
<td><%=resultSet.getString("ac") %></td>
<td><%=resultSet.getString("gps") %></td>
<td><%=resultSet.getString("camera") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<FORM ACTION="http://localhost:8080/538/login.jsp" method="get" >
<textarea rows="5" cols="50">
Feedback And Suggestions.
</textarea>
<br>
<button type="submit"class="registerbtn">Submit</button>
</body>
</html>
