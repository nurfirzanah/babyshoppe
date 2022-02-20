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
</head>
<style>
       
  </style>
<body>

<%@include file="header2.jsp" %><br>
<div class="container"><br>
<div class="card">
<form action="editProduct" method="post">

	  <div class="card-header"style="background-color:#ffffff">
		Edit Product
	  </div>
	  <div class="card-body"style="background-color:#dfe4ea">
		<blockquote class="blockquote mb-0">
		
		<%		
				int prodId = Integer.parseInt(request.getParameter("prodId"));	
				Connection connection = ConnectionManager.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from product where prodId = '"+prodId+"'");
				while (resultSet.next()) {	
		%>
				
			<div class="form-row">
  				
				<div class="form-group col-md-12">
					<input type="hidden" name="id" id="id" value=<%=resultSet.getInt("PRODID") %>>
				</div>
				<div class="form-group col-md-6">
					<label for="desc" style="color:black;font-size:16px;"><b>Name: </b></label>
					<textarea class="form-control" name="name" id="name"  autocomplete="off" ><%=resultSet.getString("PRODNAME")%></textarea>
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
						<div class="form-group col-md-6">
					<label for="size" style="color:black;font-size:16px;"><b>Size:</b></label>
					<select class="form-control " name="prodsize" id="prodsize">
						<option value="2-5 years" >2-5 years </option>
						<option value="0-6 months" >0-6 months </option>
					</select>
				</div>
				</div>
				<div class="form-group col-md-6">
					<label for="qty" style="color:black;font-size:16px;"><b>Quantity:</b></label>
					<input type="text" class="form-control" name="qty" id="qty"  autocomplete="off" value=<%=resultSet.getInt("PRODQTY") %>>
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="desc" style="color:black;font-size:16px;"><b>Description:</b></label>
					<textarea class="form-control" name="desc" id="desc"  autocomplete="off" ><%=resultSet.getString("PRODDESC")%></textarea>
				</div>
				<div class="form-group col-md-6">
					<label for="price" style="color:black;font-size:16px;"><b> Price:</b></label>
					<input type="text" class="form-control" name="price" id="price" autocomplete="off" value=<%=resultSet.getDouble("PRODPRICE") %>>
				</div>
				
				<center><button class="btn btn-primary" style="background-color:#2f3542">UPDATE</button></center>
			</div>
			<%} %>		
		
		</blockquote>
</div>
</form>
</body>
</html>