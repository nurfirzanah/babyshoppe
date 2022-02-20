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
<form action="addproduct" method="post" enctype="multipart/form-data">

<div class="card-header"style="background-color:#ffffff">
		Add Product
	  </div>
	  <div class="card-body"style="background-color:#dfe4ea">
		<blockquote class="blockquote mb-0">
			<div class="form-row">

				<label for="img" style="color:black;font-size:16px;"><b>Picture:</b></label>
				&nbsp;
  				<input type="file" id="img" name="img" accept="image/*">
				
				<div class="form-group col-md-12"><br>
					<label for="name" style="color:black;font-size:16px;"><b>Product Name:</b></label>
					<input type="text" class="form-control" name="prodname" id="name" required autocomplete="off">
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="size" style="color:black;font-size:16px;"><b>Size:</b></label>
					<select class="form-control " name="prodsize" id="prodsize">
						<option value="2-5 years" >2-5 years </option>
						<option value="0-6 months" >0-6 months </option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="prodQty" style="color:black;font-size:16px;"><b>Quantity:</b></label>
					<input type="number" class="form-control" name="prodQty" id="prodQty" required autocomplete="off">
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="desc" style="color:black;font-size:16px;"><b>Description:</b></label>
					<textarea class="form-control" name="prodDesc" id="prodDesc" rows="4" cols="50" required autocomplete="off"></textarea>
				</div>
				<div class="form-group col-md-6">
					<label for="orderPrice" style="color:black;font-size:16px;"><b> Price:</b></label>
					<input type="text" class="form-control" name="prodprice" id="prodprice" required autocomplete="off">
				</div></div>
			</div>	
			<%	String email = (String)session.getAttribute("sessionName");
			 	 Connection connection = ConnectionManager.getConnection();
				Statement statement1 = connection.createStatement();
				ResultSet resultset1 = statement1.executeQuery("select * from admin where adminemail ='"+email+"'");
				while (resultset1.next()) {%>
				
				
				<input type="hidden" name="adminId" value=<%=resultset1.getInt("adminId")%>>
				
		<%}%>
			</div>
				
        <center><button class="btn btn-primary" style="background-color:#2f3542">ADD</button></center>
    
				</blockquote></div></form>
			
			
		
		


</body>
</html>