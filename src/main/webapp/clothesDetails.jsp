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

<form action="orderController" method="post">
 	<% 
		int prodId = Integer.parseInt(request.getParameter("prodId"));
  		Connection connection = ConnectionManager.getConnection();
		Statement statement = connection.createStatement();
		ResultSet resultset = statement.executeQuery("select * from product where prodId = '"+prodId+"'");
		while(resultset.next()){
			
	%>   
	<main class="contain">


      <div class="left-column">
        <img src="images/<%=resultset.getString("fileName") %>" width="80%"/>
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
          <a onclick="increment()"  class="btn btn-info" role="button">+</a>
          <input id=demoInput name = "qty" type=number min=1 max=<%=resultset.getInt("prodQty")%>>
			<a onclick="decrement()"  class="btn btn-secondary" role="button">-</a>
		</div>
          

          
          <div class="radio-toolbar">
            <span>Size</span><br>
            <input type="radio" id="radio1" name="size" value="0-6 months">
            <label for="radio1">0-6 months</label>
        
            <input type="radio" id="radio2" name="size" value="6-12 months">
            <label for="radio2">6-12 months</label>
        
            <input type="radio" id="radio3" name="size" value="1-2 years">
            <label for="radio3">1-2 years</label> 
        </div>
        <p>&nbsp;</p>
        </div>

        <!-- Product Pricing -->
        <div class="product-price">
          <span>RM <%=resultset.getDouble("prodPrice")%></span>
          <button type="submit" class="btn zoom pl-4 pb-2 pr-4"
			style="float:right; padding-left: 270px; background-color: #8BAAD6; color: black; font-size: 18px;" role="button" aria-pressed="true">ADD TO CART
		  </button>
        </div>
      </div>    
      
      <input type="hidden" name="prodId" value=<%=resultset.getInt("prodID")%>>
      <input type="hidden" name="prodPrice" value=<%=resultset.getDouble("prodPrice")%>>
      <input type="hidden" name="prodName" value=<%=resultset.getString("prodName")%>>
      <%	String email = (String)session.getAttribute("sessionName");
			 connection = ConnectionManager.getConnection();
				Statement statement1 = connection.createStatement();
				ResultSet resultset1 = statement1.executeQuery("select * from customer where useremail ='"+email+"'");
				while (resultset1.next()) {%>
				
				
				<input type="hidden" name="userId" value=<%=resultset1.getInt("userId")%>>
				
		<%}%>
      
      <%} %>
    </main>
   </form>
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