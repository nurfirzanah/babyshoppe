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
<style>
       
  </style>
<body>
<%@include file="header.jsp" %>

<div class="row">
  <% 
  		Connection connection = ConnectionManager.getConnection();
		Statement statement = connection.createStatement();
		ResultSet resultset = statement.executeQuery("select * from product");
		while(resultset.next()){
			
	%>
	
      <div class="column">  
      	<div class="test">&nbsp;&nbsp;&nbsp;
	      <div  class="cardd">
	        <img src="getImage.jsp?prodID=<%=resultset.getInt("prodID")%>" width="100%"/>
       		<h5><%out.print(resultset.getString("prodName")); %></h5>
        	<p class="price">RM <%out.print(resultset.getDouble("prodPrice")); %></p>
        	<p><button><a href="clothesDetails.jsp?prodId=<%=resultset.getInt("prodId")%>" style="color: inherit;text-decoration: none;">
        	VIEW DETAILS</a></button></p>
          </div>
      </div>
      </div>
    <%} %>
</div>

<%@include file="footer.jsp" %>

</body>
</html>