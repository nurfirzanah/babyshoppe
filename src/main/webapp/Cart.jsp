<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionManager"%>
<%@page import ="org.postgresql.jdbc.PgDatabaseMetaData" %>
<!-- END SERVLET FOR RETRIEVE CATEGORY -->

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style.css" rel="stylesheet">
</head>
<style>
</style>
<body>
	<%@include file="header.jsp"%><br>
	<div class="container">
		<h3 align="center">SHOPPING CART</h3>
		
		
	
	</div>
	
	<form action = "checkout.jsp" method = "post">	
	
	<hr>
	<div class="container">
	
		<table class="table">
			<thead>
				<tr>
					<th scope="col">NAME</th>
					<th scope="col">CATEGORY</th>
					<th scope="col">PRICE</th>
					<th scope="col">QUANTITY</th>
					<th scope="col">ACTION</th>


				</tr>
			</thead>
			<tbody>

			<% 
				String email = (String)session.getAttribute("sessionName");
				Connection connection = ConnectionManager.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from cust_order p, product c where p.prodid = c.prodId and p.userId = (select userid from customer where useremail = '"+email+"');");
				while (resultSet.next()) {
				%>
				

				<tr>
					<td><%=resultSet.getString("PRODNAME")%></td>
					<td><%=resultSet.getString("PRODTYPE")%></td>
					<td><%=resultSet.getFloat("ORDERPRICE")%></td>
					<td>
					<%=resultSet.getInt("ORDERQTY")%>
					</td>
					<td>
           			 <a class="btn btn-danger" href="deleteCart.jsp?orderId=<%=resultSet.getInt("ORDERID")%>" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
           			</td></tr>
					
					<input type="hidden" name="prodId" value=<%=resultSet.getInt("prodID")%>>
					<input type="hidden" name="userId" value=<%=resultSet.getInt("USERID")%>>
					<input type="hidden" name="prodPrice" value=<%=resultSet.getDouble("ORDERPRICE")%>>
					
					<input type="hidden" name="qty" value=<%=resultSet.getInt("ORDERQTY")%>>
					<input type="hidden" name="size" value=<%=resultSet.getString("ORDERDETAILS")%>>
					
		 	
				<%
				}
				%>
				
			</tbody>
		</table>
			<button type = "submit" class="btn btn-primary">CHECKOUT</button>
				

	</div>	
	</form>
<script>
		function increment() {
			document.getElementById('demoInput').stepUp();
		}
		function decrement() {
			document.getElementById('demoInput').stepDown();
		}
</script>
</body>
</html>
