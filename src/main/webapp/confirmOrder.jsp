<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement" %>
<%@ page import = "java.util.*" %>
<%@ page import = "connection.ConnectionManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
<body>
<%@include file="header.jsp" %>
<br>
<button class="buttonBack" onclick="history.back()"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button>


 	<% 
 		int qty = Integer.parseInt(request.getParameter("qty"));
		int prodId = Integer.parseInt(request.getParameter("prodId"));
  		Connection connection = ConnectionManager.getConnection();
		Statement statement = connection.createStatement();
		ResultSet resultset = statement.executeQuery("select * from product where prodId = '"+prodId+"'");
		while(resultset.next()){
			
	%>   <main class="contain">

      <div class="left-column">
        <img src="getImage.jsp?prodID=<%=resultset.getInt("prodID")%>" width="80%"/>
      </div>

      <!-- Right Column -->
      <div class="right-column">

        <!-- Product Description -->
        <div class="product-description">
          <span>Clothes</span>
          <h1><%out.print(resultset.getString("prodName")); %></h1>
       		<p><%out.print(resultset.getString("prodDesc")); %></p>
        </div>

        
        <div class="product-configuration">

          <!-- Product Quantity -->
          <div class="quantity buttons_added">
          <span>Quantity </span>
          <input id=demoInput name = "qty" type=number min=1 max=<%=resultset.getInt("prodQty")%>>
			<button onclick="increment()">+</button>
			<button onclick="decrement()">-</button>
		</div>
          

          
          <div class="radio-toolbar">
            <span>Size</span><br>
            <input type="radio" id="radio1" name="radioSize" value="0-6 months">
            <label for="radio1">0-6 months</label>
        
            <input type="radio" id="radio2" name="radioSize" value="6-12 months">
            <label for="radio2">6-12 months</label>
        
            <input type="radio" id="radio3" name="radioSize" value="1-2 years">
            <label for="radio3">1-2 years</label> 
        </div>
        <p>&nbsp;</p>
        </div>

        <!-- Product Pricing -->
        <div class="product-price">
          <span>RM 190</span>
          <a href = "checkout.jsp?prodId=<%resultset.getInt("prodId");%>" class="cart-btn">BUY NOW</a>
        </div>
      </div>    
      <%} %>
    </main>
   
<%@include file="footer.jsp" %>

<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" charset="utf-8"></script>
<script src="script.js" charset="utf-8"></script>
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