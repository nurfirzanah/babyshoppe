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
<form action="updateStatus" method="post">

	  <div class="card-header"style="background-color:#ffffff">
		Edit Product
	  </div>
	  <div class="card-body"style="background-color:#dfe4ea">
		<blockquote class="blockquote mb-0">
		
		<%		
				int id = Integer.parseInt(request.getParameter("orderid"));
				Connection connection = ConnectionManager.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("SELECT * from CUST_ORDER where orderID = '"+id+"'");
				while (resultSet.next()) {	
		%>
				
			<div class="form-row">
  				
				<div class="form-group col-md-6">
					<label for="date" style="color:black;font-size:16px;"><b>order id: </b></label>
					<input type ="number" class="form-control" name="id" id="id" readonly value = <%=resultSet.getString("orderId")%>>
				</div>
				<div class="form-group col-md-6">
					<label for="date" style="color:black;font-size:16px;"><b>order date: </b></label>
					<input type ="text" class="form-control" name="date" id="date" readonly value = <%=resultSet.getString("orderDate")%>>
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
						<div class="form-group col-md-6">
					<label for="price" style="color:black;font-size:16px;"><b>price:</b></label>
					<input type ="number" class="form-control" name="price" id="price" readonly value = <%=resultSet.getDouble("orderPrice")%>>
				</div>
				</div>
			
				<div class="form-group col-md-6">
						<div class="form-group col-md-6">
					<label for="price" style="color:black;font-size:16px;"><b>quantity:</b></label>
					<input type = "text" class="form-control" name="price" id="price" readonly value = <%=resultSet.getInt("orderQty")%>>
				</div>
				</div>
				</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="prodID" style="color:black;font-size:16px;"><b>Description:</b></label>
					<textarea class="form-control" name="prodID" id="prodID" readonly autocomplete="off" ><%=resultSet.getString("orderDetails")%></textarea>
				</div>
				<div class="form-group col-md-6">
						<label for="status" style="color:black;font-size:16px;"><b>Status:</b></label>
					<select class="form-control " name="status" id="status">
						<option value="Pending" >Pending </option>
						<option value="On Delivery" >On Delivery </option>
						<option value="Delivered" >Delivered</option>
					</select>
				</div>
				
				<center><button class="btn btn-primary" style="background-color:#2f3542">UPDATE</button></center>
			</div>
			<%} %>		
		
		</blockquote>
</div>
</form>
</body>
</html>