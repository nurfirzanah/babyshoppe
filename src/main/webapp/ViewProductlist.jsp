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
	<%@include file="header2.jsp"%>
	<div class="container">
		<div class="row">
			<%
			Connection connection = ConnectionManager.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery("select * from product where prodType like '%clothes%'");
			while (resultset.next()) {
			%>

			<div class="column">
				<div class="test">
					&nbsp;&nbsp;&nbsp;
					<div class="cardd">
						<img src="images/<%=resultset.getString("fileName") %>"
							width="100%" />
						<h5>
							<%
							out.print(resultset.getString("prodName"));
							%>
						</h5>
						<p class="price">
							RM
							<%
						out.print(resultset.getDouble("prodPrice"));
						%>
						</p>
						<p>
							<a class="btn btn-primary btn-sm" href="editProduct.jsp?prodId=<%=resultset.getInt("prodID")%> "
								style="background-color: green; color: black;">EDIT</a> 
							<a onclick="return confirm('Are you sure you want to delete?')" class="btn btn-primary btn-sm" href="deleteProduct.jsp?prodId=<%=resultset.getInt("prodID")%>"
								style="background-color: red; color: black;">DELETE</a>
							
						</p>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>