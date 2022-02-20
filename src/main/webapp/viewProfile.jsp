<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- SERVLET FOR RETRIEVE CATEGORY -->
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionManager"%>
<!-- END SERVLET FOR RETRIEVE CATEGORY -->

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href = "style.css" rel="stylesheet">
<title>PROFILE</title>
</head>
<style>
       
  </style>
<body>
<%@include file="header.jsp" %>

<div style="background-color:white">
	

<div class="container"><br><br>
<div class="card">
	  <div class="card-header"style="background-color:#ced6e0">
		Account Information
	  </div>
	  <div class="card-body"style="background-color:white">
		<blockquote class="blockquote mb-0">
			<div class="form-row">

				<label for="id" style="color:black;font-size:17px;"><b>&nbsp;</b></label>
				&nbsp;
  				<p> 
       
			<%
			String email = (String)session.getAttribute("sessionName");
				Connection connection = ConnectionManager.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from customer where userEmail = '"+email+"'");
				while (resultSet.next()) {	
			%>
</p>
<pre><b> 
    NAME 	: <%=resultSet.getString("USERNAME")%> 
    ADDRESS 	: <%=resultSet.getString("USERADDRESS")%>
    PHONENUM 	: 0<%=resultSet.getInt("USERNUM")%>
    EMAIL 	: <%=resultSet.getString("USEREMAIL")%>
</b></pre>
					
</div></blockquote>
<div></div>
		 
			<div class="pb-3 d-grid gap-2 col-6 mx-auto">
					<center><a class="btn btn-primary" style="background-color:#2f3542" href="editProfile.jsp?id=<%=resultSet.getInt("USERID")%> ">EDIT PROFILE</a></center>
			</div>
			<%} %>
			
</div>
</div>
<br><br><br>
</div>
<%@include file="footer.jsp" %>
</body>
</html>