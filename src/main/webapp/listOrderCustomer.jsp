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
	<%@include file="header2.jsp"%><br>
	<h3 align="center">ORDER LIST</h3>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">ORDER ID</th>
					<th scope="col">ADDRESS</th>
					<th scope="col">DATE</th>
					<th scope="col">ORDER STATUS</th>
					<th scope="col">TOTAL PRICE</th>
					
					
				</tr>
			</thead>
			<tbody>
	
						<%
						String email = (String)session.getAttribute("sessionName");
							Connection connection = ConnectionManager.getConnection();
							Statement statement = connection.createStatement();
							ResultSet resultSet = statement.executeQuery("select * from cust_order c join product p on c.prodId = p.prodId join customer t on t.userid = c.userid where t.useremail = '"+email+"'");
							while (resultSet.next()) {	
						%> 

					<tr>
						<td><%out.print(resultSet.getString("ORDERID"));%></td>
						<td><%=resultSet.getString("USERADDRESS")%></td>
						<td><%=resultSet.getDate("ORDERDATE")%></td>
						<td><%=resultSet.getString("ORDERSTATUS")%></td>
						<td><%=resultSet.getDouble("ORDERPRICE")%></td>
					
					
					</tr>
				<%} %>
			</tbody>
		</table>
		
	</div>
</body>
</html>