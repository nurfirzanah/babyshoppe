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
<div style="background-color:#ffffff">
<form action="UpdateProfileUserController" method="post">	
<div class="container"><br><br>
<div class="card">
	  <div class="card-header"style="background-color:#ced6e0">
		Edit Profile
	  </div>
	  <div class="card-body"style="background-color:#ffffff">
		<blockquote class="blockquote mb-0">
			
			<%
			String email = (String)session.getAttribute("sessionName");
			Connection connection = ConnectionManager.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from customer where userEmail = '"+email+"'");
			while (resultSet.next()) {	
			%>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="name" style="color:black;font-size:16px;"><b>Name:</b></label>
					<input type="text" class="form-control" name="name" id="name"  autocomplete="off" value="<%=resultSet.getString("USERNAME") %>">
				<input type="hidden"  name="userid" id="userid" value="<%=resultSet.getInt("USERID") %>">
				</div>	
			
			
				<div class="form-group col-md-6">
					<label for="size" style="color:black;font-size:16px;"><b>Email:</b></label>
					<input type="text" class="form-control" name="email" id="email"  autocomplete="off" value="<%=resultSet.getString("USEREMAIL") %>">
				</div>
				<div class="form-group col-md-6">
					<label for="phoneNum" style="color:black;font-size:16px;"><b>Phone number:</b></label>
					<input type="text" class="form-control" name="phonenum" id="phonenum"  autocomplete="off" value="0<%=resultSet.getInt("USERNUM") %>">
				</div>	
		
				<div class="form-group  col-md-6">
					<label for="userAddress" style="color:black;font-size:16px;"><b>Address:</b></label>
					<input type="text" class="form-control" name="address" id="address"  autocomplete="off" value="<%=resultSet.getString("USERADDRESS") %>">
				</div>
				<div class="form-group col-md-6">
					<label for="userPass" style="color:black;font-size:16px;"><b>Pass:</b></label>
					<input type="text" class="form-control" name="pass" id="pass"  autocomplete="off" value="<%=resultSet.getString("USERPASS") %>">
					
				</div>
			
			</div>		
			<div class="pb-3 d-grid gap-2 col-6 mx-auto">
					<center><button class="btn btn-primary" style="background-color:#2f3542" >UPDATE PROFILE</button></center>
			</div>
		</blockquote>
	</div>
		 <%}

		%>		
		
</div>
<br><br><br>
</div>
</form>
<%@include file="footer.jsp" %>
</body>
</html>