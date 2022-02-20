<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Statement" %>
<%@ page import = "connection.ConnectionManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href = "style.css" rel="stylesheet">
</head>
<style>
       
  </style>
<body>

<%@include file="header2.jsp" %><br>
<div class="container"><br>
<div class="card">
<form action="AddAdmin" method="post">

<div class="card-header"style="background-color:#ffffff">
		Add Admin
	  </div>
	  <div class="card-body"style="background-color:#dfe4ea">
		<blockquote class="blockquote mb-0">
		
		 <%	String adminemail = (String)session.getAttribute("sessionName");
			 Connection connection = ConnectionManager.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultset = statement.executeQuery("select * from admin where adminemail ='"+adminemail+"'");
				while (resultset.next()) {%>
				
				
				<input type="hidden" name="adminID" value=<%=resultset.getInt("adminID")%>>
			
		
			<div class="form-row">

				<div class="form-group col-md-12"><br>
					<label for="name" style="color:black;font-size:16px;"><b>Admin Name:</b></label>
					<input type="text" class="form-control" name="name" id="name" required autocomplete="off">
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-12"><br>
					<label for="name" style="color:black;font-size:16px;"><b>Admin Email:</b></label>
					<input type="text" class="form-control" name="email" id="email" required autocomplete="off">
				</div>	
			</div>
			
			<div class="form-row">

				<div class="form-group col-md-12"><br>
					<label for="name" style="color:black;font-size:16px;"><b>Admin Password:</b></label>
					<input type="password" class="form-control" name="password" id="password" required autocomplete="off">
				</div>	
			</div>
			
			<div class="form-row">

				<div class="form-group col-md-12"><br>
					<label for="name" style="color:black;font-size:16px;"><b>Admin Address:</b></label>
					<input type="text" class="form-control" name="address" id="address" required autocomplete="off">
				</div>	
			</div>
			
			<div class="form-row">

				<div class="form-group col-md-12"><br>
					<label for="name" style="color:black;font-size:16px;"><b>Admin Number:</b></label>
					<input type="text" class="form-control" name="number" id="number" required autocomplete="off">
				</div>	
			</div>

				<%
			}
			%>
        <center><button class="btn btn-primary" type="submit" style="background-color:#2f3542">ADD</button></center>
    
				</blockquote></div></form>
			</div>	
			
			</div>
			
</body>
</html>