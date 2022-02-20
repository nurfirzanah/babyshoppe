<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Statement" %>
    <%@ page import = "java.util.*" %>
<%@ page import = "connection.ConnectionManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'rel='stylesheet'>
<title>Checkout Product</title>
<link rel="icon" href="logo.png">
<style>
</style>
</head>
<body>
<body>
<%@include file="header.jsp" %>
<button class="buttonBack" onclick="history.back()"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button>
<form action="CheckoutController" method="post">
<div class="container">
	<div class="row">
		<div class="col-12 col-md-12 mt-3">
			<div class="mb-3">
				<div class="card-body bg-white" style="border: 5px solid white">
					<h4 class="card-title"
						style="font-size: 40px; font-family: 'Grenze';">
						<b>SHIPPING & PAYMENT METHOD</b>
					</h4>
					<hr>
					<h4 class="card-title"
						style="font-size: 30px; font-family: 'Grenze';">
						<b>BILLING INFORMATION</b>
					</h4>
					<hr>
					<b>Add new billing address</b>
					<p class="card-text"
					style="font-size: 18px; font-family: 'Grenze';">

					<%  
						String email = (String)session.getAttribute("sessionName");
						Connection connection = ConnectionManager.getConnection();
						Statement statement1 = connection.createStatement();
						ResultSet resultSet1 = statement1.executeQuery("select * from customer where userEmail = '"+email+"'");
						while (resultSet1.next()) {	
					%> 

					<input type="hidden" name="userid" id="userid" value=<%=resultSet1.getInt("USERID")%> >
					
					
					<div class="form-row">
						<div class="form-group col-md-6 col-sm-6">
							<label for="name"><b>Name</b></label> 
							<textarea  rows="1" readonly class="form-control" name="name" id="name"  required
							autocomplete="off"><%out.print(resultSet1.getString("USERNAME")); %> </textarea>
						</div>
						<div class="form-group col-md-6">
							<label for="num"><b>Phone Number</b></label> <input
								type="text" class="form-control" name="num" id="num" value=0<%=resultSet1.getInt("USERNUM")%> readonly>
						</div>
						
					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="address"><b>Address (can be changed)</b></label>
							<textarea class="form-control" name="address" id="address"  required
							autocomplete="off"><%out.print(resultSet1.getString("USERADDRESS")); %></textarea>
						</div>
					</div><%} %>
					<hr>
					<b>Payment Method</b><br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="payment"
						id="payment" value="Online Banking"> <label
						class="form-check-label" for="bank">Online Banking</label>
					</div>
					<br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="payment"
						id="payment" value="Cash"> <label
						class="form-check-label" for="card">Cash</label>
					</div>
					
					<hr>
					<b>Confirm Order</b><br>
					<hr>
					
					<div class="form-row">
						<div class="form-group col-md-6 col-sm-6">
							<label for="name"><b>Product Name </b></label>
						</div>
					
						<div class="form-group col-md-2">
							<label for="price"><b>Price (RM)</b></label>
							
						</div>
						<div class="form-group col-md-2">
							<label for="qty"><b>Quantity</b></label> 
						
						</div>
						
						<div class="form-group col-md-2">
							<label for="total"><b>Subtotal (RM)</b></label> 
							
						</div>
					</div>
						<%  
							connection = ConnectionManager.getConnection();
							Statement statement = connection.createStatement();
							ResultSet resultSet = statement.executeQuery("select * from cust_order p, product c where p.prodid = c.prodId and p.userId = (select userid from customer where useremail = '"+email+"');");
							while (resultSet.next()) {	
						%> 
					<div class="form-row">
						<div class="form-group col-md-6 col-sm-6">
							 <br><%=resultSet.getString("PRODNAME")%> 
						</div>
					
						<div class="form-group col-md-2">
							<br><%=resultSet.getFloat("PRODPRICE")%> 
						</div>
						<div class="form-group col-md-2">
							<br><%=resultSet.getInt("ORDERQTY")%>
						</div>
						
						<div class="form-group col-md-2">
							<br><%=resultSet.getDouble("ORDERPRICE")%>
						</div>
					
					<input type="hidden" name="paytotal" id="paytotal" value=<%=resultSet.getDouble("ORDERPRICE")%> >
					</div><br><br>
						<input type="hidden" name="orderId" value=<%=resultSet.getInt("orderId")%> >
					
					<%} %>
					
					
					
					<div class="form-row">
				<%  
							connection = ConnectionManager.getConnection();
							Statement statement2 = connection.createStatement();
							ResultSet resultSet2 = statement2.executeQuery("select sum(ORDERPRICE) as totorder from cust_order p, product c where p.prodid = c.prodId and p.userId = (select userid from customer where useremail = '"+email+"');");
							while (resultSet2.next()) {	
						%> 
						
						<div class="form-group col-md-6 col-sm-6">
						<label for = "totorder"><b>TOTAL ALL</b></label>
							 <br>RM <%=resultSet2.getDouble("totOrder")%> 
						</div>
					</div>
					<input type="hidden" name="tot" id="tot" value=<%=resultSet2.getDouble("totorder")%> >
					<%} %>
					<button type="submit" class="btn zoom pl-4 pb-2 pr-4"
						style="float:right; padding-left: 270px; background-color: #8BAAD6; color: white; font-size: 18px;" role="button" aria-pressed="true" onclick="confirmation(this.id)">PLACE ORDER
					</button>
					<br>
					
				</div>
			</div>
		</div>
	</div>
</div>
</form>
<br><br>
	
<%@include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
	function confirmation(id){					  		 
		  console.log(id);
		  var r = confirm("Thankyou for your order!");
		 
	}
	</script>
</body>
</html>